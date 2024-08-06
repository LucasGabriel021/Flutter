import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
                "Aprender Flutter",
                "assets/images/img1.png",
                3),
            Task(
                "Andar de Bike",
                "assets/images/img2.jpeg",
                2),
            Task(
                "Meditar",
                "assets/images/img3.jpeg",
                5),
            Task(
                "Jogar",
                "assets/images/img4.jpg",
                1),
            Task(
                "Ler",
                "assets/images/img5.jpg",
                4),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.remove_red_eye,
          color: Colors.white,
        ),
      ),
    );
  }
}
