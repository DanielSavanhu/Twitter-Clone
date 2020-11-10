import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterclone/Settings.dart';
import 'package:twitterclone/Account.dart';
import 'package:twitterclone/Very_First.dart';
import 'package:twitterclone/post_tweet.dart';
import 'package:twitterclone/profile.dart';
import 'package:twitterclone/tweet.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool initialise = false;

  

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:    Very_First()  //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List twitterlist = List();
  List<Tweet> tweets = List<Tweet>();
  @override
  void initState() {    
    super.initState();
  }
  GlobalKey <ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerkey,
        drawer: Drawer( 
          child:Column(
            children:[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    FlatButton(
                      onPressed: (){},
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child:FlatButton(
                              onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Profile())),
                              child: null),
                            backgroundImage: AssetImage('images/profpic.jpg'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text('William'),
                              Icon(Icons.keyboard_arrow_down_outlined, color:Colors.blue),
                            ]
                          ),   
                          Text('@William', textScaleFactor: .75),
                        ],
                      ),
                    ),                                  
                      
                    Row(
                      children: [
                        FlatButton(
                          child:Text('31 Following',textAlign: TextAlign.start,                    
                          textScaleFactor: .75),    
                          onPressed: (){},
                        ),
                        FlatButton(
                          child:Text('27 Followers',textAlign: TextAlign.start,                    
                          textScaleFactor: .75),    
                          onPressed: (){},
                        )                      
                        
                      ],
                    ),

                  ]
                ),
              ),
              ListTile(
                onTap:()=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>Account())),
                leading:Icon(Icons.account_circle_outlined),
                title: Text('Profile'),
              ),
              ListTile(
                leading:Icon(Icons.account_circle_outlined),
                title: Text('Lists'),
              ),
              ListTile(
                leading:Icon(Icons.account_circle_outlined),
                title: Text('Topics'),
              ),
              ListTile(
                leading:Icon(Icons.account_circle_outlined),
                title: Text('Bookmarks'),
              ),
              ListTile(
                leading:Icon(Icons.account_circle_outlined),
                title: Text('Moments'),
              ),
              Divider(),
              ListTile(
                leading:Icon(Icons.account_circle_outlined),
                title: Text('Twitter Ads'),
              ),
              Divider(),
              ListTile(
                //onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Settin())),
                leading:Icon(Icons.account_circle_outlined),
                title: Text('Settings and Privacy'),
              ),
              ListTile(
                leading:Icon(Icons.account_circle_outlined),
                title: Text('Help Centre'),
              ),
              Expanded(
                child: Divider(color: Colors.white),
              ),
              Divider(),
              ListTile(
                leading:Icon(Icons.lightbulb_outlined,color:Colors.blue),
                trailing: Icon(Icons.qr_code_outlined,color:Colors.blue),
              ),
            ]
          )
        ),
        body: Center(
          child: Column(
            
            children: <Widget>[
              Container(              
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height*.1,
                child:Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VerticalDivider(color: Colors.white,),
                    CircleAvatar(
                      child: FlatButton(
                        onPressed: ()=> _drawerkey.currentState.openDrawer(),
                        child: null),
                      backgroundImage: AssetImage('images/profpic.jpg'),
                    ),                  
                    
                    Expanded(
                      child:IconButton(
                        color: Colors.blue,
                        tooltip: 'Switch timeline',
                        icon: Icon(FontAwesomeIcons.twitter), 
                        onPressed: (){}
                      ),
                    ),
                    
                    IconButton(
                      color: Colors.blue,
                      tooltip: 'Switch timeline',
                      icon: Icon(Icons.star_border_outlined), 
                      onPressed: (){}
                    ),

                  ],
                ),
                                              
              ),
                    
              Container(
                height: MediaQuery.of(context).size.height*.05,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,                               
                  children: [
                    Text('Home'),
                    Text('Cars'),
                    Text('Sport'),
                    Text('Usa'),
                  ],
                ),
              ),
              Divider(),
              
              Expanded(
                child:StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('Tweet').snapshots(),
                  builder:(_, snap){
                    switch(snap.connectionState){
                      case ConnectionState.none:return Center(child:SelectableText('Error'));                      
                      default:
                        if(!snap.hasData){
                          return Center(child:SelectableText('Error: Check your Internet Connection'));
                        }if(snap.hasError){
                          return Center(child:SelectableText('Error: Check your Internet Connection'));
                        }
                        tweets = List<Tweet>();
                    snap.data.docs.forEach((element){
                      print(element.get('alias'));
                      tweets.add(Tweet(
                        time: element.get('time'), 
                        likes: element.get('likes'),  
                        comments:element.get('comments'),
                        retweets:element.get('retweets'),
                        alias: element.get('alias'),
                        person: element.get('person'),
                        assetName: element.get('link'),
                        tweet: element.get('tweet'),
                      ));

                    });
                    
                    return ListView.separated(
                      itemBuilder: (_,index){                        
                        return  tweets[index];
                      }, 
                      separatorBuilder: (_,index)=> Divider(),
                      itemCount: tweets.length
                    );
                  }
                  }                  
                )
                
              ),

                                      
              
            ],
          ),
        ),
        persistentFooterButtons: [        
          Container(
            width: MediaQuery.of(context).size.width*.2,
            child:IconButton(
              color: Colors.blue,
              tooltip: 'Home',
              icon: Icon(FontAwesomeIcons.home), 
              onPressed: (){}
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*.2,
            child:IconButton(
              color: Colors.grey,
              tooltip: 'Search',
              icon: Icon(Icons.search_outlined), 
              onPressed: (){}
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*.2,
            child:IconButton(
              color: Colors.grey,
              tooltip: 'Notiifications',
              icon: Icon(FontAwesomeIcons.bell), 
              onPressed: (){}
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*.25,
            child:IconButton(
              color: Colors.grey,
              tooltip: 'DM',
              icon: Icon(Icons.message_outlined), 
              onPressed: (){}
            ),
          )
        ],
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Post_Tweet()));
          },
          
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      )
    );
  }
}
