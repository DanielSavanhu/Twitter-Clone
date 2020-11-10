import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterclone/post_tweet.dart';
import 'package:twitterclone/tweet.dart';

class Profile extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {    
    
    return _Profile();
  }
}

class _Profile extends State<Profile>{
  
  int likes,comments,retweets;
  String assetName,person,tweet,alias,time;
  List<Tweet> tweets = List<Tweet>();
  @override
  void initState() {    
    super.initState();   
    tweets.add(Tweet(
      time: '10m', likes:0, comments:0, retweets:0,
      alias: 'Daniel 3:29',
      person: 'daniel',
      assetName: 'images/feed/g.jpeg',
      tweet: 'No other God can deliver after this sort',
    ));
    tweets.add(Tweet(
      time: '10m', likes:0, comments:0, retweets:0,
      alias: 'Daniel 3:29',
      person: 'daniel',
      assetName: '',
      tweet: 'No other God can deliver after this sort',
    ));
    tweets.add(Tweet(
      time: '10m', likes:0, comments:0, retweets:0,
      alias: 'Daniel 3:29',
      person: 'daniel',
      assetName: 'images/feed/g.jpeg',
      tweet: 'No other God can deliver after this sort',
    ));
    tweets.add(Tweet(
      time: '10m', likes:0, comments:0, retweets:0,
      alias: 'Daniel 3:29',
      person: 'daniel',
      assetName: 'images/feed/g.jpeg',
      tweet: 'No other God can deliver after this sort',
    ));
  }
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(                        
            icon: Icon(Icons.arrow_back_outlined,color:Colors.white,), 
            onPressed:()=> Navigator.of(context).pop(),
          ),          
          title: ListTile(                        
            title:Text('China News Network',
              style: TextStyle(color:Colors.black38),),
            subtitle:Text('185K Tweets',style: TextStyle(color:Colors.black38),),
          ),
          actions: [
            PopupMenuButton(                              
              icon: Icon(Icons.menu_rounded,color:Colors.white),
              itemBuilder: (_){
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: FlatButton(
                      onPressed: null,
                      child:Text('Share'),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      onPressed: null,
                      child:Text('Turn off Retweets'),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      onPressed: null,
                      child:Text('View Topics'),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      onPressed: null,
                      child:Text('Add to List'),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      onPressed: null,
                      child:Text('View Lists'),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      onPressed: null,
                      child:Text("Lists they're on"),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      onPressed: null,
                      child:Text('View moments'),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      onPressed: null,
                      child:Text('Mute'),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      onPressed: null,
                      child:Text('Block'),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(
                      onPressed: null,
                      child:Text('Report'),
                    ),
                  ),
                ];
              }
            )            
            
          ],
          bottom:TabBar(            
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black38,
            tabs: [
              Tab(                
                text: 'Tweets',
              ),
              Tab(
                text: 'Tweets & replies',
              ),
              Tab(
                text: 'Media',
              ),
              Tab(
                text: 'Likes',
              ),
            ],
          ),                                                            
        ),
        body: TabBarView(
          children: [
            ListView(
              children: tweets,
            ),                
            Text('Run'),
            Text('Run'),
            Text('Run'),
          ]
        ),
      )
    );
      
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed:(){
      //     Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Post_Tweet()));
      //   },
        
      //   child: Icon(Icons.add),
      // ), 
    
    // );    
  }
}