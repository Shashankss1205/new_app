import 'package:flutter/material.dart';

import 'package:notes/UI/widgets/CreateNote.dart';
import 'package:notes/UI/widgets/NoteCard.dart';
import 'package:notes/models/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black87,
        leading:
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: const CircleAvatar(
            backgroundImage: AssetImage('images/profile.png'),
        ),
          ),
        title: const Text("My Notes App", style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold,) ),
      ),

      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index){
          return NoteCard(note: notes[index], index: index, onNoteDeleted:onNoteDeleted);
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreateNote(onNewNoteCreated: onNewNoteCreated,)));
        },
        child: const Icon(Icons.add, color: Colors.black, size: 45,),
      ),
    );
  }

  void onNewNoteCreated(Note note){
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index){
    notes.removeAt(index);
    setState(() {});
  }
}