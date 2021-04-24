import 'package:flutter/material.dart';
import 'package:myapp/core/routes/routes.dart';
import 'package:myapp/core/services/navigator.dart';
import 'package:myapp/core/widgets/buttons.dart';
import 'package:myapp/core/widgets/containers/full_size_container.dart';

class Tags extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  List<Tag> _tags = [Tag("Tag1", 1)];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: RefreshIndicator(
        onRefresh: _refreshTags,
        child: FullSizeContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                children: _tags
                    .map((_tag) => Chip(
                          label: Text(_tag.name),
                        ))
                    .toList(),
              ),
              MyButton(
                text: "Next",
                onPressed: handleNextStep,
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

  handleNextStep() {
    NavigatorService.instance.navigateTo(routeUserDetails);
  }
}

class Tag {
  final String name;
  final int id;

  Tag(this.name, this.id);
}
