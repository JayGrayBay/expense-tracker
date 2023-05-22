//home_page.dart
import 'package:flutter/material.dart';
import 'daily_expenses_page.dart';
import 'weekly_expenses_page.dart';
import 'monthly_expenses_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Expense {
  final String item;
  final double price;

  Expense({required this.item, required this.price});
}

class ExpensesModel extends ChangeNotifier {
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void add(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }
}


class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final itemController = TextEditingController();
  final priceController = TextEditingController();

  static List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    DailyExpensesPage(),
    WeeklyExpensesPage(),
    MonthlyExpensesPage(),
  ];

  @override
  void dispose() {
    itemController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          RawMaterialButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('New Expense'),
                    content: Column(
                      children: [
                        TextField(
                          controller: itemController,
                          decoration: InputDecoration(hintText: 'Item/Service'),
                        ),
                        TextField(
                          controller: priceController,
                          decoration: InputDecoration(hintText: 'Price'),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Add'),
                        onPressed: () {
                          // Get the current text field values here.
                          String item = itemController.text;
                          double price = double.parse(priceController.text);

                          // Add the new expense to the model.
                          Provider.of<ExpensesModel>(context, listen: false).add(
                            Expense(item: item, price: price),
                          );

                          // Clear the text fields.
                          itemController.clear();
                          priceController.clear();

                          Navigator.of(context).pop();
                        },
                      )],
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('new expense', style: TextStyle(color: Colors.white),  // set the text color to white
              ),
            ),
            fillColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            constraints: BoxConstraints.tightFor(
              width: 200,  // specify a width
              height: 56,  // specify a height
            ),
            elevation: 6.0,
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Daily',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Weekly',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xf06bb, fontFamily: 'MaterialIcons')),
            label: 'Monthly',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white, // Add this line to set the color of unselected items.
        onTap: _onItemTapped,
      ),
    );
  }
}
