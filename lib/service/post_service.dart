import '../model/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  // Obtengo los valores del API REST
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}