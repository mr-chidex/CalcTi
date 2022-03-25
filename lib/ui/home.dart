import 'package:calculator/utils/hexcolor.dart';
import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  TipCalculator({Key? key}) : super(key: key);

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double billAmount = 0.0;
  int percentage = 20;
  int personCount = 1;
  final Color _purple = HexColor("#5c00e6");



  double getTip() {
    double tip = billAmount * percentage/100;
       return tip;
  }

  double getBill() {
        double totalBill = billAmount + getTip();
        return totalBill/personCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            //Bill Section
            Container(
              alignment: Alignment.center,
              height: 200,
              width: 150,
              margin: const EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tip Per Person",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: _purple),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "\$${getBill().toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: _purple,
                      ),
                    ),
                  )
                ],
              ),
            ), //Bill Section
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.blueGrey.shade100, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(
                      color: _purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                    decoration: const InputDecoration(
                      prefixText: "Bill Amount  ",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      try {
                        setState(() {
                          billAmount = double.parse(value);
                        });
                      } catch (ex) {
                        billAmount = 0.0;
                      }
                    },
                  ),

                  //Split section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 17),
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              width: 40,
                              height: 40,
                              padding:
                                  const EdgeInsets.fromLTRB(15.0, 5, 15.0, 5),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: _purple.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: _purple,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              if (personCount > 1) {
                                setState(() {
                                  personCount--;
                                });
                              }
                            },
                          ),
                          Text(
                            "$personCount",
                            style: TextStyle(
                              fontSize: 18,
                              color: _purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            child: Container(
                              width: 40,
                              height: 40,
                              padding:
                                  const EdgeInsets.fromLTRB(15.0, 8, 15.0, 8),
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: _purple.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: _purple),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                personCount++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ), //Split

                  //Tip section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                        child: Text(
                          "\$${getTip().toStringAsFixed(2)}",
                          style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ), //Tip section

                  //Slider
                  Column(
                    children: [
                      Text(
                          "\$$percentage%",
                        style: TextStyle(
                          color: _purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        
                      ),
                      Slider(
                          value: percentage.toDouble(),
                          min: 0,
                          max: 100,
                        divisions: 10,
                        activeColor: _purple,
                        inactiveColor: _purple.withOpacity(0.1),
                        label: percentage.round().toString(),
                          onChanged: (double value){
                            setState(() {
                              percentage = value.round();
                            });

                          },
                      )
                    ],
                  )//Slider
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
