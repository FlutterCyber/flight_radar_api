import 'package:flight_radar_api/model/all_info_model.dart';
import 'package:flutter/material.dart';

import '../model/info_list.dart';
import '../service/network_service.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AllInfo> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiList();
  }

  void _apiList() {
    Network.GET(Network.API, Network.paramsGet()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  _showResponse(String response) {
    InfoList infoList = Network.parseList(response);
    setState(() {
      items.addAll(infoList.rows);
      print("UZUNLIGI: ${items.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Data List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, i) {
              return itemsOfList(items[i]);
            }),
      ),
    );
  }

  Widget itemsOfList(AllInfo allInfo) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            allInfo.name.toString() +
                " " +
                allInfo.city.toString() +
                ": " +
                allInfo.country.toString(),
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            height: 18,
          ),
          Text(allInfo.iata.toString()),
          SizedBox(
            height: 18,
          ),
          Text(
            "Time: " + allInfo.timezone.abbrName.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
