import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';




class Create_Account extends StatelessWidget{
  String date = '';
  TextEditingController name=TextEditingController(), 
  address=TextEditingController(), dob=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    dob=TextEditingController(text: date);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            	ListTile(
		         	title:Icon(FontAwesomeIcons.twitter, color: Colors.blue,),
		         	leading: IconButton(
                onPressed: ()=>Navigator.of(context).pop(),
                icon:Icon(Icons.arrow_back_outlined, color: Colors.blue,),),
		        ),
		        Expanded(
		        	child:Column(
			            crossAxisAlignment: CrossAxisAlignment.center,
			            mainAxisAlignment: MainAxisAlignment.spaceBetween,
			            children: [
			            	ListTile(
					         	title:Text("Create your account",textScaleFactor:1.5,style:TextStyle(fontWeight:FontWeight.bold),),
					        ),

					        Column(
					            crossAxisAlignment: CrossAxisAlignment.center,
					            mainAxisAlignment: MainAxisAlignment.spaceBetween,
					            children: [
					            	Container(
					            		height:50,
					            		width:MediaQuery.of(context).size.width*.8,
					            		child: TextField(
					            			controller:name,
					            			maxLength:50,
					            			decoration:InputDecoration(
					            				hintText:'Name',
					            			),
					            		)
					            	),
					            	Container(
					            		height:50,
					            		width:MediaQuery.of(context).size.width*.8,
					            		child: TextField(
					            			controller:address,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.phone,
					            			decoration:InputDecoration(
					            				hintText:'Phone number or email address',
					            			),
					            		)
					            	),
					            	Container(
					            		height:50,
					            		width:MediaQuery.of(context).size.width*.8,
					            		child: TextField(
					            			controller:dob,                            
					            			decoration:InputDecoration(
					            				hintText:'Date of Birth',
					            			),
					            			onTap: (){
                              DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1990, 1, 1),
                                onChanged: (date){
                                  this.date = "${date.day.toString()} ${month_converter(date.month)} ${date.year.toString()}";
                                },
                                onConfirm: (date){                                  
                                  this.date = "${date.day.toString()} ${month_converter(date.month)} ${date.year.toString()}";
                                }
                              );
                            },
					            		)
					            	),
					            ]
					        ),	
					        Container(

					        ),

			            ]
			        ),	
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



  String month_converter(int month){
    switch(month){
      case 1: return 'January'; break;
      case 2: return 'February'; break;
      case 3: return 'March'; break;

      case 4: return 'April'; break;
      case 5: return 'May'; break;
      case 6: return 'June'; break;
      
      case 7: return 'July'; break;
      case 8: return 'August'; break;
      case 9: return 'September'; break;

      case 10: return 'October'; break;
      case 11: return 'November'; break;
      case 12: return 'December'; break;
    }
  }


}