  import 'package:flutter/material.dart';
  import '../reprArt/toDo_page.dart';

class NuevoArticuloPage extends StatefulWidget {
  final Todo item;
  static final String routName = 'nuevoArt';

  NuevoArticuloPage({ this.item });

  @override
  _NewTodoViewState createState() => _NewTodoViewState();
}

class _NewTodoViewState extends State<NuevoArticuloPage> {
  TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    titleController = new TextEditingController(
      text: widget.item != null ? widget.item.title : null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.item != null ? 'Número' : 'Número',
          key: Key('new-item-title'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: titleController,
              autofocus: true,
              onEditingComplete: submit,
              decoration: InputDecoration(labelText: 'NUEVO ARTÍCULO'),
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              color: Colors.white,
              child: Text(
                'OK',
                style: TextStyle(
                  // ignore: deprecated_member_use
                  color: Colors.blue
                ),
              ),
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)
                )
              ),
              onPressed: () => submit(),
            )
          ],
        ),
      ),
    );
  }

  void submit(){
    Navigator.of(context).pop(titleController.text);
  }
}