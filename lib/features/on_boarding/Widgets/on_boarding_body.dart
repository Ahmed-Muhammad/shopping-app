import 'package:flutter/material.dart';

class BoardingModel {
  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });

  final String image;
  final String title;
  final String body;
}

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => buildBoardingItem(),
              itemCount: 3,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Text('indicator'),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.arrow_forward_ios),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildBoardingItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Expanded(
              child: Image(image: AssetImage("assets/images/onBoarding.jpg"))),
          SizedBox(height: 30),
          Text(
            'Screen Title',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Screen body',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
