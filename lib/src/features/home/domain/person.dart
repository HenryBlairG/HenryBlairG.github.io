
class Person {
  final Candidate candidate;
  final List<Employment> employment;
  final Skills skills;
  final List<Language> languages;
  final List<Project> projects;

  Person({
    required this.candidate,
    required this.employment,
    required this.skills,
    required this.languages,
    required this.projects,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      candidate: Candidate.fromJson(json['candidate']),
      employment: (json['employment'] as List).map((e) => Employment.fromJson(e)).toList(),
      skills: Skills.fromJson(json['skills']),
      languages: (json['languages'] as List).map((e) => Language.fromJson(e)).toList(),
      projects: (json['projects'] as List).map((e) => Project.fromJson(e)).toList(),
    );
  }
}

class Candidate {
  final String name;
  final String surname;
  final List<String> interests;
  final Contact contact;

  Candidate({
    required this.name,
    required this.surname,
    required this.interests,
    required this.contact,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      name: json['name'],
      surname: json['surname'],
      interests: List<String>.from(json['interests']),
      contact: Contact.fromJson(json['contact']),
    );
  }
}

class Contact {
  final String email;
  final Profiles profiles;

  Contact({
    required this.email,
    required this.profiles,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'],
      profiles: Profiles.fromJson(json['profiles']),
    );
  }
}

class Profiles {
  final String linkedin;
  final String github;

  Profiles({
    required this.linkedin,
    required this.github,
  });

  factory Profiles.fromJson(Map<String, dynamic> json) {
    return Profiles(
      linkedin: json['linkedin'],
      github: json['github'],
    );
  }
}

class Employment {
  final String company;
  final List<Role> roles;

  Employment({
    required this.company,
    required this.roles,
  });

  factory Employment.fromJson(Map<String, dynamic> json) {
    return Employment(
      company: json['company'],
      roles: (json['roles'] as List).map((e) => Role.fromJson(e)).toList(),
    );
  }
}

class Role {
  final String title;
  final String startDate;
  final String? endDate;
  final List<String> responsibilities;

  Role({
    required this.title,
    required this.startDate,
    this.endDate,
    required this.responsibilities,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      title: json['title'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      responsibilities: List<String>.from(json['responsibilities']),
    );
  }
}

class Skills {
  final List<String> programmingLanguages;
  final List<String> frameworksAndTools;
  final List<String> databases;
  final List<String> platformsAndServices;

  Skills({
    required this.programmingLanguages,
    required this.frameworksAndTools,
    required this.databases,
    required this.platformsAndServices,
  });

  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      programmingLanguages: List<String>.from(json['programming_languages']),
      frameworksAndTools: List<String>.from(json['frameworks_and_tools']),
      databases: List<String>.from(json['databases']),
      platformsAndServices: List<String>.from(json['platforms_and_services']),
    );
  }
}

class Language {
  final String language;
  final String proficiency;

  Language({
    required this.language,
    required this.proficiency,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      language: json['language'],
      proficiency: json['proficiency'],
    );
  }
}

class Project {
  final String name;
  final String description;
  final List<String> techStack;

  Project({
    required this.name,
    required this.description,
    required this.techStack,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      description: json['description'],
      techStack: List<String>.from(json['tech_stack']),
    );
  }
}
