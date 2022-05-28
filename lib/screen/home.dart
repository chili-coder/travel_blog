import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_blog/wegets/card1.dart';
import 'package:travel_blog/wegets/card2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu,color: Colors.black54,),
        actions: [
          Icon(Icons.search,color: Colors.black,),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: CircleAvatar(
                  radius: 16.0,
                  backgroundImage:
                  AssetImage("assets/images/profile.png"),
          ),
              ),

        ],

      ),


      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Daily",style: TextStyle(fontFamily: 'poppins',
                    fontSize: 20,color: Colors.grey,fontWeight: FontWeight.w300),),
                Text("Recommendation",style: TextStyle(fontFamily: 'poppins',
                    fontSize: 26,color: Colors.black,fontWeight: FontWeight.w900),),
                SizedBox(height: 10,)
              ],
            ),

            Expanded(flex:3,child: CardOne()),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text("Top",style: TextStyle(fontFamily: 'poppins',
                        fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(width: 16,),
                    Text("Popular",style: TextStyle(fontFamily: 'poppins',
                        fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w300),),
                    SizedBox(width: 16,),
                    Text("Tranding",style: TextStyle(fontFamily: 'poppins',
                        fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w300),),
                    SizedBox(width: 16,),
                    Text("Editor",style: TextStyle(fontFamily: 'poppins',
                        fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w300),),
                    SizedBox(width: 16,),
                    Text("Hotel",style: TextStyle(fontFamily: 'poppins',
                        fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w300),),
                    SizedBox(width: 16,),
                    Text("Abroad",style: TextStyle(fontFamily: 'poppins',
                        fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w300),),
                    SizedBox(width: 16,),
                    Text("Historical",style: TextStyle(fontFamily: 'poppins',
                        fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w300),),
                  ],
                ),
              ),
            ),
            Expanded(flex:5,child: CardTwo()),

          ],
        ),
      ),
    );
  }
}
