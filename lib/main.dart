import 'package:flutter/material.dart';

class MyTabbedScopedModelDemo extends StatelessWidget {
  const MyTabbedScopedModelDemo({this.title, this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MyModel>(
      model: MyModel(),
      child: Scaffold(appBar: AppBar( 
        title: Text(title),
        ),
        body: Column(
          children: <Widgit>[
          NumbersCarousel(color: color),
          NumbersLists(),
          ],
        ),
      ),
    );
  }
}

class Number {
  Number(this.title, this.image);
  final String title;
  final String image;
}

List<Number> nums = <Number>[
  //PUT THE TITLE IMAGES IN HERE
  Number('1', 'assets/img/1-1.jpg'),
  Number('2', 'assets/img/2-1.jpg'),
];

List<Number> ones = <Number>[
  //PUT THE BOTTOM IMAGES IN HERE
  Number('1-2', 'assets/img/1-1.jpg'),
  Number('1-3', 'assets/img/2-1.jpg'),
  Number('1-4', 'assets/img/1-1.jpg'),
  Number('1-5', 'assets/img/2-1.jpg'),
  Number('1-6', 'assets/img/2-1.jpg'),
  Number('1-7', 'assets/img/2-1.jpg'),
];

List<Number> twos = <Number>[
  //PUT THE BOTTOM IMAGES IN HERE
  Number('2-2', 'assets/img/1-1.jpg'),
  Number('2-3', 'assets/img/2-1.jpg'),
  Number('2-4', 'assets/img/1-1.jpg'),
];

class MyModel extends Model {
  //PRIVATE
  List<Number> _chosenNumber = ones;
  //PUBLIC PROP GETTER
  List<Number> get chosenNumber => _chosenNumber;
  //PUBLIC PROP SETTER
  set chosenNumber(List<Number> type) {
    _chosenNumber = type;
  //IF NOTHING CHANGED
  notifyListeners();
  }
}

class NumbersCard extends