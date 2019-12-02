using System.Collections.Generic;

namespace Hotel.App
{
    public interface IRoomRepository
    {
        IEnumerable<Room> GetAll();
    }

}