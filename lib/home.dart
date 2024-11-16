import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    fetchdata();
  }

  void fetchdata() async{
    var url = Uri.parse('https://gorest.co.in/public-api/users');
    var response = await http.get(url);
    if(response.statusCode==200){
      try{
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }catch (e){

      }
    }


    print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }

  List<UserCard> data = [
    UserCard(user: 'User1', email: "email1"),
    UserCard(user: 'User1', email: "email1"),
    UserCard(user: 'User1', email: "email1"),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
      ),
      body:
      Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blueGrey
                    ),
                    padding: EdgeInsets.all(15),
                    height: 50,
                 //   color: Colors.grey,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "search people....",
                        hintStyle: TextStyle(color: Colors.white)
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                Icon(Icons.search,color: Colors.blueGrey,size: 40,)
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: SizedBox(
                height: 2,
                width: double.maxFinite,
                child: ColoredBox(color: Colors.blueGrey),
              ),
            ),
            // Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       ListView(
            //         children: [
            //           UserCard(user: 'User1', email: "email1"),
            //           UserCard(user: 'User1', email: "email1"),
            //           UserCard(user: 'User1', email: "email1"),
            //         ],
            //       )
            //     ],
            //   ),
            // )
            // ListView.builder(itemBuilder: )
          ],
        ),
      ),
    );
  }


}

class UserCard extends StatelessWidget {
  String? user, email;
  UserCard({required this.user,required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Material(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('  UserName : $user',textAlign: TextAlign.left,),
              Text('  Email : $email'),
            ],
          ),
        ),
      ),
    );
  }
}

