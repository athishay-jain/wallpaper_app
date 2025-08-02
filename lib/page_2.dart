import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_app/Data/Online/Model.dart';
import 'package:wallpaper_app/page_3.dart';

class CategoriesScreen extends StatefulWidget {
  String name;
  List<PhotosModel> mPhotos;

  CategoriesScreen({required this.mPhotos, required this.name});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<String> wall = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUUD8HODZUJW14nbjs9d8AvXuMGmbFtcQwVaRMD0ZQvGzs4dOc",
    "https://wallpapersmug.com/download/1366x768/ad7960/green-waves-aerial-view.jpg",
    "https://i.pinimg.com/236x/d0/a4/8f/d0a48f5001061c8a5e433887fc11456e.jpg",
    "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTOf85Bw4IhznFufGAggq3PYWPothg6y6l16HcP1ZUQ7h1enAkr",
    "https://wallpapersmug.com/large/48f4a4/swiss-mountains-lake-nature-in-autumn.jpg",
    "https://wallpapersmug.com/large/ce190f/island-waterfall-nature-sunset.jpg",
    "https://wallpapersmug.com/large/cf6647/golden-sunset-reflection-vibes-art.jpg",
    "https://wallpapersmug.com/thumb/6e841f/gunsight-butte-lake.jpg",
    "https://wallpapersmug.com/thumb/811764/sky-and-nature-breathtaking-beauty-of-nature.jpg",
    "https://wallpapersmug.com/large/76cc20/torres-del-paine-national-park-5k-golden-summit.jpg",
    "https://wallpapersmug.com/thumb/bcf654/lago-di-carezza-karersee-nature.jpg",
    "https://wallpapersmug.com/thumb/c19a5d/golden-dawn-river-sunrise-beatuiful-canal.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffedf3f4)),
      backgroundColor: Color(0xffedf3f4),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                fontFamily: "poppins",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '${widget.mPhotos.length} wallpaper available',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: "poppins",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: MasonryGridView.count(
                shrinkWrap: true,
                itemCount: widget.mPhotos.length,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) {
                  PhotosModel photo = widget.mPhotos[i];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return PreHome(url: photo.src.large2x,photo: photo,);
                          },
                        ));
                      });
                    },
                    child: Padding(
                      padding:
                          i == 1 ? EdgeInsets.only(top: 80) : EdgeInsets.zero,
                      child: SizedBox(
                        height: 250,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: photo.src.portrait,
                              fit: BoxFit.cover,
                              placeholder: (context, url) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            )),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
