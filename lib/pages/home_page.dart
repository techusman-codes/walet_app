import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/utils/my_buttons.dart';
import 'package:wallet_app/utils/my_card.dart';
import 'package:wallet_app/utils/my_listile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // page controller
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                size: 32,
                color: Colors.pink,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 32,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // app BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),

                  /// plus Button
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),

            // CARD
            Container(
              height: 150,
              child: Expanded(
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  controller: _controller,
                  children: [
                    MyCard(
                      balance: 5250.25,
                      cardNumber: 1234567,
                      expireMonth: 12,
                      expireYear: 2025,
                      color: Colors.deepPurple,
                    ),
                    MyCard(
                      balance: 342.23,
                      cardNumber: 1234567,
                      expireMonth: 09,
                      expireYear: 2025,
                      color: Colors.blue[400],
                    ),
                    MyCard(
                      balance: 420.42,
                      cardNumber: 1234567,
                      expireMonth: 10,
                      expireYear: 2027,
                      color: Colors.green[400],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade700,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            // 3 buttons -> send + pay + Bills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButtons(
                    iconImagePath: 'assets/icons/send-money.png',
                    buttonText: 'Send',
                  ),
                  MyButtons(
                    iconImagePath: 'assets/icons/credit-card.png',
                    buttonText: 'Pay',
                  ),
                  MyButtons(
                    iconImagePath: 'assets/icons/bill.png',
                    buttonText: 'Bills',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // colums statrs + transactions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  // statistics
                  MyListile(
                    iconImagePath: 'assets/icons/analysis.png',
                    titleTitle: 'Statistcs',
                    titleSubTtile: 'Payments and Income',
                  ),
                  MyListile(
                    iconImagePath: 'assets/icons/bill.png',
                    titleTitle: 'Transactions',
                    titleSubTtile: 'Transaction History',
                  ),

                  // transaction history
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
