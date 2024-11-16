import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet_tm/cubit/home_page/anime_cubit.dart';
import 'package:projet_tm/services/api/filter.dart';
import 'package:projet_tm/widget/filter/checkbox.dart';
import 'package:projet_tm/widget/filter/dropdown.dart';

import 'package:projet_tm/widget/filter/slider.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterView();
  }
}

class _FilterView extends State<FilterView> {
  RangeValues scoreValue = const RangeValues(0, 10);
  String name = "";
  String valueType = "all";
  List<Checked> typeList = [
    Checked("all", checked: true),
    Checked("tv", checked: false),
    Checked("movie", checked: false),
    Checked("ova", checked: false),
    Checked("special", checked: false),
    Checked("ona", checked: false),
    Checked("music", checked: false)
  ];
  String order = "none";

  changeValue(score) {
    setState(() {
      scoreValue = score;
    });
  }

  changeType(type, index) {
    setState(() {
      for (var type in typeList) {
        type.checked = false;
      }
      valueType = typeList[index].name;
      typeList[index].checked = true;
    });
  }

  changeOrder(value) {
    setState(() {
      order = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        children: [
          const SizedBox(
            height: 15,
          ),
          FilterItem(
            title: "Average note",
            content: SliderWidget(
              fct: (value) => changeValue(value),
              currentValue: scoreValue,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FilterItem(
            title: "Type of Media",
            content: CheckBoxWidget(
              valuesList: typeList,
              fct: changeType,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FilterItem(
              title: "Name of Anime",
              content: TextField(
                onChanged: (value) {
                  name = value.toString();
                },
              )),
          const SizedBox(
            height: 15,
          ),
          FilterItem(
              title: "Sort order",
              content: Center(
                  child: DropDownWidget(
                fct: changeOrder,
              ))),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
            child: const Text("Search"),
            onPressed: () {
              Filter filter = Filter(
                  name: name,
                  scoreMin: scoreValue.start,
                  scoreMax: scoreValue.end,
                  type: valueType,
                  order: order);
              BlocProvider.of<AnimeCubit>(context).animesFilter(filter, 1);

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final String title;
  final Widget content;

  const FilterItem({super.key, required this.title, required this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(2),
            color: Color.fromRGBO(41, 37, 44, 0.4)),
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                content,
              ],
            )));
  }
}
