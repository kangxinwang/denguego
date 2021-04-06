import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denguego/entity/UserAccount.dart';

class UserAccountManager {
  // final String uid;
  // DatabaseManager(
  //     {this.uid});

  final CollectionReference userCollection =
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
      'RiskZone': '',
    });
  }

  Future updateUsername(String name) async {
    return await userCollection.doc(name).update({
      'Name': userDetails.name,
    });
  }

  Future updateSavedLocations(String name) async {
    return await userCollection.doc(name).update({
      'SavedLocations': userDetails.SavedLocations,
    });
  }

  Future updateRiskZone(String name) async {
    return await userCollection.doc(name).update({
      'RiskZone': userDetails.RiskZone,
    });
  }

  // code to store the survey done bool in database d=so can check if the user has already done the survey
  // have to change userDetails.SurveyDone to true when the survey is done
  Future updateSurveyDone(String name) async {
    return await userCollection.doc(name).update({
      'SurveyDone': userDetails.SurveyDone,
    });
  }

  // code to store the survey score in database
  // have to change userDetails.SurveyScore when the survey is done
  Future updateSurveyScore(String name) async {
    return await userCollection.doc(name).update({
      'SurveyScore': userDetails.SurveyScore,
    });
  }

  Future<void> readUserFromDatabase(String name) async {
    List<String> SavedLocations = [];
    await for (var snapshot in userCollection.snapshots()) {
      var Documents = snapshot.docs;
      for (var document in Documents) {
        if (document.id == name) {
          try {
            for (var locationName in document['SavedLocations']) {
              SavedLocations.add(locationName);
            }
            userDetails.name = name;
            userDetails.email = document['Email'];
            userDetails.RiskZone = document['RiskZone'];
            userDetails.SurveyDone = document['SurveyDone'];
            userDetails.SurveyScore = document['SurveyScore'];
            userDetails.SavedLocations = SavedLocations;
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
