import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/image_containers.dart';
import '../../../../core/widgets/styles.dart';
import '../../../../data/models/person.dart';
import '../../../../data/providers/person_provider.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personFuture = ref.watch(personServiceProvider).getPerson();

    return Scaffold(
      body: FutureBuilder<Person>(
        future: personFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final person = snapshot.data!;
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularImageContainer(
                    imageUrl: 'https://via.placeholder.com/150',
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Me',
                          style: headline1,
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 8,
                          children: person.candidate.interests.map((interest) => Chip(label: Text(interest))).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}