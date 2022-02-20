// ignore_for_file: non_constant_identifier_names

import 'package:eticaret/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int radioIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          BuildRadioPayment(
            title: 'Paypal',
            icon: const FaIcon(
              FontAwesomeIcons.paypal,
              color: Colors.blueAccent,
            ),
            value: 1,
            onChange: (int? value) {
              setState(() {
                radioIndex = value!;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BuildRadioPayment(
            title: 'Kredi Kartı',
            icon: const FaIcon(
              FontAwesomeIcons.creditCard,
              color: Colors.blueGrey,
            ),
            value: 2,
            onChange: (int? value) {
              setState(() {
                radioIndex = value!;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          BuildRadioPayment(
            title: 'Havale / Eft',
            icon: const FaIcon(
              FontAwesomeIcons.cashRegister,
              color: Colors.deepOrange,
            ),
            value: 3,
            onChange: (int? value) {
              setState(() {
                radioIndex = value!;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget BuildRadioPayment({
    required int value,
    required Function onChange,
    required Widget icon,
    required String title,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon,
                const SizedBox(
                  width: 20,
                ),
                TextUtil(
                    text: title,
                    textSize: 20,
                    textColor: Colors.black,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
          Radio(
            value: value,
            groupValue: radioIndex,
            onChanged: (int? value) {
              onChange(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          )
        ],
      ),
    );
  }
}
