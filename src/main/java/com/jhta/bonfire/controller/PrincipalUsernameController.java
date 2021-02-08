package com.jhta.bonfire.controller;

import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrincipalUsernameController {
    @RequestMapping(value = "/test/test")
    public String test(
    @AuthenticationPrincipal Authentication authentication , Model model
    ) {
        Logger logger = LoggerFactory.getLogger(getClass());

        // Authentication aauthentication = SecurityContextHolder.getContext().getAuthentication();
        // Optional.ofNullable(authentication).
        // String userrname = authentication.getName();
        // String username = 
        Optional<Authentication> user = Optional.ofNullable(authentication);
        String username = Optional.ofNullable(authentication).map(Authentication::getName).orElse("");
        logger.info(username);
        model.addAttribute("username", username);
        return ".home.principalusernametest";
    }
}
