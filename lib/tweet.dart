import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterclone/profile.dart';
import 'package:twitterclone/view_tweet.dart';

class Tweet extends StatefulWidget{
  final String assetName,person,tweet,alias,time;
  final int likes,comments,retweets;
  Tweet({this.assetName,this.person,this.tweet,this.alias,this.time,this.comments,this.retweets,this.likes});
  
  @override
  State<StatefulWidget> createState() {    
    
    return _Tweet(comments:comments,retweets:retweets,likes:likes,time: time,
      assetName: assetName, person: person, tweet: tweet,alias:alias);
  }
}
class _Tweet extends State<Tweet>{
  _Tweet({this.assetName,this.person,this.tweet,this.alias,this.time,
  this.comments,this.retweets,this.likes});  
  
  int likes,comments,retweets;
  String assetName,person,tweet,alias,time;
  
  @override
  Widget build(BuildContext context) {
    
    return Material(
      child:FlatButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>View_Tweet(
            alias: alias,time:time, likes:likes, comments:comments, 
            retweets:retweets,person: person,assetName: assetName,
            tweet:tweet,
          )));
        },
        child: Container(
          child:Row(  
            crossAxisAlignment: CrossAxisAlignment.start,            
            children:[
              Container(
                alignment: Alignment.topCenter,              
                width: MediaQuery.of(context).size.width*.15,
                child: IconButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Profile()));
                  },
                  icon:Icon(Icons.account_circle_outlined),
                )
              ),
              Expanded(
                child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[    
                  Row(
                    children:[
                      Text('$alias ',textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textScaleFactor: .75),
                      Text('@$person',textAlign: TextAlign.start,                    
                      textScaleFactor: .75),                   
                      Text(' . $time',textAlign: TextAlign.start,
                      textScaleFactor: .75),
                      Expanded(
                        child:Align(
                          alignment: Alignment.centerRight,
                          child:Icon(Icons.keyboard_arrow_down_outlined, ),  
                        ),
                      ),
                    ]
                  ),                        
                  Text('$tweet',textScaleFactor: .8,),                
                  Divider(color: Colors.white),
                  assetName!=null?
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          IconButton(
                            icon: Icon(Icons.mode_comment_outlined)
                          ),
                          Text(comments.toString()),
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          IconButton(
                            icon: Icon(Icons.repeat_outlined),
                          ),
                          Text(retweets.toString()),
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          IconButton(
                            icon: Icon(Icons.favorite_outline_outlined),
                          ),
                          Text(likes.toString()),
                        ]
                      ),
                      IconButton(
                        icon: Icon(Icons.share_outlined,),
                      ),                                         
                      
                                          
                    ]
                  ),
                ]
              ),
              
              ),
              
            ]
          ),                              
        )
      )
    );
    
  }
}