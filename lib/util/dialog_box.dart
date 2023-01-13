import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'my_button.dart';
import 'package:intl/intl.dart';

class DialogBox extends StatefulWidget {
  final controller;
  DateTime date;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.date,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {

  simpleDate(DateTime date){
    return "${date.year}- ${date.month} - ${date.day} / ${date.hour}-${date.minute}";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 233, 230, 208),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ Text("${simpleDate(widget.date)} "),TextButton(onPressed: () {
              DatePicker.showDateTimePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2018, 3, 5,),
                              maxTime: DateTime(2025, 6, 7,), onChanged: (date) {
                            setState(() {
                              widget.date = date;
                            });
                          }, onConfirm: (date) {
                            setState(() {
                              widget.date = date;
                            });
                          }, currentTime: DateTime.now(),);
            },  child: Text("Set Reminder")),],
           ),
            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: widget.onSave),

                const SizedBox(width: 8),

                // cancel button
                MyButton(text: "Cancel", onPressed: widget.onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
