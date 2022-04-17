import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:twendekaziprovider/onboardingscreens/page_one.dart';
import 'package:twendekaziprovider/onboardingscreens/page_three.dart';
import 'package:twendekaziprovider/onboardingscreens/page_two.dart';
import 'package:twendekaziprovider/screens/registration_screen.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  int currentPage = 0;
  List<Map<String, String>> pageData = [
    {
      "title": 'Contact via message',
      "image": 'assets/images/chat.png',
      "text":
          "Hire a service provider from easily from our application and communicate through text"
    },
    {
      "title": 'Providers near you',
      "image": 'assets/images/map.png',
      "text":
          "Our maps give you all providers near you allowing you to complete tasks promptly"
    },
    {
      "title": 'Post jobs',
      "image": 'assets/images/postjobs.png',
      "text":
          "Easily post jobs and receive bids from a number of providers near you."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: const Alignment(0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text('skip')),
                const Icon(Icons.keyboard_double_arrow_right)
              ],
            ),
          ),
          PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              itemCount: pageData.length,
              itemBuilder: (context, index) => PageContent(
                  title: pageData[index]['title'],
                  image: pageData[index]['image'],
                  text: pageData[index]['text'])),
          Container(
            alignment: const Alignment(0, 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const SlideEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.95),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
              child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  onPressed: () {
                    Get.to(const RegistrationScreen());
                  },
                  child: const Text(
                    'GET STARTED',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class PageContent extends StatefulWidget {
  var image;
  var text;
  var title;

  PageContent({Key? key, this.image, this.text, this.title}) : super(key: key);

  @override
  State<PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AspectRatio(
            //   aspectRatio: 16 / 9,
            //   child: Image.asset(widget.image),
            // ),
            Center(
              child: Image.asset(widget.image,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.title,
              style: GoogleFonts.oswald(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(color: Colors.black, fontSize: 16
                  // fontWeight: FontWeight.w400,
                  ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
