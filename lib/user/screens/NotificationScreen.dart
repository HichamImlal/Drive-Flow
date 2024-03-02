import 'package:drive_flow_ui/user/Widgets/CustomDate.dart';
import 'package:drive_flow_ui/user/Widgets/CustomNotification.dart';
import 'package:drive_flow_ui/user/Widgets/CustomSearch.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: [
            SizedBox(
              height: height*0.05,
            ),
            const CustomSearch(),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
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
