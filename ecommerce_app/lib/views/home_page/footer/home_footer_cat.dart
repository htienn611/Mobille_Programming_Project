import 'package:ecommerce_app/views/home_page/footer/footer_sub_cat.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeFooterCat extends StatefulWidget {
  HomeFooterCat({super.key, required this.title, this.isConnect = false});
  String title;
  bool isConnect;
  bool isShow = false;

  @override
  State<HomeFooterCat> createState() => _HomeFooterCatState();
}

class _HomeFooterCatState extends State<HomeFooterCat> {
  @override
  Widget build(BuildContext context) {
    var sW = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          if (!widget.isConnect) {
            setState(() {
              widget.isShow = !widget.isShow;
            });
          }
        },
        child: Container(
            width: sW - 40,
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                //  color: Colors.amber,
                border: widget.isConnect
                    ? const Border()
                    : const Border(bottom: BorderSide(color: Colors.black))),
            child: Column(
              children: [
                widget.isConnect
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: CircleAvatar(
                                    radius: 25,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/img/logo/fb.png',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: CircleAvatar(
                                    radius: 25,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/img/logo/tt.png',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: CircleAvatar(
                                    radius: 25,
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/img/logo/ytb.png',
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                            ],
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Icon(Icons.add)
                        ],
                      ),
                widget.isShow
                    ? Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: sW - 40,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FooterSubCat(),
                            FooterSubCat(),
                            FooterSubCat(),
                          ],
                        ),
                      )
                    : Container()
              ],
            )));
  }
}
