package com.yuen.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.yuen.domain.User;
import com.yuen.service.UserService;

@Component
public class RegisterValidator implements Validator {

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> cls) {
        return User.class.isAssignableFrom(cls); 
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        
        // Confirm password
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "NotEmpty");
        
        // Match password
        if (!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "Match.user.confirmPassword");
        }
        
        // Email exists
        if (userService.findOne(user.getEmail()) != null) {
            errors.rejectValue("email", "Exists.user.email");
        }
    }

}