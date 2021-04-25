import 'package:flutter/material.dart';
import 'package:myapp/core/routes/routes.dart';
import 'package:myapp/core/services/firestore.dart';
import 'package:myapp/core/services/navigator.dart';
import 'package:myapp/core/services/user.dart';
import 'package:myapp/core/widgets/buttons.dart';
import 'package:myapp/core/widgets/containers/full_size_container.dart';

class Tags extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  List<Tag> _tags = getTags();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: RefreshIndicator(
        onRefresh: _refreshTags,
        child: FullSizeContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: _tags.any((tag) => tag.selected)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text("Your labels"),
                          ),
                          Wrap(
                            children: _tags
                                .where((tag) => tag.selected)
                                .map((tag) => Container(
                                      margin: EdgeInsets.all(4),
                                      child: Chip(
                                        label: Text(tag.name),
                                      ),
                                    ))
                                .toList(),
                          )
                        ],
                      )
                    : Container(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, top: 30),
                child: Text("Select labels"),
              ),
              Wrap(
                children: _tags
                    .map((_tag) => Container(
                          margin: EdgeInsets.all(4),
                          child: ChoiceChip(
                            label: Text(_tag.name),
                            selected: _tag.selected,
                            onSelected: (value) {
                              setState(() {
                                _tag.selected = value;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
              MyButton(
                text: "Save",
                onPressed: handleTagsSave,
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }

  Future<void> _refreshTags() async {
    return Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _tags = [];
      });
    });
  }

  handleTagsSave() {
    FirestoreService.setTagsToUser(
      _tags.where((tag) => tag.selected).map((e) => e.id),
    ).then((v) {
      NavigatorService.instance.navigateTo(routeUserDetails);
    });
  }

  static List<Tag> getTags() {
    final List<Tag> tags = [
      Tag("Tag1", 1, false),
      Tag("Tag2", 2, false),
      Tag("Tag3", 3, false),
      Tag("Tag4", 4, false),
      Tag("Tag5", 5, false),
      Tag("Tag6", 6, false),
      Tag("Tag7", 7, false),
      Tag("Tag8", 8, false),
      Tag("Tag9", 9, false),
      Tag("Tag10", 10, false),
      Tag("Tag11", 11, false),
    ];

    if (GlobalService.instance.user.tags != null) {
      GlobalService.instance.user.tags.forEach((tagID) {
        tags.firstWhere((tag) => tag.id == tagID).selected = true;
      });
    }

    return tags;
  }
}

class Tag {
  final String name;
  final int id;
  bool selected;

  Tag(this.name, this.id, this.selected);
}
