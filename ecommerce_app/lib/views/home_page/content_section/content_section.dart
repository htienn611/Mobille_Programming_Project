import 'package:ecommerce_app/views/home_page/content_section/sub_cat_label.dart';
import 'package:flutter/material.dart';

import 'product_label.dart';

class ContenSection extends StatefulWidget {
  const ContenSection({super.key, this.isBestSelling = false});
 final bool isBestSelling;
  @override
  State<ContenSection> createState() => _ContenSectionState();
}

class _ContenSectionState extends State<ContenSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: widget.isBestSelling
                  ? const Color.fromARGB(255, 224, 84, 75)
                  : Colors.white),
          child: widget.isBestSelling
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Icon(
                          Icons.electric_bolt_sharp,
                          size: 30.0,
                          color: Colors.yellow.withOpacity(_controller.value),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'SALE KHỦNG',
                      style: TextStyle(fontSize: 20, color: Colors.yellow),
                    ),
                  ],
                )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "LapTop",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Xem tất cả"),
                      )
                    ],
                  ),
                ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubCatLabel(isBestSelling: widget.isBestSelling),
                SubCatLabel(
                  isBestSelling: widget.isBestSelling,
                ),
                SubCatLabel(
                  isBestSelling: widget.isBestSelling,
                ),
                SubCatLabel(
                  isBestSelling: widget.isBestSelling,
                ),
              ],
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: const [
            ProductLabel(),
            ProductLabel(),
            ProductLabel(),
            ProductLabel(),
          ]),
        ),
      ]),
    );
  }
}
