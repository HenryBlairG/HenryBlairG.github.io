
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/person_service.dart';

final personServiceProvider = Provider((ref) => PersonService());
