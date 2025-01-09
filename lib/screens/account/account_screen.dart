import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:EasyShop/common_widgets/app_text.dart';
import 'package:EasyShop/helpers/column_with_seprator.dart';
import 'package:EasyShop/styles/colors.dart';
import '../../apis/auth_api.dart';
import '../../model_schema/user_model.dart';
import '../auth/login_page.dart';
import 'account_item.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreen> {
  UserModel? _user;
  String? _photoUrl;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    try {
      final authAPI = AuthAPI();
      final currentUser = await authAPI.readCurrentUser();
      final authInstance = await authAPI.getCurrentUserInstance();
      setState(() {
        _user = currentUser;
        _photoUrl = authInstance?.photoURL;
      });
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading:
                  SizedBox(width: 65, height: 65, child: getImageHeader()),
              title:  AppText(
                text: _user != null ? _user!.name : '',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              subtitle:  AppText(
                text: _user != null ? _user!.email : '',
                color: const Color(0xff7C7C7C),
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            Column(
              children: getChildrenWithSeperator(
                widgets: accountItems.map((e) {
                  return getAccountItemWidget(e);
                }).toList(),
                seperator: const Divider(
                  thickness: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            logoutButton(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 0,
          backgroundColor: const Color(0xffF2F3F2),
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 25),
          minimumSize: const Size.fromHeight(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const Text(
              'Log Out',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Container()
          ],
        ),
        onPressed: () {
          final authAPI = AuthAPI();
          authAPI.googleSignout();
          Navigator.of(context).pushReplacement<void, void>(MaterialPageRoute(
          builder: (BuildContext context) {
            return const LoginPage();
          },
        ));
        },
      ),
    );
  }

 Widget getImageHeader() {
  if (_photoUrl == null || _photoUrl!.isEmpty) {
    const imagePath = 'assets/images/account_image.jpg';
    return CircleAvatar(
      radius: 5.0,
      backgroundImage: const AssetImage(imagePath),
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
    );
  } else {
    return CircleAvatar(
      radius: 5.0,
      backgroundImage: NetworkImage(_photoUrl!),
      backgroundColor: AppColors.primaryColor.withOpacity(0.7),
    );
  }
}

  Widget getAccountItemWidget(AccountItem accountItem) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              accountItem.iconPath,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            accountItem.label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
