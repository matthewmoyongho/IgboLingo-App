import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants.dart';
import '../../data/models/video.dart';

class VideoTIle extends StatelessWidget {
  VideoTIle({
    super.key,
    required this.videos,
    required this.index,
  });

  final List<Video> videos;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      // color: kPrimaryColor,
      width: 200,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(

                    // image: DecorationImage(
                    //     image:FadeInImage(placeholder: AssetImage('assets/avatar.png'),image: NetworkImage(videos[index].thumbnail),),
                    //     fit: BoxFit.cover),
                    ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/image_4.png'),
                    image: NetworkImage(videos[index].thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 220,
                    child: Text(
                      videos[index].name,
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      //softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '5 mins',
                    style: GoogleFonts.poppins(
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0XFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '15s rest',
                  style: TextStyle(
                    color: Color(0xFF839fed),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 70; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
