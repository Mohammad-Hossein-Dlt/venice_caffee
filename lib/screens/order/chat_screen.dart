import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';
import 'package:venice_caffee/constants/iconsax_icons.dart';
import 'package:venice_caffee/utils/theme/app_theme.dart';
import 'package:venice_caffee/widgets/persian_number.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

Map cafeAssistantData = {
  "assistantName": "روژان فروزانفر",
  "assistantProfileImage": "assets/images/person4.png",
  "lastSeen": "آخرین بازدید 59 : 06",
};

class _ChatScreenState extends State<ChatScreen> {
  bool isDarkMode_ = false;

  @override
  Widget build(BuildContext context) {
    isDarkMode_ = AppTheme.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDarkMode_ ? secondaryBlack : gray100,
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    cafeAssistantData["assistantName"],
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PersianNumber(
                    number: cafeAssistantData["lastSeen"],
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isDarkMode_ ? lightGray : darkGray,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              cafeAssistantData["assistantProfileImage"],
              width: 50,
              height: 50,
            ),
          ],
        ),
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                maximumSize: const Size(44, 44),
                minimumSize: const Size(44, 44),
                side: BorderSide(color: isDarkMode_ ? darkGray : gray100),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onPressed: () {},
              child: Center(
                child: Icon(
                  Iconsax.call5,
                  color: isDarkMode_ ? blue400 : blue600,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
        centerTitle: false,
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
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 80,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "امروز",
                            style: TextStyle(
                              color: isDarkMode_ ? lightGray : darkGray,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    messageBox(
                      messageType: MessageType.sender,
                      message: "سلام . قسمت توضیحات رو لحاظ کردید؟",
                      time: "امروز 50 :06",
                    ),
                    messageBox(
                      messageType: MessageType.reciver,
                      message: "بله همه چیز طبقه سفارشه.",
                      time: "امروز 51 :06",
                    ),
                    messageBox(
                      messageType: MessageType.sender,
                      message: "فقط لطفا شکر کنار سفارش بذارید به تعداد",
                      time: "امروز 52 :06",
                    ),
                    messageBox(
                        messageType: MessageType.reciver,
                        message: "حتما . میگم براتون توی بسته ارسالی بذارن .",
                        time: "امروز 53 :06"),
                    messageBox(
                      messageType: MessageType.sender,
                      message: "ممنون از شما.",
                      time: "امروز 54 :06",
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                // height: 80,
                decoration: BoxDecoration(
                  color: isDarkMode_ ? primaryBlack : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(2),
                            backgroundColor: primaryBrown,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            maximumSize: const Size(44, 44),
                            minimumSize: const Size(44, 44),
                          ),
                          onPressed: () {},
                          child: const Center(
                            child: Icon(
                              Iconsax.send_2,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.attach_square,
                            color: isDarkMode_ ? lightGray : darkGray,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: TextField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintTextDirection: TextDirection.rtl,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          hintText: "پیام خود را بنویسید...",
                          hintStyle: TextStyle(
                              color: lightGray,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageBox(
      {required MessageType messageType,
      required String message,
      required String time}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: messageType == MessageType.sender
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 1,
                  shadowColor: Theme.of(context).colorScheme.shadow,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: messageType == MessageType.sender
                          ? isDarkMode_
                              ? primaryBlack
                              : Colors.white
                          : isDarkMode_
                              ? brown100
                              : primaryBrown,
                    ),
                    child: Text(
                      message,
                      textDirection: TextDirection.rtl,
                      softWrap: true,
                      style: TextStyle(
                        color: messageType == MessageType.sender
                            ? isDarkMode_
                                ? white
                                : primaryBlack
                            : isDarkMode_
                                ? primaryBlack
                                : white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                PersianNumber(
                  number: time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: lightGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum MessageType { sender, reciver }
