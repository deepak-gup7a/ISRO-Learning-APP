import 'package:flutter/material.dart';
import 'package:isro_learning/service/api.dart';

class CustomerSatellites extends StatelessWidget {
  const CustomerSatellites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Satellite'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getCustomerSatellites(),
            builder: (_, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            child: Text(
                              (index + 1).toString(),
                              style:const TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                            ),
                            backgroundColor: Colors.white),
                        title:
                            Text(snapshot.data[index]['launcher'].toString()),
                        subtitle: Text(
                            'Conuntry: ${snapshot.data[index]['country']}'),
                      );
                    });
              }
              return const Center(
                child: Text("Loading ...."),
              );
            }),
      ),
    );
  }
}
