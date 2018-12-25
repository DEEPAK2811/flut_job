import 'package:flut_job/models/joblistmodel.dart';
import 'package:flutter/material.dart';

class JobCard extends StatefulWidget {
  final JoblistModel data;

  JobCard(this.data);

  @override
  State<StatefulWidget> createState() {
    return JobCardState(data);
  }
}

class JobCardState extends State<JobCard> {
  JoblistModel data;
  String renderUrl;

  JobCardState(this.data);

  Widget get jobCard {
    return new Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      ListTile(
        leading: const Icon(Icons.book),
        title: Text('${data.name.toUpperCase()} :: ${data.location} '),
        subtitle: Text('Description: ${data.desc} .'),
      ),
      new ButtonTheme.bar(
          // make buttons use the appropriate styles for cards
          child: new ButtonBar(children: <Widget>[
        new FlatButton(
          child: const Text('Agree=>Work'),
          onPressed: () {/* ... */},
        ),
        new FlatButton(
          child: const Text('Deny'),
          onPressed: () {/* ... */},
        )
      ]))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: jobCard,
      padding:const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 10.0)
    );
  }
}

/*import 'package:flutter/material.dart';

class jobcard extends StatefulWidget {
  @override
  _jobcardState createState() => _jobcardState();
}

class _jobcardState extends State<jobcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: procard(),
    );
  }
}

Widget procard() {
  return Center(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('The Enchanted Soul'),
            subtitle: Text('Music by MusicDp. Lyrics by Deepak Prakash.'),
          ),
          ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Approve'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: const Text('Cancel'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
*/
