import 'package:flutter/material.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/styles.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
                    key: _formKey,
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
                            if (_formKey.currentState!.validate()) {
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
                      const Text(
                        'Alternatively, you can reach me at:',
                        style: headline2,
                      ),
                      const SizedBox(height: 20),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: const Text('your.email@example.com'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.code),
                        title: const Text('GitHub'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.business),
                        title: const Text('LinkedIn'),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      const Text(
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
      ),
    );
  }
}