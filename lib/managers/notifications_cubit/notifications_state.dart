part of 'notifications_cubit.dart';

class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsFilled extends NotificationsState {
  final List<NotificationItemModel> notifications;
  NotificationsFilled({required this.notifications});
}
