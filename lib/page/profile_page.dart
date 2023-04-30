import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState()=> _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: scaffoldKey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                child: Container(
                  width: 406.2,
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6EBE0),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: const [
                              Expanded(
                                flex: 8,
                                child: Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 10),
                                    child: Text(
                                      'Favourite',
                                      style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: AlignmentDirectional(0, 1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 10),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10, 5, 5, 20),
                                  child: Container(
                                    width: 120,
                                    height: 150,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 223, 223, 223),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: Image.network(
                                            'https://media.baamboozle.com/uploads/images/190665/1608397021_124160',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: const [
                                                Expanded(
                                                  flex: 8,
                                                  child: Text(
                                                    'A',
                                                    style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Icon(
                                                    Icons.favorite_rounded,
                                                    color: Color(0xFFACD783),
                                                    size: 24,
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 20),
                                  child: Container(
                                    width: 120,
                                    height: 150,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 223, 223, 223),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Image.network(
                                              'https://res.cloudinary.com/spiralyze/image/upload/f_auto/BabySignLanguage/DictionaryPages/bye-bye-preview-png.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: const [
                                                Expanded(
                                                  flex: 8,
                                                  child: Text(
                                                    'Hello',
                                                    style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Icon(
                                                    Icons.favorite_rounded,
                                                    color: Color(0xFFACD783),
                                                    size: 24,
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 20),
                                  child: Container(
                                    width: 120,
                                    height: 150,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 223, 223, 223),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: Image.network(
                                            'https://cdn2.iconfinder.com/data/icons/minimal-sign-language/256/minimal_sign_6-512.png',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: const [
                                                Expanded(
                                                  flex: 8,
                                                  child: Text(
                                                    'Mother',
                                                    style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Icon(
                                                    Icons.favorite_rounded,
                                                    color: Color(0xFFACD783),
                                                    size: 24,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                child: Container(
                  width: 406.2,
                  height: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6EBE0),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                          child: Text(
                            'Quiz Result',
                            style:
                                TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                    ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 5, 5, 20),
                              child: Container(
                                width: 120,
                                height: 150,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 223, 223, 223),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Image.network(
                                          'https://png.pngtree.com/png-clipart/20210310/ourlarge/pngtree-math-clipart-cartoon-numbers-png-image_2997366.jpg',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    const Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'Number',
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                    const Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '100%',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 5, 5, 20),
                              child: Container(
                                width: 120,
                                height: 150,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 223, 223, 223),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Image.network(
                                          'https://static.vecteezy.com/system/resources/previews/002/084/012/original/cute-girl-cartoon-character-cry-feel-sad-free-vector.jpg',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    const Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'Feeling',
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                    const Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '75%',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(10, 5, 5, 20),
                              child: Container(
                                width: 120,
                                height: 150,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 223, 223, 223),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Image.network(
                                          'https://www.shutterstock.com/image-vector/cute-bear-say-hello-cartoon-260nw-1724930290.jpg',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    const Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'Number',
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                    const Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          '95%',
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


// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}):super(key: key);
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context){
//     return const MaterialApp(
//       home: Center(child: Text('Profile')),
//     );
//   }
// }