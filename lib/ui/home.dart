import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  TipCalculator({Key? key}) : super(key: key);

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double billAmount = 0.0;
  int percetage = 0;
  int personCount = 0;

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
              Container(
                alignment: Alignment.center,
                height:  150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children:  [
                       Text(
                          "Tip Per Person",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.purpleAccent.shade700
                        ),
                      ),
                     const SizedBox(height: 8),
                     Text(
                       "\$$billAmount",
                       style:  TextStyle(
                         fontSize: 35,
                         fontWeight: FontWeight.bold,
                           color: Colors.purpleAccent.shade700
                       ),
                     )
                   ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
