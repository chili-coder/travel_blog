import 'package:flutter/material.dart';
import 'package:travel_blog/screen/signin.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with RegisterAuth {
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
      // backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              InkWell(
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SigninPage()),
                  );
                },
                child: Container(
                  // color: const Color(0xfffcfcfb),
                  height: 40.0,
                  alignment: Alignment.center,
                  child: const Text.rich(
                    TextSpan(
                      text: "Have an account? ",style: TextStyle(fontFamily: 'poppins',
                        fontSize: 12,color: Colors.white),
                      children: [
                        TextSpan(
                            text: " Sign in",
                        style: TextStyle(fontFamily: 'poppins',
                        fontSize: 16,color: Colors.blueAccent,fontWeight: FontWeight.bold),)
                      ],

                    ),
                  ),
                ),
              ),
              const Divider(height: 20),
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
                          Text("Sign up",
                          style: TextStyle(fontFamily: 'poppins',
                          fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 25.0),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: buildInputDecoration("Full Name",),
                            validator: InputValidator.emptyCheck(
                              "Full name can't be empty",
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration:
                              buildInputDecoration("Phone"),
                              validator: InputValidator.phone,
                            ),
                          ),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              obscureText: visiblePassword,
                              onChanged: (t) {
                                InputValidator.confirmPasswordText = t;
                              },
                              decoration: buildInputDecoration(
                                  "Re-enter password", true),
                              validator: InputValidator.password,
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
                            "I'm agree above information are true",
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
                            : const Text("Create account",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

abstract class RegisterAuth {
  GlobalKey<FormState> formKey = GlobalKey();
  bool rememberMe = false;
  bool visiblePassword = false;
  bool isLoading = false;
  Future register();
}

class InputValidator {
  static String? confirmPasswordText;
  static String? passwordText;
  static String? emailText;
  static String? name;
  static String? phoneNumber;

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

  static String? phone(String? t) {
    if (t!.isEmpty) return "Phone can't be empty";
    return null;
  }

  static String? password(String? t) {
    if (t!.isEmpty) return "Password can't be empty";
    if (confirmPasswordText != passwordText) return "Password not matched";
    return null;
  }
}

