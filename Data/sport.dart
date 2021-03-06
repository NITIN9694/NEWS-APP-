import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

Future <Map> getsport ()async{
String url = "http://newsapi.org/v2/top-headlines?country=in&category=sport&apiKey=5bbdcdbc1f614c4e9651df00dd38ee47";
http.Response response = await http.get(url);
print(response.body);
return json.decode(response.body);

}

class Sport extends StatefulWidget {
  @override
  _SportState createState() => _SportState();
}

class _SportState extends State<Sport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:FutureBuilder(
          future: getsport(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.hasData){

              Map data = snapshot.data;
             return ListView.builder(
               
               physics: ClampingScrollPhysics(),
               itemCount:21, 
               itemBuilder:
                (BuildContext context,int index,
               ){
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
          })
      ),
    );
  }
}