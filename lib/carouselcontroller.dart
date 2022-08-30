import 'package:get/get.dart';
import 'package:getxcarouselmodel/carouselmodel.dart';
import 'package:getxcarouselmodel/webservice.dart';


class SliderController extends GetxController {
  RxBool isLoading = false.obs;
var bannerlist=<Carouselmodel>[].obs;

@override
void onInit(){
   loadBanner();
  super.onInit();
}
 void loadBanner() {
    try{
      isLoading(true);
      ApiRepositoryImpl.getCarousel().then((value) =>bannerlist(value));
    }finally{
      isLoading(false);
    }
  }
}
