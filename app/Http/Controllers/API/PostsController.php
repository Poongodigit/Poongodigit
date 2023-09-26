<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use App\Models\Posts;
use App\Models\UsersViewed;
use App\Models\PostData;
use App\Models\UserLanguageData;
use Illuminate\Http\Request;
use App\Http\Controllers\API\Controller;
use App\Http\Controllers\API\MainController as MainController;
use App\Http\Resources\Post as PostResource;
use App\Models\API_Models\API_Model;
use App\Models\DO_Models\DO_Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use DB;

class PostsController extends MainController
{
    /* Ddefine models for Data objects and API */

    public function __construct()
    {
        $this->DO_Model = new DO_Model();   // DO model is used to get data from DB //
        $this->API_Model = new API_Model();  //API model is used to execute the API //
    }

    /**
    * Display a listing of the resource.
    *
    * @return \Illuminate\Http\Response
    */

    /* Function for creating payload as per requirement */
    public function index($user_id)
    {
        /* Get user details from users table */
        $userDetails = $this->DO_Model->getUserDataArray($user_id);
        
        if(!empty($userDetails) && isset($userDetails[0]))
        {
            $token = $userDetails[0]['remember_token'];
            /* Initialising all needed arrays */
            $posts_data = array();
            $following_user_post = array();
            $loggedin_user_data = array();
            $user_viewed = array();
            $users_rated = array();
            $users_shared = array();
            $users_comments = array();
            $user_viewedPostData = array();
            $i = 0;
            /* Data array from posts table */
            $posts_data = $this->DO_Model->getPostsDataArray();
           
            /* Looping the data array for all posts to create payload*/

            /* Data from users table for the user who has logged in  */
            $loggedin_user_data = $this->DO_Model->getLoggedinUserDataArray($user_id);

            if(!empty($posts_data))
            {
                foreach($posts_data as $data)
                {
                    /* Data from users_viewed table */
                    $user_viewed[] = $this->DO_Model->getUserViewedDataArray($data['id']);
                    /* Data from users_rated table */
                    $users_rated[] = $this->DO_Model->getUserRatedDataArray($data['id']);
                    /* Data from users_viewed table */
                    $users_shared[] = $this->DO_Model->getUserSharedDataArray($data['id']);
                    /* Data from users_comments table */
                    $users_comments[] = $this->DO_Model->getUserCommentsDataArray($data['id']);
                    /* Payload preparation for all extraccted data */
                    $following_user_post[] = array("post_id"=>$data['id'],
                                            "user_id"=>$user_id, 
                                            "text" => $data['text'],
                                            "uploaded_on" => $data['created_at'],
                                            "active" => $data['active'],
                                            "text_color" => $data['text_color'],
                                            "bg_color" => $data['bg_color'],
                                            "symbol" => $data['symbol'],
                                            "emotion_text" => $data['emotion_text'],
                                            "emotion_bg_color" => $data['emotion_bg_color'],
                                            "ratings" => $data['ratings'],
                                            "total_rating" => $data['total_rating'],
                                            "loggedin_user_data" => $loggedin_user_data,
                                            "user_viewed" => (isset($user_viewed[$i]['userViewedDataResponseArray']) && $user_viewed[$i]['userViewedDataResponseArray']) ? $user_viewed[$i]['userViewedDataResponseArray'] : "",
                                            "users_rated" => (isset($users_rated[$i]['userRatedDataResponseArray']) && $users_rated[$i]['userRatedDataResponseArray']) ? $users_rated[$i]['userRatedDataResponseArray'] : "",
                                            "users_shared" => (isset($users_shared[$i]['userSharedDataResponseArray']) && $users_shared[$i]['userSharedDataResponseArray']) ? $users_shared[$i]['userSharedDataResponseArray'] : "",
                                            "users_comments" => (isset($users_comments[$i]['userCommentsDataResponseArray']) && $users_comments[$i]['userCommentsDataResponseArray']) ? $users_comments[$i]['userCommentsDataResponseArray'] : "",
                                            "total_comments" => count($users_comments),
                                            "total_views" => count($users_comments),
                                            "total_shared" => count($users_shared),
                                            );
                    
                    /* User ID preparation to store post data using json payload */
                    $userviewedPostData[] = array("post_id"=> $data['id'],"user_id" => $user_viewed[$i]['user_id']);
                    $userRatedPostData[] = array("post_id"=> $data['id'],"user_id" => $users_rated[$i]['user_id']);
                    $userSharedPostData[] = array("post_id"=> $data['id'],"user_id" => $users_shared[$i]['user_id']);
                    $userCommentsPostData[] = array("post_id"=> $data['id'],"user_id" => $users_comments[$i]['user_id']);

                    $i++;
                }
               
                $responseArray[] = array("status"=>"success",
                                        "following_user_post"=>$following_user_post,
                                    );
                
                $saveData = $this->saveData($userviewedPostData,$userRatedPostData,$userSharedPostData,$userCommentsPostData,$posts_data);
                return json_encode($responseArray);
            }
            else{
                return $this->sendError('Data not available.', ['error'=>'Data error']);
            }
        }
        else{
            return $this->sendError('User details is not available', ['error'=>'Data error']);
        }
       
    }

    /* Test function to save user ids from json data without use it as payload */
    public function saveData($user_viewed,$users_rated,$users_shared,$users_comments,$posts_data)
    {

        $postIds = array_column($posts_data, 'id');
        $postIds = array_values($postIds);
        $postIDStr = implode("','",$postIds);

        $oldEntries = $this->DO_Model->deleteOldEntries($postIDStr);

        $i = 0;
        foreach($posts_data as $posts)
        {
            $post = new PostData;
            $post->post_id = $posts['id'];
            $post->user_viewed = (isset($user_viewed[$i]['user_id']) && $user_viewed[$i]['user_id'] != "") ? $user_viewed[$i]['user_id'] : "";
            $post->users_commented = (!empty($users_comments[$i]['user_id']) && isset($users_comments[$i]['user_id']) && $users_comments[$i]['user_id'] != "") ? $users_comments[$i]['user_id'] : "";
            $post->users_rated = (!empty($users_rated[$i]['user_id']) && isset($users_rated[$i]['user_id']) && $users_rated[$i]['user_id'] != "") ? $users_rated[$i]['user_id'] : "";
            $post->users_shared = (!empty($users_shared[$i]['user_id']) && isset($users_shared[$i]['user_id']) && $users_shared[$i]['user_id'] != "") ? $users_shared[$i]['user_id'] : "";
            $post->save();
            $i++;
        }
        
    }

    public function savePostData(Request $request)
    {
        /* Save data in table 1 */
        $postData = $request->all();
        
        /*Get arrays to save the user_ids */
        $data = array_column($postData, "following_user_post");
        $data = array_values($data);

        /*form array to get post ids */
        $postDataArray = call_user_func_array('array_merge', $data);

        $postIDArray = array_column($postDataArray, "post_id");
        $postIDArray = array_values($postIDArray);

        $postIDStr = implode("','",$postIDArray);
    
        foreach($data as $Data)
        {
            foreach($Data as $saveData )
            {
                $viewed_users = NULL;
                $commented_users = NULL;
                $rated_users = NULL;
                $shared_users = NULL;
                $post_id = $saveData['post_id'];

                /* viewed users id array preparation */
                $user_viewed = $saveData['user_viewed'];
                $user_viewed_array[] = $saveData['user_viewed'];

                if(!empty($user_viewed)){
                    $viewed_users_array = array_column($user_viewed,"id");
                    $viewed_users_array = array_values($viewed_users_array);
                    $viewed_users = $viewed_users_array[0];
                    
                    if(count($viewed_users_array) > 1){
                        $viewed_users = implode(",",$viewed_users_array);
                    }
                }

                /* rated users id array preparation */
                $user_rated = $saveData['users_rated'];
                $user_rated_array[] = $saveData['users_rated'];

                if(!empty($user_rated)){
                    $rated_users_array = array_column($user_rated,"id");
                    $rated_users_array = array_values($rated_users_array);
                    $rated_users = $rated_users_array[0];
                    
                    if(count($rated_users_array) > 1){
                        $rated_users = implode(",",$rated_users_array);
                    }
                }

                
                /* shared users id array preparation */
                $user_shared = $saveData['users_shared'];
                $user_shared_array[] = $saveData['users_shared'];

                if(!empty($user_rated)){
                    $shared_users_array = array_column($user_shared,"id");
                    $shared_users_array = array_values($shared_users_array);
                    $shared_users = $shared_users_array[0];
                    
                    if(count($shared_users_array) > 1){
                        $shared_users = implode(",",$shared_users_array);
                    }
                }

                /* commented users id array preparation */
                $user_commented = $saveData['users_comments'];
                $user_commented_array[] = $saveData['users_comments'];

                if(!empty($user_commented)){
                    $commented_users_array = array_column($user_commented,"id");
                    $commented_users_array = array_values($commented_users_array);
                    $commented_users = $commented_users_array[0];
                    
                    if(count($commented_users_array) > 1){
                        $commented_users = implode(",",$commented_users_array);
                    }
                }
            
                $userPostData = $this->DO_Model->getUserPostData($post_id);

                /* If same post_id is exist data will be updated */
                if(count($userPostData) >= 1)
                {
                    $affected = DB::table('post_data')
                    ->where('post_id','=',$post_id)
                    ->update(['user_viewed' => $viewed_users,
                              'users_commented' => $commented_users,
                              'users_rated' => $rated_users,
                              'users_shared' => $shared_users
                            ]);

                }
                else{
                    $post = new PostData;
                    $post->post_id = $post_id;
                    $post->user_viewed = $viewed_users;
                    $post->users_commented = $commented_users;
                    $post->users_rated = $rated_users;
                    $post->users_shared = $shared_users;
    
                    $post->save();
                }
                
            }

            /* Save data in table 2 */
            $mergedArray = array_merge($user_viewed_array,$user_rated_array,$user_shared_array,$user_commented_array);
            $mergedArray = array_filter($mergedArray);
            $mergedArray = array_values($mergedArray);

            $users_viewed_array = call_user_func_array('array_merge', $mergedArray);
            
            foreach($users_viewed_array as $array)
            {
                $id = $array['id'];
                $langArray = $array['language'];
                $langs = (!empty($langArray)) ? array_column($langArray,"language") : NULL;
                
                $language = NULL;

                if($langs != NULL)
                {
                    $language = (count($langs) > 1) ? implode(",",$langs) : $langs[0];
                }
                
                $userLangArray[$id][] = $language;
                
            }
        
            $uniqueArray = array_unique(array_column($users_viewed_array,"id"));

            foreach($uniqueArray as $users)
            {
                $userLanguageData = $this->DO_Model->getUserLanguage($users);
                /* If same user id already exists data will be updated */
                if(count($userLanguageData) >= 1)
                {
                    $sql = "Update `user_language_data` SET language = '".$userLangArray[$users][0]."' WHERE user_id = '".$users."' ";
                    
                    DB::select($sql);
                }
                else{
                    $userData = new UserLanguageData;
                    $userData->user_id = $users;
                    $userData->language = (isset($userLangArray[$users][0]) && $userLangArray[$users][0] != "") ? $userLangArray[$users][0] : NULL;
                    $userData->save();
                }
                
                
            }
        }
        
        $success['Post_Ids'] = $postIDArray;
        return $this->sendResponse($success, 'Post user Ids saved successfully.');
    }


    
}