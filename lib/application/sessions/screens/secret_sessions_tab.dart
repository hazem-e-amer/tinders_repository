import 'package:flutter/material.dart';
import 'package:tinders/application/sessions/models/session_model.dart';
import 'package:tinders/application/sessions/screens/session_details_screen.dart';
import 'package:tinders/application/sessions/widgets/explanation_widget.dart';
import 'package:tinders/core/utils/extensions/widget_extensions.dart';

import '../../../app_theme.dart';
import '../../../core/utils/common.dart';
import '../widgets/normal_session_widget.dart';

List<SessionModel> secretSessions = [
  SessionModel(
      sessionName: 'Session name4', number: '4', meetingDate: '1/4/2024'),
  SessionModel(
      sessionName: 'Session name5', number: '5', meetingDate: '1/5/2024'),
  SessionModel(
      sessionName: 'Session name6', number: '6', meetingDate: '1/6/2024'),
];

class SecretSessionsTab extends StatefulWidget {
  const SecretSessionsTab({super.key});

  @override
  State<SecretSessionsTab> createState() => _SecretSessionsTabState();
}

class _SecretSessionsTabState extends State<SecretSessionsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ExplanationWidget(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                child: SessionWidget(
                    color: colors(context).lightGreyColor,
                    sessionTitle: secretSessions[index].sessionName ?? '',
                    sessionNumber: secretSessions[index].number ?? '',
                    numberOfTopics: '3',
                    theDate: secretSessions[index].meetingDate ?? ''),
                onTap: () {
                  SessionDetailsScreen(
                    sessionModel: secretSessions[index],
                  ).launch(
                    context,
                    pageRouteAnimation: PageRouteAnimation.Scale,
                  );
                },
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 10.0,
            ),
            itemCount: secretSessions.length,
          ),
        ),
      ],
    );
  }
}
