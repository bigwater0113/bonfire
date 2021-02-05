package com.jhta.bonfire.controller;

import java.util.Optional;

import com.jhta.bonfire.security.CustomUserDetail;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrincipalUsernameController {
    @RequestMapping(value = "/test/test")
    public String test(@AuthenticationPrincipal CustomUserDetail CustomUserDetail, Model model) {
        Optional<String> username = Optional.ofNullable(CustomUserDetail.getUsername());
        model.addAttribute("username", username.orElse("작동하지 않음"));
        return ".home.principalusernametest";
    }
}
