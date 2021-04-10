import 'package:denguego/controller/ClusterManager.dart';
import 'package:denguego/controller/UserAccountManager.dart';

class SystemManager {
  static UserAccountManager UserMgr = UserAccountManager();

  static Future<List<String>> loadInformation() async {
    List<String> clusterInformation = await ClusterManager.getAllLocations();

    await UserAccountManager.populateUser();
    return clusterInformation;
  }
}
