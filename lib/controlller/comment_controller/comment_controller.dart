import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jewels_airport_transfers/models/comment_insert_model/comment_insert_model.dart';
import '../../repositories/shared_pref_repo.dart';
import '../../services/api_services.dart';
import '../../utills/logging.dart';

class CommentController extends GetxController {
  final comment = CommentInsertModel().obs;
  final commentList = <CommentInsertModel>[].obs;

  RxBool isAvailableLoading = true.obs;
  final isLoading = false.obs;
  SharedPrefsRepository repository = SharedPrefsRepository();

  @override
  void onInit() {
    super.onInit();
    commentInsert(Get.context!);
  }

  final commentInsertModel = CommentInsertModel().obs;

  commentInsert(BuildContext context) async {
    try {
      isAvailableLoading.value = true;
      var res = await ApiService().commentInsertApi(context);
      if (res != null) {
        commentInsertModel.value = res;
        update();
      }
    } catch (e) {
      Logger.error("Api Error:${e.toString()}");
    } finally {
      isAvailableLoading.value = false;
    }
  }
}
