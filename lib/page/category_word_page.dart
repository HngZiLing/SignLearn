import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:signlearn/config.dart';

class CategoryWordPage extends StatefulWidget {
  final String id, title, description, category;
  const CategoryWordPage({Key? key, required this.id, required this.title, required this.description, required this.category}) : super(key: key);
  
  @override
  State<CategoryWordPage> createState() => _CategoryWordPageState();
}

class _CategoryWordPageState extends State<CategoryWordPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  
  String titleName = "";

  @override
  void initState() {
    super.initState();
    titleName = widget.title.toString();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFACD783),
          automaticallyImplyLeading: true,
          title: Text(widget.id.toString(),
            style: const TextStyle(fontSize: 20, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold, color: Colors.white)
          ),
          actions: [],
          centerTitle: true,
          elevation: 5,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: Config.server + "/signlearn/assets/c" + widget.category.toString() + "/" + widget.id.toString() + '.png',
                      width: 423,
                      height: 295.4,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: 456.4,
                  height: 261.6,
                  decoration: const BoxDecoration(
                    color: Color(0xFFC6DEAE),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(20, 30, 10, 5),
                          child: Text(
                            widget.title.toString(),
                            style: 
                            const TextStyle(fontSize: 20, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 10),
                          child: Text(
                            widget.description.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 20, height: 1.2)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}