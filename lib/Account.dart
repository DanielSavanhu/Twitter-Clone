import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Account extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Material(
        child: Container(
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_outlined,
                  color: Colors.blue,),
                  onPressed: ()=>Navigator.of(context).pop(),
                ),
                title: Text('Account'),
                subtitle:Text('@dannysavannhu'),
              ),
              Container(
                height: 45,
                alignment:Alignment.centerLeft,
                color: Colors.lightBlue,
                width: MediaQuery.of(context).size.width,
                child:ListTile(              
                  title:Text('Login and security',style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor:1),
                ),
              ),
              
              ListTile(              
                title: Text('Username'),
                subtitle:Text('@dannysavannhu'),
              ),
              
              ListTile(              
                title: Text('Phone'),
                subtitle:Text('+263 787 554 589'),
              ),

              ListTile(              
                title: Text('Email Address'),
                subtitle:Text('dannysavanhu@gmail.com'),
              ),

              ListTile(title:Text('Password'),),
              Divider(),
              ListTile(title:Text('Security'),),                  
              
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                color: Colors.lightBlue,
                child: ListTile(
                  title:Text('Data and permissions',style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Divider(color:Colors.white),
              ListTile(              
                title: Text('Country'),
                subtitle:Text('Zim'),
              ),              
              Row(
                children:[            
                  Text('  Select the country in which you live in.', textScaleFactor:.6),                  
                  FlatButton(
                    textColor:Colors.blue,
                    child:Text('Learn more'),
                    onPressed:(){}
                  ),
                ]
              ),
              Divider(),
              ListTile(              
                title:Text('Your Twitter data'),),
              Divider(),
              ListTile(              
                title:Text('Apps and sessions'),),
              Divider(thickness:20,color:Colors.grey),
              ListTile(              
                title:Text('Deactivate your account'),),
              Divider(thickness:20,color:Colors.grey),
              ListTile(              
                title:Text('Log out',style:TextStyle(color:Colors.red)),
              ),

            ],
          ),
        )
      )
    );    
  }
}