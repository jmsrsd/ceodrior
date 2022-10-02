import '../main.dart';
import 'package:drpc/drpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../hooks/use_memoized_scroll_controller.dart';
import '../hooks/use_mutation.dart';
import '../hooks/use_query.dart';
import '../hooks/use_refresh.dart';
import '../utils/with_separator.dart';

class ProjectPage extends HookWidget {
  static const String title = 'Project';

  const ProjectPage({super.key});

  @override
  Widget build(context) {
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

    final deleting = useState<String?>(null);

    void onDelete(ProjectEntity project) {
      MyApp.useContext((context) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          width: 360,
          behavior: SnackBarBehavior.floating,
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: withSeparator(
              separator: const SizedBox(
                width: kToolbarHeight / 4.0,
              ),
              children: [
                Expanded(
                  child: Text(project.name),
                ),
                Icon(
                  Icons.close_outlined,
                  color: Colors.red[500],
                ),
              ],
            ),
          ),
        ));
      });
    }

    final projects = browse.data?.projects ?? [];

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
                      child: ListView(
                        key: ValueKey(projects.length),
                        controller: useMemoizedScrollController(),
                        padding: const EdgeInsets.only(
                          top: kToolbarHeight / 4.0,
                          bottom: kToolbarHeight,
                        ),
                        children: withSeparator(
                          separator: const SizedBox(
                            height: kToolbarHeight / 8.0,
                          ),
                          children: projects.asMap().entries.map((e) {
                            final index = e.key;
                            final project = e.value;
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: kToolbarHeight * 1.5,
                                    height: kToolbarHeight * 1.5,
                                    child: Text(
                                      '- $index -',
                                      style: theme.textTheme.caption,
                                    ),
                                  ),
                                  Expanded(
                                    child: ProjectTile(
                                      project: project,
                                      deleting: deleting.value == project.id,
                                      onTap: isLoading
                                          ? null
                                          : (project) {
                                              deleting.value = project.id;
                                              delete.mutate(
                                                input: DeleteProjectRouterInput(
                                                  id: project.id,
                                                ),
                                                opts: MutateOpts(
                                                  then: (output) {
                                                    onDelete(project);
                                                    deleting.value = null;
                                                  },
                                                ),
                                              );
                                            },
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: kToolbarHeight * 1.5,
                                    height: kToolbarHeight * 1.5,
                                    child: Text(
                                      '- $index -',
                                      style: theme.textTheme.caption,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
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
  final bool deleting;
  final ProjectEntity project;
  final void Function(ProjectEntity project)? onTap;

  const ProjectTile({
    super.key,
    required this.deleting,
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
          opacity: deleting ? 0.33 : 1.0,
          child: SizedBox(
            width: 360,
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
                  onTap: onTap == null ? null : () => onTap!(project),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
