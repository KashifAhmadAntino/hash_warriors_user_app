import 'package:auto_localization/auto_localization.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_voting_app/core/constants/app_colors.dart';
import 'package:user_voting_app/core/constants/app_text_style.dart';
import 'package:user_voting_app/core/reponsive/SizeConfig.dart';
import 'package:user_voting_app/core/routes/app_routes.dart';
import 'package:user_voting_app/feature/voting/controller/voting_controller.dart';
import 'package:user_voting_app/feature/voting/models/candidate.dart';
import 'package:user_voting_app/feature/voting/repository/voting_repository.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({super.key});

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  int selectedCandidateIndex = -1;
  final VotingController votingController = Get.put(VotingController(
    VotingRepository(
      Dio(),
    ),
  ));

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      votingController.getCandidates();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vote",
            style: AppTextStyle.f20w700RooberWhite
                .copyWith(fontWeight: FontWeight.w500)),
      ),
      body: Container(
        padding: EdgeInsets.all(16.widthMultiplier),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20.heightMultiplier,
          ),
          Text("Vote by selecting the candidate",
              style: AppTextStyle.f16w500InterBlackShade2),
          SizedBox(
            height: 16.heightMultiplier,
          ),
          Expanded(
            child: Obx(
              () {
                final List<Candidate> candidates = votingController.candidates;
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedCandidateIndex = index;
                          });
                        },
                        child: ClipRRect(
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            selectedTileColor:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            selected: index == selectedCandidateIndex,
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              candidates[index].name ?? '',
                              style: AppTextStyle.f18w500RooberBlackShade2,
                            ),
                            subtitle: Text(
                              candidates[index].partyName ?? '',
                              style: AppTextStyle.f16w500InterNeutral08,
                            ),
                            leading: CircleAvatar(
                              radius: 32,
                              foregroundColor: AppColors.accent4,
                              child: CircleAvatar(
                                foregroundImage: NetworkImage(
                                    candidates[index].imageUrl ?? ''),
                                radius: 26,
                              ),
                            ),
                            trailing: Radio<int>(
                              value: index,
                              groupValue: selectedCandidateIndex,
                              onChanged: (value) {
                                setState(() {
                                  selectedCandidateIndex = value!;
                                });
                                print("Button value: $value");
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 24.heightMultiplier,
                        ),
                    itemCount: votingController.candidates.length);
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.voteSubmitScreen,
                        arguments: VotingScreenParms(votingController
                            .candidates[selectedCandidateIndex]));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.heightMultiplier),
                    child: Text(
                      "Next",
                      style: AppTextStyle.f18w400Jakartaneutral02,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 40.heightMultiplier,
          ),
        ]),
      ),
    );
  }
}

class VotingScreenParms {
  final Candidate candidate;

  VotingScreenParms(this.candidate);
}
