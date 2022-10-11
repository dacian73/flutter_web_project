import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derzelas/const/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditeazaHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditeazaHeaderState();
}

class EditeazaHeaderState extends State<EditeazaHeader> {
  TextEditingController titluController = new TextEditingController();
  TextEditingController prezentareController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Editeaza Header'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: const Text(
              'Pagina de acasă - editează header',
              style: TextStyle(fontSize: 32),
            )),
            _getTextField(context, 'acasa', 'titlu'),
            const Text('Editează textul de prezentare de pe prima pagină'),
            _getTextField(context, 'acasa', 'prezentare'),
            InkWell(
              highlightColor: turcoaz,
              child:
                  Text('Salvează modificările pentru header - pagina de Acasă'),
              onTap: () {
                FirebaseFirestore.instance
                    .collection('header')
                    .doc('acasa')
                    .set({
                      'titlu': titluController.text,
                      'prezentare': prezentareController.text,
                      'cuButon': false
                    })
                    .then((value) => debugPrint(
                        "Textul de prezentare pentru acasa a fost schimbat"))
                    .catchError((error) => debugPrint(
                        "Nu s-a schimbat textul de prezentare pentru acasa: $error"));
              },
            ),
            Center(
                child: const Text(
              'Pagina de Activități și Proiecte  - editează header',
              style: TextStyle(fontSize: 32),
            )),
            TextField(
              controller: titluController,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Scrie un alt titlu',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            const Text(
                'Editează textul de prezentare de pe pagina de activități și proiecte'),
            TextField(
              controller: prezentareController,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Scrie un alt text de prezentare',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            InkWell(
              highlightColor: turcoaz,
              child: Text(
                  'Salvează modificările pentru header - pagina de Activități și Proiecte'),
              onTap: () {
                FirebaseFirestore.instance
                    .collection('header')
                    .doc('activitati')
                    .set({
                      'titlu': titluController.text,
                      'prezentare': prezentareController.text,
                      'cuButon': false
                    })
                    .then((value) => debugPrint(
                        "Textul de prezentare pentru pagina de Activități și Proiecte a fost schimbat"))
                    .catchError((error) => debugPrint(
                        "Nu s-a schimbat textul de prezentare pentru pagina de Activități și Proiecte: $error"));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTextField(BuildContext context, String textID, String field) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('header')
            .doc(textID)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new CircularProgressIndicator();
          }
          var text = snapshot.data!.get(field);

          return TextField(
            controller: titluController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          );
        });
  }
}
