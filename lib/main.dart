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
      //debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context), // Use the locale from DevicePreview 
      //debugShowCheckedModeBanner: false,
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

  void _incrementCounter() {
    setState(() {
      _counter++;
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings, size: 100, color: Colors.grey),
                  Text('Settings Page', style: Theme.of(context).textTheme.headlineMedium),
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
