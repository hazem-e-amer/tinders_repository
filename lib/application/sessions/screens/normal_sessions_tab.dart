import 'package:flutter/material.dart';
import 'package:tinders/application/sessions/screens/session_details_screen.dart';
import 'package:tinders/application/sessions/widgets/explanation_widget.dart';
import 'package:tinders/core/utils/common.dart';
import 'package:tinders/core/utils/extensions/widget_extensions.dart';

import '../../../app_theme.dart';
import '../models/session_model.dart';
import '../widgets/normal_session_widget.dart';

List<SessionModel> normalSessions = [
  SessionModel(
      sessionName: 'Session name1', number: '1', meetingDate: '1/1/2024'),
  SessionModel(
      sessionName: 'Session name2', number: '2', meetingDate: '1/2/2024'),
  SessionModel(
      sessionName: 'Session name3', number: '3', meetingDate: '1/3/2024'),
];

class NormalSessionsTab extends StatefulWidget {
  const NormalSessionsTab({super.key});

  @override
  State<NormalSessionsTab> createState() => _NormalSessionsTabState();
}

class _NormalSessionsTabState extends State<NormalSessionsTab> {
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
                    color: colors(context).backgroundColor,
                    sessionTitle: normalSessions[index].sessionName ?? '',
                    sessionNumber: normalSessions[index].number ?? '',
                    numberOfTopics: '3',
                    theDate: normalSessions[index].meetingDate ?? ''),
                onTap: () {
                  SessionDetailsScreen(
                    sessionModel: normalSessions[index],
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
            itemCount: normalSessions.length,
          ),
        ),
      ],
    );
  }
}
