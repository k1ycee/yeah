import 'package:flutter/material.dart';
import 'new.dart';

void main() => runApp(MaterialApp(
  home: Anim() ,
  debugShowCheckedModeBanner: false,
));


class Anim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
     body: Center(
       child: RaisedButton(
         child: Text('Magic'),
         onPressed: (){
           Navigator.of(context).push(hmm());
         },
       ),
     ),
    );
  }
}

Route hmm(){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child){
      var begin = Offset(0.0,1.0);
      var end = Offset.zero;
      var curve = Curves.fastOutSlowIn;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    }
  );
}