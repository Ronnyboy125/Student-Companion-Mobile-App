import 'package:flutter/material.dart';
import 'package:profile_photo/profile_photo.dart'; 

//Widget used to build a info card background for information
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

class ProfileShell extends StatelessWidget{
  ProfileShell({Key? key,});

  String info = ('Pete Tucker\nPTucker@my.whitworth.edu\n509-111-2222\nComputer Science');

  @override
  Widget build(BuildContext context) {
    
    // scaffolds main profile page``
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whitworth University"),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)), 
            ProfilePhoto(
                totalWidth: 300, 
                cornerRadius: 300,
                color: Colors.black,
                image: AssetImage('assets/Pete.jpg'), 
                ),
            const Padding(padding: EdgeInsets.all(10)),
            _buildInfoCard(info),
          ],
        ),
      ),
    );
  }
}
