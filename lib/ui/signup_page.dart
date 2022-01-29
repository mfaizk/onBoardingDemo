import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
                color: Colors.white,
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
                            "Create Account",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff394251),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 25.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: SingleChildScrollView(
                            child: Wrap(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: const InputDecoration(
                                    label: Text('name'),
                                    suffixIcon: Icon(
                                      Icons.verified_user,
                                      color: Color(0xffff7c18),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    label: Text('Email'),
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
                                      Icons.remove_red_eye,
                                      color: Color(0xffff7c18),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      activeColor: Colors.grey,
                                      value: true,
                                      onChanged: (b) {},
                                    ),
                                    Container(
                                      color: Colors.white,
                                      alignment: Alignment.centerRight,
                                      child: const Text(
                                        'I Read and Agree to Terms and Condition',
                                        style: TextStyle(
                                          color: Color(0xffb4b4b4),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                    top: 40.0,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Hero(
                                    tag: "register",
                                    child: Consumer(
                                      builder: (context, ref, child) {
                                        final value = ref.read(authprovider);
                                        return MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              value.signUpWithNameAndPassword(
                                                  emailController.text,
                                                  passController.text,
                                                  nameController.text);
                                              passController.clear();
                                              emailController.clear();
                                              nameController.clear();
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
                                                  "Register Now",
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
                                    'Or Register using Social Media',
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
                    const Text('Already have an account?'),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/signinPage');
                        },
                        child: const Text(
                          'Login',
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
