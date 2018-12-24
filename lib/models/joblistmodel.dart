class Joblistmodel {
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

/*factory Joblistmodel.fromJson(Map<String, dynamic> parsedJson){
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

*/



}

