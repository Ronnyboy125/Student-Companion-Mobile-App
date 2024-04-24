// /////////////////////////////////////////////////////////////////
// File Comment
//
// Purpose: file containing widgets and setup for integration with pirate port info
// *NOTE: THIS FILE CONTAINS THE WORK WE DID TO EXPERIMENT WITH PIRATE PORT INTEGRATION.
//        READING FROM THE WEBSITE WAS NOT TOO DIFFICULT, BUT WE DO NOT KNOW HOW TO APPROACH
//        GETTING DATA FROM PIRATE PORT DUE TO NEEDING TO LOG IN. THIS MOST LIKELY NEEDS 
//        MAJOR HELP FROM PETE AND/OR IT*
// Sources contained in main.dart
//
// /////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart' hide Element; // general helpful material components for flutter, element is hidden to defer to dom
import 'package:http/http.dart' as http; //https://docs.flutter.dev/cookbook/networking/fetch-data

// below two copied from ic03_C
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';

//https://docs.flutter.dev/cookbook/networking/send-data
import 'dart:convert';

main() async {
  // using ic03 for help (pt C)

  // parses info from a url, waits for that response
  http.Response response = await http.get(Uri.parse("https://news.whitworth.edu/"));
  Document document = parser.parse(response.body);

  // copied from ic3_c
  // Use the document object to access each element of the webpage
  document.getElementsByTagName('a').forEach((Element element) async{
        
        // var url2 = Uri.parse(element.attributes['href']!);
        // response2 = await http.get(url2);

        // // Parse the HTML into a document object
        // Document document2 = parser.parse(response2.body);
        // document2.getElementsByTagName('a').forEach((Element element2){
        //   print(element2);
        // });
        
        
      print(element.text); });


}

// above is able to get html, but cant get into pirateport b/c username

class inttesting extends StatelessWidget{
  const inttesting({Key? key});

  

  @override
  Widget build(BuildContext context){
    // scaffolds main profile page
    return Scaffold(
      appBar: AppBar(
        
      ), 
    );
  }

}