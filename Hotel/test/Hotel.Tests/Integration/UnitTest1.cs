using System;
using System.Collections.Generic;
using System.Linq;
using Hotel.App;
using Moq;
using Xunit;

namespace Hotel.Tests
{
    public class UnitTest1
    {
        [Fact]
        public void CheckAvailability_no_match_should_not_return_rooms()
        {
            IEnumerable<Room> roomsList = new List<Room>{};
            
            Mock<IRoomRepository> roomRepository = new Mock<IRoomRepository>();
            roomRepository.Setup(r => r.GetAll()).Returns(roomsList);
            

            BookingEngine be = new BookingEngine(roomRepository.Object);
            DateTime from = new DateTime(2019, 04, 01);
            DateTime to = new DateTime(2019, 04, 01);

            int adults = 2;
            int children = 1;
            
            IEnumerable<Room> rooms = be.CheckAvailabilty(from, to, adults, children);

            Assert.True(rooms.Count() == 0);
        }

        [Fact]
        public void CheckAvailability_one_match_should_return_one_room()
        {
            IEnumerable<Room> roomsList = new List<Room>{
                new FamilyRoom(237)
            };
            
            Mock<IRoomRepository> roomRepository = new Mock<IRoomRepository>();
            roomRepository.Setup(r => r.GetAll()).Returns(roomsList);
            

            BookingEngine be = new BookingEngine(roomRepository.Object);
            DateTime from = new DateTime(2019, 04, 01);
            DateTime to = new DateTime(2019, 04, 01);

            int adults = 2;
            int children = 1;
            
            IEnumerable<Room> rooms = be.CheckAvailabilty(from, to, adults, children);

            Assert.True(rooms.Count() == 0);
        }
    }
}
