using System;
using System.Collections.Generic;
using System.Linq;

namespace Hotel.App
{
    public class BookingEngine
    {
        private IRoomRepository _roomRepository;

        public BookingEngine(IRoomRepository roomRepository)
        {
            _roomRepository = roomRepository;
        }

        public IEnumerable<Room> CheckAvailabilty(DateTime from, DateTime to, int adults, int children)
        {
            IEnumerable<Room> rooms = _roomRepository.GetAll();
            
            return rooms.Where(r => !r.IsReserved(from, to));

        }
    }
}
