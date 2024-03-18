import 'dart:convert';
import 'dart:typed_data';

import 'package:drive_flow_ui/class/History.dart';
import 'package:drive_flow_ui/constant.dart';
import 'package:drive_flow_ui/user/providers/UserDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    final userData =
        Provider.of<UserDataProvider>(context, listen: false).userData;
    getHistoryAndImagesByUserId(userData!['id']);
    ();
  }

  List<History> rentalDetails = [];
  Future<void> getHistoryAndImagesByUserId(int userId) async {
    final Uri uri = Uri.parse('http://${ipAddress}:8080/history/user/$userId');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<History> historyEntities =
            jsonResponse.map((model) => History.fromJson(model)).toList();
        setState(() {
          rentalDetails = historyEntities;
        });
      } else {
        throw Exception(
            'Failed to load history and images. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load history and images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.06),
          Padding(
            padding: EdgeInsets.only(left: width * 0.04),
            child: Text(
              "Histoire des voitures :",
              style: TextStyle(fontSize: 18, fontFamily: "Poppins_semiBold"),
            ),
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: rentalDetails.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: HistoryCarsCustom(
                  width: width,
                  height: height,
                  history: rentalDetails[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryCarsCustom extends StatelessWidget {
  const HistoryCarsCustom({
    Key? key,
    required this.width,
    required this.height,
    required this.history,
  }) : super(key: key);

  final double width;
  final double height;
  final History history;

  @override
  Widget build(BuildContext context) {
    DateTime dateIn = history.dateIn;
    DateTime dateOut = history.dateOut;
    String _dateIn =
        "${dateIn.year}-${dateIn.month.toString().padLeft(2, '0')}-${dateIn.day.toString().padLeft(2, '0')}";

    String _dateOut =
        "${dateOut.year}-${dateOut.month.toString().padLeft(2, '0')}-${dateOut.day.toString().padLeft(2, '0')}";

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.003),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: width * 0.45,
                    height: height * 0.13,
                    child: Image(
                      image: MemoryImage(history.carImage),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${history.total} MAD",
                        style: TextStyle(fontSize: 18, color: MainColor),
                      ),
                      Text(
                        "${history.mark} ${history.model}",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: height * 0.004,
                      ),
                      Text(
                        "${_dateIn}  / ${_dateOut}",
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
