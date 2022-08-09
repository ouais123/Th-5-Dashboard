import 'package:dashboard/core/app/locator_app.dart';
import 'package:dashboard/models/complaints.dart';
import 'package:dashboard/services/api/home_service.dart';
import 'package:get/state_manager.dart';

class ComplaintsConttroler extends GetxController {
  final RxInt indexHover = (-1).obs;
  @override
  void onInit() {
    super.onInit();
    getComplaints();
  }

  RxList<Complaints> complaints = <Complaints>[].obs;

  final RxBool isLoading = false.obs;

  Future<void> getComplaints() async {
    isLoading.value = true;
    HomeService homeService = locator.get<HomeService>();
    List<Complaints>? complaintsTemp =
        await homeService.getComplaints().catchError(errorHandle);

    if (complaintsTemp != null) complaints.assignAll(complaintsTemp);

    isLoading.value = false;
  }

  dynamic errorHandle(error) {
    //do somw work
  }
}
