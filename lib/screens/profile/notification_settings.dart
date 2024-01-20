import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';

class NotificationsSettings extends StatefulWidget {
  const NotificationsSettings({super.key});

  @override
  State<NotificationsSettings> createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  bool notificationsSound = true;
  bool showNotifications = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "اعلان ها",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.menu,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBrown,
                elevation: 0,
                padding: EdgeInsets.zero,
                maximumSize: const Size(34, 34),
                minimumSize: const Size(34, 34),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Center(
                child: Icon(
                  Iconsax.arrow_right_3,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            item(
              title: "صدای اعلان ها",
              value: notificationsSound,
              function: (bool value) {
                notificationsSound = value;
              },
            ),
            const Divider(),
            item(
              title: "نمایش اعلان ها",
              subTitle: "خاموش کردن نمایش اعلان ها در صفحه نمایش",
              value: showNotifications,
              function: (bool value) {
                showNotifications = value;
              },
            ),
          ],
        ),
      )),
    );
  }

  Widget item({
    required String title,
    required bool value,
    String? subTitle,
    required Function(bool value) function,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: SizedBox(
                                  height: 36,
                                  width: 46,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Switch(
                                      activeTrackColor: primaryBrown,
                                      activeColor: Colors.white,
                                      value: value,
                                      onChanged: (value_) {
                                        setState(() {
                                          function(value_);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      title,
                                      textDirection: TextDirection.rtl,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Visibility(
                                      visible: subTitle != null,
                                      child: Text(
                                        subTitle ?? "",
                                        textDirection: TextDirection.rtl,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: lightGray,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
