import 'package:get/get.dart';
import 'package:shopapp/models/urun.dart';

class CartControllers extends GetxController {
  var count = 0.obs;
  List<UrunModel> uruns = [];

  sepeteEkle(UrunModel u) {
    uruns.add(u);
    update();
  }

  sepetUrunSayisi() {
    
    count = uruns.length.obs;
    return uruns.length;
  }
}
