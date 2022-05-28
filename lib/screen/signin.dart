import 'package:flutter/material.dart';
import 'package:travel_blog/screen/home.dart';
import 'package:travel_blog/screen/signup.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> with LoginAuth {
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


      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

      const Divider(height: 1.0),
      Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Sign in",
                    style: TextStyle(fontFamily: 'poppins',
                        fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 25.0),

                  const SizedBox(height: 8.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: buildInputDecoration("Email",),

                    validator: InputValidator.email,
                  ),
                  const SizedBox(height: 8.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      obscureText: visiblePassword,
                      decoration:
                      buildInputDecoration("Password", true),
                      validator: InputValidator.password,
                      onChanged: (t) {
                        InputValidator.passwordText = t;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 26.0),
              child: Theme(
                data: ThemeData(
                    unselectedWidgetColor: Colors.blueAccent
                ),
                child: CheckboxListTile(

                  onChanged: (a) {
                    setState(() {
                      rememberMe = !rememberMe;
                    });
                  },
                  value: rememberMe,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text(
                    "Remember password",
                    style: TextStyle(fontFamily: 'poppins',
                        fontSize: 12,color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: MaterialButton(
                height: 40.0,
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.blueAccent,
                onPressed: () {
                  register();
                },
                child: isLoading
                    ? const SizedBox(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                    width: 20.0,
                    height: 20.0)
                    : const Text("Signin",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20,),
      InkWell(
        onTap: (){

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupPage()),
          );
        },
        child: Container(
          // color: const Color(0xfffcfcfb),
          height: 40.0,
          alignment: Alignment.center,
          child: const Text.rich(
            TextSpan(
              text: "Have no an account? ",style: TextStyle(fontFamily: 'poppins',
                fontSize: 12,color: Colors.white),
              children: [


                TextSpan(
                  text: " Sign up",
                  style: TextStyle(fontFamily: 'poppins',
                      fontSize: 16,color: Colors.blueAccent,fontWeight: FontWeight.bold),)
              ],

            ),
          ),
        ),
      ),
      ],
    ),
    ),
    ),
    );
  }


  InputDecoration buildInputDecoration(hintText, [eyeVisible = false]) {
    var outlineInputBorder = OutlineInputBorder(

      borderSide: BorderSide(color: Colors.white.withOpacity(0.5)),

    );

    return InputDecoration(
      suffixIcon: eyeVisible
          ? IconButton(
        icon: Icon(
          Icons.remove_red_eye,
          color: !visiblePassword ? Colors.grey : Colors.red,
        ),
        onPressed: () {
          setState(() {
            visiblePassword = !visiblePassword;
          });
        },
      )
          : const SizedBox.shrink(),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      border: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );
}

  @override
  Future register() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      });
      if (rememberMe) {
        print("saved");
      }
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        isLoading = false;
      });
    }
    return null;
  }
}

abstract class LoginAuth {
  GlobalKey<FormState> formKey = GlobalKey();
  bool rememberMe = false;
  bool visiblePassword = false;
  bool isLoading = false;
  Future register();
}

class InputValidator {
  static String? passwordText;
  static String? emailText;


  static emptyCheck(String msg) {
    return (t) {
      if (t.isEmpty || t == null) return msg;
      return null;
    };
  }

  static String? email(String? t) {
    if (t!.isEmpty) return "Email can't be empty";
    return null;
  }

  static String? password(String? t) {
    if (t!.isEmpty) return "Password can't be empty";
    return null;
  }
}


