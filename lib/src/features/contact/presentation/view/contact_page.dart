import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/links.dart';
import '../../../../core/widgets/styles.dart';
import '../../../../data/models/person.dart';
import '../../../../data/providers/person_provider.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personFuture = ref.watch(personServiceProvider).getPerson();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: FutureBuilder<Person>(
        future: personFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final person = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Me',
                    style: headline1,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Subject',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a subject';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Message',
                                  border: OutlineInputBorder(),
                                ),
                                maxLines: 5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a message';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              PrimaryButton(
                                text: 'Send Message',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    // Process data
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alternatively, you can reach me at:',
                              style: headline2,
                            ),
                            const SizedBox(height: 20),
                            TextLink(
                              text: person.candidate.contact.email,
                              href: 'mailto:${person.candidate.contact.email}',
                              icon: Icons.email,
                            ),
                            const SizedBox(height: 20),
                            TextLink(
                              text: 'GitHub',
                              href: person.candidate.contact.profiles.github,
                              icon: Icons.code,
                            ),
                            const SizedBox(height: 20),
                            TextLink(
                              text: 'LinkedIn',
                              href: person.candidate.contact.profiles.linkedin,
                              icon: Icons.business,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'I will try to respond within 24 hours.',
                              style: bodyText1,
                            ),
                          ],
                        ),
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