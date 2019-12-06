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
            Assert.True(r.Number == 237);
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
        public void AddNewReservation_should_room_is_not_reserved_if_the_date_is_not_in_the_range()
        {
            DateTime from = new DateTime(2010, 04, 09);

            Room r = new FamilyRoom(237);
            r.AddNewReservation(from, from.AddDays(7), 1);

            bool isReserved = r.IsReserved(new DateTime(2010, 11, 28));
            Assert.False(isReserved);
        }

        [Fact]
        public void AddNewReservation__multiple_should_set_room_reserved_if_the_date_is_within_the_range()
        {
            DateTime from1 = new DateTime(2010, 04, 09);
            DateTime from2 = new DateTime(2010, 11, 28);

            Room r = new FamilyRoom(237);
            r.AddNewReservation(from1, from1.AddDays(7), 1);
            r.AddNewReservation(from2, from2.AddDays(14), 1);

            bool isReserved = r.IsReserved(new DateTime(2010, 04, 11));
            Assert.True(isReserved);
        }


        [Fact]
        public void AddNewReservation_multiple_should_room_is_not_reserved_if_the_date_is_not_in_the_range()
        {
            DateTime from1 = new DateTime(2010, 04, 09);
            DateTime from2 = new DateTime(2010, 11, 28);

            Room r = new FamilyRoom(237);
            r.AddNewReservation(from1, from1.AddDays(7), 1);
            r.AddNewReservation(from2, from2.AddDays(14), 1);

            bool isReserved = r.IsReserved(new DateTime(2010, 05, 29));
            Assert.False(isReserved);
        }
    }
}
