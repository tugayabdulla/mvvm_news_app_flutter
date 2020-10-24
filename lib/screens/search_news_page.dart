import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_mvvm/utils/destinations.dart';
import 'package:news_app_mvvm/utils/functions.dart';
import 'package:news_app_mvvm/view%20models/news_view_model.dart';
import 'package:news_app_mvvm/widgets/news_list.dart';
import 'package:provider/provider.dart';

const oneMonth = Duration(days: 30);

class SearchNewsPage extends StatefulWidget {
  @override
  _SearchNewsPageState createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  DateTime now;
  DateTime selectedStartDate;
  DateTime selectedEndDate;
  TextEditingController _controller = TextEditingController();
  var vm;


  @override
  void initState() {
    now = DateTime.now();
    selectedStartDate = now.subtract(oneMonth);
    selectedEndDate = now;
    vm = Provider.of<NewsViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text('Start:'),
          ElevatedButton(
            onPressed: () {
              _selectDate(context, true);
            },
            child: Text(
              formatDateForUI(selectedStartDate),
            ),
          ),
          Text('End:'),
          ElevatedButton(
              onPressed: () {
                _selectDate(context, false);
              },
              child: Text(
                formatDateForUI(selectedEndDate),
              ),)
        ]),
        SizedBox(
          height: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 70.0,
                child:TextField(
                  controller: _controller,
                  decoration:  InputDecoration(
                    labelText: "Enter keyword",
                    border:  OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(25.0),
                    ),
                  ),

                  keyboardType: TextInputType.text,

                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                focusColor: Colors.red,
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    vm.getSearchNews(
                        _controller.text, selectedStartDate, selectedEndDate);
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Consumer<NewsViewModel>(builder: (context, vm, child) {

            return vm.loadingSearch? Center(child: CircularProgressIndicator(),) :NewsList(
                newsList: vm.searchNews,
                backgroundColor: allDestinations[2].color.shade100);
          }),
        )
      ],
    );
  }

  _selectDate(BuildContext context, bool isStart) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context, isStart);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context, isStart);
    }
  }

  buildMaterialDatePicker(BuildContext context, bool isStart) async {
    var selectedDate = isStart ? selectedStartDate : selectedEndDate;
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: now.subtract(oneMonth),
      lastDate: now,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        if (isStart) {
          selectedStartDate = picked;
        } else {
          selectedEndDate = picked;
        }
      });
  }

  buildCupertinoDatePicker(BuildContext context, bool isStart) {
    var selectedDate = isStart ? selectedStartDate : selectedEndDate;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    if (isStart) {
                      selectedStartDate = picked;
                    } else {
                      selectedEndDate = picked;
                    }
                  });
              },
              initialDateTime: selectedDate,
              minimumDate: now.subtract(oneMonth),
              maximumDate: now,
            ),
          );
        });
  }
}
