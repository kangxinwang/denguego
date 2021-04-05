import 'package:denguego/controller/AuthenticateManager.dart';
import 'package:denguego/controller/ClusterManager.dart';
import 'package:denguego/controller/DatabaseManager.dart';
import 'package:denguego/entity/ClusterLocation.dart';
import 'package:denguego/shared/Constants.dart';

class SavedManager {
  static AuthenticateManager _auth = AuthenticateManager();
  static DatabaseManager DB = DatabaseManager();

  static bool isSaved(ClusterLocation loc) {
    for (String savedLoc in DatabaseManager.SavedLocations) {
      if (savedLoc == loc.location) return true;
    }
    return false;
  }

  static void removeSaved(ClusterLocation loc) {
    for (String savedLoc in DatabaseManager.SavedLocations) {
      if (savedLoc == loc.location) {
        DatabaseManager.SavedLocations.remove(savedLoc);
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
      DatabaseManager.SavedLocations.add(loc.location);

    await DB.updateSavedLocations(loc.location, name);
  }
}
