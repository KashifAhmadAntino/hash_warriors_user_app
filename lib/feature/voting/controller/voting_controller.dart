import 'package:get/get.dart';
import 'package:user_voting_app/core/utilites/progress_dialog.dart';
import 'package:user_voting_app/feature/auth/controller/login_controller.dart';
import 'package:user_voting_app/feature/voting/models/candidate.dart';
import 'package:user_voting_app/feature/voting/repository/voting_repository.dart';

class VotingController extends GetxController {
  final VotingRepository _repository;
  final LoginController _loginController = Get.find();
  final RxList<Candidate> candidates = <Candidate>[].obs;

  VotingController(this._repository);

  Future<void> getCandidates() async {
    ProgressDialog.openProgressDialog();
    final list = await _repository.getAllCandidates() ?? [];

    ProgressDialog.closeProgressDialog(
      onDialogClosed: () {
        candidates.value = list;
      },
    );
  }

  Future<void> submitVote(Candidate candidate) async {
    await _repository.submitVote(candidate, _loginController.userId ?? "",
        _loginController.otpController.text);
  }
}
