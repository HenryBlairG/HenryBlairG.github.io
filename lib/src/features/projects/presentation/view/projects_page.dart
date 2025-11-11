import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/links.dart';
import '../../../../core/widgets/styles.dart';
import '../../../../data/models/person.dart';
import '../../../../data/providers/person_provider.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personFuture = ref.watch(personServiceProvider).getPerson();

    return Scaffold(
      body: FutureBuilder<Person>(
        future: personFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final projects = snapshot.data!.projects;
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Projects',
                    style: headline1,
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 40,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        final project = projects[index];
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image.network(project.imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(project.name, style: headline2),
                                    const SizedBox(height: 10),
                                    Text(project.description, style: bodyText1),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 8,
                                      children: project.techStack.map((tech) => Chip(label: Text(tech))).toList(),
                                    ),
                                    const SizedBox(height: 10),
                                    const Row(
                                      children: [
                                        TextLink(
                                          text: 'GitHub',
                                          href: '#',
                                          icon: Icons.code,
                                        ),
                                        SizedBox(width: 20),
                                        TextLink(
                                          text: 'Live Demo',
                                          href: '#',
                                          icon: Icons.open_in_new,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
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