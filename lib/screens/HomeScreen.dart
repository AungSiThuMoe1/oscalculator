import 'package:flutter/material.dart';
import 'package:online_shop_calculator/models/Data.dart';
import 'package:online_shop_calculator/screens/ConfigureScreen.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const String id = 'home';
  TextEditingController pricecontroller = TextEditingController(text: "0");
  String percentage = '15';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Provider.of<Data>(context,listen: true).DataInit();
    double totalprice = Provider.of<Data>(context,listen: true).totalPrice;
    double yuan = Provider.of<Data>(context,listen: true).yuan;
    double price = 0;
    List<DropdownMenuItem> percentageItem = Provider.of<Data>(context,listen: true).percentage;
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.black38,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.2,
                      child: Center(
                        child: Text('$totalprice Ks',style: TextStyle(
                          fontSize: 50,
                        ),),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(icon: Icon(Icons.settings), onPressed: (){
                        Navigator.of(context).pushNamed(ConfigureScreen.id);
                      }),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: pricecontroller,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                            ),
                            labelText: 'Amount',
                            labelStyle: TextStyle(
                              color: Colors.yellow.withOpacity(0.5),
                              letterSpacing: 10,
                            ),
                            contentPadding: EdgeInsets.all(10)),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow:[BoxShadow(color:Colors.white,offset: Offset(0, 10),blurRadius: 50)]
                        ),
                        child: Text('Yuan = $yuan',
                          style: TextStyle(
                            fontSize: 20,
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      DropdownButtonFormField(
                        onChanged: (newvalue) {
                          percentage = newvalue;
                          print(percentage);
                        },
                        decoration: InputDecoration(
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                            ),
                            labelText: 'Percentage',
                            labelStyle: TextStyle(
                              color: Colors.yellow.withOpacity(0.5),
                              letterSpacing: 10,
                            ),
                            contentPadding: EdgeInsets.all(10)),
                        items: percentageItem,
                        value: percentage,
                        dropdownColor: Colors.white70,
                        isExpanded: false,
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          height: 45,
                          child: FlatButton(
                            onPressed: () {
                              price = double.parse(pricecontroller.text);
                              double kyat = price*yuan;
                              totalprice = kyat + (kyat * double.parse(percentage) * 0.01);
                              print(price);
                              print(yuan);
                              print(kyat);
                              print(totalprice);
                              Provider.of<Data>(context,listen: false).setTotalPrice(totalprice);
                            },
                            child: Text(
                              'calculate',
                              style: TextStyle(color: Colors.white70),
                            ),
                            color: Colors.black54,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

}
