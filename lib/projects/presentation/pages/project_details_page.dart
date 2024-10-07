import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectDetailsPage extends ConsumerStatefulWidget {
  const ProjectDetailsPage({
    required this.projectId,
    super.key,
  });

  final String projectId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends ConsumerState<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
