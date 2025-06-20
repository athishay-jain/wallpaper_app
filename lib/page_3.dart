import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_app/page_2.dart';

class PreHome extends StatefulWidget {
  String url;

  PreHome({required this.url});

  @override
  State<PreHome> createState() => _PreHomeState();
}

class _PreHomeState extends State<PreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              top: 0,
              child: CachedNetworkImage(imageUrl: widget.url,
                fit: BoxFit.cover,
                placeholder: (context,url) =>
                    Shimmer.fromColors(baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 100, width: 100, color: Colors.white,),))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                    shadows: [Shadow(
                      color: Colors.black,
                      blurRadius: 10,
                    )
                    ],
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  SizedBox(
                    width: 85,
                  ),
                  Column(
                    children: [
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 5),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(55, 55),
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: Colors.white.withAlpha(70),
                                  shadowColor: Colors.black.withAlpha(30),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Text(
                          "Info",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 5),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(55, 55),
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: Colors.white.withAlpha(70),
                                  shadowColor: Colors.black.withAlpha(30),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: Icon(
                                Icons.save_alt_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(55, 55),
                            padding: EdgeInsets.all(10),
                            backgroundColor: Color(0xff3f65f4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Icon(
                            Icons.brush,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Text(
                          "Apply",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
