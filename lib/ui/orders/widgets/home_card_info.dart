import 'package:flapkap_flutter_challenge/ui/components/text_style.dart';
import 'package:flapkap_flutter_challenge/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCardInfo extends StatelessWidget {
  const HomeCardInfo({
    Key? key,
    required this.image,
    required this.opacityImage,
    required this.title,
    required this.number,
    required this.onPressed,
  }) : super(key: key);

  final String image;
  final String opacityImage;
  final String title;
  final String number;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: isMobile()
              ? ScreenUtil().screenWidth * .95
              : ScreenUtil().screenWidth * .25,
          height: isMobile()
              ? ScreenUtil().screenHeight * .2
              : ScreenUtil().screenHeight * .31,
          decoration: BoxDecoration(
            color: primaryDarkColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: medText(number, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: medText(title, color: Colors.white),
                      ),
                    ],
                  ),
                  ClipRRect(
                    child: SizedBox(
                      width: isMobile()
                          ? ScreenUtil().screenWidth * .35
                          : ScreenUtil().screenWidth * .1,
                      height: ScreenUtil().screenHeight * .2,
                      child: FractionalTranslation(
                        translation: const Offset(0.2, -0.1),
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(15 / 360),
                          child: Image.asset(
                            opacityImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
