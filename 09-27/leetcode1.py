# 729. My Calendar I

class MyCalendar:

    def __init__(self):
        self.events = []

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
