import 'package:flutter/material.dart';
// show snakbar
showMassage({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
// show single input dialog
showSingleTextInputButton({
  required BuildContext context,
  required String title,
  TextInputType keyboardType = TextInputType.text,
  String positiveText = 'save',
  String negativeText = 'cancel',
  required Function(String) onSave,
})
{
final controller = TextEditingController();
showDialog(context: context, builder: (context) => AlertDialog(
  title: Text(title),
  content: TextField(
    keyboardType: keyboardType,
    controller: controller,
    decoration:  InputDecoration(
      border: const OutlineInputBorder(),
      hintText: 'Enter $title',
    ),
  ),
  actions: [
   OutlinedButton(onPressed: () {
     if(controller.text.isEmpty) return;
     onSave(controller.text);
     Navigator.pop(context);

   }, child: Text(positiveText)),
    TextButton(onPressed: () {
      Navigator.pop(context);
    }, child: Text(negativeText))
  ],
),);


}