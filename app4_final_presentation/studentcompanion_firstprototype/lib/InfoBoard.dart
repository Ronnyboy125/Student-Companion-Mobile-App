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
    final response = await http.Client().get(Uri.parse('https://news.whitworth.edu/'));

    if (response.statusCode == 200) {
      var document = parser.parse(response.body); 
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

        responseTitle1 = _cleanText(responseTitle1); //removing the unwanted text
        responseTitle2 = _cleanText(responseTitle2);
        responseTitle3 = _cleanText(responseTitle3);
        return [ //returning the clean text without the specific deleted texts
          responseTitle1,
          responseTitle2,
          responseTitle3
        ];
      } catch (e) { //error statement in case of an error
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }

String _cleanText(String text) {
    final unwantedTexts = [ //removing unwanted lines from the scrap
      'Email ThisBlogThis!Share to TwitterShare to FacebookShare to Pinterest',
      'Read more »',
    ];
    
    for (var unwantedText in unwantedTexts) {
      text = text.replaceAll(unwantedText, ''); //changing it to space
    }
    
    return text.trim(); // return the trimed text
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
              _buildInfoCard(title1),//returning the text in boxes
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
                  final response = await scrapeText();
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
