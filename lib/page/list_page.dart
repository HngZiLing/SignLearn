import 'package:flutter/material.dart';
import 'package:signlearn/page/category_page.dart';

class Category{
  final String title;
  final String description;
  final String coverPic;

  const Category({
    required this.title,
    required this.description,
    required this.coverPic
  });
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}):super(key: key);
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Category> categorys = [
    const Category(
      title: 'Number', 
      description: 'One, two, three, four, five, six, seven, eight, nine, ten', 
      coverPic: 'https://img2.mwed.jp/c/f=webp:jpeg,w=720,ir=auto/u/049/0491526176.jpg'
    ),
    const Category(
      title: 'Alphabet', 
      description: 'A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z', 
      coverPic: 'https://img.technews.tw/wp-content/uploads/2018/12/14123514/alphabet-3704805_1920-e1544762132775.jpg'
    ),
    const Category(
      title: 'Greeting', 
      description: 'Hello, Goodbye, good morning, good afternoon, good night, thank you, sorry', 
      coverPic: 'https://thumbs.dreamstime.com/z/hello-sticker-retro-style-vector-illustration-isolated-white-background-hello-sticker-retro-style-134866078.jpg'
    ),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 233, 233),
      body: 
      ListView.builder(
        padding: const EdgeInsets.fromLTRB(10,20,10,0),
        itemCount: categorys.length,
        itemBuilder: ((context, index) {
          final category = categorys[index];
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          // child: ListTile(
          //   contentPadding: const EdgeInsets.all(16),
          //   leading: CircleAvatar(
          //     radius: 28,
          //     backgroundImage: NetworkImage(category.coverPic),
          //   ),
          //   title: Text(category.title),
          //   subtitle: Text(category.description),
          //   trailing: const Icon(Icons.arrow_forward),
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => CategoryPage(category: category)));
          //   },
          // ),
        );
      })),
    );
  }
}