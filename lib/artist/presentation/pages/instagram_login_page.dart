import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/app_dependencies.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

sealed class InstagramLoginResult {
  const InstagramLoginResult();
}

class InstagramLoginSuccess extends InstagramLoginResult {
  const InstagramLoginSuccess(this.code);

  final String code;
}

class InstagramLoginError extends InstagramLoginResult {
  const InstagramLoginError({
    required this.error,
    required this.errorReason,
    required this.errorDescription,
  });

  final String error;
  final String errorReason;
  final String errorDescription;
}

class InstagramInfo {
  static Uri initialUrl = Uri.parse(
    'https://www.instagram.com/oauth/authorize?enable_fb_login=0&force_authentication=1&client_id=1630290747564041&redirect_uri=https://web.squiddies.ink/&response_type=code&scope=instagram_business_basic%2Cinstagram_business_manage_messages%2Cinstagram_business_manage_comments%2Cinstagram_business_content_publish',
  );
  static Uri redirectUri = Uri.parse('https://web.squiddies.ink/');
  static String appId = '1630290747564041';

  static InstagramLoginResult parseRedirect(String url, Logger logger) {
    logger.i('InstagramInfo.parseRedirect: $url');
    final uri = Uri.parse(url);
    if (uri.host == redirectUri.host) {
      if (uri.queryParameters.containsKey('code')) {
        final rawCode = uri.queryParameters['code']!;
        logger.i('InstagramInfo.parseRedirect: code=$rawCode');
        final formattedCode = rawCode.substring(0, rawCode.indexOf('#'));
        logger.i('InstagramInfo.parseRedirect: formattedCode=$formattedCode');
        return InstagramLoginSuccess(formattedCode);
      } else {
        final error = uri.queryParameters['error']!;
        final errorReason = uri.queryParameters['error_reason']!;
        final errorDescription = uri.queryParameters['error_description']!;
        logger.w(
          'InstagramInfo.parseRedirect: error=$error, errorReason=$errorReason, errorDescription=$errorDescription',
        );
        return InstagramLoginError(
          error: error,
          errorReason: errorReason,
          errorDescription: errorDescription,
        );
      }
    }
    return const InstagramLoginError(
      error: 'invalid_redirect',
      errorReason: 'invalid_redirect',
      errorDescription: 'Invalid redirect',
    );
  }
}

class InstagramLoginPage extends ConsumerStatefulWidget {
  const InstagramLoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InstagramLoginPageState();
}

class _InstagramLoginPageState extends ConsumerState<InstagramLoginPage> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..clearCache()
      ..clearLocalStorage()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(InstagramInfo.redirectUri.toString())) {
              final codeResult = InstagramInfo.parseRedirect(
                request.url,
                ref.read(loggerProvider),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(InstagramInfo.initialUrl);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Show this in a modal dialog.
    // TODO: On success navigate to a loading page.
    // TODO: Once loaded, pop the modal and refresh instagram token provider (or at least provider that checks if it exists)
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: WebViewWidget(controller: webViewController),
    );
  }
}
