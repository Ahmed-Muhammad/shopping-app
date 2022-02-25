import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../login_screen/ui/login_screen.dart';

class BoardingModel {
  BoardingModel({required this.image, required this.title, required this.body});

  final String image;
  final String title;
  final String body;
}

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController? boardController;

  @override
  void initState() {
    boardController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    boardController?.dispose();
    super.dispose();
  }

  List<BoardingModel?> boarding = [
    BoardingModel(
        image: "assets/images/onBoarding.jpg",
        title: 'title 1 ',
        body: 'body 1 '),
    BoardingModel(
        image: "assets/images/onBoarding.jpg",
        title: 'title 2 ',
        body: 'body 2 '),
    BoardingModel(
        image: "assets/images/onBoarding.jpg",
        title: 'title 3 ',
        body: 'body 3 '),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: boardController,
              onPageChanged: (int currentIndex) {
                if (currentIndex == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              itemBuilder: (context, index) =>
                  buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SmoothPageIndicator(
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.deepOrange,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                  expansionFactor: 4,
                ),
                controller: boardController!,
                count: boarding.length,
              ),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (isLast) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  } else {
                    setState(() {
                      boardController?.nextPage(
                          duration: const Duration(microseconds: 100),
                          curve: Curves.fastLinearToSlowEaseIn);
                    });
                  }
                },
                child: const Icon(Icons.arrow_forward_ios),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget buildBoardingItem([BoardingModel? boarding]) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage(boarding!.image))),
        const SizedBox(height: 30),
        Text(
          boarding.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          boarding.body,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
