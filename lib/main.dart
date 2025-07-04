import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';


void main() {
  runApp( 
    DevicePreview(
      enabled: true, // Set to false to disable
      builder: (context) => const MyApp(), // Your app
    ),
  );
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       
      locale: DevicePreview.locale(context), // Use the locale from DevicePreview 
      title: 'Flutter Demo',
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool showEmail = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void showAccount() {
    setState(() {
      showEmail = !showEmail;
    });
  }




  @override
  Widget build(BuildContext context) {
 

    return SafeArea(
      
      child: DefaultTabController(
        
        length: 3,
        child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          
          title: Text("Flutter App"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },
          ),
      
          actions: <Widget>[
              IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Handle settings button press
              },
            ),
      
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Handle settings button press
              },
            ),
      
          ],
      
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/appbar.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
              Tab(icon: Icon(Icons.info), text: 'Info'),
            ],
          ),
          elevation: 22.0, // Set elevation for the AppBar
          //backgroundColor: Colors.deepPurple, // Set background color for the AppBar
          
        ),

        body: TabBarView(
          children: [
            // Home Tab Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('You have pushed the button this many times:'),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),



            // Settings Tab Content
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile( 
                      leading: Icon(Icons.person),
                      title:  Text('Account'),
                      tileColor: const Color.fromARGB(255, 235, 137, 137),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onTap: (){
                        showAccount();

                      },
                    ),

                    if (showEmail)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 10),
                          Text("📧 priyanjithranathunga@gmail.com"),
                          Text("📧 sample123@gmail.com"),
                      ],  
                    ),
                    
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notification'),
                      onTap: () {
                        // Handle notification tap
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.palette),
                      title: Text('Appearance'),
                      onTap: () {
                        // Handle appearance tap
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.security),
                      title: Text('Privacy & Security'),
                      onTap: () {
                        // Handle privacy & security tap
                      },
                    ),  

                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text('Help and Support'),
                      onTap: () {
                        // Handle help and support tap
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About'),
                      onTap: () {
                        // Handle about tap
                      },
                    ),

                  ],
                ),
            ),
             


            // Info Tab Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info, size: 100, color: Colors.blue),
                  Text('Info Page', style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
