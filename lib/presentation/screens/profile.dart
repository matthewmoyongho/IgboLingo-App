import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_bloc.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/authentication/authentication_state.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool readOnly = true;
  final _formKey = GlobalKey<FormState>();
  String? phone;
  String? email;
  String? username;
  String? gpTarget;
  String? school;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //  setData();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[900],
      //   elevation: 0,
      //   title: const Text('Profile'),
      //   actions: [
      //     if (readOnly)
      //       IconButton(
      //           onPressed: () {
      //             setState(() {
      //               readOnly = !readOnly;
      //             });
      //           },
      //           icon: const Icon(
      //             Icons.edit,
      //             color: Colors.white,
      //           )),
      //     if (!readOnly)
      //       IntrinsicHeight(
      //         child: Row(
      //           children: [
      //             TextButton(
      //               onPressed: () {},
      //               child: const Text(
      //                 'Update',
      //                 style: TextStyle(color: Colors.white70),
      //               ),
      //             ),
      //             const VerticalDivider(
      //               color: Colors.white70,
      //             ),
      //             TextButton(
      //               onPressed: () {
      //                 setState(() {
      //                   readOnly = !readOnly;
      //                 });
      //               },
      //               child: const Text(
      //                 'Cancel',
      //                 style: TextStyle(color: Colors.white70),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //   ],
      // ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                height: deviceSize.height * 0.35,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                    right: 15,
                    left: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: kSecondaryColor),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      user?.photoURL == null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.blueGrey,
                              child: Text(
                                (user!.email?.substring(0, 1))!,
                                style: TextStyle(fontSize: 100),
                              ),
                            )
                          : Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(100)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: FadeInImage(
                                  placeholder:
                                      const AssetImage('assets/app_icon3.png'),
                                  image: NetworkImage(user!.photoURL!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(children: [
                  Container(
                    height: deviceSize.height * 0.58,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'PHONE NO:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blueGrey),
                            ),

                            TextFormField(
                              maxLength: 11,
                              readOnly: readOnly,
                              initialValue: user.phoneNumber,
                              style: const TextStyle(fontSize: 18),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 3,
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
//Email Address
                            const Text(
                              'EMAIL ADDRESS:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blueGrey),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: user.email ?? '',
                              style: const TextStyle(fontSize: 18),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 3,
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
//Birth Info
                            const Text(
                              'USERNAME:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blueGrey),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: user.displayName,
                              style: const TextStyle(fontSize: 18),
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 3,
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
//Target gp
                          ]),
                    ),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
