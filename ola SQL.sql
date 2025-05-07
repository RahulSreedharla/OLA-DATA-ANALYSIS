SELECT * FROM ola.ola_bookings;

#1. Retrieve all successful bookings:
create view Successfulbooking As
select * from ola.ola_bookings 
where Booking_Status="Success";

#1. Retrieve all successful bookings:
select * from successfulbooking;

#2. Find the average ride distance for each vehicle type:
create view  average_ride_distance_for_each_vehicle as
select Vehicle_Type,avg(Ride_Distance) as avg_dis 
from ola.ola_bookings group by Vehicle_Type;

#2. Find the average ride distance for each vehicle type:
select * from average_ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
create view cancelled_by_customers as
select count(*) from ola.ola_bookings where Booking_Status='Canceled by Customer';

#3. Get the total number of cancelled rides by customers:
select * from cancelled_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view top_fives_customers as
select Customer_Id,count(Booking_Id) as total_rides
from ola.ola_bookings
group by Customer_ID
order by total_rides Desc limit 5; 

#4. List the top 5 customers who booked the highest number of rides:
select * from top_fives_customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view  driver_cancelled_due_to_personal_issues as
select count(*) from ola.ola_bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from driver_cancelled_due_to_personal_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rating_primesedan as
select max(Driver_Ratings),min(Driver_Ratings) from ola.ola_bookings
where Vehicle_Type = 'Prime Sedan';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from max_min_driver_rating_primesedan;

#7. Retrieve all rides where payment was made using UPI:
create view pay_upi as
select * from ola.ola_bookings
where Payment_Method = 'UPI';

#7. Retrieve all rides where payment was made using UPI:
select * from pay_upi;

#8. Find the average customer rating per vehicle type:
create view avg_rating_Vehicle_type as
select Vehicle_Type,avg(Customer_Rating) as Avg_Customer from ola.ola_bookings
group by Vehicle_Type;

#8. Find the average customer rating per vehicle type:
select * from avg_rating_Vehicle_type;

#9. Calculate the total booking value of rides completed successfully:
create view total_booking_rides as 
select sum(Booking_Value) as total_Bookings
from ola.ola_bookings
where Booking_Status = 'Success';

#9. Calculate the total booking value of rides completed successfully:
select * from  total_booking_rides;

#10. List all incomplete rides along with the reason:
create view  incomplete_rides_reasons as
select Booking_ID,Incomplete_Rides_Reason 
from ola.ola_bookings
where Incomplete_Rides = 'Yes';

#10. List all incomplete rides along with the reason:
select * from incomplete_rides_reasons; 
