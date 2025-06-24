import 'package:ele_pit/provider/global/provider_auth.dart';
import 'package:ele_pit/ui/page_add_part.dart';
import 'package:ele_pit/ui/page_auth.dart';
import 'package:ele_pit/ui/page_edit_part.dart';
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
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: '/add_part',
        builder: (context, state) => const AddPartPage(),
      ),
      GoRoute(
        path: '/edit_part',
        builder: (context, state) {
          final part = state.extra as Map<String, dynamic>?;
          return EditPartPage(part: part);
        },
      ),
    ],
  );
});
