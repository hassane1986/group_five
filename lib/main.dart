import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyAppState();
}

class _MyAppState extends State<MyHome> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  var ctx = '';

  Future<void> shouwInformaionDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          // print(_textEditingController.text);
                          return value != null && value.isNotEmpty
                              ? null
                              : "Invalid Field";
                        },
                        decoration: InputDecoration(hintText: "Enter  Text"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Write Name Profile :"),
                        ],
                      )
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: Text('Okay'),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //  ctx = _textEditingController.text.toString();
                      // print(ctx);
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  final int cpt = 0;

  final double imags = 350;

  final double rds = 100;

  final double t = 300 - 80;
  int indexCategory = 0;

  List list = ['Food', 'Pizza', 'Salades', 'Fruits', 'Vegetables'];
  Widget circlo() => CircleAvatar(
        radius: rds / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage("assets/sandwich.jpg"),
      );
  /**************************/
  Widget gridFood() {
    return GridView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 261,
      ),
      itemBuilder: (context, index) {
        String food = list[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyApp();
            }));
          },
          child: Container(
            height: 261,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          "assets/sandwich.jpg",
                          //  food.image,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "hhhh",
                        // style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text("555555" //food.cookingTime,
                              // style: TextStyle(color: Colors.grey[600]),
                              ),
                          const Spacer(),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            "666",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const Positioned(
                  top: 12,
                  right: 12,
                  child: Icon(Icons.favorite_border, color: Colors.grey),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Material(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

/*********************** */
  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Spacer(),
          //const Spacer(),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/sandwich.jpg',
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }

/*********************** */
  Widget categories() {
    List list = ['Food', 'Pizza', 'Salades', 'Fruits', 'Vegetables'];

    return Container(
      width: double.maxFinite,
      height: 50,

      //width: double.infinity,
      child: ListView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                indexCategory = index;
                setState(() {
                  print("yes");
                });
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(index == 0 ? 16 : 16, 0,
                    index == list.length - 1 ? 16 : 16, 0),
                alignment: Alignment.center,
                child: Text(
                  list[index],
                  style: TextStyle(
                    fontSize: 20,
                    //color: Colors.black,
                    color: indexCategory == index ? Colors.green : Colors.grey,
                    fontWeight: indexCategory == index ? FontWeight.bold : null,
                  ),
                ),
              ),
            );
          }),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
              width: double.infinity,
              height: 250,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: imags,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/sandwich.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(child: header())
                ],
              )),
          //header(),
          const SizedBox(height: 1),
          circlo(),
          //header(),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${ctx == '' ? "Hello Easy learn " : '$ctx'} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await shouwInformaionDialog(context);
                        setState(() {
                          ctx = _textEditingController.text;
                        });
                      },
                      icon: Icon(CupertinoIcons.pen),
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //  title(),
          // const SizedBox(height: 20),
          //  search(),
          const SizedBox(height: 5),
          categories(),
          const SizedBox(height: 5),
          gridFood(),
        ],
      ),
    );
  }
}
