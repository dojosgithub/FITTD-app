import 'package:app_links/app_links.dart';

class DeepLinkHandler {
  final AppLinks _appLinks = AppLinks();

  Future<void> handleInitialLink(Function(Uri) onLinkReceived) async {
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) {
      onLinkReceived(initialUri);
    }
  }

  void listenToLinks(Function(Uri) onLinkReceived) {
    _appLinks.uriLinkStream.listen((uri) {
      onLinkReceived(uri);
    });
  }
}
