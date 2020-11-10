import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_outlined,color: Colors.blue,),
                onPressed: ()=>Navigator.of(context).pop(),
              ),
              title: Text('Settings and privacy')
            ),
            Container(
              height: 45,
              color: Colors.grey,
              width: MediaQuery.of(context).size.width,
              child:Text('@dannysavannhu',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            
            Text('Acccount'),
            Divider(),
            Text('Privacy and safety'),
            Divider(),
            Text('Notifications'),
            Divider(),
            Text('Content Preferences'),
            
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Text('General',style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            
            Text('Display and Sound'),
            Divider(),
            Text('Data Usage'),
            Divider(),
            Text('Accessibility'),
            Divider(),
            Text('Proxy'),
            Divider(),
            Text('About Twitter'),
            Divider(),
            Text('Thesesettings will affect all your twitter accounts on this device.',textScaleFactor: .6,),

          ],
        ),
      )
    );
    
  }
}