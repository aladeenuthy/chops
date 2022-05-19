import 'package:chops/components/no_internet_screen.dart';
import 'package:chops/helpers/auth_helper.dart';
import 'package:chops/models/chop_user.dart';
import 'package:chops/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final Future<ChopUser> _future;
  @override
  void initState() {
    super.initState();
    _future = AuthHelper.getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _future,
          builder: (context, AsyncSnapshot<ChopUser> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            } else if (snapshot.hasData) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Information",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/person.png",
                            height: 70,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.fullName,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  snapshot.data!.email,
                                  style: const TextStyle(
                                      fontSize: 16, color: greyColor),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  snapshot.data!.address,
                                  style: const TextStyle(
                                      fontSize: 16, color: greyColor),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.edit))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Payment method",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const NoInternetConnectionScreen();
            }
            return Container();
          }),
    );
  }
}
