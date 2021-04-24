import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/modules/groups/services/service.dart';
import 'package:myapp/widgets/errors.dart';

class GroupsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: GroupsService.getGroups(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          List<QueryDocumentSnapshot> data = snapshot.data.docs.toList();

          if (data.isNotEmpty) {
            List<Map<String, dynamic>> groups = data.map((e) => e.data()).toList();

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: groups.map((e) => Container(
                  width: double.infinity,
                  height: 54,
                  margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF222222),
                  ),
                  child: Text("Full Name: ${e['name']}"),
                )).toList(),
              ),
            );
          } else {
            return Text("No groups");
          }


        }

        return Text("loading");
      },
    );
  }
}
