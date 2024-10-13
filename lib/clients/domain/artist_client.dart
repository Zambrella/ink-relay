import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:ink_relay/common/models.dart';

part 'artist_client.g.dart';

@CopyWith()
class ArtistClient extends Equatable {
  const ArtistClient({
    required this.id,
  });

  final Identifier id;

  @override
  List<Object?> get props => [];
}
