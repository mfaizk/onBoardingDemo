import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  AppBar appBar = AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: SizedBox(
          height: (MediaQuery.of(context).size.height) -
              appBar.preferredSize.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: (MediaQuery.of(context).size.height * 0.3) -
                    appBar.preferredSize.height,
                width: MediaQuery.of(context).size.width,
                child: const Text("AssetImage will be here"),
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                alignment: Alignment.center,
                height: (MediaQuery.of(context).size.height * 0.7) -
                    appBar.preferredSize.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Card(
                    shadowColor: Colors.grey,
                    elevation: 5.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          child: const Text(
                            "Hello",
                            style: TextStyle(
                                fontSize: 40, color: Color(0xff394251)),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width,
                          child: const Text(
                            "Sign into your Acount",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff394251),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 25.0,
                          ),
                        ),
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Wrap(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    label: Text('Email ID'),
                                    suffixIcon: Icon(
                                      Icons.email,
                                      color: Color(0xffff7c18),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: passController,
                                  decoration: const InputDecoration(
                                    label: Text('Password'),
                                    suffixIcon: Icon(
                                      Icons.password,
                                      color: Color(0xffff7c18),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'Forgot your password?',
                                    style: TextStyle(
                                      color: Color(0xffb4b4b4),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 40.0,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Hero(
                                    tag: "login",
                                    child: Consumer(
                                      builder: (context, ref, child) {
                                        final value = ref.read(authprovider);
                                        return MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              value
                                                  .signInWithUserNameAndPassWord(
                                                      emailController.text,
                                                      passController.text);
                                              passController.clear();
                                              emailController.clear();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: SizedBox(
                                              height: 50,
                                              width: 250,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffff7c18),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height),
                                                ),
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  "Login",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width: MediaQuery.of(context).size.width,
                                  child: const Text(
                                    'Or Login using Social Media',
                                    style: TextStyle(
                                      color: Color(0xffb4b4b4),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.facebook,
                                        color: Colors.blue,
                                      ),
                                      VerticalDivider(
                                        thickness: 20,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.g_mobiledata,
                                        color: Colors.blueAccent,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                alignment: Alignment.bottomCenter,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Dont\'t have an account?'),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/signupPage');
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(color: Color(0xffff7c18)),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
