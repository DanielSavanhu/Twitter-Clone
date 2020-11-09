import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class View_Tweet extends StatefulWidget{
  final String assetName,person,tweet,alias,time,likes,comments,retweets;
  View_Tweet({this.assetName,this.person,this.tweet,this.alias,this.time,this.comments,this.retweets,this.likes});
  
  @override
  State<StatefulWidget> createState() {    
    
    return _View_Tweet(comments:comments,retweets:retweets,likes:likes,time: time,
      assetName: assetName, person: person, tweet: tweet,alias:alias);
  }
}

class _View_Tweet extends State<View_Tweet>{
  _View_Tweet({this.assetName,this.person,this.tweet,this.alias,this.time,
  this.comments,this.retweets,this.likes});  
  
  String assetName,person,tweet,alias,time,likes,comments,retweets;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(      
      body:Row(
        children:[
          VerticalDivider(color: Colors.white,), 
          
              Expanded(
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[    
                  ListTile(        
                    tileColor: Colors.white,
                    onTap: ()=>Navigator.of(context).pop(),                    
                    title: Text('Tweet', style: TextStyle(color:Colors.black),),                    
                    leading: Icon(Icons.arrow_back_outlined,color:Colors.blue),
                  ),
                  Divider(), 
                  Row(
                    children:[
                      Container(
                        alignment: Alignment.topCenter,              
                        width: MediaQuery.of(context).size.width*.15,
                        child: Icon(Icons.account_circle_outlined),
                      ),
                      Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text('$alias ',textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaleFactor: .75),
                          Text('@$person',textAlign: TextAlign.start,                    
                      textScaleFactor: .75),                                         
                        ]
                      ),
                      
                      Expanded(
                        child:Align(
                          alignment: Alignment.centerRight,
                          child:Icon(Icons.keyboard_arrow_down_outlined, ),  
                        ),
                      ),
                    ]
                  ),                        
                  Divider(color: Colors.white,), 
                  Text('$tweet',textScaleFactor: 1.2,),                
                  Divider(color: Colors.white,),
                  assetName!=''?
                    Container(
                      decoration: BoxDecoration(                      
                        borderRadius: BorderRadius.circular(25),
                        image:DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(assetName)                  
                        )
                      ),
                      height: 200,
                      width: MediaQuery.of(context).size.width*.83,                  
                    )
                    :
                    Container(),
                  Divider(color: Colors.white,),
                  Row(
                    children:[
                      Text('$time . ',textAlign: TextAlign.start,
                      textScaleFactor: .75),
                      Text('08 Nov 20 . ',textAlign: TextAlign.start,
                      textScaleFactor: .75),
                      Text('Twitter for Android',textAlign: TextAlign.start,
                      textScaleFactor: .75,style: TextStyle(color:Colors.blue) ),
                    ]
                  ), 

                  Divider(),
                  Row(
                    children:[
                      Text('$retweets Retweets',textAlign: TextAlign.start,
                      textScaleFactor: .75),
                      VerticalDivider(),
                      Text('$retweets Quote Tweets',textAlign: TextAlign.start,
                      textScaleFactor: .75),
                      VerticalDivider(),
                      Text('$likes Likes',textAlign: TextAlign.start,
                      textScaleFactor: .75 ),
                    ]
                  ),                        
                  
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          IconButton(
                            icon: Icon(Icons.mode_comment_outlined)
                          ),
                          Text(comments),
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          IconButton(
                            icon: Icon(Icons.repeat_outlined),
                          ),
                          Text(retweets),
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          IconButton(
                            icon: Icon(Icons.favorite_outline_outlined),
                          ),
                          Text(likes),
                        ]
                      ),
                      IconButton(
                        icon: Icon(Icons.share_outlined,),
                      ),                                         
                      
                                          
                    ]
                  ),
                  
                  Expanded(
                    child: Divider(color: Colors.white,),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width*.8,
                        child:TextField(
                          decoration: InputDecoration(
                            hintText: 'Tweet your reply'
                          ),
                        )
                      ),
                      IconButton(
                        icon: Icon(Icons.photo_camera_outlined,color: Colors.blue,),
                        onPressed: (){
                          print('lAUNCH Camera');
                        }
                      )
                    ],
                  ),
                                    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        alignment: Alignment.center,
                        color: Colors.blue,
                        tooltip: 'Gallery',
                        icon: Icon(FontAwesomeIcons.image),
                        onPressed: (){}
                      ),                             
                      VerticalDivider(color: Colors.white,),
                      IconButton(              
                        color: Colors.blue,
                        tooltip: 'GIF',
                        icon: Icon(Icons.gif_outlined),
                        onPressed: (){}
                      ),
                      Expanded(
                        child:VerticalDivider(color:Colors.white),
                      ),
                      IconButton( 
                        color: Colors.blue,
                        tooltip: 'Round',
                        icon: Icon(Icons.circle,color: Colors.grey),
                        onPressed: (){}
                      ),
                      VerticalDivider(color: Colors.white,),
                      RaisedButton(                  
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.blue, )
                        ),
                        onPressed: (){},
                        color: Colors.lightBlueAccent,
                        textColor: Colors.white,
                        child: Text('Reply',style: TextStyle(color:Colors.white,),),
                      )

                
                    ],
                  ),
                  
                ]
              ),
              
              ),          
           
        ]
      )                       
    );    
  }
}