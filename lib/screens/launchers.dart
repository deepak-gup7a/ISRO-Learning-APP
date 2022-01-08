import 'package:flutter/material.dart';
import 'package:isro_learning/service/api.dart';

class Launchers extends StatelessWidget {
  const Launchers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Launchers'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getLaunchers(),
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
                        title: Text(snapshot.data[index]['id'].toString()),
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
