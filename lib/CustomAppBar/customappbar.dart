
import 'package:flutter/material.dart';
import 'package:task_project/colors/colors.dart';
import '../DialogScreen/custom_dialog.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  bool value = false;

  final Function() onTap;

  final IconData? icon;
  bool logoutIcon = true;
  bool backButton = true;

  CustomAppBar({
    Key? key,
    required this.title,
    this.value = true,
    required this.onTap,
    this.backButton = true,
    this.logoutIcon = true,
    this.icon,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    // final logout = Provider.of<LoginApiCall>(context);
    final size = MediaQuery.of(context).size;
    MyCustomAlertDialog alertDialog = MyCustomAlertDialog();
    // final data = Provider.of<LoginApiCall>(context);
    return AppBar(
      backgroundColor: appbarRightColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SizedBox(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: appBarLeftColor,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(40),
                          topRight: Radius.circular(0))),
                  height: size.height,
                  width: size.width,
                  child: Row(
                    children: [
                      widget.backButton == false
                          ? Container()
                          : IconButton(
                              onPressed: () {
                                widget.onTap();
                              },
                              icon: Icon(
                                widget.icon,
                                color: Colors.white,
                              )),
                      Flexible(
                        child: Text(
                          widget.title,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  height: size.height,
                  width: size.width,
                  color: appbarRightColor,
                  alignment: Alignment.centerRight,
                  child: widget.logoutIcon
                      ? IconButton(
                          onPressed: () {
                            alertDialog.showCustomAlertdialog(
                                context: context,
                                title: 'Confirm',
                                subtitle: 'Do you want to log out and exit.',
                                onTapOkButt: () {
                                  // data
                                  //     .logoutApiCall(context: context)
                                  //     .then((value) {
                                  //   if (value == 200) {
                                  //     logout.logoutFunction(context: context);
                                  //   } else {}
                                  // });
                                },
                                button: true,
                                onTapCancelButt: () {
                                  Navigator.of(context).pop();
                                });
                          },
                          icon: const Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                          ))
                      : Container(),
                ))
          ],
        ),
      ),
    );
  }
}
