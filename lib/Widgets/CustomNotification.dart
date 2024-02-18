import 'package:flutter/material.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({super.key,@required this.title,@required this.content,@required this.date});
  // ignore: prefer_typing_uninitialized_variables
  final title , content,date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8,top: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(15)
        ),
        child: ListTile(
          title: Text(title,style: const TextStyle(fontSize: 14),),
          subtitle: Text(content,style: const TextStyle(color: Colors.black54,fontSize: 12),),
          trailing: Text(date),
        ),
      ),
    );
  }
}