## About the project Create and Read Payload Task

   This is a project to create JSON payload of available posts for the user following and can viewed only by authenticated users and also from the created payload post data has saved in new table as comma separated user Ids

** Step1 ** 
	Create tables for sample data which are users, posts, users_viewed, users_shared, users_ratings and users_comments and made the sample entries from the JSON sample by using migration 
	
	- php artisan migrate

** Step2 ** 
	Download and install laravel/passport and config the needed files
	In my local system laravel passport client name as Laravel Personal Access Client can create tokens
    - composer require laravel/passport  --with-all-dependencies

** Step3 **
	- routes\api.php
	Create api routes for register and login 

Before start to execute the urls in post man run the command to running the server on local host
- php artisan serve
  
** Step4 ** 

	- [Register, register the user details ](http://localhost:8000/api/register).
	
	- App\Http\Controllers\API\RegisterController => register

	# Parameters
		+ name
		+ email
		+ password
		+ confirm Password
		+ about
		+ business_about
  
** Step 5 **

	- [Login, login with credentials like authorization token ](http://localhost:8000/api/login).

	- App\Http\Controllers\API\RegisterController => login

	# Parameters
		+ email
		+ password
		+ headers of Authorization along with Bearer token is needed (Which is created at the time of Register)

** Step6 **
	- App\Http\Controllers\API\PostsController => index

 	Create payload for the authenticated user by using user id 

	- [Posts, Post data will be retrived for the authenticated user ](http://localhost:8000/api/posts/{user_id}).

	Payload will be included the data of post , Users viewed, Users Rated, Users Shared and Users commented
	
** Step7 ** 

	- App\Http\Controllers\API\PostsController => savePostData

	Save the Post data which is the JSON payload input

	- [Save Post Data, Post data will be saved in new tables ](http://localhost:8000/api/saveData).

	  + Table 1 => post_data, which is having the columns of post_id, User_viewed, users_rated, users_shared, users_commented and all thosde columns having comma separated user_idsfor each posts

	  + Table 2 => user_language_data, which is having the columns of user_id and language for each user their languages are saved in comma separated















