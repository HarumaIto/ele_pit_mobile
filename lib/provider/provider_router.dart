import 'package:ele_pit/provider/global/provider_auth.dart';
import 'package:ele_pit/ui/page_auth.dart';
import 'package:ele_pit/ui/page_home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/auth',
    redirect: (context, state) {
      final isLoggedIn = authState.asData?.value != null;
      final isAuthPage = state.matchedLocation == '/auth';

      if (!isLoggedIn && !isAuthPage) {
        return '/auth';
      }
      if (isLoggedIn && isAuthPage) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => AuthPage(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
});