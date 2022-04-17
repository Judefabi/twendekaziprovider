import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twendekaziprovider/model/user_model.dart';

class ProfileContainer extends StatefulWidget {
  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('providers')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient:
              const LinearGradient(colors: [Colors.black, Colors.black87]),
          boxShadow: const [BoxShadow(color: Colors.grey)]),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const CircleAvatar(
                      maxRadius: 30.0,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1531123897727-8f129e1688ce?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cG9ydHJhaXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                      ))),
              const SizedBox(width: 21),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Text(
                                  "${loggedInUser.firstName} ${loggedInUser.secondName}",
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .apply(
                                          fontWeightDelta: 2,
                                          color: Colors.white))),
                          const SizedBox(width: 15),
                          GestureDetector(
                            child: const Icon(Icons.edit, color: Colors.white),
                            onTap: () {},
                          )
                        ]),
                    const SizedBox(height: 10),
                    Text("${loggedInUser.email}",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .apply(color: Colors.white))
                  ]))
            ]),
            const SizedBox(height: 25),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(children: <Widget>[
                    Text('123',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .apply(color: Colors.white)),
                    const SizedBox(height: 3),
                    Text("Jobs Posted",
                        style: TextStyle(color: Colors.grey[300]))
                  ]),
                  Column(children: <Widget>[
                    Text('119',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .apply(color: Colors.white)),
                    const SizedBox(height: 3),
                    Text("Assigned", style: TextStyle(color: Colors.grey[300]))
                  ]),
                  // Column(children: <Widget>[
                  //   Text('3',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .headline6!
                  //           .apply(color: Colors.white)),
                  //   const SizedBox(height: 3),
                  //   Text("Likes", style: TextStyle(color: Colors.grey[300]))
                  // ]),
                  Column(children: <Widget>[
                    Text('98%',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .apply(color: Colors.white)),
                    const SizedBox(height: 3),
                    Text("Satisfaction Rate",
                        style: TextStyle(color: Colors.grey[300]))
                  ])
                ])
          ]),
    );
  }
}
