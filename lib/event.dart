
class Event {

  final String title;
  Event(this.title);

  static Map<DateTime, List<Event>> events = {
    DateTime.utc(2023, 6, 2): [Event('title'), Event('title2')],
  };

  static List<Event> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  static void addEvent(DateTime day, String title) {
    final event = Event(title);
    if (events.containsKey(day)) {
      events[day]!.add(event);
    } else {
      events[day] = [event];
    }
  }
}
