using System;
using System.Collections.Generic;
using System.Linq;
using Hotel.App;
using Moq;
using Xunit;

namespace Hotel.Tests
{
    public class RoomTest
    {
        [Fact]
        public void CreateRoom_should_set_room_number()
        {
            Room r = new FamilyRoom(237);
            Assert.True(r.Number ==  237);
        }

        [Fact]
        public void AddNewReservation_should_set_room_reserved_if_the_date_is_within_the_range()
        {
            DateTime from = new DateTime(2010, 04, 09);
            
            Room r = new FamilyRoom(237);
            r.AddNewReservation(from, from.AddDays(7), 1);

            bool isReserved = r.IsReserved(new DateTime(2010, 04, 11));
            Assert.True(isReserved);
        }

        [Fact]
        public void AddNewReservation_should_room__is_not_reserved_if_the_date_is_not_in_the_range()
        {
            DateTime from = new DateTime(2010, 04, 09);
            
            Room r = new FamilyRoom(237);
            r.AddNewReservation(from, from.AddDays(7), 1);

            bool isReserved = r.IsReserved(new DateTime(2010, 11, 28));
            Assert.False(isReserved);
        }
    }
}
