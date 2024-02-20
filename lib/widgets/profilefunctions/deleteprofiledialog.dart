import 'package:flutter/material.dart';

import 'package:taskwarrior/config/app_settings.dart';
import 'package:taskwarrior/config/taskwarriorcolors.dart';
import 'package:taskwarrior/widgets/taskdetails/profiles_widget.dart';

class DeleteProfileDialog extends StatelessWidget {
  const DeleteProfileDialog({
    required this.profile,
    required this.context,
    super.key,
  });

  final String profile;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Center(
          child: AlertDialog(
            scrollable: true,
            title: const Text('Delete Profile?'),
            // content: TextField(controller: controller),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    ProfilesWidget.of(context).deleteProfile(profile);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Profile: ${profile.characters} Deleted Successfully',
                          style: TextStyle(
                            color: AppSettings.isDarkMode
                                ? TaskWarriorColors.kprimaryTextColor
                                : TaskWarriorColors.kLightPrimaryTextColor,
                          ),
                        ),
                        backgroundColor: AppSettings.isDarkMode
                            ? TaskWarriorColors.ksecondaryBackgroundColor
                            : TaskWarriorColors.kLightSecondaryBackgroundColor,
                        duration: const Duration(seconds: 2)));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Profile: ${profile.characters} Deletion Failed',
                          style: TextStyle(
                            color: AppSettings.isDarkMode
                                ? TaskWarriorColors.kprimaryTextColor
                                : TaskWarriorColors.kLightPrimaryTextColor,
                          ),
                        ),
                        backgroundColor: AppSettings.isDarkMode
                            ? TaskWarriorColors.ksecondaryBackgroundColor
                            : TaskWarriorColors.kLightSecondaryBackgroundColor,
                        duration: const Duration(seconds: 2)));
                  }
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
