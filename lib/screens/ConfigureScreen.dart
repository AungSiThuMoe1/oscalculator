import 'package:flutter/material.dart';
import 'package:online_shop_calculator/models/Data.dart';
import 'package:provider/provider.dart';

import 'HomeScreen.dart';


class ConfigureScreen extends StatelessWidget {
  static const String id = 'configure_screen';
  TextEditingController  yuancontroller = TextEditingController(text: '198');
  TextEditingController  percentagecontroller = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    double yuan = Provider.of<Data>(context).yuan;
    yuancontroller.text='$yuan';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Configuration'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LabelTextWithTextField(yuancontroller: yuancontroller,labelText: '1 yuan = ? kyat',),
              SizedBox(
                height: 10,
              ),
              LabelTextWithTextField(yuancontroller: percentagecontroller,labelText: 'Percentage',),
              Container(
                  margin: EdgeInsets.all(10),
                  height: 45,
                  child: FlatButton(
                    onPressed: () {
                      if(percentagecontroller.text != '') {
                        Provider.of<Data>(context, listen: false).addPercentage(percentagecontroller.text);
                      }
                      if(yuancontroller.text != '')
                      {Provider.of<Data>(context,listen: false).setYuan(double.parse(yuancontroller.text));}
                      print(yuancontroller.text);
                      dialog(context);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white70),
                    ),
                    color: Colors.black54,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class LabelTextWithTextField extends StatelessWidget {
  const LabelTextWithTextField({
    Key key,
    @required this.yuancontroller,
    @required this.labelText,
  }) : super(key: key);

  final TextEditingController yuancontroller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: yuancontroller,
      autofocus: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.black54, width: 1.0)),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.black54, width: 1.0),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black54.withOpacity(0.5),
            fontSize: 15,
          ),
          contentPadding: EdgeInsets.all(10)),
    );
  }
}

void dialog(var context){
  showDialog(context: context,
    builder: ( _ ) =>   AlertDialog(
      title: Text('Success'),
      content: Text('Change data is successful.'),
      actions: [
        FlatButton(
          child: Text('Yes'),
          onPressed: (){
          Navigator.popAndPushNamed(context, Home.id);
          },
        ),
      ],
      elevation: 24.0,
    ),
    barrierColor: Colors.black12,
    barrierDismissible: false,
  );
}
