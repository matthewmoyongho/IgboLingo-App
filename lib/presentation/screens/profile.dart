import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/domain/business_logic/blocs/user/user_bloc.dart';

import '../../domain/business_logic/blocs/user/user_state.dart';

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

    // final user = FirebaseAuth.instance.currentUser;
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
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                height: deviceSize.height * 0.35,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
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
                        height: 5,
                      ),
                      // state.user!.photoUrl == null
                      //     ? Container(
                      //         height: 100,
                      //         width: 100,
                      //         decoration: const BoxDecoration(
                      //             image: DecorationImage(
                      //                 image: AssetImage('assets/avatar.png'),
                      //                 fit: BoxFit.cover),
                      //             shape: BoxShape.circle),
                      //       )
                      //     : Container(
                      //         height: 70,
                      //         width: 70,
                      //         decoration: BoxDecoration(
                      //             color: Colors.white70,
                      //             borderRadius: BorderRadius.circular(100)),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(100),
                      //           child: FadeInImage(
                      //             placeholder:
                      //                 const AssetImage('assets/avatar.png'),
                      //             image: NetworkImage(state.user!.photoUrl!),
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/avatar.png'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                '${state.user!.level}',
                                style: GoogleFonts.poppins(
                                    color: kSecondaryColor,
                                    fontSize: 14,
                                    decoration: TextDecoration.underline),
                              ),
                              Text(
                                'lectures completed',
                                style: GoogleFonts.poppins(
                                    color: kSecondaryColor, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (state is UserLoaded)
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
                                'EMAIL ADDRESS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.blueGrey),
                              ),
                              TextFormField(
                                readOnly: true,
                                initialValue: state.user!.email ?? '',
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
                                'USERNAME',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.blueGrey),
                              ),
                              TextFormField(
                                readOnly: true,
                                initialValue: state.user!.name,
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
                            ]),
                      ),
                    ),
                  ]),
                ),
              if (state is UserLoading)
                const Expanded(
                    child: Center(child: CircularProgressIndicator())),
              if (state is UserLoadingFailed)
                const Center(
                  child: Text(
                      'Could not load user details. Please refresh with a better network!'),
                )
            ],
          );
        },
      ),
    );
  }
}
