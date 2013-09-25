<%--
  Created by IntelliJ IDEA.
  User: arpit-singhal
  Date: 8/9/13
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="linksharing"/>
  <title>Login Page of Link Sharing Application.</title>
    <style>


    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="http://jquery.bassistance.de/validate/jquery.validate.js"></script>
    <script type="text/javascript">
        /**
         * Basic jQuery Validation Form Demo Code
         * Copyright Sam Deering 2012
         * Licence: http://www.jquery4u.com/license/
         */
        (function($,W,D)
        {
            var JQUERY4U = {};

            JQUERY4U.UTIL =
            {
                setupFormValidation: function()
                {
                    //form validation rules
                    $("#homepage").validate({
                        rules: {
                            email: {
                                required: true,
                                email:true
                            },
                            firstName :"required",
                            lastName  :"required"  ,
                            password  : {
                                required: true
                            } ,
                            confirmPassword :{
                                required:true,
                                equalTo:"#password"
                            },
                            gender:{
                                required:true
                            }  ,
                            dateOfBirth:{
                                required:true ,
                                date:true
                            }

                        },
                        messages: {
                            email: "Please enter your Email",
                            firstName:"Please enter First Name",
                            lastName:"Please enter last name"  ,
                            password: "Please enter your password" ,
                            confirmPassword:{
                                required:"Please enter confirm password",
                                equalTo:"Please enter correct confirmation password"
                            }    ,
                            gender:"Please enter Gender" ,
                            dateOfBirth:"Please Select Date of birth"

                        },
                        submitHandler: function(form) {
                            form.submit();
                        }
                    });
                }
            }

            //when the dom has loaded setup form validation rules
            $(D).ready(function($) {
                JQUERY4U.UTIL.setupFormValidation();
            });

        })(jQuery, window, document);
    </script>
</head>
<body>
<g:form name="homepage" controller="user" action="saveig">

<div style="background-color: #E1F2B6">

    <center><h1>Sign Up!!</h1></center>
    <table style="width: 100%">
        <td style="width: 25%;"></td>
        <td>
            <table>
                <tr>
                    <td>Email ID*</td>
                    <td><g:textField name="email"/></td>
                </tr>
                <tr>
                    <td>Your Name*</td>
                    <td><g:textField name="firstName" placeholder="Enter First Name" spellcheck="true"/><g:textField name="lastName" placeholder="Enter Last name" /></td>
                </tr>
                <tr>
                    <td>Enter Password* </td>
                    <td> <g:passwordField name="password" /> </td>
                </tr>
                <tr>
                    <td>Confirm Password* </td>
                    <td> <g:passwordField name="confirmPassword" /> </td>
                </tr>
                <tr>
                    <td>Gender </td>
                    <td> Male <g:radio name="gender" value="Male"/>  Female <g:radio name="gender" value="Female"/></td>
                </tr>
                <tr>
                    <td>Date Of Birth</td>
                    <td> <g:datePicker name="dateOfBirth" precision="day"   default="none" noSelection="['': '']" /></td>
                </tr>
                <tr>
                    <td><g:link controller="authentication" action="login">Log in to existing Account</g:link></td>
                    <td> <g:submitButton name="signup" value="Sign Up"  /></td>
                </tr>
            </table>
        </td>
    </table>




</div>




</g:form>






</body>
</html>