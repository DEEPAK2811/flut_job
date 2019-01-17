import 'package:cloud_firestore/cloud_firestore.dart';

class JoblistModel {
  final DocumentReference reference;
  String name;
  String desc;
  String location;
  

  JoblistModel.data(this.reference,
      [this.name,
        this.desc,
        this.location]) {
    // Set these rather than using the default value because Firebase returns
    // null if the value is not specified.
    this.name ??= 'Deeapk';
    this.desc ??= 'Flutter Developer';
    this.location ??= 'Delhi';
  }

  factory JoblistModel.from(DocumentSnapshot document) => JoblistModel.data(
      document.reference,
      document.data['name'],
      document.data['desc'],
      document.data['location'],
      );

  void save() {
    reference.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'location': location,
    };
  }
}

/*class Joblistmodel {
  String jobid;
  String jobname;
  String jobdescription;
  String joblocation;
  String jobamount;
  String jobtime;

  Joblistmodel(
      {this.jobid,
      this.jobname,
      this.jobdescription,
      this.joblocation,
      this.jobamount,
      this.jobtime});

factory Joblistmodel.fromJson(Map<String, dynamic> parsedJson){
    return Joblistmodel(
      jobid: parsedJson['id'],
      jobname : parsedJson['name'],
      joblocation : parsedJson ['location']
    );
}
getList() async{
    await FirebaseDatabase.instance.reference().child("wall").once().then((DataSnapshot dataSnapshot){
        this.setState((){
          for(var value in dataSnapshot.value.values) {
          list.add(new Post.fromJson(value));
        }
      });
   });
}


}
*/
