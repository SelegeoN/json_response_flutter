import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jsonplaceholder/pages/posts_list_widget.dart';
import 'package:flutter_jsonplaceholder/pages/user_list_page.dart';
import 'package:flutter_jsonplaceholder/providers/theme_provider.dart';
import 'package:flutter_jsonplaceholder/themes/light_mode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.dark
  //     ));
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentMode.themeData,
      home: MainPage(),
    );
  }
}

final navRailIndexProvider = StateProvider((ref) => 0);

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentIndex = ref.watch(navRailIndexProvider);
    final theme = ref.read(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: double.infinity,
          child: IndexedStack(
            index: currentIndex,
            children: [
              Center(child: Text('Пользователи')),
              Center(
                  child: Text(
                'Посты',
              ))
            ],
          ),
        ),
        actions: [
          theme.themeData == lightMode
              ? IconButton(
                  onPressed: ()=>theme.toggleDark(), icon: Icon(Icons.shield_moon_outlined))
              : IconButton(
                  onPressed: ()=>theme.toggleLight(), icon: Icon(Icons.sunny))
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: [UsersWidget(), PostsWidget()],
        ),
      ),
      drawer: SizedBox(
        width: 150,
        child: NavigationRail(
          labelType: NavigationRailLabelType.all,
          groupAlignment: -0.1,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.supervised_user_circle_sharp),
              selectedIcon: Icon(Icons.supervised_user_circle_outlined),
              label: Text('Пользователи'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.book_online_rounded),
              selectedIcon: Icon(Icons.book),
              label: Text('Посты'),
            )
          ],
          selectedIndex: currentIndex,
          onDestinationSelected: (value) {
            ref.read(navRailIndexProvider.notifier).update((state) => value);
          },
        ),
      ),
    );
  }
}
