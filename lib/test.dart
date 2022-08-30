import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcarouselmodel/carouselcontroller.dart';
import 'package:getxcarouselmodel/carouselmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselView extends StatefulWidget {

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
 final _controller=PageController();

  int activeIndex=0;

  // a list of images' URLs
  final  List<Carouselmodel> imageList=[];

SliderController controller = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
     log("abcdddd=============================");
// final List<Image>bannerimageList = [];

 
// print("2222222222222");
 controller.bannerlist.map((Carouselmodel element) {
  imageList.add(element);


  //imageList=element.banner;
//   print("33333333333333333333333333333333333");
  print("length of final datatttttttt==="+imageList.length.toString());
//    Map a=element as Map<String, dynamic>;
//   // print("66666666666666666666");
//    bannerimageList.add(element.banner);

//   print('image========' + bannerimageList.toString());
  },).toList();

print('outfromimage========' + imageList.toString());

     return Column(
        children: [
          // Implement the image carousel
          Padding(
            padding: const EdgeInsets.all(10.0),
                child: CarouselSlider(
                              items: imageList
                                  .map((e) => ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Image.network("http://192.168.43.85:8080/lmswebapplication/banners/"+
                                              e.banner,
                                              width: 1050,
                                              height: 350,
                                              fit: BoxFit.cover,
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList(),
                                    options: CarouselOptions(
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                autoPlay: true,
                                onPageChanged:(index,reasons){


                                  log("inside every time");
                                  
                                  activeIndex=index;

                                }
                              ),
                                  
                            ),
                            
      ),
      AnimatedSmoothIndicator(activeIndex: activeIndex, count: imageList.length)
//       SizedBox(height: 10,),
//       CarouselIndicator(
//   count:imageList.length ,
//   index: activeIndex,
// ),

//  SmoothPageIndicator(
//     controller:controller.bannerlist.obs,
//     count:imageList.length,
//     effect:ExpandingDotsEffect(activeDotColor: Colors.white)
//   ),
    // buildIndicator(activeIndex,imageList.length),
        ],
     );
     
   
     Widget buildImage(String datas,int index)=>Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    width: double.infinity,
    color: Colors.grey,
    child: Image.network(
      datas,
      fit: BoxFit.cover,
    ),
  );
 
}
}

//  Widget buildIndicator(int active,int count)=>
// // Padding(padding: const EdgeInsets.all(8.0),
// //     child: Container(
// //       width: MediaQuery.of(context).size.width - 20,
// //       height: 150.0,
// //       child: ClipRect(child: CarouselSlider.builder(
// //         itemCount:bannerimageList.length,
// //         itemBuilder:,
// //          options:CarouselOptions(
// //               autoPlay: true,
// //               autoPlayInterval: const Duration(seconds: 2),
// //               autoPlayAnimationDuration: const Duration(milliseconds: 400),
// //               height: 150,
// //             ),
       
// //           // overlayShadow: false,
// //             // borderRadius: true,
// //             // boxFit: BoxFit.none,
// //             // autoplay: true,
// //             // dotSize: 4,
// //             // images:,
// //         )
// //         // bannerimageList,
// //         ),
// //     ),);
// //   }
// // }