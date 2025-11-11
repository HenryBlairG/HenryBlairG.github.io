import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/links.dart';
import '../../../../core/widgets/styles.dart';
import '../../../../data/models/person.dart';
import '../../../../data/providers/person_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    person.candidate.name,
                    style: headline1,
                  ),
                  const Text(
                    'Software Engineer / Full-Stack Developer',
                    style: headline2,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Building scalable solutions...',
                    style: bodyText1,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        text: 'View Projects',
                        onPressed: () {},
                      ),
                      const SizedBox(width: 20),
                      PrimaryButton(
                        text: 'Download Resume',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextLink(
                        text: 'GitHub',
                        href: person.candidate.contact.profiles.github,
                        icon: Icons.code,
                      ),
                      const SizedBox(width: 20),
                      TextLink(
                        text: 'LinkedIn',
                        href: person.candidate.contact.profiles.linkedin,
                        icon: Icons.business,
                      ),
                      const SizedBox(width: 20),
                      TextLink(
                        text: 'Email',
                        href: 'mailto:${person.candidate.contact.email}',
                        icon: Icons.email,
                      ),
                    ],
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