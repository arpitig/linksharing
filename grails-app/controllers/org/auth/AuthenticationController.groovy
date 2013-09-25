package org.auth

import org.ig.User

class AuthenticationController {

    def index() { }


    def logout() {
        session.invalidate()
        render(view: '../login')
    }

    def login() {
        if(!session.user){
            render(view: '../login')
        }   else{
            if(session.isAdmin == true)  {
                render (view: '/index')
            }   else{
                redirect(controller: 'user' , action: 'dashBoard')
            }

        }

    }
    def mailService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def auth() {
        render("Welcome ")
    }

    def forgetsend(){

        String email = params.emailforget

        User user = User.findWhere(email: email)
        if(user){
            try {
                sendMail {
                    to email
                    subject "Forget Password"
                    text "Your Password is ${user.password}"
                }

            } catch(Exception e) {
                render(e)

            }
            render("Your Password has sent to Your Email , Please check ")

        }else{
            render ("This email is not register for this application")
        }


    }

    def loginhandler(){
        String uname = params.emailig
        String password = params.passwordig

        User user = User.findWhere(email: uname, password: password)
        if(user != null){
            session.user = user
            session.isLogin = true
            if(user.email.equals("admin@gmail.com")){
                session.isAdmin = true
                render (view: '/index')
            } else{
                session.isAdmin = false
                redirect(controller: 'user' , action: 'dashBoard')
            }
        }  else{
            flash.message = "Wrong username or password"
            redirect(controller: 'authentication' , action: 'login')
        }
    }

    def register() {

        render (view: "register")
    }

    def forget() {
        render (view: '/authentication/forget')
    }

    def adminDash() {
        render("Welcome to admin Page")
    }

    def dashBoard(){
        render ("Welcome to user page")
    }


}
