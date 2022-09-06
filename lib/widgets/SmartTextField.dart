// import 'package:flutter/material.dart';
//
//
// class SmartTextField extends StatefulWidget {
//
//   final ValueNotifier<Object> value;
//   final TextEditingController textFieldController;
//   final InputDecoration inputDecoration;
//
//   SmartTextField({
//     this.value,
//     this.textFieldController = TextEditingController(),
//     this.inputDecoration = InputDecoration(),
//   })
//
//
//   @override
//   _SmartTextField createState() => _SmartTextField();
// }
//
// class _SmartTextField extends State<SmartTextField> {
//   ValueNotifier<Object> value = ValueNotifier("");
//   TextEditingController textFieldController = TextEditingController();
//   InputDecoration inputDecoration = InputDecoration();
//
//   _SmartTextField(this.value, InputDecoration)
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     value.addListener(() {
//       textFieldController.text = value.value.toString();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return TextField(
//       controller: textFieldController,
//       onChanged: (val) => {
//         setState(() => {
//           value.value = val
//         })
//       },
//     );
//   }
//
// }