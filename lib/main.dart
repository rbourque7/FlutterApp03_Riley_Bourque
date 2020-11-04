import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MyTabbedScopedModelProject extends StatelessWidget {
  const MyTabbedScopedModelProject({this.title, this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MyModel>(
      model: MyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),                
        body: Column(
          children: <Widget>[
          DrinksCarousel(color: color),
          DrinksList(),
          ],
        ),
      ),
    );
  }
}

class Drink {
  Drink(this.title, this.image);
  final String title;
  final String image;
}

List<Drink> coffee = <Drink>[
  //PUT THE TITLE IMAGES IN HERE
  Drink('Black Coffee', 'assets/img/black-coffee.jpeg'),
  Drink('Cappuccino', 'assets/img/cappuccino.jpeg'),
  Drink('Espresso', 'assets/img/espresso.jpeg'),
  Drink('Latte', 'assets/img/latte.jpeg'),
];

List<Drink> tea = <Drink>[
  //PUT THE TITLE IMAGES IN HERE
  Drink('Black Tea', 'assets/img/black-tea.jpeg'),
  Drink('Brown Tea', 'assets/img/brown-tea.jpeg'),
  Drink('English Tea', 'assets/img/english-tea.jpeg'),
  Drink('Herbal Tea', 'assets/img/herbal-tea.jpeg'),
  Drink('Mint Tea', 'assets/img/mint-tea.jpeg'),
];

List<Drink> juice = <Drink>[
  //PUT THE TITLE IMAGES IN HERE
  Drink('Lemon Juice', 'assets/img/lemon.jpeg'),
  Drink('Lime Juice', 'assets/img/lime.jpeg'),
  Drink('Pink Grape Juice', 'assets/img/pink-grape.jpeg'),
  Drink('Plum Juice', 'assets/img/plum.jpeg'),
  Drink('Tomato Juice', 'assets/img/tomato.jpeg'),
];

List<Drink> smoothie = <Drink>[
  //PUT THE BOTTOM IMAGES IN HERE
  Drink('Apple Smoothie', 'assets/img/apple-smoothie.jpeg'),
  Drink('Blackberry Smoothie', 'assets/img/black-smoothie.jpeg'),
  Drink('Kiwi Fruit Smoothie', 'assets/img/kiwi-smoothie.jpeg'),
  Drink('Raspberry Smoothie', 'assets/img/rasberry-smoothie.jpeg'),
  Drink('1-6', 'assets/img/2-1.jpeg'),
  Drink('1-7', 'assets/img/2-1.jpeg'),
];

List<Drink> twos = <Drink>[
  //PUT THE BOTTOM IMAGES IN HERE
  Drink('2-2', 'assets/img/1-1.jpeg'),
  Drink('2-3', 'assets/img/2-1.jpeg'),
  Drink('2-4', 'assets/img/1-1.jpeg'),
];

class MyModel extends Model {
  //PRIVATE
  List<Drink> _chosenDrink = coffee;
  //PUBLIC PROP GETTER
  List<Drink> get chosenDrink => _chosenDrink;
  //PUBLIC PROP SETTER
  set chosenDrink(List<Drink> type) {
    _chosenDrink = type;
  //IF NOTHING CHANGED
  notifyListeners();
  }
}

class DrinksCard extends StatelessWidget {
  const DrinksCard({this.instantsDrink});

  final Drink instantsDrink;

  @override 
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
            instantsDrink.image,
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

class DrinksList extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModel>(
      builder: (context, child, model) {
        return Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(6.0),
            children: model.chosenDrink.map((e) {
              return DrinksCard(
                instantsDrink: e,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class DrinksCarousel extends StatefulWidget {
  DrinksCarousel({this.color});

  final Color color;

  @override 
  _DrinksCarouselState createState() => _DrinksCarouselState();
}

class _DrinksCarouselState extends State<DrinksCarousel>
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

  @override 
  Widget build(BuildContext context) {
    Color myColor = widget.color;

    return SizedBox(
      height: 250.0,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 4.0,
            color: myColor,
          ),
        ),
        child: Stack(
          children: <Widget>[
            ScopedModelDescendant<MyModel>(
              rebuildOnChange: false,
              builder: (context, child, myModel) {
                return TabBarView(
                  controller: _tabController,
                  children: nums.map((drinkType) {
                    return GestureDetector(
                      onTap: () {
                        var type;
                        switch (drinkType.title) {
                          case '1':
                          type = ones;
                          break;
                          case '2':
                          type = twos;
                          break;
                          default:                         
                          throw '${drinkType.title} type not recognized';
                        }
                        //CALLS THE SETTER
                        myModel.chosenDrink = type;
                      },
                      child: DrinksCard(
                        instantsDrink: drinkType,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabPageSelector(
                  controller: _tabController,
                  color: Colors.white,
                  selectedColor: myColor,
                  indicatorSize: 20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: myColor,
                  size: 36,
                ),
                onPressed: () {
                  _changeImage(delta: -1);
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color:myColor,
                  size: 36,
                ),
                onPressed: () {
                  _changeImage(delta: 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}