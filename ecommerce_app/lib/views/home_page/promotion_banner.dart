import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/banner/banner_bg.jpg'),
              fit: BoxFit.cover)),
      child: CarouselSlider(
          items: const [
            Image(image: AssetImage('assets/img/banner/banner1.png')),
            Image(image: AssetImage('assets/img/banner/banner2.png')),
            Image(image: AssetImage('assets/img/banner/banner3.png')),
            Image(image: AssetImage('assets/img/banner/banner4.png')),
            Image(image: AssetImage('assets/img/banner/banner5.png')),
            Image(image: AssetImage('assets/img/banner/banner6.png')),
          ],
          options: CarouselOptions(
            height: 200.0, // Chiều cao của carousel
            initialPage: 0, // Trang khởi đầu
            enableInfiniteScroll: true, // Cho phép cuộn vô hạn
            reverse: false, // Đảo ngược thứ tự
            autoPlay: true, // Tự động chuyển trang
            autoPlayInterval: const Duration(
                seconds: 4), // Thời gian giữa các lần chuyển trang tự động
            autoPlayAnimationDuration: const Duration(
                milliseconds:
                    600), // Thời gian của hiệu ứng chuyển trang tự động
            autoPlayCurve: Curves
                .fastOutSlowIn, // Hình dạng của đường cong chuyển trang tự động
            enlargeCenterPage: true, // Phóng to trang ở giữa
            onPageChanged: (index, reason) {
              // Hàm callback khi trang thay đổi
              //print('Page changed to index $index, reason: $reason');
            },
            scrollDirection: Axis.horizontal, // Hướng cuộn
            viewportFraction: 1
          )),
    );
  }
}
