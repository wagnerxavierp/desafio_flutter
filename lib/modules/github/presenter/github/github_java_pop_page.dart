import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_flutter/main.dart';
import 'package:desafio_flutter/modules/github/cubit/github_cubit.dart';
import 'package:desafio_flutter/modules/github/domain/entities/item.dart';
import 'package:desafio_flutter/modules/id/getit.dart';
import 'package:desafio_flutter/utils/image_url.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:go_router/go_router.dart';

class GithubJavaPopPage extends StatefulWidget {
  const GithubJavaPopPage({super.key});

  @override
  State<GithubJavaPopPage> createState() => _GithubJavaPopPageState();
}

class _GithubJavaPopPageState extends State<GithubJavaPopPage> {
  final cubit = getIt<GithubCubit>();

  @override
  void initState() {
    super.initState();
    cubit.fetchRepositories('Java', 1);
  }

  @override
  void dispose() {
    super.dispose();
    cubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      drawer: const Drawer(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: StreamBuilder<Object>(
                stream: cubit.stream,
                builder: (context, snapshot) {
                  final state = cubit.state;
                  if (state is GithubLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GithubSuccesState) {
                    return ListView.builder(
                        itemCount: state.githubContainer!.items!.length,
                        itemBuilder: (context, index) {
                          final item = state.githubContainer!.items![index];
                          return _buildItem(item);
                        });
                  } else if (state is GithubErrorState) {
                    return Center(
                      child: Text(state.error!.message),
                    );
                  } else {
                    return const Center(
                      child: Text("Nenhum dado encontrado"),
                    );
                  }
                }),
          ))
        ],
      ),
    );
  }

  _buildItem(Item item) {
    return GestureDetector(
      onTap: () => context.go('/githubconatinerpulls', extra: item),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name ?? '',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          item.description ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Octicons.git_branch,
                                color: Colors.orange,
                              ),
                              Text(
                                item.forksCount.toString(),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Octicons.star,
                                color: Colors.orange,
                              ),
                              Text(
                                item.stargazersCount.toString(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                                image: CachedNetworkImageProvider(
                                    item.owner?.avatarUrl ?? avatarGithub),
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover),
                          ),
                          Text(
                            item.owner?.login ?? '',
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
