import 'package:flutter/material.dart';


Widget jobcard(){
Center(
  child: Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album),
          title: Text('The Enchanted Soul'),
          subtitle: Text('Music by MusicDp. Lyrics by Deepak Prakash.'),
        ),
        ButtonTheme.bar( // make buttons use the appropriate styles for cards
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('Approve'),
                onPressed: () { /* ... */ },
              ),
              FlatButton(
                child: const Text('Cancel'),
                onPressed: () { /* ... */ },
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
}