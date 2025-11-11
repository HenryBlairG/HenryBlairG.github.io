import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/styles.dart';
import '../../../../data/models/person.dart';
import '../../../../data/providers/person_provider.dart';

class BlogPage extends ConsumerWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personFuture = ref.watch(personServiceProvider).getPerson();

    return Scaffold(
      body: FutureBuilder<Person>(
        future: personFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final person = snapshot.data!;
            final projects = person.projects;

            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Blog',
                    style: headline1,
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: ListView.builder(
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        final project = projects[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(project.name, style: headline2),
                                const SizedBox(height: 10),
                                Text(project.description, style: bodyText1),
                                const SizedBox(height: 10),
                                PrimaryButton(
                                  text: 'Read More',
                                  onPressed: () {
                                    // TODO: Implement navigation to project url
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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