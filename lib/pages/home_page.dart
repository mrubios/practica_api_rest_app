import 'package:flutter/material.dart';
import 'package:practica_api_rest_app/service/post_service.dart';

import '../model/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? listaDePosts;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    // Llamamos a obtener los post
    obtenerPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practica ApiRest"),
        elevation: 10,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: listaDePosts?.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listaDePosts![index].title,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        //Image.network(listaDePosts![index].url),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.only(left: 10),
                    child: Image.network(listaDePosts![index].url),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  obtenerPosts() async {
    listaDePosts = await PostService().getPosts();
    if (listaDePosts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
}
