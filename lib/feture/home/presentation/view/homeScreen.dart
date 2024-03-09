import 'package:chat_app/core/enum/enum.dart';
import 'package:chat_app/feture/auth/login/presintation/view/loginScreen.dart';
import 'package:chat_app/feture/chat/persentition/view/chatScreen.dart';
import 'package:chat_app/feture/home/data/model/userModel.dart';
import 'package:chat_app/feture/home/presentation/viewModel/cubit/home_cubit.dart';
import 'package:chat_app/feture/home/presentation/viewModel/cubit/home_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.signOutRequestState == RequestState.success) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => true);
          if (context.mounted) {}
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              title: const Text("Home Page"),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.background,
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              actions: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<HomeCubit>(context).signOutMethod();
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
            body: BlocProvider(
                create: (context) => HomeCubit()..listenToUsers(),
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    switch (state.userState) {
                      case HomeRequestState.loading:
                        return const Center(child: CircularProgressIndicator());
                      case HomeRequestState.success:
                        return ListView.builder(
                            itemCount: state.userModel!.length,
                            itemBuilder: (context, index) {
                              final UserModel userModel =
                                  state.userModel![index]!;
                              if (FirebaseAuth.instance.currentUser!.uid !=
                                  userModel.uId) {
                                return UserTile(user: userModel);
                              } else {
                                return Container();
                              }
                            });
                      case HomeRequestState.erorr:
                        return const Center(child: Text("erorr"));
                    }
                  },
                )));
      },
    );
  }
}

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(
            Icons.person,
            size: 35,
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                        user: user,
                      )));
        },
        title: Text(user.email),
        subtitle: Text(user.email),
      ),
    );
  }
}
