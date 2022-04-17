import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({ Key? key }) : super(key: key);

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
                      'Create your client profile',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset('assets/images/swipe.png',
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width),
                ),
                const Text(
                  'Set up you profile in a few easy steps and start assigning work to professionals near you',
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