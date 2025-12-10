import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationMessage {
  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  final Map<String, dynamic>? data;

  NotificationMessage({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    this.data,
  });
}

class NotificationsNotifier extends StateNotifier<List<NotificationMessage>> {
  NotificationsNotifier() : super([]);

  void addNotification(NotificationMessage notification) {
    state = [notification, ...state];
  }

  void clearNotifications() {
    state = [];
  }
}

final notificationsProvider =
    StateNotifierProvider<NotificationsNotifier, List<NotificationMessage>>((ref) {
  return NotificationsNotifier();
});

