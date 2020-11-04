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

class NumbersCard extends StatelessWidget {
  const NumbersCard({this.instantNumber});

  final Number instantNumber;

  @override 
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
            instantsNumber.image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
          ],
        )
      ),
    );
  }
}

class NumbersList extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModel>(
      builder: (context, child, model) {
        return Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(6.0),
            children: model.chosenNumber.map((e)) {
              return NumbersCard(
                instantsNumber: e,
              );
            }).toList(),
          ),
        ),
      },
    );
  }
}

class NumbersCarousel extends StatefulWidget {
  NumbersCarousel({this.color});

  final Color color;

  @override 
  _NumbersCarouselState createState() => _NumbersCarouselState();
}

class _NumbersCarouselState extends State<NumbersCarousel>
  with SingleTickerProviderStateMixin {
    TabController _tabController;

    @override 
    void initState() {
      super.initState();
      _tabController = TabController(length: nums.length, vsync: this);
    }

    @override 
    void dispose() {
      super.dispose();
      _tabController.dispose();
    }

    void _changeImage({int delta}) {
      var newTabIndex = _tabController.index + delta;
      if (newTabIndex >= nums.length) {
        newTabIndex = 0;
      } else if (newTabIndex < 0) {
        newTabIndex = nums.length - 1;
      }
      _tabController.animateTo(
        newTabIndex,
      );
    }
  }

  @override 
  Widgit 