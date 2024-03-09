import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuildUserAvatar extends StatelessWidget {
  const BuildUserAvatar({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      width: 45,
      height: 45,
      child: CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          backgroundImage: FirebaseAuth.instance.currentUser?.photoURL != null && FirebaseAuth.instance.currentUser?.photoURL != ''
              ? NetworkImage(
                  FirebaseAuth.instance.currentUser?.photoURL ?? '',
                )
              : null,
          child: FirebaseAuth.instance.currentUser?.photoURL == null || FirebaseAuth.instance.currentUser?.photoURL == ''
              ? Icon(
                  Icons.person,
                  size: 26,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null));
}
