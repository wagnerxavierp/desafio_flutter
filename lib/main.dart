import 'package:desafio_flutter/modules/github/domain/entities/item.dart';
import 'package:desafio_flutter/modules/id/getit.dart';
import 'package:desafio_flutter/modules/pull/presenter/pulls/github_container_pulls_page.dart';
import 'package:desafio_flutter/modules/github/presenter/github/github_java_pop_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  setupProviders();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static const String title = 'Github JavaPop';

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: title,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        routeInformationProvider: _router.routeInformationProvider,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
      );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            routes: const <GoRoute>[],
            path: 'githubconatinerpulls',
            builder: (context, state) {
              final exta = state.extra as Item;
              return GithubContainerPullsPage(item: exta);
            },
          ),
        ],
        path: '/',
        builder: (context, state) => const GithubJavaPopPage(),
      ),
    ],
  );
}
