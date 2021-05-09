import 'package:flutter_test/flutter_test.dart';
import 'package:lubby/app/home/repositories/post_repository.dart';
 
void main() {
  late PostRepository repository;

  setUpAll(() {
    repository = PostRepository();
  });
}