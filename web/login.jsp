

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/newcss.css">
        <style>
         .ss{
                background-color: #00BCD4;
                border-radius: 13px;
                color: white;
                font-weight: 600;
                border: 3px white solid;
                
            }
            
            @media only screen and (max-width:500px){
                html,body{
                    margin: 0;
                    padding: 0;
                    height: 100%;
                }
        #main1{
        margin:0 !important;
        max-height: none !important;
        height: 100%;
        width: 100%;
        max-width: none;
       }
        }
        </style>    
    </head>
    <body>
        
        <div  id="main1">
            <div id="logobox">
                <div id="abcd" style="margin-bottom: 10px;"><img src="images/logo.jpeg" id="logo" alt="logo"></div>  
                <span style="color: white; font-weight: 700; font-size: 25px;">GO EASY</span>
            </div>
        <div  id="login">
            <form action="LoginController" method="post">
              <div class="form-group">
              <label for="email">Username:</label>
              <input  required type="text" class="form-control" id="email" placeholder="Enter username" name="username">
              </div>
              <div class="form-group">
              <label for="pwd">Password:</label>
              <input required type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
              </div>
               <div class="form-group">
                <label for="sel1">User Type:</label>
                <select class="form-control" id="sel1" name="utype">
                  <option>Teacher</option>
                  <option>Admin</option>
                  <option>Student</option>
                  </select>
                </div>
                <div style="font-weight: 600;color: red">${errMsg}</div>
               <button type="submit" class="btn btn-default ss" style="margin-left:35%">Submit</button>
              </form>
            </div>
        </div>
    </body>
</html>
