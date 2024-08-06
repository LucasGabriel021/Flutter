import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(alignment: Alignment.center, children: [
                Container(width: 100, height: 100, color: Colors.yellow),
                Container(width: 50, height: 50, color: Colors.blue)
              ]),
              Stack(alignment: Alignment.center, children: [
                Container(
                    width: 100, height: 100, color: Colors.deepOrangeAccent),
                Container(width: 50, height: 50, color: Colors.green)
              ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(width: 50, height: 50, color: Colors.pinkAccent),
                    Container(width: 50, height: 50, color: Colors.brown),
                    Container(width: 50, height: 50, color: Colors.redAccent)
                  ]),
              Container(
                  color: Colors.amber,
                  height: 30,
                  width: 300,
                  child: Text('Teste',
                      style: TextStyle(color: Colors.black, fontSize: 28),
                      textAlign: TextAlign.center)),
              ElevatedButton(
                  onPressed: () {
                    print("Botão clicado!");
                  },
                  child: Text("Clique aqui"))
            ]));
  }
}
