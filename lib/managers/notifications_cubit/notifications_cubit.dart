import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/models/notification_item_model.dart';
part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  List<NotificationItemModel> notifications = [];

  void addNotfication(NotificationItemModel notification) {
    notifications.add(notification);
    emitNotificationsState();
  }

  void removeNotfication(NotificationItemModel notification) {
    notifications.remove(notification);
    emitNotificationsState();
  }

  emitNotificationsState() {
    if (notifications.isEmpty) {
      emit(NotificationsInitial());
    } else {
      emit(
        NotificationsFilled(notifications: List.unmodifiable(notifications)),
      );
    }
  }
}
