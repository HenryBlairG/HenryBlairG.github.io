import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/styles.dart';
import '../../../../data/models/person.dart';
import '../../../../data/providers/person_provider.dart';

class ExperiencePage extends ConsumerWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personFuture = ref.watch(personServiceProvider).getPerson();

    return Scaffold(
      body: FutureBuilder<Person>(
        future: personFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final employment = snapshot.data!.employment;
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Experience',
                    style: headline1,
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: ListView.builder(
                      itemCount: employment.length,
                      itemBuilder: (context, index) {
                        final experience = employment[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...experience.roles.map((role) => ListTile(
                                  title: Text(role.title, style: headline2),
                                  subtitle: Text(
                                      '${experience.company} | ${role.startDate} - ${role.endDate ?? 'Present'}',
                                      style: bodyText1),
                                )),
                                const SizedBox(height: 10),
                                const Text('Responsibilities:', style: TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5),
                                ...experience.roles.expand((role) => role.responsibilities).map((r) => Text('- $r')),
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