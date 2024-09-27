# 731. My Calendar II

def causes_double_booking(booking, events):
    booking_start, booking_end = booking
    for (event_start, event_end) in events:
        if event_start <= booking_start < event_end:
            return True
        if booking_start <= event_start < booking_end:
            return True
    return False


def get_overlap(booking, events):
    booking_start, booking_end = booking
    for (event_start, event_end) in events:
        if event_start <= booking_start < event_end:
            return (booking_start, event_end)
        if booking_start <= event_start < booking_end:
            return (event_start, booking_end)

class MyCalendarTwo:

    def __init__(self):
        self.events = []
        self.double_bookings = []

    def book(self, start: int, end: int) -> bool:
        booking = (start, end)
        if causes_double_booking(booking, self.double_bookings):
            return False

        if causes_double_booking(booking, self.events):
            overlap = get_overlap(booking, self.events)
            self.double_bookings.append(overlap)

        self.events.append(booking)
        return True


# Your MyCalendarTwo object will be instantiated and called as such:
# obj = MyCalendarTwo()
# param_1 = obj.book(start,end)
