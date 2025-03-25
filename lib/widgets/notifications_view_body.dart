import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/managers/notifications_cubit/notifications_cubit.dart';
import 'package:e_commerce_app/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsViewBody extends StatelessWidget {
  const NotificationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          if (state is NotificationsFilled) {
            return ListView.builder(
              itemCount: state.notifications.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(index),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      'Remove',
                      style: AppTextStyles.semibold16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    context.read<NotificationsCubit>().removeNotfication(
                      state.notifications[index],
                    );
                  },
                  child: NotificationItem(model: state.notifications[index]),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'You don\'t have any notifications yet!',
                style: AppTextStyles.semibold18,
              ),
            );
          }
        },
      ),
    );
  }
}
