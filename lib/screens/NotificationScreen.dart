import 'package:drive_flow_ui/Widgets/CustomDate.dart';
import 'package:drive_flow_ui/Widgets/CustomNotification.dart';
import 'package:drive_flow_ui/Widgets/Header.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Header(
                  text: 'Notification',
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDate(
                      date: 'Nov 17,2024 WED',
                    ),
                    CustomNotification(
                      title: 'Hello',
                      content: "App realse neto;Visitor sent a conversation message",
                      date: "5 days ago",
                    ),
                    CustomDate(
                      date: 'Nov 17,2024 WED',
                    ),
                    CustomNotification(
                      title: 'assigned a new conversations. ',
                      content: "Conversation assigned",
                      date: "5 days ago",
                    ),
                    CustomDate(
                      date: 'Nov 17,2024 WED',
                    ),
                    CustomNotification(
                      title: 'Hello',
                      content: "App realse neto;Visitor sent a conversation message",
                      date: "5 days ago",
                    ),
                    CustomDate(
                      date: 'Nov 17,2024 WED',
                    ),
                    CustomNotification(
                      title: 'assigned a new conversations. ',
                      content: "Conversation assigned",
                      date: "5 days ago",
                    ),
                    CustomDate(
                      date: 'Nov 17,2024 WED',
                    ),
                    CustomNotification(
                      title: 'Hello',
                      content: "App realse neto;Visitor sent a conversation message",
                      date: "5 days ago",
                    ),
                    CustomDate(
                      date: 'Nov 17,2024 WED',
                    ),
                    CustomNotification(
                      title: 'assigned a new conversations. ',
                      content: "Conversation assigned",
                      date: "5 days ago",
                    ),
                    CustomDate(
                      date: 'Nov 17,2024 WED',
                    ),
                    CustomNotification(
                      title: 'Hello',
                      content: "App realse neto;Visitor sent a conversation message",
                      date: "5 days ago",
                    ),
                    CustomDate(
                      date: 'Nov 17,2024 WED',
                    ),
                    CustomNotification(
                      title: 'assigned a new conversations. ',
                      content: "Conversation assigned",
                      date: "5 days ago",
                    ),
                    CustomDate(
                      date: 'Nov 17,2024 WED',
                    ),
                    CustomNotification(
                      title: 'Hello',
                      content: "App realse neto;Visitor sent a conversation message",
                      date: "5 days ago",
                    ),
                    CustomDate(
                      date: 'Nov 17,2024 WED',
                    ),
                    CustomNotification(
                      title: 'You have been assigned a new conversations. ',
                      content: "Conversation assigned",
                      date: "5 days ago",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
