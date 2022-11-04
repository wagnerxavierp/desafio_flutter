import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_flutter/modules/github/domain/entities/item.dart';
import 'package:desafio_flutter/modules/id/getit.dart';
import 'package:desafio_flutter/modules/pull/cubit/pull_cubit.dart';
import 'package:desafio_flutter/modules/pull/domain/entities/pull_request.dart';
import 'package:desafio_flutter/utils/image_url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubContainerPullsPage extends StatefulWidget {
  final Item? item;
  const GithubContainerPullsPage({super.key, required this.item});

  @override
  State<GithubContainerPullsPage> createState() =>
      _GithubContainerPullsPageState();
}

class _GithubContainerPullsPageState extends State<GithubContainerPullsPage> {
  final cubit = getIt<PullCubit>();

  @override
  void initState() {
    super.initState();
    cubit.fetchPulls(widget.item!.pullsUrl!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item!.name!),
      ),
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
                  if (state is PullLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PullSuccessState) {
                    if (state.pullRequests!.isEmpty) {
                      return const Center(
                        child: Text("Nenhum pull request encontrado"),
                      );
                    }
                    return ListView.builder(
                        itemCount: state.pullRequests!.length,
                        itemBuilder: (context, index) {
                          final item = state.pullRequests![index];
                          return _buildItem(item);
                        });
                  } else if (state is PullErrorState) {
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

  _buildItem(PullRequest item) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(item.htmlUrl ?? '')),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 8.0, top: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                children: [
                  Text(
                    item.title ?? "",
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
                    item.body ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                    image: CachedNetworkImageProvider(
                                        item.user?.avatarUrl ?? avatarGithub),
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Text(
                              item.user?.login ?? "",
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.blueAccent,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        item.createdAt ?? "",
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
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
