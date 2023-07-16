import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:film/future/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class imageSlider extends StatelessWidget {
  Stream<QuerySnapshot> stream;
  imageSlider({required this.stream});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.55,
      color: MyTheme.black,
      width: size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? SizedBox()
              : Stack(alignment: Alignment.bottomCenter, children: [
                  PageView.builder(
                      controller: controller,
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        DocumentSnapshot myref = snapshot.data!.docs[index];
                        return Container(
                          height: size.height * 0.55,
                          width: size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(myref["resim"]))),
                        );
                      }),
                  Positioned(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SmoothPageIndicator(
                      count: snapshot.data!.docs.length,
                      controller: controller,
                      effect: ScrollingDotsEffect(
                        dotHeight: 6,
                        dotWidth: 6,
                        radius: 0,
                        activeDotColor: MyTheme.green,
                        dotColor: MyTheme.white,
                      ),
                    ),
                  ))
                ]);
        },
      ),
    );
  }
}
