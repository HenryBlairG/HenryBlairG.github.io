import 'package:flutter/material.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/styles.dart';

class BlogPost {
  final String title;
  final String description;

  BlogPost({required this.title, required this.description});
}

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BlogPost> blogPosts = [
      BlogPost(
        title: 'Blog Post 1',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      ),
      BlogPost(
        title: 'Blog Post 2',
        description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      ),
      BlogPost(
        title: 'Blog Post 3',
        description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      ),
    ];

    return Scaffold(
      body: Padding(
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
                itemCount: blogPosts.length,
                itemBuilder: (context, index) {
                  final blogPost = blogPosts[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(blogPost.title, style: headline2),
                          const SizedBox(height: 10),
                          Text(blogPost.description, style: bodyText1),
                          const SizedBox(height: 10),
                          PrimaryButton(
                            text: 'Read More',
                            onPressed: () {},
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