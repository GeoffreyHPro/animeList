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
  String valueType = "tous";
  List<Checked> typeList = [
    Checked("tous", checked: true),
    Checked("tv", checked: false),
    Checked("movie", checked: false),
    Checked("ova", checked: false),
    Checked("special", checked: false),
    Checked("ona", checked: false),
    Checked("music", checked: false)
  ];
  String order = "aucun";

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
            title: "Note moyenne",
            content: SliderWidget(
              fct: (value) => changeValue(value),
              currentValue: scoreValue,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FilterItem(
            title: "Type de média",
            content: CheckBoxWidget(
              valuesList: typeList,
              fct: changeType,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FilterItem(
              title: "Nom de l'animé",
              content: TextField(
                onChanged: (value) {
                  name = value.toString();
                },
              )),
          const SizedBox(
            height: 15,
          ),
          FilterItem(
              title: "Ordre de tri",
              content: Center(
                  child: DropDownWidget(
                fct: changeOrder,
              ))),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            child: const Text("rechercher"),
            onPressed: () {
              Filter filter = Filter(
                  name: name,
                  scoreMin: scoreValue.start,
                  scoreMax: scoreValue.end,
                  type: valueType, order: order);
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
          color: const Color.fromRGBO(200, 200, 200, 0.4),
        ),
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
