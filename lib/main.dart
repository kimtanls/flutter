import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        DetailScreen.nameRoute: (context) => const DetailScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: LogInUI(),
    );
  }
}

class LogInUI extends StatelessWidget {
  const LogInUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: FlutterLogo(),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Hello \nWelcom Back\ntan dep trai',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'USER NAME',
                      labelStyle: TextStyle(
                        fontSize: 13,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 30),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                            fontSize: 13,
                          )),
                    ),
                    Text(
                      'SHOW',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondPage()));
                        },
                        child: Text('LOGIN'))),
              ),
              Container(
                height: 130,
                width: double.infinity,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'NEW USER? SIGN UP',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      'FORGOT PASSWORD?',
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Man hinh 2'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DetailScreen.nameRoute,
                        arguments: AgumentScreen('title1 ', 'content1'));
                  },
                  child: Text('dong 1')),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, DetailScreen.nameRoute,
                    arguments: AgumentScreen('title2 ', 'content2'));
              },
              child: Text('dong 2'),
            )
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  static const nameRoute = '/Detail';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AgumentScreen;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.content),
      ),
    );
  }
}

class AgumentScreen {
  String title;
  String content;
  AgumentScreen(this.title, this.content);
}
