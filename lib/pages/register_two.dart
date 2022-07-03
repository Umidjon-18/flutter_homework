import 'package:flutter/material.dart';
import 'package:flutter_homework/pages/login.dart';

class RegisterTwo extends StatefulWidget {
  const RegisterTwo({Key? key}) : super(key: key);

  @override
  State<RegisterTwo> createState() => _RegisterTwoState();
}

class _RegisterTwoState extends State<RegisterTwo> {
  

  Color dividerOne = Colors.grey;
  Color dividerTwo = Colors.grey;
  Color dividerThree = Colors.grey;
  Color dividerFour = Colors.grey;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(136, 47, 47, 47),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          children: [
            Column(
          children: [
            Form(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 165, top: 58),
                      child: const Image(
                        image: AssetImage('assets/images/ic_logo.png'),
                        width: 146,
                        height: 24,
                      ),
                      // child:
                    ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: 327,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'E-mail adress',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    width: 327,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Password',
                            style: TextStyle(color: Colors.grey)),
                        TextFormField(
                              onChanged: (value) {
                                if(value.length<8){
                                  setState(() {
                                    dividerOne = Colors.grey;
                                    dividerTwo = Colors.grey;
                                    dividerThree = Colors.grey;
                                    dividerFour = Colors.grey;
                                  });
                                }
                                if (value.length >= 8 && value.length < 12) {
                                  setState(() {
                                    dividerOne = Colors.green;
                                    dividerTwo = Colors.grey;
                                    dividerThree = Colors.grey;
                                    dividerFour = Colors.grey;
                                  });
                                }
                                if (value.length >= 12 && value.length < 16) {
                                  setState(() {
                                    dividerOne = Colors.green;
                                    dividerTwo = Colors.green;
                                    dividerThree = Colors.grey;
                                    dividerFour = Colors.grey;
                                  });
                                }
                                if (value.length >= 16 && value.length < 20) {
                                  setState(() {
                                    dividerOne = Colors.green;
                                    dividerTwo = Colors.green;
                                    dividerThree = Colors.green;
                                    dividerFour = Colors.grey;
                                  });
                                }
                                if (value.length >= 20) {
                                  setState(() {
                                    dividerOne = Colors.green;
                                    dividerTwo = Colors.green;
                                    dividerThree = Colors.green;
                                    dividerFour = Colors.green;
                                  });
                                }
                              },
                          style: const TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Row(children:  <Widget>[
                      Expanded(
                          child: Divider(
                        height: 3,
                        thickness: 7,
                        color: dividerOne,
                      )),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                          child: Divider(
                        height: 3,
                        thickness: 7,
                        color: dividerTwo,
                      )),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                          child: Divider(
                        height: 3,
                        thickness: 7,
                        color: dividerThree,
                      )),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                          child: Divider(
                        height: 3,
                        thickness: 7,
                        color: dividerFour,
                      )),
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    margin: const EdgeInsets.only(bottom: 40),
                    child: const Text(
                      'Use 8 or more characters with a mix of letters, numbers & symbols.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 130),
                    width: 327,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(206, 233, 79, 36),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Get started, it\'s free!',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ))
                      ],
                    ),
                  ),
                  const Text(
                    'Do you have already an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 24, top: 20),
                    width: 327,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            
            ),
          ],
        ),
      
          ],
        ),
        
      ),
    );
  }
}
