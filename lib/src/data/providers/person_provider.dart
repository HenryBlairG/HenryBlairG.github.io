
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './person_service.dart';

final personServiceProvider = Provider((ref) => PersonService());
