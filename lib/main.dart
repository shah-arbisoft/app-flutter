import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shah\'s App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar:AppBar(title: Text("jello")),
        body: TextInputWidget() );
          
  }
}



class TextInputWidget extends StatefulWidget {
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller  = TextEditingController();
  String text="";

  @override
  void dispose()
  {
    super.dispose();
    controller.dispose();
  }

  void changeText(text)
  {
    if(text=="hello world")
    {
      controller.clear();
      text="";
    }
    setState(() {
      
      this.text=text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
    children:<Widget> [ TextField(
      controller: this.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.message) , labelText:"Type a message: " ),
        onChanged: (text)=>this.changeText(text),
      ), Text(this.text)
      ]);
  }
}

