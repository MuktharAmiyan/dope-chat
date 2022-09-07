import 'package:dope_chat/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dope_chat/features/search/repository/search_repository.dart';

final searchControllerProvider = Provider((ref) {
  final searchRepository = ref.read(searchRepositoryProvider);
  return SearchController(searchRepository: searchRepository, ref: ref);
});

class SearchController {
  final SearchRepository searchRepository;
  final ProviderRef ref;
  SearchController({
    required this.searchRepository,
    required this.ref,
  });
  Stream<List<UserModel>> searchUser(BuildContext context, String query) {
    return searchRepository.searchUser(query, context);
  }

  void requestFunction(String myUid, String userUid) {
    searchRepository.addOrRemoveRequestlist(myUid, userUid);
  }
}
