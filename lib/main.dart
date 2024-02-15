import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/auth/controller/auth_controller.dart';
import 'package:quizlee/firebase_options.dart';
import 'package:quizlee/models/user_model.dart';
import 'package:quizlee/router.dart';
import 'package:quizlee/theme/palette.dart';
import 'package:quizlee/utils/error_text.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  UserModel? userModel;

  void getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.read(userProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider).when(
          data: (user) => ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: false,
            builder: (context, child) {
              return MaterialApp.router(
                title: 'Quizlee',
                theme: ref.watch(themeNotifierProvider),
                debugShowCheckedModeBanner: false,
                routerDelegate: RoutemasterDelegate(
                  routesBuilder: (context) {
                    if (user != null) {
                      getData(ref, user);
                      if (userModel != null) {
                        return loggedInRoute;
                      }
                    }
                    return loggedOutRoute;
                  },
                ),
                routeInformationParser: const RoutemasterParser(),
              );
            },
          ),
          error: (error, stactrace) => ErrorText(error: error.toString()),
          loading: () => const SizedBox.shrink(),
        );
  }
}
