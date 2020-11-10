import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'Create_Account.dart';


class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {    
    return login();
  }
}

class login extends State<Login>{
  String date = '';
  bool showPassword = false;
  TextEditingController name=TextEditingController(), 
  password=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
        
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,            
            children: [
            	Container(
                height:50,
                width:MediaQuery.of(context).size.width*.95,
                child:ListTile(
                  trailing:Container(
                    
                    width:MediaQuery.of(context).size.width*.30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          child:Text('Sign up',style:TextStyle(color:Colors.blue),),
                          onPressed:()=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>Create_Account())),
                        ),
                        Icon(Icons.menu, color: Colors.blue,),
                      ],
                    ),
                  ),
                  title:Icon(FontAwesomeIcons.twitter, color: Colors.blue,),
                  leading: IconButton(
                onPressed: ()=>Navigator.of(context).pop(),
                icon:Icon(Icons.arrow_back_outlined, color: Colors.blue,),),
                ),
            ),
		          Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    title:Text("Log in to Twitter",textScaleFactor:1.5,style:TextStyle(fontWeight:FontWeight.bold),),
                  ),
                  
                  
                  ListTile(
                    title:Text("Phone number, email address or username",textScaleFactor:.8,style:TextStyle(color:Colors.grey),),
                    subtitle: Container(
                      height:50,
                      width:MediaQuery.of(context).size.width*.95,
                      child: TextField(
                        controller:name,                                                   
                      )
                    ),
                  ),
                  
                  ListTile(
                    title:Text("Password",textScaleFactor:.8,style:TextStyle(color:Colors.grey),),
                    subtitle: Container(
                      height:50,
                      width:MediaQuery.of(context).size.width*.95,
                      child: TextField(
                        obscureText: showPassword,
                        controller:password,                                                   
                      )
                    ),
                    trailing: IconButton(
                      icon:Icon(Icons.remove_red_eye_outlined,color: Colors.grey,),
                      onPressed: ()=> setState(() =>showPassword = !showPassword,),
                    ),
                  ),
                  
                  FlatButton(
                    child:Text('Forgotten your password?', style:TextStyle(color:Colors.grey)),
                    onPressed: (){
                                              
                    },
                  ),
                ]
              ),				         		        		       
            ],
          ),
        ),
        persistentFooterButtons:[
        	Container(
        		decoration:BoxDecoration(
        			borderRadius:BorderRadius.circular(20),
        			color:Colors.blue,
        		),
        		child:FlatButton(
              child:Text('Next', style:TextStyle(color:Colors.white)),
              onPressed: (){
                
              },
         		),
         	)
        ],
      )
    );    
  }



  


}