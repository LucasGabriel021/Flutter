import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: Text(
          "Nova Tarefa",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 650,
            width: 375,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if(value != null && value.isEmpty) {
                          return "Insira um nome.";
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nome",
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if(value!.isEmpty || int.parse(value) < 1 || int.parse(value) > 5) {
                          return "Insira a dificuldade entre 1 e 5.";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Dificuldade",
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (text) {
                        setState(() {});
                      },
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Insira a URL da imagem.";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Imagem",
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                  ),
                  Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue),
                      ),
                      child:
                          Image.network(
                              imageController.text,
                              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                return Image.asset("assets/images/nophoto.png", width: 72, height: 100);
                              },
                              fit: BoxFit.cover
                          )
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          // print(nameController.text);
                          // print(int.parse(difficultyController.text));
                          // print(imageController.text);

                          TaskInherited.of(widget.taskContext).addNewTask(nameController.text, imageController.text, int.parse(difficultyController.text));

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Tarefa crianda com sucesso!")));
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Adicionar"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
