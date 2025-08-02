import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_app/Data/Online/Bloc/photos_bloc.dart';
import 'package:wallpaper_app/Data/Online/Bloc/photos_event.dart';
import 'package:wallpaper_app/Data/Online/Bloc/photos_state.dart';
import 'package:wallpaper_app/Data/Online/Model.dart';
import 'package:wallpaper_app/appContents.dart';
import 'package:wallpaper_app/page_2.dart';
import 'package:wallpaper_app/page_3.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

void getapi() async {
  String url = "https://api.pexels.com/v1/curated?page=1&per_page=20";
  http.Response res = await http.get(
    Uri.parse(url),
    headers: {
      "Authorization":
          "HuieUshJkwM4HmRbzixTAj8TPpuxD3npz442tslVjWHlkne4jLBotquH"
    },
  );
  print(res.body);
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getapi();
    context.read<PhotosBloc>().add(SetInitialPhotos());
  }
bool close = false;
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> cat = [
    {
      "url":
          "https://i.pinimg.com/236x/ae/59/45/ae59450df379bbbcf3ab0024908e42a8.jpg",
    },
    {
      "url":
          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQuI09xMzIDOWRAX2IlFPr_VBfmwRxMptrxVFefwnUIpZRRzx5s",
    },
    {
      "url":
          "https://wallpapers.com/images/high/pastel-ipad-watery-mixture-fwz5ogigbtxcegh8.webp",
    },
    {
      "url":
          "https://wallpapersmug.com/thumb/19276c/prismatic-abstract-lines-circle.jpg"
    },
    {
      "url":
          "https://wallpapersmug.com/thumb/9d8312/red-petal-blossom-render-digital-art.jpg"
    },
    {"url": "https://wallpapersmug.com/thumb/bd4987/orange-drops-coloseup.jpg"},
    {"url": "https://wallpapersmug.com/thumb/51afe4/liquid-flux-abstract.jpg"},
    {
      "url":
          "https://wallpapersmug.com/thumb/82d4cb/asus-vibobook-colorful-ribbon.jpg"
    },
    {
      "url": "https://wallpapersmug.com/thumb/ac2842/hexscape-dark-abstract.jpg"
    },
    {
      "url":
          "https://wallpapersmug.com/thumb/cd3bb7/dark-abstract-small-objets.jpg"
    },
    {
      "url":
          "https://wallpapersmug.com/thumb/506197/closeup-abstract-curvature.jpg"
    },
    {
      "url":
          "https://wallpapersmug.com/thumb/6c96cf/blue-abstract-shapes-objects.jpg"
    },
    {
      "url":
          "https://wallpapersmug.com/thumb/967967/abstract-mountain-and-moon-fuild-art.jpg"
    },
    {
      "url":
          "https://wallpapersmug.com/thumb/bd2d4e/bluish-blender-abstract.jpg"
    },
    {
      "url":
          "https://wallpapersmug.com/thumb/321271/coloros-abstract-stock-white-petal-art.jpg"
    },
  ];

  List<Map<String, dynamic>> col = [
    {
      "color": Color(0xfffdb6b8),
    },
    {
      "color": Color(0xff4062e0),
    },
    {
      "color": Color(0xff6241e0),
    },
    {
      "color": Color(0xff62bec3),
    },
    {
      "color": Color(0xff2a2829),
    },
    {
      "color": Color(0xfffe9a0a),
    },
    {
      "color": Color(0xffb944ef),
    },
    {
      "color": Color(0xffb944ef),
    },
    {
      "color": Color(0xfff5a623),
    },
    {
      "color": Color(0xffd0021b), // Red
    },
    {
      "color": Color(0xff7ed321), // Green
    },
    {
      "color": Color(0xffbd10e0), // Magenta
    },
    {
      "color": Color(0xfff8e71c), // Yellow
    },
    {
      "color": Color(0xff8b572a), // Brown
    },
    {
      "color": Color(0xff4a4a4a), // Dark Gray
    },
    {
      "color": Color(0xff9b9b9b), // Light Gray
    },
    {
      "color": Color(0xfff2f2f2), // Off White
    },
    {
      "color": Color(0xff7c4dff), // Deep Purple
    },
    {
      "color": Color(0xff00bcd4), // Cyan
    },
    {
      "color": Color(0xffff6f61), // Coral
    },
    {
      "color": Color(0xff6a1b9a), // Dark Purple
    },
    {
      "color": Color(0xff00c853), // Dark Green
    },
    {
      "color": Color(0xffffd600), // Golden Yellow
    },
    {
      "color": Color(0xffc2185b), // Pink
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffedf3f4),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 380,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(35),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ]),
                child: TextField(
                  controller: searchController,
                  onTap: (){
                    close = true;
                    setState(() {

                    });
                  },
                  onTapOutside: (value) {
                    close = false;

                    if (searchController.text.isEmpty) {
                      context.read<PhotosBloc>().add(SetInitialPhotos());
                    }
                  },
                  onChanged: (value) {

                    context.read<PhotosBloc>().add(SearchPhoto(search: value));
                  },
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffffffff),
                    contentPadding: EdgeInsets.only(top: 40, left: 30),
                    suffixIcon: IconButton(onPressed: (){
                      FocusScope.of(context).unfocus();
                      searchController.clear();
                      context.read<PhotosBloc>().add(SetInitialPhotos());
                      close = false;
                      setState(() {

                      });
                    }, icon: close ? Icon(Icons.close,color: Colors.grey,size: 30,):Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),),
                    hintText: "Find Wallpaper..",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            BlocBuilder<PhotosBloc, PhotosState>(
              builder: (_, state) {
                if (state is PhotosLoadingState) {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Image.asset("assets/gif/loading.gif",
                        height: 150, width: 150),
                  ));
                }
                if (state is PhotosErrorState) {
                  return Center(
                    child: Text(state.error),
                  );
                }
                if (state is PhotosLoadedState) {
                  List<PhotosDataModel> catPhotos = state.catPhotos;
                  PhotosDataModel photos = state.photos;
                  return Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Best of The month",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 230,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: photos.photos.length,
                                itemBuilder: (_, i) {
                                  PhotosModel photo = photos.photos[i];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PreHome(
                                                  url: photo.src.portrait,photo: photo,)),
                                        );
                                      },
                                      child: SizedBox(
                                        height: 170,
                                        width: 150,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: photo.src.portrait,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[100]!,
                                              child: Container(
                                                height: 100,
                                                width: 100,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "The color tone",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 52,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: col.length,
                                itemBuilder: (_, i) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                      height: 52,
                                      width: 52,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: col[i]["color"],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              childAspectRatio: 16 / 9,
                              maxCrossAxisExtent: 250,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                            ),
                            itemCount: catPhotos.length,
                            itemBuilder: (_, i) {
                              PhotosModel photo = catPhotos[i].photos[0];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return CategoriesScreen(
                                        mPhotos: catPhotos[i].photos,
                                        name: AppConstents.cat[i],
                                      );
                                    },
                                  ));
                                },
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      top: 0,
                                      child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: photo.src.landscape,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) {
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                Colors.grey[100]!,
                                                child: Container(
                                                  color: Colors.white,
                                                ),
                                              );
                                            },
                                          )),
                                    ),
                                    Center(
                                        child: Text(
                                          AppConstents.cat[i],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            shadows: [
                                              Shadow(
                                                  blurRadius: 5, color: Colors.grey)
                                            ],
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),

                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }
                if (state is PhotoSearchState) {
                  PhotosDataModel mPhotos = state.photos;
                  return Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            '${mPhotos.photos.length} wallpaper available',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
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
                              itemCount: mPhotos.photos.length,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              crossAxisCount: 2,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (_, i) {
                                PhotosModel photo = mPhotos.photos[i];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return PreHome(
                                              url: photo.src.large2x,photo: photo,);
                                        },
                                      ));
                                    });
                                  },
                                  child: Padding(
                                    padding: i == 1
                                        ? EdgeInsets.only(top: 80)
                                        : EdgeInsets.zero,
                                    child: SizedBox(
                                      height: 250,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: photo.src.portrait,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) {
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
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
                return Container();
              },
            ),
          ],
        ));
  }
}
