import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
    //this for dropdownMenu
    final items = ['Shopping', 'Restaurant', 'Cafe', 'Gifts', 'Transportation'];
    String? selectedItem = 'Shopping';
    //this for date text filed
    TextEditingController _date = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 389,
              width: 382,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Choose Category', style: textStyle.subtitle2),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide:
                                BorderSide(width: 1, color: Colors.green),
                          ),
                        ),
                        value: selectedItem,
                        iconSize: 36,
                        icon: Icon(Icons.keyboard_arrow_down_sharp,
                            color: Colors.green),
                        isExpanded: true,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(fontSize: 24),
                                )))
                            .toList(),
                        onChanged: (item) =>
                            setState(() => selectedItem = item),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Your Expenses', style: textStyle.subtitle2),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '100 SR',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Exchange Data', style: textStyle.subtitle2),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: TextFormField(
                      controller: _date,
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today_outlined,
                            color: Colors.green),
                        hintText: 'Select Date',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        if (pickeddate != null) {
                          setState(() {
                            _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                                // DateFormat('yyyy-MM-dd').format(pickeddate);
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: ElevatedButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      child: Text('Save'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        minimumSize: const Size.fromHeight(50),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
