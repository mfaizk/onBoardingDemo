import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xfffe8103),
          alignment: Alignment.center,
          child: const Text("AssetImage will Be here"),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xfffe8103),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xfffe8103),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: "login",
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signinPage');
                        },
                        elevation: 5.0,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: SizedBox(
                            height: 50,
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height),
                              ),
                              alignment: Alignment.center,
                              child: const Text("Login"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "register",
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signupPage');
                        },
                        elevation: 5.0,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: SizedBox(
                            height: 50,
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.height),
                              ),
                              alignment: Alignment.center,
                              child: const Text("Register Now"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xfffe8103),
                alignment: Alignment.center,
                child: const Text(
                  "Now Quick Login Use Touch ID",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xfffe8103),
                alignment: Alignment.center,
                child: const FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Icon(
                    Icons.fingerprint,
                    size: 100.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xfffe8103),
                alignment: Alignment.center,
                child: const Text(
                  "Use Touch ID",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
