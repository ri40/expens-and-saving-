import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SavingPage extends StatelessWidget {
  const SavingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
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
                    child: Text('Your Saving Reat', style: textStyle.subtitle2),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '10 %',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Saving For This Month',
                        style: textStyle.subtitle2),
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
                    child: Text('Saving Data', style: textStyle.subtitle2),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: TextFormField(
                      controller: _date,
                      decoration: const InputDecoration(
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
                            _date.text =
                                DateFormat('yyyy-MM-dd').format(pickeddate);
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

  void setState(Null Function() param0) {}
}
