import 'package:flutter/material.dart';

class HomeworkThree extends StatefulWidget {
  const HomeworkThree({Key? key}) : super(key: key);

  @override
  State<HomeworkThree> createState() => _HomeworkThreeState();
}

class _HomeworkThreeState extends State<HomeworkThree> {
  @override
  Widget build(BuildContext context) {
    ////////////////////////////    Sign Up Page  ////////////////////////

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Instagram',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    obscuringCharacter: '*',
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Passsword',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 380,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    ///////////////////////////     Log In Page   ////////////////////////
    // return Scaffold(
    //   body: Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 30),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           const Text('Instagram', style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500),),
    //           Form(
    //             child: Column(
    //               children: [
    //                 TextFormField(
    //                   keyboardType: TextInputType.emailAddress,
    //                   decoration: const InputDecoration(hintText: 'Email', border: UnderlineInputBorder(),),
    //                 ),
    //                 TextFormField(
    //                   obscuringCharacter: '*',
    //                   obscureText: true,
    //                   decoration: const InputDecoration(hintText: 'Passsword', border: UnderlineInputBorder(),),
    //                 ),
    //                 Container(
    //                   margin: const EdgeInsets.only(top: 20),
    //                   width: 380,
    //                   child: ElevatedButton(
    //                     onPressed: (){},
    //                     child: const Text('Log In'),
    //                     ),
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       const Text('Don\'t have an account? '),
    //                       TextButton(onPressed: () {}, child: const Text('Sign up', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,),),),
    //                     ],
    //                   ),
    //               ],
    //           ),
    //           ),
    //         ],
    //       ),
    //     ),

    // );
  }
}
