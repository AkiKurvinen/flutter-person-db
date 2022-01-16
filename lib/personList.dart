import 'package:flutter/material.dart';

class Person {
  String _name = "N/A";
  int _age = 0;
  String _address = "N/A";

  Person({required String name, required int age, required String address})
      : _name = name,
        _age = age,
        _address = address;

  String get getName {
    return _name;
  }

  int get getAge {
    return _age;
  }

  String get getAddress {
    return _address;
  }

  set setName(String aName) {
    _name = aName;
  }

  set setAge(int aAge) {
    _age = aAge;
  }

  set setAddress(String aAddress) {
    _address = aAddress;
  }
}

class PersonList extends StatefulWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  _PersonListState createState() => _PersonListState();
}

List<Widget> getList(List<Person> persons) {
  List<Widget> childs = persons
      .map(
        (person) => Row(children: [
          Expanded(flex: 3, child: Text(person.getName)),
          SizedBox(width: 100, child: Text(person.getAge.toString())),
          Expanded(flex: 2, child: Text(person.getAddress)),
        ]),
      )
      .toList();

  return childs;
}

class _PersonListState extends State<PersonList> {
  final List<Person> persons = [
    Person(name: "Matti", age: 10, address: "Tie 10, 12345 TRE"),
    Person(name: "Teppo", age: 20, address: "Tie 20, 12345 TRE"),
    Person(name: "Kaija", age: 30, address: "Tie 30, 12345 TRE"),
  ];
  String infoMessage = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
//
  bool checkNameController() => nameController.text.isEmpty;
  bool checkAgeController() => ageController.text.isEmpty;
  bool checkAddressController() => addressController.text.isEmpty;

  bool enableButton() =>
      !checkNameController() ||
      !checkAgeController() ||
      !checkAddressController();
//
  int addPerson(String aName, int aAge, String aAddress) {
    Person p = Person(name: aName, age: aAge, address: aAddress);
    persons.add(p);
    return 0;
  }

//
  Widget _buildList() {
    return (Column(children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getList(persons),
        ),
      ),
      Column(
        children: [
          Container(height: 10, color: Colors.red),
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            "Add person to database",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: nameController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Name...",
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: ageController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Age...",
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: addressController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Address...",
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),     const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            child: const Text('Add Person'),
            onPressed: () => addToPersons(),

          ),     const SizedBox(
            height: 16.0,
          ),
          Text(
            infoMessage,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      )
    ]));
  }

  void addToPersons() {
    addPerson(nameController.value.text, int.parse(ageController.value.text),
        addressController.value.text);
    setState(() {
      persons;
    });
  }
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Person App"),
          backgroundColor: Colors.redAccent,
        ),
        body: _buildList());
  }
}
