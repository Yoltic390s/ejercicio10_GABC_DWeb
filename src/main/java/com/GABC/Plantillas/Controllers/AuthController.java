package com.GABC.Plantillas.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("auth")
public class AuthController {

    //http://localhost:8080/auth/login
    //http://localhost:8080/auth/register

    @GetMapping("/login")
    public String login(){
        return "login";
    }
    @GetMapping("/register")
    public String register(){
        return "register";
    }
    @GetMapping("/forgot-password")
    public String password(){
        return "forgot-password";
    }



}

