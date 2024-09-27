# 729. My Calendar I

class MyCalendar:

    def __init__(self):
        self.events = []

    def exists_event_before_that_stretches_into_it(self, booking):
        booking_start, booking_end = booking
        for (event_start, event_end) in self.events:
            if event_start < booking_start and event_end > booking_start:
                return True
        return False

    def exists_event_during(self, booking):
        booking_start, booking_end = booking
        for (event_start, event_end) in self.events:
            if booking_start <= event_start < booking_end:
                return True
        return False
            

    def book(self, start: int, end: int) -> bool:
        booking_start, booking_end = start, end
        for (event_start, event_end) in self.events:
            if event_start < booking_start < event_end:
                return False
            elif booking_start <= event_start < booking_end:
                return False
        
        event = (booking_start, booking_end)
        self.events.append(event)
        return True
        

# Your MyCalendar object will be instantiated and called as such:
# obj = MyCalendar()
# param_1 = obj.book(start,end)
