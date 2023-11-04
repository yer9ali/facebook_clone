import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook Mockup',
      theme: ThemeData(
        primaryColor: Colors.blue[800],
      ),
      home: FacebookMockup(),
    );
  }
}

class FacebookMockup extends StatefulWidget {
  @override
  _FacebookMockupState createState() => _FacebookMockupState();
}

class _FacebookMockupState extends State<FacebookMockup> {
  late ScrollController _scrollController;
  bool _showBottomNavBar = true;
  double _lastScrollPosition = 0.0;

  final List<String> storyImages = [
    'https://via.placeholder.com/100?text=Story3',
    'https://poehali.kz/upload/iblock/5a3/5a36269f97135af9ae9ec9f13273dae9.jpg',
    'https://poehali.kz/upload/iblock/00d/00d383130864bb070bb4763e3fa0ca53.jpg',
    'https://kazkurort.kz/upload/regiony/kazahstan/katon-karagaj/katon-karagaj-cvety.jpg',
    'https://24.kz/media/k2/items/cache/e50b0c0b4834710cddb306bdcf69f566_XL.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels > _lastScrollPosition &&
            _showBottomNavBar) {
          // Scroll down
          setState(() {
            _showBottomNavBar = false;
          });
        } else if (_scrollController.position.pixels < _lastScrollPosition &&
            !_showBottomNavBar) {
          // Scroll up
          setState(() {
            _showBottomNavBar = true;
          });
        }
        _lastScrollPosition = _scrollController.position.pixels;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: -1.2,
          ),
        ),
        actions: const [
          Icon(Icons.search, size: 28),
          SizedBox(width: 20),
          Icon(Icons.messenger_outline, size: 28),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'What\'s on your mind?',
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                )
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.video_call, color: Colors.red[800]),
                  label: Text('Live'),
                  style: TextButton.styleFrom(primary: Colors.black),
                ),
                VerticalDivider(),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.photo, color: Colors.green[800]),
                  label: Text('Photo'),
                  style: TextButton.styleFrom(primary: Colors.black),
                ),
                VerticalDivider(),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.video_call, color: Colors.purple[900]),
                  label: Text('Room'),
                  style: TextButton.styleFrom(primary: Colors.black),
                ),
              ],
            ),
          ),

          Divider(thickness: 8),

          // Stories
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: storyImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(storyImages[index]),
                          ),
                          if (index == 0) ...[
                            CircleAvatar(
                              radius: 66,
                              backgroundColor: Colors.white,
                            ),
                            CircleAvatar(
                              radius: 65,
                              backgroundColor: Colors.grey[300],
                            ),
                            Icon(Icons.add, color: Colors.blue, size: 30)
                          ]
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(index == 0 ? 'Your Story' : 'Story ${index + 1}'),
                    ],
                  ),
                );
              },
            ),
          ),



          // Sample Posts
          for (var i = 0; i < 5; i++)
            Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage("https://thumbs.dreamstime.com/b/молодой-человек-как-лесничий-думая-лесник-думающий-о-проблемах-в-лесу-161148036.jpg"),
                  ),
                  title: Text('Maqsat'),
                  subtitle: Row(
                    children: [
                      Text('5 hrs • '),
                      Icon(Icons.public, size: 12, color: Colors.grey[700]),
                    ],
                  ),
                  trailing: Icon(Icons.more_horiz),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                      'This is a sample post content for demonstration purposes.'),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  child: Image.network('https://thumbs.dreamstime.com/b/в-лесу-устойчивом-облесении-forester-молодой-рейнджер-во-время-лесных-178228328.jpg',
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 10),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.thumb_up, color: Colors.blue),
                        SizedBox(width: 4),
                        Text('Like'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.comment, color: Colors.grey[700]),
                        SizedBox(width: 4),
                        Text('Comment'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.share, color: Colors.grey[700]),
                        SizedBox(width: 4),
                        Text('Share'),
                      ],
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
        ],
      ),
      bottomNavigationBar: _showBottomNavBar
          ? BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: 'Groups',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Menu',
                ),
                // ... other items
              ],
            )
          : null,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
