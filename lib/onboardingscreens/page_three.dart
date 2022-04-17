import 'package:flutter/material.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Expanded(
            // flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    Text(
                      'TWENDEKAZI',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 36),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Employ Professionals Now',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset('assets/images/engineer.png',
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width),
                ),
                const Text(
                  'Have many tasks that need sorting. Twendekazi allows you to post a number of jobs and track each individually -complete jobs and pay the service provider all through your phone',
                  // style: TextStyle(
                  //   fontWeight: FontWeight.w500,
                  // ),
                )
              ],
            )),
      ),
    );
  }
}
