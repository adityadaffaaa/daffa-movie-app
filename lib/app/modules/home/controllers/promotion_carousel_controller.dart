import 'package:carousel_slider/carousel_slider.dart';
import 'package:daffa_movie_app/app/data/models/others/promotion_carousel_item.dart';
import 'package:get/get.dart';
import 'package:daffa_movie_app/utils/images.dart' as app_images;

/// Controller untuk mengelola carousel promosi di halaman aplikasi.
///
/// [PromotionCarouselController] mengatur data dan logika untuk menampilkan
/// item-item promosi dalam bentuk carousel.
class PromotionCarouselController extends GetxController {
  /// Controller untuk mengelola carousel dari paket [carousel_slider].
  final CarouselSliderController carouselCtrl = CarouselSliderController();

  /// Index halaman saat ini pada carousel.
  RxInt carouselIdx = RxInt(0);

  /// List item promosi yang akan ditampilkan di carousel.
  final List<PromotionCarouselItem> promotionItems = <PromotionCarouselItem>[
    PromotionCarouselItem(
      image: app_images.img_promotion_banner,
      title: 'Buy 1 Get 1 Free!',
      desc:
          'Enjoy a special weekend offer! Buy one ticket and get one free for your favorite movie.',
    ),
    PromotionCarouselItem(
      image: app_images.img_promotion_banner,
      title: '50% Off on Mondays',
      desc:
          'Make Mondays better with 50% off on all movie tickets. Don’t miss out on this great deal!',
    ),
    PromotionCarouselItem(
      image: app_images.img_promotion_banner,
      title: 'Special Family Package',
      desc:
          'Watch movies with your family at a special package price. Get 4 tickets for the price of 3.',
    ),
    PromotionCarouselItem(
      image: app_images.img_promotion_banner,
      title: 'Free Popcorn & Drinks',
      desc:
          'Get free popcorn and drinks with every 3D movie ticket purchase. Available at select theaters only.',
    ),
  ];

  /// Mengubah halaman pada carousel ke index yang diberikan.
  ///
  /// [idx] adalah index dari halaman yang akan ditampilkan.
  void changePage(final int idx) {
    carouselIdx.value = idx;
  }
}
