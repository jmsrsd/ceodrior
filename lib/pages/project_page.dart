import 'package:drpc/drpc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../hooks/use_memoized_scroll_controller.dart';
import '../hooks/use_mutation.dart';
import '../hooks/use_query.dart';
import '../hooks/use_refresh.dart';
import '../utils/with_separator.dart';

class LayoutHookBuilder extends StatelessWidget {
  final LayoutWidgetBuilder builder;

  const LayoutHookBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return HookBuilder(builder: (context) {
          return builder(context, constraints);
        });
      },
    );
  }
}

class ProjectMainPage extends HookWidget {
  static const title = 'Project';

  const ProjectMainPage({super.key});

  @override
  Widget build(context) => LayoutHookBuilder(builder: builder);

  Widget builder(
    BuildContext context,
    BoxConstraints constraints,
  ) {
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
              icon: executeWhen(() {
                return isLoading;
              }, then: () {
                return const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(),
                );
              }, or: () {
                return const Icon(Icons.refresh_outlined);
              }),
            ),
          ],
        ),
        title: const Text(title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isLoading ? null : add.mutate,
        child: executeWhen(() {
          return isLoading;
        }, then: () {
          return CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              theme.colorScheme.surface,
            ),
          );
        }, or: () {
          return const Icon(Icons.add);
        }),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: isLoading ? null : 1,
          ),
          Expanded(
            child: executeWhen(() {
              return projects.isEmpty && isLoading;
            }, then: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, or: () {
              return AnimatedSwitcher(
                key: ValueKey(projects.isEmpty && isLoading),
                duration: const Duration(milliseconds: 300),
                child: execute(() {
                  const childAspectRatio = 4.0 / 3.0;
                  return AnimatedOpacity(
                    key: ValueKey(projects),
                    duration: const Duration(milliseconds: 300),
                    opacity: isLoading ? 0.33 : 1,
                    child: GridView.builder(
                      key: ValueKey(projects.length),
                      gridDelegate: execute(() {
                        const spacing = kToolbarHeight / 2.0;
                        return SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: childAspectRatio,
                          crossAxisCount: execute(() {
                            final parentWidth = constraints.maxWidth;
                            const childWidth = 360.0;
                            return parentWidth ~/ childWidth;
                          }).clamp(1, double.maxFinite.truncate()),
                          crossAxisSpacing: spacing,
                          mainAxisSpacing: spacing,
                        );
                      }),
                      controller: useMemoizedScrollController(),
                      padding: const EdgeInsets.all(
                        kToolbarHeight / 2.0,
                      ).copyWith(
                        bottom: kToolbarHeight * 4.0,
                      ),
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        final project = projects.elementAt(index);
                        return ProjectTile(
                          aspectRatio: childAspectRatio,
                          project: project,
                          onTap: executeWhen(() {
                            return isLoading;
                          }, then: () {
                            return null;
                          }, or: () {
                            return (project) {
                              executeAsync(() async {
                                return await navigator.pushNamed(
                                  '/project/${project.id}',
                                );
                              }).then((_) => browse.refetch());
                            };
                          }),
                        );
                      },
                    ),
                  );
                }),
              );
            }),
          ),
        ],
      ),
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
  Widget build(context) => LayoutHookBuilder(builder: builder);

  Widget builder(context, constraints) {
    final screenSize = constraints.biggest;

    final theme = Theme.of(context);

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
      return read.data?.project ?? defaultProjectEntity(id: id);
    }, [read.data?.project, id]);

    final isLoading = [
      read.isLoading,
      edit.isLoading,
      delete.isLoading,
    ].reduce((v, e) => v || e);

    TextEditingController textFieldController({required String text}) {
      return useTextEditingController(
        text: text,
        keys: [read.data?.project, id],
      );
    }

    final titleController = textFieldController(
      text: project.title,
    );

    final contentController = textFieldController(
      text: project.content,
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

    Widget textField({
      required bool enabled,
      required String label,
      required TextEditingController controller,
    }) {
      return ListTile(
        contentPadding: EdgeInsets.zero,
        title: Container(
          margin: const EdgeInsets.only(
            bottom: kToolbarHeight / 8.0,
          ),
          child: Text(
            label,
            style: theme.textTheme.caption,
          ),
        ),
        subtitle: TextField(
          enabled: enabled,
          decoration: inputDecoration(
            label: const Text(''),
          ),
          controller: executeWhen(() {
            return isLoading && controller.text.isEmpty;
          }, then: () {
            return useTextEditingController(
              text: 'Loading...',
            );
          }, or: () {
            return controller;
          }),
          minLines: null,
          maxLines: null,
          maxLength: null,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          executeWhen(() {
            return isLoading && titleController.text.isEmpty;
          }, then: () {
            return 'Loading...';
          }, or: () {
            return titleController.text;
          }),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: executeWhen(() {
              return isLoading;
            }, then: () {
              return null;
            }, or: () {
              return () {
                delete.mutate(
                  input: DeleteProjectRouterInput(id: id),
                );
              };
            }),
            icon: const Icon(
              Icons.delete_outline_outlined,
            ),
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
                  bottom: kToolbarHeight * 4.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kToolbarHeight / 2.0,
                      ),
                      width: screenSize.width.clamp(0.0, 720.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: withSeparator(
                          separator: const SizedBox(
                            height: kToolbarHeight / 2.0,
                          ),
                          children: [
                            textField(
                              enabled: !isLoading,
                              label: 'Title',
                              controller: titleController,
                            ),
                            textField(
                              enabled: !isLoading,
                              label: 'Content',
                              controller: contentController,
                            ),
                            ElevatedButton(
                              onPressed: executeWhen(() {
                                return isLoading;
                              }, then: () {
                                return null;
                              }, or: () {
                                return () {
                                  edit.mutate(
                                    input: EditProjectRouterInput(
                                      project: project.copyWith(
                                        title: titleController.text,
                                        content: contentController.text,
                                      ),
                                    ),
                                  );
                                };
                              }),
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
                            const Divider(
                              height: 2,
                              thickness: 2,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                executeWhen(() {
                                  return isLoading && project.id.isEmpty;
                                }, then: () {
                                  return 'Loading...';
                                }, or: () {
                                  return project.id;
                                }),
                              ),
                              subtitle: const Text('ID'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                executeWhen(() {
                                  return isLoading && project.author.isEmpty;
                                }, then: () {
                                  return 'Loading...';
                                }, or: () {
                                  return project.author;
                                }),
                              ),
                              subtitle: const Text('Author'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                executeWhen(() {
                                  return isLoading;
                                }, then: () {
                                  return 'Loading...';
                                }, or: () {
                                  return project.createdAt.toIso8601String();
                                }),
                              ),
                              subtitle: const Text('Created at'),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                executeWhen(() {
                                  return isLoading;
                                }, then: () {
                                  return 'Loading...';
                                }, or: () {
                                  return project.updatedAt.toIso8601String();
                                }),
                              ),
                              subtitle: const Text('Updated at'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
  final double aspectRatio;
  final ProjectEntity project;
  final void Function(ProjectEntity project)? onTap;

  const ProjectTile({
    super.key,
    required this.aspectRatio,
    required this.project,
    this.onTap,
  });

  @override
  Widget build(context) {
    final theme = Theme.of(context);
    const borderWidth = 1.0;
    const borderRadius = kToolbarHeight / 4.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: 1,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(
                  borderRadius,
                ),
              ),
              padding: const EdgeInsets.all(borderWidth),
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(
                  borderRadius - borderWidth,
                ),
                color: Colors.blue[50],
                child: ListTile(
                  contentPadding: const EdgeInsets.all(
                    kToolbarHeight / 2.0,
                  ),
                  title: Text(
                    project.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Container(
                    padding: const EdgeInsets.only(
                      bottom: kToolbarHeight / 4.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: withSeparator(
                        separator: const SizedBox(height: kToolbarHeight / 8.0),
                        children: [
                          Text(
                            project.author,
                            style: theme.textTheme.caption,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              project.content,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Text(
                            project.id,
                            style: theme.textTheme.caption,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: executeWhen(() {
                    return onTap == null;
                  }, then: () {
                    return null;
                  }, or: () {
                    return () {
                      return onTap!(project);
                    };
                  }),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
