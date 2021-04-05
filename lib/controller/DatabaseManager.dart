import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  // final String uid;
  // DatabaseManager(
  //     {this.uid});

  final CollectionReference userDetails =
      FirebaseFirestore.instance.collection('Users');
  // userDetails will be the reference we need to use when we want to access that collection
  static List<String> SavedLocations = [];

  Future updateUserData(String name, String email) async {
    return await userDetails.doc(name).set({
      'Name': name,
      'Email': email,
      'SurveyDone': false,
      'SavedLocations': [],
      'SurveyScore': 0,
    });
  }

  Future updateSavedLocations(String location, String name) async {
    return await userDetails.doc(name).update({
      'SavedLocations': SavedLocations,
    });
  }

  Future<void> readSavedLocations(String name) async {
    SavedLocations = [];
    await for (var snapshot in userDetails.snapshots()) {
      var Documents = snapshot.docs;
      for (var document in Documents) {
        if (document.id == name) {
          try {
            for (var locationName in document['SavedLocations']) {
              //var location = await userDetails.doc(locationName).get();
              SavedLocations.add(locationName);
            }
          } catch (e) {
            print(e);
          }
          break;
        }
      }
      break;
    }
  }
  //Retrieve information

}
