import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/home/controller/main_controler.dart';
import 'package:food_delivery/app/modules/home/models/customer_model.dart';
import 'package:get/get.dart';

class TestCRUDFireStore extends StatelessWidget {
  final cusController = Get.put(MainController());
  TestCRUDFireStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => Flexible(
        child: ListView.builder(
            itemCount: cusController.customers.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomerDetail(index: index);
            })));
  }
}

class CustomerDetail extends StatelessWidget {
  final cusController = Get.put(MainController());
  final dtController = Get.find();
  final int index;
  CustomerDetail({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            dtController.customers[index].name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )),
          Expanded(
              child: Text(dtController.customers[index].gender,
                  style: TextStyle(
                    fontSize: 18,
                  ))),
          Expanded(
              child: Text(dtController.customers[index].phone,
                  style: TextStyle(
                    fontSize: 18,
                  ))),
          FlatButton(
              onPressed: () {
                //cusController.addCustomer(dtController.customers[index]);
              },
              child: Text(
                "click",
                style: TextStyle(color: Colors.red),
              ))
          // Expanded(
          //     child: Text(CustomerModel.customers[index].email,
          //         style: TextStyle(
          //           fontSize: 18,
          //         ))),
          // Expanded(
          //     child: Text(CustomerModel.customers[index].address,
          //         style: TextStyle(
          //           fontSize: 18,
          //         ))),
          // Text(CustomerModel.customers[index].),
          // Text(CustomerModel.customers[index].),
          // Text(CustomerModel.customers[index].),
          // Text(CustomerModel.customers[index].),
        ],
      ),
    );
  }
}
