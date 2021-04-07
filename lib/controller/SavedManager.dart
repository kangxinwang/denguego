import 'package:denguego/controller/AuthenticateManager.dart';
import 'package:denguego/controller/UserAccountManager.dart';
import 'package:denguego/entity/ClusterLocation.dart';

class SavedManager {
  static AuthenticateManager _auth = AuthenticateManager();
  static UserAccountManager UserMgr = UserAccountManager();

  static bool isSaved(ClusterLocation loc) {
    for (String savedLoc in UserAccountManager.userDetails.SavedLocations) {
      if (savedLoc == loc.location) {
        return true;
      }
    }
    return false;
  }

  static void removeSaved(ClusterLocation loc) {
    for (String savedLoc in UserAccountManager.userDetails.SavedLocations) {
      if (savedLoc == loc.location) {
        UserAccountManager.userDetails.SavedLocations.remove(savedLoc);
        return;
      }
    }
    return;
  }

  static void editSaved(ClusterLocation loc) async {
    String name = await _auth.getCurrentUserName();

    if (isSaved(loc)) {
      removeSaved(loc);
    } else
      UserAccountManager.userDetails.SavedLocations.add(loc.location);

    await UserMgr.updateSavedLocations(name);
  }
}
