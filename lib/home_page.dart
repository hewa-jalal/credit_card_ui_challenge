import 'dart:ui';

import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_challenge_4/success_page.dart';
import 'package:ui_challenge_4/widgets/credit_text_field.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cardHolderName = 'CARDHOLDER NAME';
  final txtController = TextEditingController();
  var cardNumber = [
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
    'x',
  ];

  var cvv;
  var listIndex = 0;
  var month = 'MM';
  final months = List<String>.generate(31, (i) => '$i')..removeAt(0);
  var showBack = false;
  var year = 'YY';
  final years = [2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012];

  Widget _buildCardFrontLayout() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey.shade200.withOpacity(0.4),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 20,
                left: 20,
                child: Text(
                  'INFINITESHOP',
                ),
              ),
              Positioned(
                top: 4,
                right: 20,
                child: Image.asset(
                  'assets/images/master_card_logo.png',
                  height: 50,
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                right: 20,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: getCreditCardNumber(),
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 110,
                left: 20,
                child: Text('Valid Until  $month/$year'),
              ),
              Positioned(
                top: 150,
                left: 20,
                child: Text(cardHolderName.toUpperCase()),
              ),
              Positioned(
                right: 20,
                top: 145,
                child: Icon(
                  Icons.sim_card,
                  color: Colors.yellow,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          height: 60,
          decoration: new BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.5),
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Center(
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuccessPage()),
              ),
              child: Text(
                'CHECKOUT',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 26,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _showDatePicker() {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.grey[300],
        builder: (context) {
          return Container(
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  top: 12,
                  left: 20,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 12,
                  child: InkWell(
                    onTap: () {
                      txtController.text = '$month/$year';
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Pick Date',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  top: 34,
                  left: 20,
                  child: Container(
                    width: 180,
                    height: 160,
                    child: ListView.builder(
                      itemCount: months.length,
                      itemBuilder: (context, index) {
                        return Material(
                          child: GestureDetector(
                            onTap: () => setState(() {
                              month = months[index].toString().padLeft(2, '0');
                            }),
                            child: ListTile(
                              title: Text(
                                '${months[index].padLeft(2, '0')}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 34,
                  right: 20,
                  child: Container(
                    width: 180,
                    height: 160,
                    child: ListView.builder(
                      itemCount: months.length,
                      itemBuilder: (context, index) {
                        return Material(
                          child: GestureDetector(
                            onTap: () => setState(() {
                              var newYear = years[index].toString();
                              year = newYear.substring(2, 4);
                            }),
                            child: ListTile(
                              title: Text(
                                '${years[index]}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  String getCreditCardNumber() {
    return cardNumber.sublist(0, 4).toString().formatListToCreditCard() +
        '  ' +
        cardNumber.sublist(4, 8).toString().formatListToCreditCard() +
        '  ' +
        cardNumber.sublist(8, 12).toString().formatListToCreditCard() +
        '  ' +
        cardNumber.sublist(12, 16).toString().formatListToCreditCard();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple[900],
                Colors.pink[400],
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: CreditCard(
                  frontBackground: Container(color: Colors.grey),
                  backBackground: CardBackgrounds.white,
                  showBackSide: showBack,
                  cardType: CardType.masterCard,
                  cvv: cvv.toString(),
                  frontLayout: _buildCardFrontLayout(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18.0, right: 10, left: 10),
                            child: CreditTextField(
                              labelText: 'Card Number',
                              textInputType: TextInputType.number,
                              onChanged: (val) {
                                setState(() {
                                  showBack = false;
                                  cardNumber[listIndex] = val[listIndex];
                                });
                                listIndex++;
                                val = '';
                              },
                              maxLength: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 12.0, right: 10, left: 10),
                            child: CreditTextField(
                              textInputType: TextInputType.number,
                              labelText: 'Expiry Date',
                              controller: txtController,
                              onTap: () {
                                showBack = false;
                                _showDatePicker();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 10, left: 10),
                            child: CreditTextField(
                              textInputType: TextInputType.number,
                              labelText: 'CVC',
                              onChanged: (val) => setState(() {
                                cvv = int.parse(val);
                                showBack = true;
                              }),
                              maxLength: 4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 4.0, right: 10.0, left: 10.0),
                            child: CreditTextField(
                              textInputType: TextInputType.name,
                              labelText: 'Cardholder Name',
                              onChanged: (val) => setState(() {
                                showBack = false;
                                cardHolderName = val;
                              }),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                child: _buildCheckoutButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
