import 'package:firebase2/pharmacy/pharmacy.dart';
import 'package:flutter/material.dart';

class Dashboard2 extends StatelessWidget {
  const Dashboard2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> devices = [
      {'name': 'Living room', 'image': 'https://simpleicon.com/wp-content/uploads/multy-user.png'},
      {'name': 'Desk lamp', 'image': 'https://thumbs.dreamstime.com/b/pink-reading-lamp-icon-330151834.jpg'},
      {'name': 'Garage door', 'image': 'https://media.istockphoto.com/id/1322848395/vector/garage-icon-glyph-garage-icon-for-website-design-and-mobile-app-development-print-garage.jpg?s=612x612&w=0&k=20&c=0RI8c-zGSEQ7BYTc4HblbbcoVhdgFHrxdtQv3sEhTvI='},
      {'name': 'Kids room', 'image': 'https://static.vecteezy.com/system/resources/thumbnails/000/101/989/small_2x/free-kids-room-vector-icons-18.jpg'},
      {'name': 'DHT 12', 'image': 'https://simpleicon.com/wp-content/uploads/multy-user.png'},
      {'name': 'Backyard lights', 'image': 'https://simpleicon.com/wp-content/uploads/multy-user.png'},
      {'name': 'Mother room', 'image': 'https://simpleicon.com/wp-content/uploads/multy-user.png'},
      {
        'name': 'Pharma',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQLPHelmaulHqfeQuGbpwYWoUbcYKWQqRBqQ&s',
        'route': const PharmaMateApp()
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              'https://icons.veryicon.com/png/o/internet--web/prejudice/user-128.png',
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PharmaMateApp()));
              },
              child: Text(
                'iSHOP',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            )

          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          iconSize: 32,
          color: Colors.blue,
          onPressed: () {
            // Add navigation back logic here
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.key),
            iconSize: 32,
            color: Colors.blue,
            onPressed: () {
              // Handle support icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 32,
            color: Colors.blue,
            onPressed: () {
              // Handle menu icon press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to PharmaMateApp when 'Pharma' is tapped
                if (devices[index]['name'] == 'Pharma') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => devices[index]['route'],
                    ),
                  );
                }
              },
              child: DeviceTile(
                deviceName: devices[index]['name'],
                image: devices[index]['image'],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs7FMSRYAcn5-h4yIsxfncUXMq5Jct9xjnUw&s',
              height: 24,
              width: 24,
            ),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              'https://cdn-icons-png.flaticon.com/512/95/95148.png',
              height: 24,
              width: 24,
            ),
            label: 'Automation',
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhxOCMMODh9L9iJ2NfEORL0bR5lEuxCjujlQ&s',
              height: 24,
              width: 24,
            ),
            label: 'Notifications',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation
        },
      ),
    );
  }
}

class DeviceTile extends StatelessWidget {
  final String deviceName;
  final String? image;

  const DeviceTile({super.key, required this.deviceName, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image != null
              ? Image.network(
            image!,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          )
              : const SizedBox.shrink(),
          const SizedBox(height: 10),
          Text(
            deviceName,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
