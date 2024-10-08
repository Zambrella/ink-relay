import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArtistProfilePage extends ConsumerStatefulWidget {
  const ArtistProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ArtistProfileStatePage();
}

class _ArtistProfileStatePage extends ConsumerState<ArtistProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Artist Profile'),
      ),
    );
  }
}
