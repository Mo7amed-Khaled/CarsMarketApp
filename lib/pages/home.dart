import 'package:cars/pages/product.dart';
import 'package:flutter/material.dart';

import 'carDetails.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {

  List<Product> products = [
    Product(image: 'images/8.jpg', type: 'BMW', piece: 20, price: '900', number: 00112233),
    Product(image: 'images/2.jpg', type: 'Mercedes', piece: 22, price: '800', number: 00112233),
    Product(image: 'images/3.jpg', type: 'Toyota', piece: 18, price: '700', number: 00112233),
    Product(image: 'images/5.jpg', type: 'Chevrolet', piece: 16, price: '750', number: 00112233),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars Market'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
              child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      height: 120,
                      width: 180,
                      child: Image.asset(products[i].image, fit: BoxFit.fill,),
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(products[i].type,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Icon(Icons.star, size: 16, color: Colors.amberAccent,),
                              ),
                              Text('5.3     (23 Reviews)'),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: <Widget>[
                              Text('${products[i].piece} Pieces'),
                              SizedBox(width: 25,),
                              Text('\$${products[i].price}',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text('${products[i].number}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: (){
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    title: Align(child: Text(products[i].type),
                      alignment: Alignment.center,  
                    ),
                    content: Container(
                      height: 190,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(products[i].image),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                              boxShadow: [BoxShadow(
                                blurRadius: 5,

                              )],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text('Confirm Call That Driver'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Confirm', style: TextStyle(color: Colors.white),),
                            ),
                            color: Colors.black,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => CarDetails(products[i]),
                              ),);
                            },
                          ),
                          SizedBox(width: 5,),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: RaisedButton(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Cancel', style: TextStyle(color: Colors.white),),
                              ),
                              color: Colors.black,
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}




