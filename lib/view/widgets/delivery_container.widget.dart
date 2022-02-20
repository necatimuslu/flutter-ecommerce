// ignore_for_file: non_constant_identifier_names

import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioIndex = 1;
  bool changeColors = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildRadioContainer(
          color: changeColors ? Colors.white : Colors.grey.shade300,
          value: 1,
          onChanged: (int? value) {
            setState(() {
              radioIndex = value!;
              changeColors = !changeColors;
            });
          },
          title: 'e-ticaret',
          phone: '555 022 11 22',
          adress: 'İstanbul Esenler',
          name: 'Necati',
        ),
        const SizedBox(
          height: 10,
        ),
        BuildRadioContainer(
          color: changeColors ? Colors.grey.shade300 : Colors.white,
          value: 2,
          onChanged: (int? value) {
            setState(() {
              radioIndex = value!;
              changeColors = !changeColors;
            });
          },
          title: 'e-ticaret',
          phone: '555 033 11 22',
          adress: 'İstanbul Esenler',
          name: 'Neco',
        ),
      ],
    );
  }

  Widget BuildRadioContainer(
      {required Color color,
      required int value,
      required Function onChanged,
      required String title,
      required String name,
      required String phone,
      required String adress}) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2.0,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioIndex,
            onChanged: (int? value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtil(
                    text: title,
                    textSize: 20,
                    textColor: Colors.black,
                    fontWeight: FontWeight.bold),
                const SizedBox(
                  height: 5,
                ),
                TextUtil(
                    text: name,
                    textSize: 15,
                    textColor: Colors.black,
                    fontWeight: FontWeight.normal),
                const SizedBox(
                  height: 5,
                ),
                TextUtil(
                    text: phone,
                    textSize: 15,
                    textColor: Colors.black,
                    fontWeight: FontWeight.normal),
                const SizedBox(
                  height: 5,
                ),
                TextUtil(
                    text: adress,
                    textSize: 15,
                    textColor: Colors.black,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
