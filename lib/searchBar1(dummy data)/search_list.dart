import 'package:flutter/material.dart';
import 'package:listview_search/model/guestList.dart';
import 'package:listview_search/theme/colors.dart';

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final List<Map<String, dynamic>> people = myPeople;

  List<Map<String, dynamic>> _foundUsers = [];

  @override
  void initState() {
    _foundUsers = people;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      results = people;
    } else {
      results = people
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wedding list '),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                labelText: 'search ...',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(_foundUsers[index]["id"]),
                    color: Colors.blue,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Text(
                        _foundUsers[index]["id"].toString(),
                        style:
                            const TextStyle(fontSize: 24, color: primaryWhite),
                      ),
                      title: Text(_foundUsers[index]["name"].toString(),
                          style: const TextStyle(color: primaryWhite)),
                      subtitle: Text(
                          ' ${_foundUsers[index]["age"].toString()} years old ',
                          style: const TextStyle(color: primaryWhite)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
