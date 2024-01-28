import 'dart:convert';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/presenters/order_presenter.dart';
import 'package:ecommerce_app/presenters/orderdetail_presenters.dart';
import 'package:ecommerce_app/views/cart/payshopping.dart';
import 'package:ecommerce_app/views/chat/chat.dart';
import 'package:ecommerce_app/views/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class InfoCartScreen extends StatefulWidget {
  const InfoCartScreen({super.key});

  @override
  State<InfoCartScreen> createState() => _InfoCartScreenState();
}

class _InfoCartScreenState extends State<InfoCartScreen> {
  late User user;
  late Order order;
  late OrderDetail orderDetail;

  OrderPresenter oPre = OrderPresenter();
  OrderDetailPresenter odPre = OrderDetailPresenter();
  
  bool isTextFieldEmpty = true;
  bool isTextFieldNumberEmpty = true;

  final GlobalKey<FormState> _formNameKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();

  List<dynamic> provinces = [];
  int? selectedProvince;

  List<dynamic> districts = [];
  int? selectedDistricts;

  List<dynamic> communes = [];
  int? selectedCommunes;

  DateTime? selectedDate;

  bool isCheckedDelivery = true;
  bool isCheckedInStore = false;

  @override
  void initState() {
    super.initState();
    fetchProvinces();
    fetchDistricts();
    fetchCommunes();
    _controller.addListener(_onTextChanged);
  }

  Future<void> fetchProvinces() async {
    final response = await http.get(
      Uri.parse('https://provinces.open-api.vn/api/'),
    );

    if (response.statusCode == 200) {
      setState(() {
        provinces = json.decode(response.body);
      });
    } else {
      print('Failed to fetch provinces. Error: ${response.statusCode}');
    }
  }

  Future<void> fetchDistricts() async {
    final response = await http.get(
      Uri.parse('https://provinces.open-api.vn/api/d/'),
    );

    if (response.statusCode == 200) {
      setState(() {
        districts = json.decode(response.body);
      });
    } else {
      print('Failed to fetch districts. Error: ${response.statusCode}');
    }
  }

  Future<void> fetchCommunes() async {
    final response = await http.get(
      Uri.parse('https://provinces.open-api.vn/api/w/'),
    );

    if (response.statusCode == 200) {
      setState(() {
        communes = json.decode(response.body);
      });
    } else {
      print('Failed to fetch communes. Error: ${response.statusCode}');
    }
  }

  void _onTextChanged() {
    setState(() {
      isTextFieldEmpty = _controller.text.isEmpty;
      isTextFieldNumberEmpty = _controllerNumber.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 224, 84, 75),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: const Text(
            "Giỏ hàng",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen(phoneNumber: user.phoneNumber,)),
                  );
                },
                icon: const Icon(Icons.chat_bubble_outline_outlined)),
          ],
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(children: [
              Container(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                margin:
                    const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                height: 100.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: const Color.fromARGB(96, 123, 118, 118),
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.black,
                          size: 45.0,
                        ),
                        Text(
                          'Chọn sản phẩm',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.black,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.medical_information_outlined,
                          color: Colors.red,
                          size: 45.0,
                        ),
                        Text(
                          'Thông tin',
                          style: TextStyle(color: Colors.red, fontSize: 15.0),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_right_alt_rounded,
                      color: Colors.red,
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.payment_rounded,
                          color: Colors.black,
                          size: 45.0,
                        ),
                        Text(
                          'Thanh toán',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 600.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.black38,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      const Text(
                        'Thông tin khách hàng',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Form(
                        key: _formNameKey,
                        child: TextFormField(
                          onChanged: (value) {},
                          controller: _controller,
                          decoration: InputDecoration(
                              labelText: "Họ và tên (Bắt buộc)",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0))),
                        ),
                      ),
                      Text(
                        isTextFieldEmpty ? 'Không được bỏ trống' : '',
                        style:
                            const TextStyle(fontSize: 10.0, color: Colors.red),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onChanged: (value) {},
                        controller: _controllerNumber,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            labelText: "Số điện thoại (Bắt buộc)",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                      ),
                      Text(
                        isTextFieldNumberEmpty ? 'Không được bỏ trống' : '',
                        style:
                            const TextStyle(fontSize: 10.0, color: Colors.red),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Cách thức giao hàng',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Checkbox(
                              value: isCheckedDelivery,
                              onChanged: (value) {
                                setState(() {
                                  isCheckedDelivery = value!;
                                  isCheckedInStore = !value;
                                });
                              },
                              activeColor: Colors.red,
                              checkColor: Colors.white,
                            ),
                            const Text('Giao tận nơi'),
                            Checkbox(
                              value: isCheckedInStore,
                              onChanged: (value) {
                                setState(() {
                                  isCheckedInStore = value!;
                                  isCheckedDelivery = !value;
                                });
                              },
                              activeColor: Colors.red,
                              checkColor: Colors.white,
                            ),
                            const Text('Nhận tại cửa hàng'),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isCheckedDelivery,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                      isExpanded: true,
                                      value: selectedProvince,
                                      items: provinces.map((province) {
                                        return DropdownMenuItem(
                                          value: province['code'],
                                          child: Text(
                                            province['name'],
                                            style: const TextStyle(
                                                fontFamily: 'RobotoBlack'),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedProvince = value as int;
                                          selectedDistricts = null;
                                          selectedCommunes = null;
                                        });
                                      },
                                      hint: const Text('Tỉnh/Thành phố'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(
                                    child: DropdownButtonFormField(
                                      isExpanded: true,
                                      value: selectedDistricts,
                                      items: selectedProvince != null
                                          ? (districts.where((district) =>
                                                  district['province_code'] ==
                                                  (selectedProvince)))
                                              .map((district) {
                                              return DropdownMenuItem(
                                                value: district['code'],
                                                child: Text(district['name']),
                                              );
                                            }).toList()
                                          : [],
                                      onChanged: (value) {
                                        setState(() {
                                          selectedDistricts = value as int;
                                          selectedCommunes = null;
                                        });
                                      },
                                      hint: const Text('Quận/Huyện'),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            SizedBox(
                              height: 60.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 150.0,
                                    child: Expanded(
                                      child: DropdownButtonFormField(
                                        isExpanded: true,
                                        value: selectedCommunes,
                                        items: selectedDistricts != null
                                            ? (communes.where((commune) =>
                                                    commune['district_code'] ==
                                                    (selectedDistricts)))
                                                .map((commune) {
                                                return DropdownMenuItem(
                                                  value: commune['code'],
                                                  child: Text(commune['name']),
                                                );
                                              }).toList()
                                            : [],
                                        onChanged: (value) {
                                          setState(() {
                                            selectedCommunes = value as int;
                                          });
                                        },
                                        hint: const Text('Phường/Xã'),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0))),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          labelText: "Tên đường/Số nhà",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            SizedBox(
                              height: 70.0,
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: "Ghi chú",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isCheckedInStore,
                        child: Column(
                          children: [
                            DateTimeField(
                              decoration: InputDecoration(
                                labelText: 'Chọn ngày và giờ đến nhận hàng',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              format: DateFormat("yyyy-MM-dd HH:mm"),
                              onShowPicker: (context, currentValue) async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: currentValue ?? DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (date != null) {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now(),
                                    ),
                                  );
                                  return DateTimeField.combine(date, time);
                                } else {
                                  return currentValue;
                                }
                              },
                              onChanged: (date) {
                                setState(() {
                                  selectedDate = date;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 8.0,
                      top: 4.0,
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Tổng tiền"),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("\$0"),
                              ],
                            )
                          ],
                        ),
                        Row(children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    elevation: 0,
                                    //shape: RoundedRectangleBorder(),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0,
                                      vertical: 8.0,
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PayShoppingScreen()),
                                  );
                                },
                                child: const Text(
                                  'Tiếp tục',
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        ]),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Mua sản phẩm khác'))),
                          ],
                        ),
                      ],
                    ),
                  )),
            ]),
          ),
        ]));
  }
}
