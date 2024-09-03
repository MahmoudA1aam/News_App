part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SourceLoading extends HomeState {}

final class SourceSuccess extends HomeState {}

final class SourceError extends HomeState {}

final class ArticleLoading extends HomeState {}

final class ArticleSuccess extends HomeState {}

final class ArticleError extends HomeState {}

final class ChangedIndex extends HomeState {}
