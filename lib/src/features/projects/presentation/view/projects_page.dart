import 'package:flutter/material.dart';
import '../../../../core/widgets/styles.dart';

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String? githubUrl;
  final String? liveDemoUrl;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    this.githubUrl,
    this.liveDemoUrl,
  });
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Project> projects = [
      Project(
        title: 'Project 1',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        imageUrl: 'https://via.placeholder.com/300',
        techStack: ['Flutter', 'Firebase'],
        githubUrl: '#',
        liveDemoUrl: '#',
      ),
      Project(
        title: 'Project 2',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        imageUrl: 'https://via.placeholder.com/300',
        techStack: ['React', 'Node.js', 'MongoDB'],
        githubUrl: '#',
      ),
      Project(
        title: 'Project 3',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        imageUrl: 'https://via.placeholder.com/300',
        techStack: ['Python', 'Django', 'PostgreSQL'],
        liveDemoUrl: '#',
      ),
    ];

    return Scaffold(
      body: Padding(
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
                        Image.network(project.imageUrl, height: 150, width: double.infinity, fit: BoxFit.cover),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(project.title, style: headline2),
                              const SizedBox(height: 10),
                              Text(project.description, style: bodyText1),
                              const SizedBox(height: 10),
                              Wrap(
                                spacing: 8,
                                children: project.techStack.map((tech) => Chip(label: Text(tech))).toList(),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  if (project.githubUrl != null)
                                    IconButton(
                                      icon: const Icon(Icons.code),
                                      onPressed: () {},
                                      tooltip: 'GitHub',
                                    ),
                                  if (project.liveDemoUrl != null)
                                    IconButton(
                                      icon: const Icon(Icons.open_in_new),
                                      onPressed: () {},
                                      tooltip: 'Live Demo',
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
      ),
    );
  }
}