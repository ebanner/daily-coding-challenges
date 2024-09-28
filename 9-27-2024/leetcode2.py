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
    overlaps = []
    for (event_start, event_end) in events:
        if event_start <= booking_start < event_end:
            overlap = (booking_start, event_end)
            overlaps.append(overlap)
        if booking_start <= event_start < booking_end:
            overlap = (event_start, booking_end)
            overlaps.append(overlap)
    return overlaps

class MyCalendarTwo:

    def __init__(self):
        self.events = []
        self.double_bookings = []

    def book(self, start: int, end: int) -> bool:
        booking = (start, end)
        causes_triple_booking = causes_double_booking
        if causes_triple_booking(booking, self.double_bookings):
            print(self.double_bookings)
            return False

        if causes_double_booking(booking, self.events):
            overlaps = get_overlap(booking, self.events)
            self.double_bookings.extend(overlaps)

        self.events.append(booking)
        print(self.double_bookings)
        return True


# Your MyCalendarTwo object will be instantiated and called as such:
# obj = MyCalendarTwo()
# param_1 = obj.book(start,end)
