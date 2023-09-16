// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:user_voting_app/core/constants/app_colors.dart';
import 'package:user_voting_app/core/constants/app_text_style.dart';
import 'package:user_voting_app/core/reponsive/SizeConfig.dart';
import 'package:user_voting_app/core/routes/app_routes.dart';
import 'package:user_voting_app/feature/voting/controller/voting_controller.dart';
import 'package:user_voting_app/feature/voting/screens/voting_screen.dart';

class VoteSubmitScreen extends StatefulWidget {
  const VoteSubmitScreen({
    Key? key,
    required this.parms,
  }) : super(key: key);
  final VotingScreenParms parms;
  @override
  State<VoteSubmitScreen> createState() => _VoteSubmitScreenState();
}

class _VoteSubmitScreenState extends State<VoteSubmitScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _celebrateAnimationController;
  final VotingController _votingController = Get.find();
  bool isDropped = false;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _celebrateAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit Vote",
            style: AppTextStyle.f20w700RooberWhite
                .copyWith(fontWeight: FontWeight.w500)),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 20.heightMultiplier,
          ),
          Draggable(
            onDragUpdate: (data) {
              if (data.localPosition.dy >= 466 * SizeConfig.heightMultiplier! &&
                  isDropped == false) {
                _votingController.getCandidates();
                setState(() {
                  isDropped = true;
                });
                _celebrateAnimationController
                    .forward()
                    .then((_) => AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Vote Submitted Successefully',
                        btnOkOnPress: () {
                          Navigator.popUntil(
                              context,
                              (route) =>
                                  RouteName.loginScreen == route.settings.name);
                        },
                        padding: EdgeInsets.all(12),
                        headerAnimationLoop: false)
                      ..show());
              }
            },
            axis: Axis.vertical,
            data: AppColors.accent01,
            child: _buildVotingWidget(Colors.amber.withOpacity(0.4)),
            childWhenDragging: _buildVotingWidget(null),
            feedback: _buildVotingWidget(Colors.amber.withOpacity(0.4)),
          ),
          SizedBox(
            height: 10.heightMultiplier,
          ),
          DragTarget(
            builder: (context, candidateData, rejectedData) {
              return Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  LottieBuilder.asset(
                    "assets/lottie/celebrate.json",
                    controller: _celebrateAnimationController,
                    height: 400,
                  ),
                  LottieBuilder.asset(
                    "assets/lottie/successfull_voted.json",
                    controller: _animationController,
                    height: 300,
                  ),
                ],
              );
            },
            onMove: (details) {
              print(details.data.toString());
            },
            onLeave: (data) {},
            onWillAccept: (data) {
              return data != AppColors.greyScale400;
            },
            onAccept: (data) {
              _votingController.getCandidates();
              setState(() {
                isDropped = true;
              });
              _celebrateAnimationController.forward().then((_) => AwesomeDialog(
                  dismissOnTouchOutside: false,
                  dismissOnBackKeyPress: false,
                  autoDismiss: false,
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  title: 'Vote Submitted Successefully',
                  onDismissCallback: (sf) {
                    Navigator.popUntil(
                        context,
                        (route) =>
                            RouteName.loginScreen == route.settings.name);
                  },
                  btnOkOnPress: () {
                    Navigator.popUntil(
                        context,
                        (route) =>
                            RouteName.loginScreen == route.settings.name);
                  },
                  padding: EdgeInsets.all(12),
                  headerAnimationLoop: false)
                ..show());
            },
          ),
        ]),
      ),
    );
  }

  _buildVotingWidget(Color? color) {
    return Material(
      child: Visibility(
        visible: color == null || !isDropped,
        maintainAnimation: true,
        maintainSemantics: true,
        maintainSize: true,
        maintainState: true,
        child: Container(
          height: 100.heightMultiplier,
          width: 80.widthMultiplier,
          color: color,
          child: color == null
              ? Container()
              : Column(children: [
                  SizedBox(
                    height: 4.heightMultiplier,
                  ),
                  Text(
                    "Vote",
                    style: AppTextStyle.f14w400InterWhite
                        .copyWith(color: AppColors.blackShade2),
                  ),
                  SizedBox(
                    height: 8.heightMultiplier,
                  ),
                  CircleAvatar(
                    radius: 20,
                    foregroundImage:
                        NetworkImage(widget.parms.candidate.imageUrl),
                  )
                ]),
        ),
      ),
    );
  }
}
