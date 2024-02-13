import 'package:drive_flow_ui/screens/intro_screen/FirstScreen.dart';
import 'package:drive_flow_ui/screens/intro_screen/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScrenn extends StatefulWidget {
  const IntroScrenn({super.key});

  @override
  State<IntroScrenn> createState() => _IntroScrennState();
}

class _IntroScrennState extends State<IntroScrenn> {
    final PageController _controller = PageController();
    bool isLastScreen=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                isLastScreen=(index==1);
              });
            },
            children: const [
               FirstScreen(),
               SecondScreen(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.85,
                  ),
                    Visibility(
                      visible: !isLastScreen,
                      child: GestureDetector(
                        onTap: () {
                          _controller.nextPage(duration: const  Duration(microseconds: 500), curve: Curves.easeIn);
                        },
                        child:  const Text(
                         'Next',
                         style:  TextStyle(
                             fontSize: 18,
                             fontFamily: 'Poppins',
                             color: Color(0xFF848080),),
                                           ),
                      ),
                    ),
                   Visibility(
                    visible: isLastScreen,
                     child: const Text(
                       ' ',
                       style:  TextStyle(
                           fontSize: 18,
                           fontFamily: 'Poppins',
                           color: Color(0xFF848080),),
                     ),
                   ),
                  const SizedBox(height: 20,),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                    effect:  const SlideEffect(dotWidth: 18, dotHeight: 10),
                  ),
                ],
              ))
        ]),
      );
  }
}