import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser; 
import 'package:http/http.dart' as http;

class InfoBoard extends StatefulWidget {
  const InfoBoard({Key? key}): super(key:key);
  @override
  _InfoBoard createState() => _InfoBoard();
}

class _InfoBoard extends State<InfoBoard> {
  String title1 = '';
  String title2 = '';
  String title3 = '';

  Future<List<String>> scrapeText() async {
    // Gets response from webpage
    final response = await http.Client().get(Uri.parse('https://news.whitworth.edu/'));

    // If status code from response is 200, then it has successfully connected to the webpage
    if (response.statusCode == 200) {
      var document = parser.parse(response.body); // Retrieves HTML document

      // Try statement that scrapes information from each post
      try {
        var responseTitle1 = document
          .getElementsByClassName('blog-posts hfeed')[0]
          .children[1]
          .text
          .trim();

        var responseTitle2 = document
          .getElementsByClassName('blog-posts hfeed')[0]
          .children[2]
          .text
          .trim();

        var responseTitle3 = document
          .getElementsByClassName('blog-posts hfeed')[0]
          .children[3]
          .text
          .trim();

        // Remove unwanted text from the titles
        responseTitle1 = _cleanText(responseTitle1);
        responseTitle2 = _cleanText(responseTitle2);
        responseTitle3 = _cleanText(responseTitle3);

        // Returns all of the information scraped
        return [
          responseTitle1,
          responseTitle2,
          responseTitle3
        ];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }

String _cleanText(String text) {
    // Remove multiple unwanted parts
    final unwantedTexts = [
      'Email ThisBlogThis!Share to TwitterShare to FacebookShare to Pinterest',
      'Read more »',
    ];
    
    for (var unwantedText in unwantedTexts) {
      text = text.replaceAll(unwantedText, '');
    }
    
    return text.trim(); // Trim the final cleaned text
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Information Board')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title1.isNotEmpty) ...[
              _buildInfoCard(title1),
              const SizedBox(height: 8),
            ],
            if (title2.isNotEmpty) ...[
              _buildInfoCard(title2),
              const SizedBox(height: 8),
            ],
            if (title3.isNotEmpty) ...[
              _buildInfoCard(title3),
              const SizedBox(height: 8),
            ],
            if (title1.isEmpty && title2.isEmpty && title3.isEmpty)
              const Text('No information available.'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // During button press, it runs the webscraper in the background
                  final response = await scrapeText();

                  // Sets the information
                  setState(() {
                    title1 = response[0];
                    title2 = response[1];
                    title3 = response[2];
                  });
                },
                child: const Text('Refresh Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// // widget to be called that displays events and info
// class InfoBoard extends StatelessWidget {
//   const InfoBoard({Key? key}): super(key:key); // super delegation taken from https://pub.dev/packages/user_profile_avatar/example

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AppBar(
//           title: const Text('Information Board'),
//         ),
//         //everything from here could be grabbed from pirate port announcements page(but that would require login(https://stackoverflow.com/questions/19662085/read-data-content-from-an-url-in-a-main-with-dart) maybe we could get it from email?(but again that requires login, so for now its hard-coded))
//         //these styles are being applied to all info in the ListView widgets, therefore should be a part of their own styles file
//         Expanded(
//           child: ListView(
//             children: const[
//               Card(
//                 color: Color.fromARGB(255, 198, 198, 198),
//                 child: ListTile(
//                 leading: CircleAvatar(child: Text('16'), backgroundColor: Color.fromRGBO(0, 124, 138, 1), foregroundColor: Color.fromRGBO(127, 212, 201, 1)),
//                 title: Text('Learn how to partner for Justice!'),
//                 subtitle: Text('Date: April 16, 2024 at 6:30pm\nLocation: Weyerhauser Hall, 107\n\nThis honors capstone project will feature a diverse panel of Community Organizers,tackling the questions surrounding how we co-create justice in our communities. They will be sharing about their life experiences, their approach to community, organizing, and how students can be involved right here in Spokane. The panel discussion will be followed by a Q&A and a group dialogue on how we as members of the Whitworth community show up for justice.'),
//                 titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 18),
//                 subtitleTextStyle: TextStyle(color: Colors.black),
//                 ),
//               ),

//               Card(
//                 color: Color.fromARGB(255, 198, 198, 198),
//                 child: ListTile(
//                 leading: (CircleAvatar(child: Text('17'), backgroundColor: Color.fromRGBO(0, 124, 138, 1), foregroundColor: Color.fromRGBO(127, 212, 201, 1))),
//                 title: Text('Housing Lottery Q&A Info Table'),
//                 subtitle: Text('Date: April 16 & 17, 2024 from noon-1:00pm\nLocation: Hixon Union Building\n\nCome and get housing lottery info and ask your questions at the Housing Lottery Q&A info table. We\'re here to help!\nFor all things related to the Housing Lottery, visit www.whitworth.edu/housinglottery'),
//                 titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 18),
//                 subtitleTextStyle: TextStyle(color: Colors.black),
//                 ),
//               ),

//               Card(
//                 color: Color.fromARGB(255, 198, 198, 198),
//                 child: ListTile(
//                 leading: (CircleAvatar(child: Text('20'), backgroundColor: Color.fromRGBO(0, 124, 138, 1), foregroundColor: Color.fromRGBO(127, 212, 201, 1))),
//                 title: Text('SIRC 2024: Spokane Intercollegiate Research Conference'),
//                 subtitle: Text('Date: April 20, 2024 from 8:30-3:30pm\nLocation: Starting in Robinson Science Center, 1st floor\n\nWhitworth University hosts SIRC, 2024. SIRC provides an opportunity for undergraduate students across the region from multiple disciplines to present their faculty-led research projects in a competitive, rigorous, and inquiry based format to help develop scholarly community. Poster and oral presentations.'),
//                 titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 18),
//                 subtitleTextStyle: TextStyle(color: Colors.black),
//                 ),
//               ),

//               Card(
//                 color: Color.fromARGB(255, 198, 198, 198),
//                 child: ListTile(
//                 leading: (CircleAvatar(child: Text('20'), backgroundColor: Color.fromRGBO(0, 124, 138, 1), foregroundColor: Color.fromRGBO(127, 212, 201, 1))),
//                 title: Text('Residence Hall Tours & Bopell Open House'),
//                 subtitle: Text('Date: April 20, 2024 from 8:00-10:00\nLocation: Residence halls\n\nEnjoy self guided tours of all the residence, halls, as well as fun, games, and prizes! You\'ll get to see various buildings layouts, the inside of a couple rooms in each hall, and get a feel for the general vibe of the buildings. This is a great tour for folks who aren\'t familiar with Whitworth residence Halls. Bonus: you\'ll get a chance to win some fun prizes by playing Res Hall bingo!'),
//                 titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 18),
//                 subtitleTextStyle: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
