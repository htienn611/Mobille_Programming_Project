import 'dart:convert';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:ecommerce_app/views/cart/payshopping.dart';
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

  bool isTextFieldEmpty = true;
  bool isTextFieldNumberEmpty = true;

  final GlobalKey<FormState> _formNameKey = GlobalKey<FormState>();

  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerNumber = TextEditingController();

  List<dynamic> provinces = [];
  int ? selectedProvince;

  List<dynamic> districts = [];
  int ? selectedDistricts;


  List<dynamic> communes = [];
  int ? selectedCommunes;

   DateTime ? selectedDate;

    bool isCheckedDelivery = true;
    bool isCheckedInStore = false;
  @override
  void initState(){
    super.initState();
    fetchProvinces();
    fetchDistricts();
    fetchCommunes();
    _controller.addListener(_onTextChanged);
  }

  Future<void> fetchProvinces() async{
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
  Future<void> fetchDistricts() async{
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
  Future<void> fetchCommunes() async{
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.red,
        leading: const Icon(Icons.arrow_back_rounded),
        title: const Text('Giỏ hàng'),
        centerTitle: true,
        actions: const [
          Icon(Icons.chat_bubble_outline_outlined),
        ],
      ),
      body: SingleChildScrollView(
        child: 
          Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            margin: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
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
                     Icon(Icons.shopping_cart_rounded, color: Colors.black, size: 45.0,),
                     Text('Chọn sản phẩm', style: TextStyle(color: Colors.black, fontSize: 15.0),)
                  ],
                ),
                Icon(Icons.arrow_right_alt_rounded, color: Colors.black,),
                Column(
                  children: [
                     Icon(Icons.medical_information_outlined, color: Colors.red, size: 45.0,),
                    Text('Thông tin', style: TextStyle(color: Colors.red, fontSize: 15.0),)
                  ],
                ),
                Icon(Icons.arrow_right_alt_rounded, color: Colors.red,),
                Column(
                  children: [
                     Icon(Icons.payment_rounded, color: Colors.black, size: 45.0,),
                     Text('Thanh toán', style: TextStyle(color: Colors.black, fontSize: 15.0),)
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
              child: Column(
              children: [
                const Text('Thông tin khách hàng', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10.0,),
                Form(
                  key: _formNameKey,
                  child: TextFormField(
                    onChanged: (value){
                    },
                    controller: _controller,
              decoration: InputDecoration(labelText: "Họ và tên (Bắt buộc)", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)
              )),
            ),
                ),
            Text(isTextFieldEmpty ? 'Không được bỏ trống' : '', style: TextStyle(fontSize: 10.0, color: Colors.red),),
            const SizedBox(height: 10.0,),
            TextFormField(
              onChanged: (value){
                    },
                    controller: _controllerNumber,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
              decoration: InputDecoration(labelText: "Số điện thoại (Bắt buộc)", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)
              )),
              
            ),
            Text(isTextFieldNumberEmpty ? 'Không được bỏ trống' : '', style: TextStyle(fontSize: 10.0, color: Colors.red),),
            const SizedBox(height: 10.0,),
            const Text('Cách thức giao hàng', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            
          Container( child: Row(children: [
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
        Container(
          height: 60.0,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Expanded(child:
                  DropdownButtonFormField(
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
                    isExpanded: true,
          value: selectedProvince,
          items: provinces.map((province) {
            return DropdownMenuItem(
              value: province['code'],
              child: Text(province['name'], style: TextStyle(fontFamily: 'RobotoBlack'),),
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
            const SizedBox(width: 5.0,),
                Expanded(
                  child: DropdownButtonFormField(
                    
                    isExpanded: true,
          value: selectedDistricts,
          items: selectedProvince != null ? (districts.where((district) => district['province_code'] == (selectedProvince))).map((district) {
            return DropdownMenuItem(
              value: district['code'],
              child: Text(district['codename']),
            );
          }).toList() : [],
          onChanged: (value) {
            setState(() {
                selectedDistricts = value as int;
                selectedCommunes = null;
            });
          },
          hint: const Text('Quận/Huyện'),
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
        ),
                ),
              ],
            ),
        ),
            const SizedBox(height: 5.0,),
            Container(
              height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container( 
                  width: 150.0,
                  child: 
                Expanded(
                  child: DropdownButtonFormField(
                    isExpanded: true,
          value: selectedCommunes,
          items: selectedDistricts != null ? (communes.where((commune) => commune['district_code'] == (selectedDistricts))).map((commune) {
            return DropdownMenuItem(
              value: commune['code'],
              child: Text(commune['codename']),
            );
          }).toList() : [],
          onChanged: (value) {
            setState(() {
                selectedCommunes = value as int;
            });
          },
          hint: const Text('Phường/Xã'),
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
        ),
                ),
            ),
            SizedBox(width: 5.0,),
                Expanded(child: 
                TextField(
              decoration: InputDecoration(labelText: "Tên đường/Số nhà", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )),
              
            ),
                )
              ],
            ),
            ),
            const SizedBox(height: 5.0,),
            Container(
                  height: 70.0,
                  child: TextField(
              decoration: InputDecoration(labelText: "Ghi chú", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )),
              
            ),
                ),
      ],
    ),),
    Visibility(
      visible: isCheckedInStore,
      child: Column(
      children: [
            DateTimeField(decoration: InputDecoration(
            labelText: 'Chọn ngày và giờ đến nhận hàng',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
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
              ]
            ),
            )
          ),
          Container(
                height: 150.0,
                decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.black),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
                ),
                child: Center(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Số tiền thanh toán: '),
                          Text('120.000đ', style: TextStyle(color: Colors.red),),
                        ],
                      ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  width: 300.0,
                  height: 50.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.red),
                  child: TextButton(child: const Text('Tiếp tục', style: TextStyle(color: Colors.white, fontSize: 20.0),), onPressed: (){
            Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const PayShoppingScreen()),
);
        },
         ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  width: 300.0,
                  height: 50.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.white, border: Border.all(width: 0.6, color: Colors.black)),
                  child: TextButton(child: const Text('Mua sản phẩm khác', style: TextStyle(color: Colors.black, fontSize: 20.0),), onPressed: (){

                  }, ),
                )
                ]
                ),
                )
              ),
        ]
    ),
    
    )
    );
  }
}

