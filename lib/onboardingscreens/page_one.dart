import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:twendekaziclient/navigation/default_button.dart';
import 'package:twendekaziprovider/screens/registration_screen.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
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
          "Our maps give you all providers near you \n allowing you to complete tasks promptly"
    },
    {
      "title": 'Post jobs',
      "image": 'assets/images/postjobs.png',
      "text":
          "Easily post jobs and receive bids from a \n number of providers near you."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Row(
                      children: const [
                        Text(
                          'skip',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(Icons.keyboard_double_arrow_right_rounded)
                      ],
                    )),
              ]),
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                          onLastPage = (index == 2);
                        });
                      },
                      itemCount: pageData.length,
                      itemBuilder: (context, index) => PageContent(
                          title: pageData[index]['title'],
                          image: pageData[index]['image'],
                          text: pageData[index]['text']))),
            ],
          ),
        ),
      ),
    );
  }

  // AnimatedContainer buildDot({required int index}) {
  //   return AnimatedContainer(
  //       duration: Duration(milliseconds: 500),
  //       margin: EdgeInsets.only(right: 5),
  //       height: 6,
  //       width: currentPage == index ? 20 : 6,
  //       decoration: BoxDecoration(
  //         color: currentPage == index ? Colors.blue[800] : Colors.grey[300],
  //         borderRadius: BorderRadius.circular(3),
  //       ));
  // }
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
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(widget.image),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.title,
              style: GoogleFonts.oswald(
                color: Colors.blue[900],
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: const Color.fromARGB(255, 39, 90, 177),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            SmoothPageIndicator(controller: _controller, count: 3),
            const SizedBox(height: 25),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 33, 87, 35),
              child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width * 0.5,
                  onPressed: () {
                    Get.to(const RegistrationScreen());
                  },
                  child: const Text(
                    'GET STARTED',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );

    // Column(
    //   children: [
    //     AspectRatio(
    //       aspectRatio: 1 / 1,
    //       child: Image.asset(image),
    //     ),
    //     const Spacer(),
    //     Text(
    //       title,
    //       textAlign: TextAlign.center,
    //       style: GoogleFonts.oswald(
    //         color: Colors.blue[900],
    //         fontSize: 26,
    //         fontWeight: FontWeight.w500,
    //       ),
    //     ),
    //     Text(
    //       text,
    //       textAlign: TextAlign.center,
    //       style: GoogleFonts.roboto(
    //         color: Colors.blueAccent,
    //         fontSize: 20,
    //         fontWeight: FontWeight.w400,
    //       ),
    //     ),
    //   ],
    // );
  }
}
