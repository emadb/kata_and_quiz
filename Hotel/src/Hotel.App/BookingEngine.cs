using System;
using System.Collections.Generic;

namespace Hotel.App
{
    public class BookingEngine
    {
        private IRoomRepository roomRepository;

        public BookingEngine(IRoomRepository roomRepository)
        {
            this.roomRepository = roomRepository;
        }

        public IEnumerable<Room> CheckAvailabilty(DateTime from, DateTime to, int adults, int children)
        {
            return new List<Room>();
        }
    }
}
