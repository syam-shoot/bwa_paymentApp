import 'package:bwa_payment/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget options(int index, String title, String subtitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                  color: selectedIndex == index
                      ? Color(0xff007DFF)
                      : Color(0xff4D5B7C))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/check_two.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/check.png',
                          width: 18,
                          height: 18,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: plantTextStyle,
                      ),
                      Text(
                        subtitle,
                        style: descTextStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 91,
                  ),
                  Text(
                    pricing,
                    style: priceTextStyle,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    // ignore: non_constant_identifier_names
    Widget Header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
        child: Column(
          children: [
            Center(
                child: Image.asset(
              'assets/icon_one.png',
              width: 267,
              height: 200,
            )),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade To',
                  style: titleTextStyle,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Pro',
                  style: titleTextStyle.copyWith(color: Colors.amber),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Go unlock all features and \nbuild your own business bigger',
              style: subTitleTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            height: 51.23,
            width: 311,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff007DFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(71))),
                onPressed: () {},
                child: Text(
                  'Checkout Now',
                  style: btnTextStyle,
                )),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112F),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 50,
              ),
              options(0, 'Montly', 'Good for starting up', '\$20'),
              options(1, 'Quarterly', 'Focusing on building', '\$55'),
              options(2, 'Yearly', 'Steady Company', '\$220'),
              SizedBox(
                height: 50,
              ),
              selectedIndex == -1 ? SizedBox() : checkoutButton(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
