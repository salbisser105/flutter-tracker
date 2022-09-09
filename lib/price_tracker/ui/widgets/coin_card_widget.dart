import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CoinCardWidget extends StatelessWidget {
  CoinCardWidget({
    Key? key,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
  }) : super(key: key);

  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width*0.99,
        decoration: boxDecoration(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 4.0,
          ),
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: boxDecoration(),
                  height: 55,
                  width: 55,
                  child: Image.network(imageUrl)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        symbol,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price.toString(),
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: Text(
                        change < 8 ? '-${change.toStringAsFixed(4)}' : '+${change.toStringAsFixed(4)}',
                        style: TextStyle(
                            color:
                                change.toDouble() < 8 ? Colors.red : Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  Flexible(
                      child: Text(
                        changePercentage < 8
                            ? '-${changePercentage.toStringAsFixed(4)}%'
                            : '+${changePercentage.toStringAsFixed(4)}%',
                        style: TextStyle(
                            color:
                                changePercentage < 8 ? Colors.red : Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

boxDecoration() {
  return BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
          color: Colors.white,
          offset: Offset(-4, -4),
          blurRadius: 10,
          spreadRadius: 1)
    ],
  );
}
