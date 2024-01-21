import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sbsr/Modules/GetStarted/contents.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});
  static const String routeName = "GetStarted";

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  int currentindex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQ = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff016132A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
                controller: _controller,
                itemCount: 4,
                onPageChanged: (int index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        content[i].img,
                        height: mediaQ.height * 0.3,
                        width: mediaQ.width * 0.6,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        content[i].discr,
                        style: const TextStyle(
                            color: Color(0xff0FEFFE8),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    ],
                  );
                }),
          ),
          Expanded(
            flex: 1,
            child: Column(
              
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        content.length, (index) => buildreq(index, context)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      currentindex != 0
                          ? GestureDetector(
                              onTap: () {
                                _controller.jumpToPage(currentindex - 1);
                              },
                              child: const Text(
                                "Back",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            )
                          : const Text(""),
                      GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(microseconds: 100),
                                curve: Curves.bounceIn);
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildreq(int index, BuildContext context) {
    return Container(
      width: 15,
      height: 4,
      color:
          currentindex == index ? Colors.white : Colors.white.withOpacity(0.5),
      margin: const EdgeInsets.only(right: 15,bottom: 25),
    );
  }
}
