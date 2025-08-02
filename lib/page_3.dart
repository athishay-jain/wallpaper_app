import 'dart:typed_data';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_app/Data/Online/Model.dart';

class PreHome extends StatefulWidget {
  String url;
  PhotosModel photo;

  PreHome({required this.url, required this.photo});

  @override
  State<PreHome> createState() => _PreHomeState();
}

class _PreHomeState extends State<PreHome> {
  bool isLoading= false;
  _saveImage() async {

    loadingWidget(loading: true);
    bool result = await GallerySaver.saveImage(widget.url,albumName: "Wallpaper")??false;
    print(result);
    if (result) {
      loadingWidget(loading: false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Image as been Saved")));
    }else{
      loadingWidget(loading: false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Image Could not be Saved,please try again later")));
    }
  }
void loadingWidget({required bool loading}){

  print("check");
  isLoading = loading;
  setState(() {

  });
  Future.delayed(Duration(seconds: 2));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              top: 0,
              child: CachedNetworkImage(
                  imageUrl: widget.url,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.white,
                        ),
                      ))),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity:isLoading?1:0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withAlpha(180),
              child: Image.asset("assets/gif/loading.gif",
                  height: 150, width: 150),
            ),
          ),
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
                    shadows: [
                      Shadow(
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierColor: Colors.transparent,
                                barrierDismissible: true,
                                builder: (context) {
                                  return Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                          width: MediaQuery.of(context).size.width * 0.9,
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                              color: Colors.white.withOpacity(0.25),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // Title
                                              Text(
                                                "📄 Info",
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                              SizedBox(height: 16),

                                              // Name
                                              Text(
                                                "Name",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white70,
                                                  fontFamily: "Poppins",
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                widget.photo.alt,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),

                                              SizedBox(height: 14),

                                              // Photographer
                                              Text(
                                                "Photographer",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white70,
                                                  fontFamily: "Poppins",
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                widget.photo.photographer,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),

                                              SizedBox(height: 14),

                                              // Source
                                              Text(
                                                "Source",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white70,
                                                  fontFamily: "Poppins",
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                "Pexels",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );

                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.white.withAlpha(100))),
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
                              fontFamily: "poppins",
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
                      InkWell(
                        onTap: _saveImage,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(50),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.white.withAlpha(100))),
                              child: Icon(
                                Icons.arrow_downward_rounded,
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
                              fontFamily: "poppins",
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                          child: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                color: Colors.blue.withAlpha(150),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.white.withAlpha(100))),
                            child: Icon(
                              Icons.brush_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
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
                              fontFamily: "poppins",
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
