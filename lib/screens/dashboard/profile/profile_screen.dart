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
  var groupValue = 0;
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
                    Text(
                      "Information",
                      style: Theme.of(context).textTheme.headlineMedium,
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  snapshot.data!.email,
                                  style: const TextStyle(
                                      fontSize: 17, color: greyColor),
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
                    Text(
                      "Cards",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: const[
                        _CardTile(groupValue: "ii"),
                        _CardTile(groupValue: "ii")
                      ]),
                    )
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

class _CardTile extends StatelessWidget {
  final String groupValue;
  const _CardTile({Key? key, required this.groupValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: greyColor))
      ),
      padding: const EdgeInsets.symmetric( vertical: 12),
      child: Row(children: [
        Radio(
            activeColor: primaryColor,
            value: 1,
            groupValue: groupValue,
            onChanged: (val) {
            
            }),
        const SizedBox(width: 10,),
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Image.asset('assets/images/card.png', width: 40, height: 40,)),
        const SizedBox(width: 7,),
        const Text("506xxxxxxxxx")
      ]),
    );
  }
}
