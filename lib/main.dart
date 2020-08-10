import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Post 
{
  String body;
  String author;
  int likes;
  bool userLiked=false;

  Post(this.body,this.author);

  void likePost()
  {
    this.userLiked = !this.userLiked;
    if(userLiked)
    {
      this.likes+=1;
    }
    else
      this.likes-=1;

  }
  
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shah\'s App',
      
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
{
  List<Post> posts = [];

  void newPost(String text)
  {
    this.setState(() 
    {
      posts.add(new Post(text,"Shah"));
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar:AppBar
      (
        title: Text("jello")
      ),

      body: Column
      (
        children: <Widget>
        [
          Expanded(child: PostList(this.posts)),
          Expanded( child: TextInputWidget(this.newPost) )
        ]
      )
    );       
  }
}




class TextInputWidget extends StatefulWidget 
{
  final Function(String) callback;
  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> 
{
  
  final controller  = TextEditingController();
  // String text="";


  @override
  void dispose()
  {
    super.dispose();
    controller.dispose();
  }


void click()
{
  widget.callback(controller.text);
  controller.clear();
}


  // void changeText(text)
  // {
  //   if(text=="hello world")
  //   {
  //     controller.clear();
      
  //   }
  //   setState(() {
      
  //     this.text=text;
  //   });
  // }

  @override
  Widget build(BuildContext context) 
  {
    return  TextField
    (
      controller: this.controller,
      decoration: InputDecoration
      (
        prefixIcon: Icon(Icons.message) ,
        labelText: "Type a message: ", 
        suffixIcon: IconButton
        (
          icon: Icon(Icons.send),
          onPressed: this.click,
          splashColor: Colors.blue,
          tooltip: "text",
        )
      )
      
    );

  }
}



class PostList extends StatefulWidget {
  final List<Post> listItems;
  PostList(this.listItems);
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder
    (
      itemCount: this.widget.listItems.length ,
      itemBuilder: (context,index) 
      {
        var post = this.widget.listItems[index];
      } 
    )
  }
}