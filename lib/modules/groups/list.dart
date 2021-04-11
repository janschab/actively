import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/services/firestore.dart';

class GroupsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: getGroups(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          List<QueryDocumentSnapshot> data = snapshot.data.docs.toList();

          if (data.isNotEmpty) {
            List<Map<String, dynamic>> groups = data.map((e) => e.data()).toList();

            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text("Full Name: ${groups[index]['name']}"),
              );
            });
          } else {
            return Text("No groups");
          }


        }

        return Text("loading");
      },
    );
  }
}
