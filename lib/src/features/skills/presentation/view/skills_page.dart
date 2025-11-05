import 'package:flutter/material.dart';
import '../../../../core/widgets/styles.dart';

class Skill {
  final String name;
  final double proficiency;

  Skill({required this.name, required this.proficiency});
}

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Skill> skills = [
      Skill(name: 'Dart', proficiency: 0.9),
      Skill(name: 'Flutter', proficiency: 0.9),
      Skill(name: 'Python', proficiency: 0.8),
      Skill(name: 'JavaScript', proficiency: 0.7),
      Skill(name: 'TypeScript', proficiency: 0.7),
      Skill(name: 'React', proficiency: 0.6),
      Skill(name: 'Node.js', proficiency: 0.6),
      Skill(name: 'Firebase', proficiency: 0.8),
      Skill(name: 'Google Cloud', proficiency: 0.7),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Skills',
              style: headline1,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                  childAspectRatio: 3,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(skill.name, style: headline2),
                          const SizedBox(height: 10),
                          LinearProgressIndicator(
                            value: skill.proficiency,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
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
      ),
    );
  }
}