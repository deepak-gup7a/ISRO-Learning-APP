import 'package:flutter/material.dart';
import 'package:isro_learning/service/api.dart';

class Centres extends StatelessWidget {
  const Centres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centres'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getCentres(),
            builder: (_, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            child: Text(
                              snapshot.data[index]['id'].toString(),
                              style:const TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                            ),
                            backgroundColor: Colors.white),
                        title: Text(snapshot.data[index]['name'].toString()),
                        subtitle: Text(
                            snapshot.data[index]['Place'].toString() +
                                ', ' +
                                snapshot.data[index]['State'].toString()),
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
