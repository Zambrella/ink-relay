import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ink_relay/artist/presentation/pages/artist_profile_page.dart';
import 'package:ink_relay/authentication/presentation/pages/login_page.dart';
import 'package:ink_relay/authentication/presentation/pages/register_page.dart';
import 'package:ink_relay/authentication/providers/authentication_providers.dart';
import 'package:ink_relay/clients/presentation/pages/contact_details_page.dart';
import 'package:ink_relay/clients/presentation/pages/contacts_page.dart';
import 'package:ink_relay/common/widgets/app_header.dart';
import 'package:ink_relay/common/widgets/main_app_wrapper.dart';
import 'package:ink_relay/messages/presentation/pages/messages_page.dart';
import 'package:ink_relay/projects/presentation/pages/project_details_page.dart';
import 'package:ink_relay/projects/presentation/pages/projects_page.dart';
import 'package:ink_relay/routing/not_found_screen.dart';
import 'package:ink_relay/routing/scaffold_with_nested_navigation.dart';
import 'package:ink_relay/sessions/presentation/pages/calendar_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

// private navigators
final _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');
final _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigator');
final _calendarNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'calendarNavigator');
final _messagesNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'messagesNavigator');
final _projectsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'projectsNavigator');
final _clientsNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'clientsNavigator');

enum AppRoute {
  login,
  register,
  calendar,
  messages,
  projects,
  projectDetails,
  clients,
  clientDetails,
  profile,
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/calendar',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final path = state.uri.path;
      final isLoggedIn = ref.read(currentUserProvider) != null;

      // Redirect to home page if navigating to login pages while logged in
      if (isLoggedIn) {
        if (path.startsWith('/login') || path.startsWith('/register')) {
          return '/calendar';
        }
      }

      // Redirect to login page if navigating to protected pages while not logged in
      if (!isLoggedIn) {
        if (path.startsWith('/login') || path.startsWith('/register')) {
          return null;
        } else {
          return '/login';
        }
      }

      // No redirect
      return null;
    },
    routes: [
      GoRoute(
        path: '/startup',
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: SizedBox.shrink());
        },
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: '/register',
        name: AppRoute.register.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: RegisterPage(),
        ),
      ),
      // Must be logged in at this point.
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainAppWrapper(
            child: AppHeader(child: child),
          );
        },
        routes: [
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell,
              );
            },
            branches: [
              StatefulShellBranch(
                navigatorKey: _calendarNavigatorKey,
                routes: [
                  GoRoute(
                    path: '/calendar',
                    name: AppRoute.calendar.name,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: CalendarPage(),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: _messagesNavigatorKey,
                routes: [
                  GoRoute(
                    path: '/messages',
                    name: AppRoute.messages.name,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: MessagesPage(),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: _projectsNavigatorKey,
                routes: [
                  GoRoute(
                    path: '/projects',
                    name: AppRoute.projects.name,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: ProjectsPage(),
                    ),
                    routes: [
                      GoRoute(
                        path: ':projectId',
                        name: AppRoute.projectDetails.name,
                        pageBuilder: (context, state) {
                          final projectId = state.pathParameters['projectId'];
                          return MaterialPage(
                            child: ProjectDetailsPage(projectId: projectId!),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: _clientsNavigatorKey,
                routes: [
                  GoRoute(
                    path: '/clients',
                    name: AppRoute.clients.name,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: ContactsPage(),
                    ),
                    routes: [
                      GoRoute(
                        path: ':clientId',
                        name: AppRoute.clientDetails.name,
                        pageBuilder: (context, state) {
                          final clientId = state.pathParameters['clientId'];
                          return MaterialPage(
                            child: ContactDetailsPage(contactId: clientId!),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/artist-profile',
            name: AppRoute.profile.name,
            pageBuilder: (context, state) => const MaterialPage(
              child: ArtistProfilePage(),
            ),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
  );
}

extension GoRouterExtension on GoRouter {
  // Clear the stack and navigate to a new location
  void clearStackAndNavigate(String location) {
    while (canPop()) {
      pop();
    }
    pushReplacement(location);
  }
}
