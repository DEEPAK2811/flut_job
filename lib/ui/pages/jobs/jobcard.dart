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
    return
      new Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.album),
              title: Text('${data.name} is ${data.desc} '),
              subtitle: Text('from ${data.location} .'),
            ),
            new ButtonTheme.bar( // make buttons use the appropriate styles for cards
              child: new ButtonBar(
                children: <Widget>[
                  new FlatButton(
                    child: const Text('Thumb up'),
                    onPressed: () { /* ... */ },
                  ),
                  new FlatButton(
                    child: const Text('Thumb down'),
                    onPressed: () { /* ... */ },
                  )]))]));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
          child:  jobCard,
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