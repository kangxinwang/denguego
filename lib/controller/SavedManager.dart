import 'package:denguego/entity/ClusterLocation.dart';
import 'package:denguego/shared/constants.dart';

class SavedManager {
  static bool isSaved(ClusterLocation loc) {
    for (ClusterLocation savedLoc in savedList) {
      if (savedLoc.location == loc.location) return true;
    }
    return false;
  }

  static void removeSaved(loc) {
    for (ClusterLocation savedLoc in savedList) {
      if (savedLoc.location == loc.location) {
        savedList.remove(savedLoc);
      }
    }
    return;
  }

  static void editSaved(ClusterLocation loc) async {
    if (isSaved(loc)) {
      removeSaved(loc);
      return;
    } else
      savedList.add(loc);
  }
}
