import 'package:flutter/material.dart';
import 'centres.dart';
import 'customer_satellites.dart';
import 'launchers.dart';
import 'package:get/get.dart';
import 'spacecrafts.dart';

class Knowledge extends StatelessWidget {
  const Knowledge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Learning - topics'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Container(
          padding:const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(const SpaceCrafts());
                },
                child: const Text(' Spacecrafts',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
              ),
              TextButton(
                onPressed: () {
                  Get.to(const Launchers());
                },
                child: const Text(' Launchers',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
              ),
              TextButton(
                onPressed: () {
                  Get.to(const CustomerSatellites());
                },
                child: const Text(' Customer Satellites',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
              ),
              TextButton(
                onPressed: () {
                  Get.to(const Centres());
                },
                child: const Text('Centres',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

 Container(
                  height: 100,
                  child: FutureBuilder(
                    future: getSpaceCrafts(),
                    builder: (_,AsyncSnapshot<dynamic>snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                          itemBuilder: (_,index){
                        return ListTile(
                          leading: Text(snapshot.data[index]['id'].toString()),
                          title: Text(snapshot.data[index]['name'].toString()),
                        );
                      });
                    }
                    return Container();
            }),
                )
 */
