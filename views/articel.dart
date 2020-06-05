import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:newsapi/Data/Entertainment.dart';
import 'package:newsapi/Data/Health.dart';
import 'package:newsapi/Data/business.dart';
import 'package:newsapi/Data/sport.dart';

import 'package:newsapi/views/menu.dart';



Future <Map> getUri()async{
String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=f694c583306e4342a1a2ca6891b2cd8e";
http.Response response = await  http.get(url);
print(response.body);
return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       actions: <Widget>[
         PopupMenuButton(
           icon: Icon(Icons.menu,color: Colors.blue,),
           onSelected: choicesAction,
           itemBuilder: (BuildContext context){
             return Category.chocies.map((String chocies) {
             return PopupMenuItem<String>(
               value: chocies,
               child: Text(chocies),
             );
             }).toList();
           })
       ],
       title: Center(
         child: Text("NEWS",style: TextStyle(
           color: Colors.blueAccent,
        
         ),),
       ),
       backgroundColor: Colors.white,
     ),
     body: 
           Container(
             child:FutureBuilder(
               future: getUri(),
               builder: (BuildContext context,AsyncSnapshot snapshot){
               if (snapshot.hasData){
                 Map data= snapshot.data;
                 return ListView.builder(
                   itemCount: 20,
                   itemBuilder: (BuildContext context,int index){
                   return  Container(
                      
                     child:Column(children: <Widget>[
                       Image.network(data['articles'][index]['urlToImage'].toString()),
                       Text(data['articles'][index]['title'].toString(),style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),),
                       Text(data['articles'][index]['description'].toString(),style: TextStyle(
                         fontSize: 17,
                         
                       ),),
                       
                     ],)
                   );

                   });
               }
               else{
                 return Center(child: CircularProgressIndicator());
               }
               },
             ) ,
           )
         
       
     
    );
    
  }
  void choicesAction(String  chocies){
    if (chocies == Category.Health){
        
          
            Navigator.push(context, MaterialPageRoute(builder: (context){
             return Api();
            }));
        
        
    }
      if (chocies == Category.Entertanment){
        
          
            Navigator.push(context, MaterialPageRoute(builder: (context){
             return Entertenment();
            }));
        
    }
     if (chocies == Category.Sport){
        
          
            Navigator.push(context, MaterialPageRoute(builder: (context){
             return Sport();
            }));
        
        
    }
    if (chocies == Category.Bussnices){
        
          
            Navigator.push(context, MaterialPageRoute(builder: (context){
             return Buss();
            }));
        
        
    }
  }

}