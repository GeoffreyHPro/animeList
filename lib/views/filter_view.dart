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
  RangeValues scoreValue =
      RangeValues(filterSearch.scoreMin, filterSearch.scoreMax);
  String name = filterSearch.name;
  String valueType = filterSearch.type;
  List<Checked> typeList = checkboxes;
  String order = filterSearch.order;

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
    filterSearch.types = typeList;
    print(filterSearch.types[0].checked);
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
          const Center(
            child: Text(
              "Filters",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            indent: 15,
            endIndent: 15,
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
          const Divider(
            indent: 15,
            endIndent: 15,
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
          const Divider(
            indent: 15,
            endIndent: 15,
          ),
          FilterItem(
              title: "Name of Anime",
              content: TextField(
                controller: TextEditingController()..text = filterSearch.name,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                onChanged: (value) {
                  name = value.toString();
                  filterSearch.name = name;
                },
              )),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            indent: 15,
            endIndent: 15,
          ),
          FilterItem(
              title: "Sort order",
              content: Center(
                  child: DropDownWidget(
                initVal: filterSearch.order,
                fct: changeOrder,
              ))),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
            child: const Text("Search"),
            onPressed: () {
              filterSearch = Filter(
                  name: name,
                  scoreMin: scoreValue.start,
                  scoreMax: scoreValue.end,
                  type: valueType,
                  order: order);
              BlocProvider.of<AnimeCubit>(context)
                  .animesFilter(filterSearch, 1);

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
    return SizedBox(
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
