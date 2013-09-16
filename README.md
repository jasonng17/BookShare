#WELCOME TO BOOKSHARE APPLICATION
> Created by: Jason Ng Changwei, MSIT-IS

##DELIVERABLES CHECKLIST

1. Create at least two controllers and two models that are related to each other. (i.e. there is foreign key or join table between the two.)
> The user and book models/controllers are related to each other. Observe db.schema for foreign key.

2. Use migrations to incrementally build your database. Because you are working by yourself, it is tempting to just use on migration file and keep altering it until it is "perfect." Instead, use multiple migrations just as if you were on a team of developers.
> Refer to migration files under db folder to observe how incremental migrations were performed.

3. Write unit, functional, and integration tests for the more interesting parts of your system. We don't expect 100% code coverage.
> Functional test written for user and book controllers
> Unit test written for user model
> Integration test written to simulate add_items to cart 

4. Have one AJAX operation.
> When adding an item to cart, AJAX call is made to line_item#create which automatically updates the cart with the new item. 

5. Have one REST API and be able to test it with an XML request
> Created REST API for users under controllers/api folder. The API uses XML format to handle requests.

##Features overview
The following Functions/Features are tested to be working
> 1. User Login/Logout
> 2. User Sign Up
> 3. Homepage
> 4. POST a new book that "belongs_to" the user
> 5. DISPLAY list of user's book 
> 6. SEARCH for books
> 7. Add book to cart
> 8. Empty cart
> 9. LIST fellow users (aka BookShare Friends)

##CONTROLLERS

1. Application Controller
- Defines current_user
- Defines current_cart methods which is being used by cart and line_item controllers

2. Session Controller
- Handles login/logout
- Creates user session key if authenticated 
- Destroys user session key upon log-out
- Re-direct authenticated user to pages#home

3. Pages Controller
- Homepage

4. Books Controller
- Handles RESTful requests for book object

5. Users Controller
- Handles RESTful requests for user object

6. Catalog Controller
- calls **SEARCH** method stored in book model when user search for a book
- send AJAX request to add_items#CREATE when user clicks on "add to cart" 
- renders cart partial in cart controller

7. Line_items Controller
- Handles RESTful requests for line_item object
- Handles AJAX request sent from catalog/index.html to create method. 
- Create method will process AJAX request and then render create.js.erb template which will update the cart partial in catalog/index.html

8. Cart Controller
- Handles "Empty Cart" request from cart partial
- Handles CREATE cart request from current_cart method in application controller

##MODELS

1. Book model
- Handles processes to ActiveRecord
- Handles **SEARCH** request by searching in ActiveRecord
- Handles relationship with users and line items and communicates to ActiveRecord

2. Cart model
- Handles relationship with line_items and communicates to ActiveRecord

3. Line_item model
- Handles relationship with cart and book and communicates to ActiveRecord

4. User model
- Handles relationship with book
- Validates that user has unique email 

##ACKNOWLEDGEMENT/CITATIONS
> Consulted TA, Jiasi on link issues for homepage.
> Referenced Agile Web Development with Rails 3.2
> Referenced Railscasts


