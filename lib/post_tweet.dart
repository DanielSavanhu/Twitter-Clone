import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Post_Tweet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    color: Colors.blue,
                    tooltip: 'Close',
                    icon: Icon(Icons.close_outlined),
                    onPressed: (){
                      Navigator.of(context).pop();
                    }
                  ),
                ),
                FlatButton(
                  color: Colors.white,
                  child: Text('Drafts'),
                ),
                RaisedButton(                  
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue, )
                  ),
                  onPressed: (){},
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  child: Text('Tweet',style: TextStyle(color:Colors.white,),),
                )
              ],
            ),            
            ListTile(
              leading: FlatButton(
                child: Image(
                  height: 50,
                  width: 50,                      
                  image: AssetImage('images/profpic.jpg'),
                ),
                onPressed: (){
                  showCupertinoDialog(
                    context: context, 
                    builder: (_){
                      return ;
                    }
                  );
                },                                      
              ),
              title:TextField(
                controller:TextEditingController(                  
                ),
                decoration: InputDecoration(hintText: "What happening?")
              )
            ),
            Expanded(
              child: Text(''),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.globeAmericas,color: Colors.blue,),
              title: Text('Everyone can reply',style: TextStyle(color:Colors.lightBlueAccent),),
              onTap: (){},
            ),
            Row(
              children:[
                IconButton(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  tooltip: 'Gallery',
                  icon: Icon(FontAwesomeIcons.image),
                  onPressed: (){}
                ),                             
                IconButton(              
                  color: Colors.blue,
                  tooltip: 'GIF',
                  icon: Icon(Icons.gif_outlined),
                  onPressed: (){}
                ),
                IconButton(              
                  color: Colors.blue,
                  tooltip: 'POLL',
                  icon: Icon(Icons.poll_outlined),
                  onPressed: (){}
                ),
                Expanded(
                  child:IconButton( 
                    alignment: Alignment.centerLeft,                 
                    color: Colors.blue,
                    tooltip: 'Location',
                    icon: Icon(Icons.location_on_outlined),
                    onPressed: (){}
                  ),
                ),
                IconButton( 
                  color: Colors.blue,
                  tooltip: 'Round',
                  icon: Icon(Icons.circle,color: Colors.grey),
                  onPressed: (){}
                ),
                VerticalDivider(),
                IconButton(
                  alignment: Alignment.centerLeft,
                  color: Colors.blue,
                  tooltip: 'Add',
                  icon: Icon(Icons.add_outlined),
                  onPressed: (){}
                ),
              ]
            ),
          ],
        ),
      )
    );
    
  }
}