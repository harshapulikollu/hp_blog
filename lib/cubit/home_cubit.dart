import 'package:bloc/bloc.dart';
import 'package:blog_post_hp/model/home.dart';
import 'package:blog_post_hp/repository/get_home_repo_interface.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPostsInterface _getPostsRepository;
  HomeCubit(this._getPostsRepository) : super(HomeInitial()) {
    getPosts();
  }

  Future<void> getPosts() async {
    emit(HomeLoading());
    try {
      final response = await _getPostsRepository.getPosts();
      emit(HomeLoadedSuccessfully(responseApi: response));
    } catch (e) {
      debugPrint('error $e');
      emit(HomeLoadingFailed());
    }
  }
}
