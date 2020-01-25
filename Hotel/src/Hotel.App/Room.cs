using System;
using System.Collections.Generic;
using System.Linq;

namespace Hotel.App 
{
    public abstract class Room
    {
        private IList<Reservation> _reservations; 
        public int Number { get; private set; }
        
        public Room(int number)
        {
            Number = number;
            _reservations = new List<Reservation>();
        }

        public void AddNewReservation(DateTime from, DateTime to, int persons)
        {
            _reservations.Add(new Reservation(from, to, persons));
        }

        public bool IsReserved(DateTime date)
        {
            return IsReserved(date, date);
        }

        public bool IsReserved(DateTime from, DateTime to)
        {
            return _reservations.Any(r => r.IsOverlapped(from, to));
        }
    }

    public class FamilyRoom : Room
    {
        public FamilyRoom(int number) : base(number)
        {
        }
    }

    internal class Reservation
    {
        private DateTime from;
        private DateTime to;
        private int persons;

        public Reservation(DateTime from, DateTime to, int persons)
        {
            this.from = from;
            this.to = to;
            this.persons = persons;
        }

        public bool Contains(DateTime date)
        {
            return from <= date && to >= date;
        }

        public bool IsOverlapped(DateTime from, DateTime to)
        {
            return this.from < to && from < this.to;
        }
    }
}