import 'package:dope_chat/common/widgets/loader.dart';
import 'package:dope_chat/features/search/controller/search_controller.dart';
import 'package:dope_chat/features/search/widgets/friend_list_tile.dart';
import 'package:dope_chat/features/search/widgets/search_user_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsBottomSheet extends ConsumerWidget {
  FriendsBottomSheet({Key? key}) : super(key: key);
  final myUid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabBar(
                  indicatorWeight: 1,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.people),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Friends')
                        ],
                      ),
                    ),
                    Tab(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.person_add),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Request')
                        ],
                      ),
                    ),
                  ],
                ),
                CloseButton(
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StreamBuilder<List<String>>(
                      stream: ref
                          .read(searchControllerProvider)
                          .getFriendListUids(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Loader();
                        }
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text("No friends"),
                          );
                        }

                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final uid = snapshot.data![index];
                              return FriendListTile(
                                  uid: uid, isFriendList: true);
                            });
                      }),
                  StreamBuilder<List<String>>(
                      stream: ref
                          .read(searchControllerProvider)
                          .getRequestListUids(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Loader();
                        }
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text("No request"),
                          );
                        }
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final uid = snapshot.data![index];
                              return FriendListTile(
                                  uid: uid, isFriendList: false);
                            });
                      }),
                ],
              ),
            )
          ],
        ));
  }
}
