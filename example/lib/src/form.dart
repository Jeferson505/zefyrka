import 'package:flutter/material.dart';
import 'package:zefyrka/zefyrka.dart';

import 'full_page.dart';

enum Options { darkTheme }

class FormEmbeddedScreen extends StatefulWidget {
  const FormEmbeddedScreen({super.key});

  @override
  FormEmbeddedScreenState createState() => FormEmbeddedScreenState();
}

class FormEmbeddedScreenState extends State<FormEmbeddedScreen> {
  final ZefyrController _controller = ZefyrController(NotusDocument());
  final FocusNode _focusNode = FocusNode();

  bool _darkTheme = false;

  @override
  Widget build(BuildContext context) {
    final form = ListView(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Name'),
          maxLines: 5,
        ),
        buildEditor(),
        TextField(
          decoration: InputDecoration(labelText: 'Details'),
          maxLines: 3,
        ),
      ],
    );

    final result = Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: ZefyrLogo(),
        actions: [
          PopupMenuButton<Options>(
            itemBuilder: buildPopupMenu,
            onSelected: handlePopupItemSelected,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: form,
      ),
    );

    if (_darkTheme) {
      return Theme(data: ThemeData.dark(), child: result);
    }
    return Theme(data: ThemeData(primarySwatch: Colors.cyan), child: result);
  }

  Widget buildEditor() {
    return ZefyrField(
      // height: 200.0,
      // decoration: InputDecoration(labelText: 'Description'),
      controller: _controller,
      focusNode: _focusNode,
      autofocus: true,
      // physics: ClampingScrollPhysics(),
    );
  }

  void handlePopupItemSelected(Options value) {
    if (!mounted) return;
    setState(() {
      if (value == Options.darkTheme) {
        _darkTheme = !_darkTheme;
      }
    });
  }

  List<PopupMenuEntry<Options>> buildPopupMenu(BuildContext context) {
    return [
      CheckedPopupMenuItem(
        value: Options.darkTheme,
        checked: _darkTheme,
        child: Text('Dark theme'),
      ),
    ];
  }
}
