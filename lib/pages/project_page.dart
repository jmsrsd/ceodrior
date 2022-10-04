import 'package:drpc/drpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../hooks/use_memoized_scroll_controller.dart';
import '../hooks/use_mutation.dart';
import '../hooks/use_query.dart';
import '../hooks/use_refresh.dart';
import '../utils/with_separator.dart';

class ProjectMainPage extends HookWidget {
  static const String title = 'Project';

  const ProjectMainPage({super.key});

  @override
  Widget build(context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return HookBuilder(
          builder: (context) {
            final navigator = Navigator.of(context);

            final theme = Theme.of(context);

            final refresh = useRefresh();

            final browse = useQuery(
              [browseProjectRouter.route, refresh],
              browseProjectRouter.query,
            );

            final add = useMutation(
              [addProjectRouter.route],
              addProjectRouter.mutation,
              mutateOpts: MutateOpts<void>(
                whenComplete: browse.refetch,
              ),
            );

            final delete = useMutation(
              [deleteProjectRouter.route],
              deleteProjectRouter.mutation,
              mutateOpts: MutateOpts<DeleteProjectRouterOutput>(
                whenComplete: browse.refetch,
              ),
            );

            final projects = useMemoized(() {
              return browse.data?.projects ?? [];
            }, [browse.data?.projects]);

            final isLoading = [
              browse.isLoading,
              add.isLoading,
              delete.isLoading,
            ].reduce((v, e) => v || e);

            return Scaffold(
              appBar: AppBar(
                actions: withSeparator(
                  separator: const SizedBox(width: 8),
                  children: [
                    IconButton(
                      onPressed: isLoading ? null : browse.refetch,
                      icon: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(),
                            )
                          : const Icon(Icons.refresh_outlined),
                    ),
                  ],
                ),
                title: const Text(title),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: isLoading ? null : add.mutate,
                child: isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          theme.colorScheme.surface,
                        ),
                      )
                    : const Icon(Icons.add),
              ),
              body: Column(
                children: [
                  LinearProgressIndicator(
                    value: isLoading ? null : 1,
                  ),
                  Expanded(
                    child: projects.isEmpty && isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : AnimatedSwitcher(
                            key: ValueKey(projects.isEmpty && isLoading),
                            duration: const Duration(milliseconds: 300),
                            child: AnimatedOpacity(
                              key: ValueKey(projects),
                              duration: const Duration(milliseconds: 300),
                              opacity: isLoading ? 0.33 : 1,
                              child: GridView.builder(
                                key: ValueKey(projects.length),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 4.0 / 3.0,
                                  crossAxisCount:
                                      (constraints.maxWidth ~/ 360.0).clamp(
                                    1,
                                    double.maxFinite.truncate(),
                                  ),
                                  crossAxisSpacing: kToolbarHeight / 2.0,
                                  mainAxisSpacing: kToolbarHeight / 2.0,
                                ),
                                controller: useMemoizedScrollController(),
                                padding: const EdgeInsets.all(
                                  kToolbarHeight / 2.0,
                                ).copyWith(
                                  bottom: kToolbarHeight,
                                ),
                                itemCount: projects.length,
                                itemBuilder: (context, index) {
                                  final project = projects.elementAt(index);
                                  return ProjectTile(
                                    project: project,
                                    onTap: isLoading
                                        ? null
                                        : (project) {
                                            navigator
                                                .pushNamed(
                                                  '/project/${project.id}',
                                                )
                                                .then((_) => browse.refetch());
                                          },
                                  );
                                },
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class ProjectDetailPage extends HookWidget {
  final String id;

  const ProjectDetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    final read = useQuery(
      [readProjectRouter.route, id],
      () async {
        return await readProjectRouter.query(
          input: ReadProjectRouterInput(id: id),
        );
      },
    );

    final edit = useMutation(
      [editProjectRouter.route, id],
      editProjectRouter.mutation,
      mutateOpts: MutateOpts(
        whenComplete: read.refetch,
      ),
    );

    final delete = useMutation(
      [deleteProjectRouter.route, id],
      deleteProjectRouter.mutation,
      mutateOpts: MutateOpts<DeleteProjectRouterOutput>(
        whenComplete: navigator.pop,
      ),
    );

    final project = useMemoized(() {
      return read.data?.project ?? ProjectEntity(id: id, name: '');
    }, [read.data?.project, id]);

    final isLoading = read.isLoading || edit.isLoading || delete.isLoading;

    final projectNameController = useTextEditingController(
      text: project.name,
      keys: [read.data?.project, id],
    );

    InputDecoration inputDecoration({
      required Widget label,
    }) {
      return InputDecoration(
        border: const OutlineInputBorder(),
        fillColor: Colors.blue[50],
        filled: true,
        label: label,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isLoading && projectNameController.text.isEmpty
              ? 'Loading...'
              : projectNameController.text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: isLoading
                ? null
                : () {
                    delete.mutate(
                      input: DeleteProjectRouterInput(id: id),
                    );
                  },
            icon: const Icon(Icons.delete_outline_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: isLoading ? null : 1,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: kToolbarHeight / 2.0,
                  bottom: kToolbarHeight,
                ),
                child: SizedBox(
                  width: 360,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: withSeparator(
                      separator: const SizedBox(
                        height: kToolbarHeight / 2.0,
                      ),
                      children: [
                        TextField(
                          enabled: false,
                          decoration: inputDecoration(
                            label: const Text('ID'),
                          ),
                          controller: useTextEditingController(
                            text: project.id,
                          ),
                        ),
                        TextField(
                          enabled: !isLoading,
                          decoration: inputDecoration(
                            label: const Text('Name'),
                          ),
                          controller:
                              isLoading && projectNameController.text.isEmpty
                                  ? useTextEditingController(text: 'Loading...')
                                  : projectNameController,
                          minLines: null,
                          maxLines: null,
                          maxLength: null,
                        ),
                        ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  edit.mutate(
                                    input: EditProjectRouterInput(
                                      project: project.copyWith(
                                        name: projectNameController.text,
                                      ),
                                    ),
                                  );
                                },
                          child: SizedBox(
                            height: 48,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    isLoading ? 'LOADING...' : 'SAVE',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectTile extends HookWidget {
  final ProjectEntity project;
  final void Function(ProjectEntity project)? onTap;

  const ProjectTile({
    super.key,
    required this.project,
    this.onTap,
  });

  @override
  Widget build(context) {
    const borderWidth = 1.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: 1,
          child: AspectRatio(
            aspectRatio: 4.0 / 3.0,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(
                  kToolbarHeight / 4.0,
                ),
              ),
              padding: const EdgeInsets.all(borderWidth),
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(
                  (kToolbarHeight / 4.0) - borderWidth,
                ),
                color: Colors.blue[50],
                child: ListTile(
                  contentPadding: const EdgeInsets.all(
                    kToolbarHeight / 2.0,
                  ),
                  title: Text(project.name),
                  subtitle: Text(project.id),
                  onTap: onTap == null
                      ? null
                      : () {
                          onTap!(project);
                        },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
