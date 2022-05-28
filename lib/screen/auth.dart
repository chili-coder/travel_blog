import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_blog/screen/signin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/cover.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.7),
            BlendMode.darken,
          ),

        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 40,),
              Expanded(flex:5,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Everyday New",style: TextStyle(fontFamily: 'poppins',
                    fontSize: 24,color: Colors.white,fontWeight: FontWeight.w300),),
                  Text("Travel Blog",style: TextStyle(fontFamily: 'tiroBangla',
                      fontSize: 40,color: Colors.white,fontWeight: FontWeight.w900),),
                ],
              )),

              Expanded(flex:2,child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text("SIGN IN",style: TextStyle(fontFamily: 'poppins',
                            fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),),
                      ),
                      onPressed: () =>  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SigninPage()),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text("SIGN IN WITH GOOGLE",style: TextStyle(fontFamily: 'poppins',
                            fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),),
                      ),
                      onPressed: () => print("it's pressed"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                ],
              )),

            ],
          ),
        )
      ),

    );
  }
}
