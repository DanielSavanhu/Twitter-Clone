import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitterclone/Create_Account.dart';
import 'package:twitterclone/Login.dart';

class Very_First extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Material(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              	IconButton(
		            color: Colors.blue,
		            tooltip: 'Switch timeline',
		            icon: Icon(FontAwesomeIcons.twitter), 
		            onPressed: (){}
		        ),
		        ListTile(
		         	title:Text("See what's happening in the world right now.",textScaleFactor:1.5,style:TextStyle(fontWeight:FontWeight.bold),),
		         	subtitle: Container(
		         		alignment: AlignmentDirectional.center,
                      	width: MediaQuery.of(context).size.width*.6,
                      	height: 50,
                      	decoration: BoxDecoration(
                      		color:Colors.blue,
	                        border:Border.all(),
	                        borderRadius: BorderRadius.circular(16),
	                    ),
	                    child:FlatButton(
	                    	onPressed:(){
	                    		Navigator.of(context).push(MaterialPageRoute(builder:(_)=>Create_Account()));
	                    	}, 		
			         		
			         		child:Text('Create account',textScaleFactor:1.5, style:TextStyle(color:Colors.white)),
			         	)
			        ) 	
		        ),
		        Row(
		        	mainAxisAlignment: MainAxisAlignment.center,
			        children:[
			        	VerticalDivider(color:Colors.white),
			         	Text('Have an account already?'),		         	
			         	FlatButton(			         		
                   onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>Login())),
			         		child:Text('Log in', style:TextStyle(color:Colors.blue))
			         	),
			         	Expanded(
			         		child:VerticalDivider(color:Colors.white),
			         	)
			        ]
		        ),
		        		        
            ],
          ),
        )
      )
    );    
  }
}