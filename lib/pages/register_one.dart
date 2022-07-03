import 'package:flutter/material.dart';
import 'package:flutter_homework/pages/register_two.dart';

class RegisterOne extends StatefulWidget {
  const RegisterOne({Key? key}) : super(key: key);

  @override
  State<RegisterOne> createState() => _RegisterOneState();
}

class _RegisterOneState extends State<RegisterOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(136, 47, 47, 47),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 312, top: 58),
                      child: const Image(
                        image: AssetImage('assets/images/ic_logo.png'),
                        width: 146,
                        height: 24,
                      ),
                      // child:
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(324, 48),
                          shape: const StadiumBorder(),
                          primary: Colors.black,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.apple,
                              color: Colors.white,
                              size: 18,
                            ),
                            Text(
                              'Sign up with Apple',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      // child:
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(324, 48),
                          shape: const StadiumBorder(),
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: AssetImage('assets/images/ic_google.png'),
                              color: Colors.black,
                              width: 14,
                            ),
                            Text(
                              ' Sign up with Google',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(324, 48),
                          shape: const StadiumBorder(),
                          primary: Colors.blue,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 18,
                            ),
                            Text(
                              ' Sign up with Facebook',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'or',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 24, top: 40),
                      width: 327,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(324, 48),
                          shape: const StadiumBorder(),
                          primary: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterTwo()),
                          );
                        },
                        child: const Text(
                          'Sign up with E-mail',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Text(
                          'By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
