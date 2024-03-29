import 'package:e_horizon/Chat.dart';
import 'package:e_horizon/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'signin.dart';
import 'start.dart';
import 'SignUp.dart';
import 'Home.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MainPage(),
      routes: {
        Userr.routename : (context)=>const Userr(),
      },
    );
  }
}
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        else if(snapshot.hasError)
          {
            return Center(child: Text("Something went wrong"),);
          }
        else if(snapshot.hasData)
          {
            return Home();
          }
        else
          {
            return Start();
          }
      },
  ),
  );

}