import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denguego/entity/UserAccount.dart';

class UserAccountManager {
  // final String uid;
  // DatabaseManager(
  //     {this.uid});

  static final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  // userDetails will be the reference we need to use when we want to access that collection
  // static List<String> SavedLocations = [];
  static UserAccount userDetails = new UserAccount();

  Future updateUserData(String name, String email) async {
    return await userCollection.doc(name).set({
      'Name': name,
      'Email': email,
      'SurveyDone': false,
      'SavedLocations': [],
      'SurveyScore': 0,
      'RiskZone': 'High',
      'Reminders': [],
    });
  }

  Future updateSavedLocations(String name) async {
    return await userCollection.doc(name).update({
      'SavedLocations': userDetails.SavedLocations,
    });
  }

  Future updateSurvey(String name) async {
    return await userCollection.doc(name).update({
      'RiskZone': userDetails.RiskZone,
      'SurveyDone': userDetails.SurveyDone,
      'SurveyScore': userDetails.SurveyScore,
    });
  }

  Future updateReminders(String name) async {
    return await userCollection.doc(name).update({
      'Reminders': userDetails.Reminders,
    });
  }

  Future<void> readUserFromDatabase(String name) async {
    //print('inside read');
    print(name);
    await for (var snapshot in userCollection.snapshots()) {
      List<String> savedLocations = [];
      List<String> Reminders = [];
      var Documents = snapshot.docs;
      for (var document in Documents) {
        if (document.id == name) {
          try {
            for (var locationName in document['SavedLocations']) {
              savedLocations.add(locationName);
            }
            for (var reminders in document['Reminders']) {
              Reminders.add(reminders);
            }
            userDetails.name = name;
            userDetails.email = document['Email'];
            userDetails.RiskZone = document['RiskZone'];
            userDetails.SurveyDone = document['SurveyDone'];
            userDetails.SurveyScore = document['SurveyScore'];
            userDetails.SavedLocations = savedLocations;
            userDetails.Reminders = Reminders;
          } catch (e) {
            print(e);
          }
          break;
        }
      }
      break;
    }
  }
}
