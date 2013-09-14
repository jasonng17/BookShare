== README

Welcome to BookShare application
Submitted by: Jason Ng Changwei, MSIT-IS

The following Functions/Features are tested to be working
1. User Login/Logout
2. User Sign Up
3. Homepage
4. POST a new book that "belongs_to" the user
5. DISPLAY list of user's book 
6. SEARCH for books
7. LIST fellow users (aka BookShare Friends)



== Controllers
1. Session Controller
Handles user login/logout and user session key
2. 


==Deliverable Check-list

1. Create at least two controllers and two models that are related to each other. (i.e. there is foreign key or join table between the two.)
> The user and book models/controllers are related to each other.

2. Use migrations to incrementally build your database. Because you are working by yourself, it is tempting to just use on migration file and keep altering it until it is "perfect." Instead, use multiple migrations just as if you were on a team of developers.
> Refer to migration files to observe how incremental migrations were performed.

3. Write unit, functional, and integration tests for the more interesting parts of your system. We don't expect 100% code coverage.
> Pending

4. Have one AJAX operation.
> When adding an item to cart, AJAX call is made to line_item#create which automatically updates the cart with the new item. 

5. Have one REST API and be able to test it with an XML request
> Created REST API for users under controllers/api folder. The API uses XML format to handle requests.

==Acknowledgement
Consulted TA, Jiasi on link issues for homepage.
Referenced Agile Web Development with Rails 3.2
Referenced Railscasts


