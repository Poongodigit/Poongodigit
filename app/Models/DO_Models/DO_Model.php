<?php
namespace App\Models\DO_Models;
use App\Models\User;
use App\Models\UsersViewed;
use App\Http\Controllers\Controller;
use DB;

class DO_Model
{
    /* Function to return all the posts for the authenticated user */
    public function getPostsDataArray(){
        $sql = "SELECT * FROM posts ";
           
        $postsDetails =  DB::select($sql);

        $postsDetails = collect($postsDetails)->map(function($x){ return (array) $x; })->toArray();

        return $postsDetails;
    }

    /* Function to return user details buy using user_id */
    public function getUserDataArray($user_id)
    {
        $sql = "SELECT * FROM users WHERE id IN ('".$user_id."') ";
           
        $userDetails =  DB::select($sql);

        $userDetails = collect($userDetails)->map(function($x){ return (array) $x; })->toArray();

        return $userDetails;
    }

    /* Function to return Ratings for the posts for the particular post and user */
    public function getUserRatingsDataArray($user_id,$post_id)
    {
        $sql = "SELECT * FROM users_ratings WHERE user_id = '".$user_id."' AND post_id = '".$post_id."' ";
       
        $ratingDetails =  DB::select($sql);

        $ratingDetails = collect($ratingDetails)->map(function($x){ return (array) $x; })->toArray();

        return $ratingDetails; 

    }

    /*function to return the array for user details to prepare payload  */
    public function getLoggedinUserDataArray($user_id)
    {
        $userDataResponseArray = array();

        $userData = $this->getUserDataArray($user_id);

        if(!empty($userData) && isset($userData[0]))    
        {
            $userDataResponseArray[] = array("id" => $userData[0]['id'],
                                            "name" => $userData[0]['name'],
                                            "profile_pic"=>$userData[0]['profile_pic'],
                                            "language" => $userData[0]['language'],
                                            "business_about" => $userData[0]['business_about']);
        }

        return $userDataResponseArray;
    }

    /* Function to return the payload JSOn data of user_viewed posts */
    public function getUserViewedDataArray($post_id)
    {
        $userViewedDataResponseArray = array();
        $userIDPostData = array();

        $sql1 = "SELECT user_id
				FROM users_viewed
				WHERE post_id = '".$post_id."'
				";

		$userData =  DB::select($sql1);

        $userData = collect($userData)->map(function($x){ return (array) $x; })->toArray(); 
       
        if(!empty($userData) && isset($userData[0]))    
        {
            $user_id = array_column($userData,"user_id");
            $user_id = array_values($user_id);
            
            if(count($user_id) > 1)
            {
                $user_id_str = implode("','",$user_id);
                
                $userDetails = $this->getUserDataArray($user_id_str);
                
                foreach($userDetails as $users){

                    $ratingDetails = $this->getUserRatingsDataArray($users['id'],$post_id);
                    $userViewedDataResponseArray[] = array("id" => $users['id'],
                                                "name" => $users['name'],
                                                "profile_pic"=>$users['name'],
                                                "language" => json_decode($users['language']),
                                                "about" => $users['about'],
                                                "business_about" => $users['business_about'],
                                                "rating" => (isset($ratingDetails[0]['rating'])) && $ratingDetails[0]['rating'] != null  ? $ratingDetails[0]['rating'] : "",
                                                "no_rating" => (isset($ratingDetails[0]['no_rating']) && $ratingDetails[0]['no_rating'] != null) ? $ratingDetails[0]['no_rating'] : "",
                                            );
                }

                /* Users Viewes Id's to store the post data  */
                $user_id = array_column($userDetails, "id");
                $user_id = array_values($user_id);
                $userIDStr = implode(",",$user_id);
                $userIDPostData = $userIDStr;
                
            }
            else{

                $userDetails = $this->getUserDataArray($user_id[0]);
              
                $ratingDetails = $this->getUserRatingsDataArray($user_id[0],$post_id);
                
                $userViewedDataResponseArray[] = array("id" => $userDetails[0]['id'],
                                                "name" => $userDetails[0]['name'],
                                                "profile_pic"=>$userDetails[0]['name'],
                                                "language" => json_decode($userDetails[0]['language']),
                                                "about" => $userDetails[0]['about'],
                                                "business_about" => $userDetails[0]['business_about'],
                                                "rating" => (isset($ratingDetails[0]['rating'])) && $ratingDetails[0]['rating'] != null  ? $ratingDetails[0]['rating'] : "",
                                                "no_rating" => (isset($ratingDetails[0]['no_rating']) && $ratingDetails[0]['no_rating'] != null) ? $ratingDetails[0]['no_rating'] : "",
                                            );
                
                /* Users Viewed Id's to store the post data  */
                $user_id = array_column($userDetails, "id");
                $user_id = array_values($user_id);
                $userIDPostData = $user_id[0];

            }
            
        }
        
        return array("userViewedDataResponseArray" => $userViewedDataResponseArray,"user_id" => $userIDPostData);

    }

    /* Function to return the payload JSOn data for user shared posts */
    public function getUserSharedDataArray($post_id)
    {
        $userSharedDataResponseArray = array();
        $userIDPostData = array();

        $sql1 = "SELECT user_id
				FROM users_shared
				WHERE post_id = '".$post_id."'
				";

		$userData =  DB::select($sql1);

        $userData = collect($userData)->map(function($x){ return (array) $x; })->toArray(); 
        
        if(!empty($userData) && isset($userData[0]))    
        {
            $user_id = array_column($userData,"user_id");
            $user_id = array_values($user_id);
            
            if(count($user_id) > 1)
            {
                $user_id_str = implode("','",$user_id);
                
                $userDetails = $this->getUserDataArray($user_id_str);
                
                foreach($userDetails as $users){

                    $ratingDetails = $this->getUserRatingsDataArray($users['id'],$post_id);
                    $userSharedDataResponseArray[] = array("id" => $users['id'],
                                                "name" => $users['name'],
                                                "profile_pic"=>$users['name'],
                                                "language" => json_decode($users['language']),
                                                "about" => $users['about'],
                                                "business_about" => $users['business_about'],
                                                "rating" => (isset($ratingDetails[0]['rating'])) && $ratingDetails[0]['rating'] != null  ? $ratingDetails[0]['rating'] : "",
                                                "no_rating" => (isset($ratingDetails[0]['no_rating']) && $ratingDetails[0]['no_rating'] != null) ? $ratingDetails[0]['no_rating'] : "",
                                            );
                }

                /* Users shared Id's to store the post data  */
                $user_id = array_column($userDetails, "id");
                $user_id = array_values($user_id);
                $userIDStr = implode(",",$user_id);
                $userIDPostData = $userIDStr;
                
            }
            else{

                $userDetails = $this->getUserDataArray($user_id[0]);
              
                $ratingDetails = $this->getUserRatingsDataArray($user_id[0],$post_id);
                
                $userSharedDataResponseArray[] = array("id" => $userDetails[0]['id'],
                                                "name" => $userDetails[0]['name'],
                                                "profile_pic"=>$userDetails[0]['name'],
                                                "language" => json_decode($userDetails[0]['language']),
                                                "about" => $userDetails[0]['about'],
                                                "business_about" => $userDetails[0]['business_about'],
                                                "rating" => (isset($ratingDetails[0]['rating'])) && $ratingDetails[0]['rating'] != null  ? $ratingDetails[0]['rating'] : "",
                                                "no_rating" => (isset($ratingDetails[0]['no_rating']) && $ratingDetails[0]['no_rating'] != null) ? $ratingDetails[0]['no_rating'] : "",
                                            );

                /* Users shared Id's to store the post data  */
                $user_id = array_column($userDetails, "id");
                $user_id = array_values($user_id);
                $userIDPostData = $user_id[0];

            }

        }
        

        return array("userSharedDataResponseArray" => $userSharedDataResponseArray,"user_id" => $userIDPostData);

    }

    /* Function to return the payload JSOn data for user rated posts */
    public function getUserRatedDataArray($post_id)
    {
        $userRatedDataResponseArray = array();
        $userIDPostData = array();

        $sql1 = "SELECT *
				FROM users_ratings
				WHERE post_id = '".$post_id."'
				";

		$ratingData =  DB::select($sql1);

        $ratingData = collect($ratingData)->map(function($x){ return (array) $x; })->toArray(); 
        
        if(!empty($ratingData) && isset($ratingData[0]))    
        {
            $user_id = array_column($ratingData,"user_id");
            $user_id = array_values($user_id);
            
            if(count($user_id) > 1)
            {
                $user_id_str = implode("','",$user_id);
                
                $userDetails = $this->getUserDataArray($user_id_str);
                
                foreach($userDetails as $users){

                    $ratingDetails = $this->getUserRatingsDataArray($users['id'],$post_id);
                    $userRatedDataResponseArray[] = array("id" => $users['id'],
                                                "name" => $users['name'],
                                                "profile_pic"=>$users['name'],
                                                "language" => json_decode($users['language']),
                                                "about" => $users['about'],
                                                "business_about" => $users['business_about'],
                                                "rating" => (isset($ratingData[0]['rating'])) && $ratingData[0]['rating'] != null  ? $ratingData[0]['rating'] : "",
                                                "no_rating" => (isset($ratingData[0]['no_rating']) && $ratingData[0]['no_rating'] != null) ? $ratingData[0]['no_rating'] : "",
                                            );
                }

                /* Users Rated Id's to store the post data  */
                $user_id = array_column($userDetails, "id");
                $user_id = array_values($user_id);
                $userIDStr = implode(",",$user_id);
                $userIDPostData = $userIDStr;
                
            }
            else{

                $userDetails = $this->getUserDataArray($user_id[0]);
                
                $userRatedDataResponseArray[] = array("id" => $userDetails[0]['id'],
                                                "name" => $userDetails[0]['name'],
                                                "profile_pic"=>$userDetails[0]['name'],
                                                "language" => json_decode($userDetails[0]['language']),
                                                "about" => $userDetails[0]['about'],
                                                "business_about" => $userDetails[0]['business_about'],
                                                "rating" => (isset($ratingData[0]['rating'])) && $ratingData[0]['rating'] != null  ? $ratingData[0]['rating'] : "",
                                                "no_rating" => (isset($ratingData[0]['no_rating']) && $ratingData[0]['no_rating'] != null) ? $ratingData[0]['no_rating'] : "",
                                            );

                /* Users Rated Id's to store the post data  */
                $user_id = array_column($userDetails, "id");
                $user_id = array_values($user_id);
                $userIDPostData = $user_id[0];

            }

        }

        return array("userRatedDataResponseArray" => $userRatedDataResponseArray,"user_id" => $userIDPostData);
    }

    /* Function to return the payload JSOn data for user comments for posts */
    public function getUserCommentsDataArray($post_id)
    {
        $userCommentsDataResponseArray = array();
        $userIDPostData = array();

        $sql1 = "SELECT *
				FROM users_comments
				WHERE post_id = '".$post_id."'
				";

		$commentsData =  DB::select($sql1);

        $commentsData = collect($commentsData)->map(function($x){ return (array) $x; })->toArray(); 
        
        if(!empty($commentsData) && isset($commentsData[0]))    
        {
            $user_id = array_column($commentsData,"user_id");
            $user_id = array_values($user_id);
            
            if(count($user_id) > 1)
            {
                $user_id_str = implode("','",$user_id);
                
                $userDetails = $this->getUserDataArray($user_id_str);
                
                foreach($userDetails as $users){

                    $ratingDetails = $this->getUserRatingsDataArray($users['id'],$post_id);
                    $userCommentsDataResponseArray[] = array("id" => $users['id'],
                                                "name" => $users['name'],
                                                "profile_pic"=>$users['name'],
                                                "language" => json_decode($users['language']),
                                                "about" => $users['about'],
                                                "business_about" => $users['business_about'],
                                                "rating" => (isset($ratingDetails[0]['rating'])) && $ratingDetails[0]['rating'] != null  ? $ratingDetails[0]['rating'] : "",
                                                "no_rating" => (isset($ratingDetails[0]['no_rating']) && $ratingDetails[0]['no_rating'] != null) ? $ratingDetails[0]['no_rating'] : "",
                                            );
                }

                /* Users Comments Id's to store the post data  */
                $user_id = array_column($userDetails, "id");
                $user_id = array_values($user_id);
                $userIDStr = implode(",",$user_id);
                $userIDPostData = $userIDStr;
                
            }
            else{

                $userDetails = $this->getUserDataArray($user_id[0]);
              
                $ratingDetails = $this->getUserRatingsDataArray($user_id[0],$post_id);
                
                $userCommentsDataResponseArray[] = array("id" => $userDetails[0]['id'],
                                                "name" => $userDetails[0]['name'],
                                                "profile_pic"=>$userDetails[0]['name'],
                                                "language" => json_decode($userDetails[0]['language']),
                                                "about" => $userDetails[0]['about'],
                                                "business_about" => $userDetails[0]['business_about'],
                                                "rating" => (isset($ratingDetails[0]['rating'])) && $ratingDetails[0]['rating'] != null  ? $ratingDetails[0]['rating'] : "",
                                                "no_rating" => (isset($ratingDetails[0]['no_rating']) && $ratingDetails[0]['no_rating'] != null) ? $ratingDetails[0]['no_rating'] : "",
                                            );

            }

            /* Users Comments Id's to store the post data  */
            $user_id = array_column($userDetails, "id");
            $user_id = array_values($user_id);
            $userIDPostData = $user_id[0];
        }

        return array("userCommentsDataResponseArray" => $userCommentsDataResponseArray,"user_id" => $userIDPostData);

    }

    public function deleteOldEntries($postIds)
    {
        $sql = "DELETE FROM post_data WHERE post_id IN ('".$postIds."') ";
           
        DB::select($sql);

    }

    public function getUserPostData($post_id)
    {
        $sql = "SELECT * FROM post_data WHERE post_id = '".$post_id."' ";

		$Data =  DB::select($sql);

        $Data = collect($Data)->map(function($x){ return (array) $x; })->toArray(); 

        return $Data;
    }

    public function getUserLanguage($user_id)
    {
        $sql = "SELECT * FROM user_language_data WHERE user_id = '".$user_id."' ";

		$Data =  DB::select($sql);

        $Data = collect($Data)->map(function($x){ return (array) $x; })->toArray(); 

        return $Data;
    }
    
}