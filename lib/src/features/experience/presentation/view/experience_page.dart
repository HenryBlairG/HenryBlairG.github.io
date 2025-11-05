import 'package:flutter/material.dart';
import '../../../../core/widgets/styles.dart';

class Experience {
  final String company;
  final String role;
  final String duration;
  final List<String> responsibilities;
  final List<String> achievements;

  Experience({
    required this.company,
    required this.role,
    required this.duration,
    required this.responsibilities,
    required this.achievements,
  });
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Experience> experiences = [
      Experience(
        company: 'Company A',
        role: 'Software Engineer',
        duration: '2020 - Present',
        responsibilities: [
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ],
        achievements: [
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        ],
      ),
      Experience(
        company: 'Company B',
        role: 'Junior Software Engineer',
        duration: '2018 - 2020',
        responsibilities: [
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
        ],
        achievements: [
          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        ],
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Experience',
              style: headline1,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  final experience = experiences[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(experience.role, style: headline2),
                            subtitle: Text('${experience.company} | ${experience.duration}', style: bodyText1),
                          ),
                          const SizedBox(height: 10),
                          const Text('Responsibilities:', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          ...experience.responsibilities.map((r) => Text('- $r')),
                          const SizedBox(height: 10),
                          const Text('Achievements:', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          ...experience.achievements.map((a) => Text('- $a')),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}