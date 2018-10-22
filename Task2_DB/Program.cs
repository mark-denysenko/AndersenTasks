using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Task2_DB.Models;

namespace Task2_DB
{
    class Program
    {
        static void Main(string[] args)
        {
            Task();

            Console.ReadKey();
        }

        public static void Task()
        {
            using (var db = new ShopDBEntities())
            {
                Task1(db);

                Task2(db);

                Task3(db);

                Task4(db);

                Task5(db);
            }
        }

        public static void Task1(ShopDBEntities db)
        {
            Console.WriteLine(" --- Task 1 ---");

            var query = from order in db.Orders
                        join state in db.States on order.StateId equals state.StateId
                        //where order.State.Name != ... without join
                        where state.Name != "Canceled" && state.Name != "Completed"
                        select new { State = state.Name, ID = order.OrderId, UserName = order.User.FirstName };

            foreach(var row in query)
            {
                Console.WriteLine($"{row.ID} - {row.State} ({row.UserName})");
            }
        }

        public static void Task2(ShopDBEntities db)
        {
            Console.WriteLine(" --- Task 2 ---");

            var query = from order in db.Orders
                        group order by order.State.Name into s
                        select new { State = s.Key, Count = s.Count() };

            foreach (var row in query)
            {
                Console.WriteLine($" {row.State} -  \t{row.Count}");
            }
        }

        public static void Task3(ShopDBEntities db)
        {
            Console.WriteLine(" --- Task 3 ---");

            DateTime currentTime = DateTime.Now;
            DateTime endTime = new DateTime(currentTime.Year, currentTime.Month, 1);
            endTime = currentTime;

            DateTime startTime = new DateTime(currentTime.Year, currentTime.Month, 1).AddMonths(-1);

            Console.WriteLine("" + startTime + " - " + endTime);

            var query = from detail in db.OrderDetails
                        where startTime <= detail.Order.OrderDate && detail.Order.OrderDate <= endTime
                        select new { price = detail.Quantity * detail.Product.UnitPrice, date = detail.Order.OrderDate, id = detail.OrderId };//).Sum(o => o.price);

            //var query = (from detail in db.OrderDetails
            //            where startTime <= detail.Order.OrderDate && detail.Order.OrderDate <= endTime
            //            group detail.Product.UnitPrice * detail.Quantity by detail.OrderId into o
            //            select new { orderId = o.Key, sum = o.Sum() }).Sum(p => p.sum);


            //Console.WriteLine("Orders sum: " + query.Value ?? "null (no orders?)");

            foreach (var rowInfo in query)
            {
                Console.WriteLine("Orders: " + rowInfo.id + " (" + rowInfo.date + ") " + "sum: " + rowInfo.price);
            }

            Console.WriteLine("Total sum: " + query.Sum(p => p.price).Value); 
        }

        public static void Task4(ShopDBEntities db)
        {
            Console.WriteLine(" --- Task 4 ---");

            var query = (from product in db.Products
                        join mark in db.Marks on product.ProductId equals mark.ProductId
                        let m = (int)mark.Mark1
                        group m by product.ProductName into p
                        orderby p.Average() descending
                        select new { Name = p.Key, AverageMark = p.Average() }).Take(10);

            // If uncomment - need change query.
            foreach (var row in query) //.Take(10)) 
            {
                Console.WriteLine($" {row.Name} : {row.AverageMark}");
            }
        }

        public static void Task5(ShopDBEntities db)
        {
            Console.WriteLine(" --- Task 5 ---");

            var query = from product in db.Products
                        where product.UnitPrice >= (db.Products.OrderByDescending(p => p.UnitPrice).FirstOrDefault()).UnitPrice
                        select product;

            var query2 = (from product in db.Products
                          group product.ProductName by product.UnitPrice into p
                          orderby p.Key descending
                          select p).Take(1);

            Console.WriteLine(" - query1 ");
            foreach (var row in query)
            {
                Console.WriteLine($" {row.ProductName} - {row.UnitPrice}");
            }

            Console.WriteLine(" - query2 ");
            foreach (var row in query2)// .SelectMany(p => p))
            {
                foreach (var name in row.Select(p => p))
                {
                    Console.WriteLine("" + name + " - " + row.Key);
                }
            }
        }
    }
}
