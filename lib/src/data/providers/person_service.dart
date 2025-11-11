
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/person.dart';

class PersonService {
  Future<Person> getPerson() async {
    final String response = await rootBundle.loadString('data/HenryBlairG.json');
    final data = await json.decode(response);
    return Person.fromJson(data);
  }
}
