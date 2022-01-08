import 'package:flutter/material.dart';
import 'package:isro_learning/service/api.dart';

class SpaceCrafts extends StatelessWidget {
  const SpaceCrafts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceCrafts'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getSpaceCrafts(),
            builder: (_, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            child: Text(
                              snapshot.data[index]['id'].toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                            ),
                            backgroundColor: Colors.white),
                        title: Text(snapshot.data[index]['name'].toString()),
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
