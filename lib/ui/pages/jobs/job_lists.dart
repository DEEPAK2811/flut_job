

/*import 'package:flut_job/models/joblistmodel.dart';
import 'package:flutter/material.dart';

class joblist extends StatefulWidget {
  @override
  _joblistState createState() => _joblistState();
}

class _joblistState extends State<joblist> {
  List<Joblistmodel> joblists = new List();
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new Column(
            children: <Widget>[
              new Text(joblists[0].jobid),
              new Text(joblists[1].jobname),
              new Text(joblists[2].jobdescription),
              new Text(joblists[3].joblocation),
              new Text(joblists[4].jobamount),
              new Text(joblists[5].jobtime),
            ],
          ),
        );
      },
      itemCount: joblists == null ? 0 : joblists.length,
    ));
  }

}

*/