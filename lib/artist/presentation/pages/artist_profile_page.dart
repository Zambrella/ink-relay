import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/artist/presentation/widgets/settings_widget.dart';
import 'package:ink_relay/artist/presentation/widgets/update_profile.dart';
import 'package:ink_relay/artist/providers/user_artist_provider.dart';
import 'package:ink_relay/theme/theme.dart';

class ArtistProfilePage extends ConsumerStatefulWidget {
  const ArtistProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ArtistProfileStatePage();
}

class _ArtistProfileStatePage extends ConsumerState<ArtistProfilePage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (ref.watch(userArtistProvider)) {
        AsyncData(valueOrNull: final artist?) => CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                title: Text(artist.name),
                bottom: TabBar(
                  controller: _controller,
                  dividerColor: context.theme.colorScheme.secondaryContainer,
                  tabAlignment: TabAlignment.center,
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      text: 'Profile',
                      icon: Icon(Icons.person),
                    ),
                    Tab(
                      text: 'Artwork',
                      icon: Icon(Icons.palette),
                    ),
                    Tab(
                      text: 'Studio',
                      icon: Icon(Icons.home),
                    ),
                    Tab(
                      text: 'Account',
                      icon: Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: _controller,
                  children: [
                    UpdateProfile(artist: artist),
                    Center(child: Text("Tab two")),
                    Center(child: Text("Tab three")),
                    const SettingsWidget(),
                  ],
                ),
              ),
            ],
          ),
        AsyncError(:final error) => Text(error.toString()),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
