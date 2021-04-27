package crud.controller;

import crud.bean.Admin;
import crud.bean.Msg;
import crud.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@ResponseBody
@RequestMapping("/admin")
public class LoginController {
    @Autowired
    LoginService loginService;

    @Autowired
    Admin admin;

    @RequestMapping("/login")
    //登陆
    public Msg login(Admin user,HttpServletRequest request) throws IOException {
        String loginName = user.getaUsername();
        String password = user.getaPassword();
        System.out.println(loginName+":"+password);
        admin.setaUsername(loginName);
        admin.setaPassword(password);
        Admin result = loginService.login(admin);

        if (result == null){
            System.out.println("用户名或密码错误");
             //将错误Msg进行ajax回调
            return Msg.fail();
        }else{
            //登陆成功，把use放入session中
            request.getSession().setAttribute("user",admin);
            System.out.println("登陆成功，我是："+admin.getaUsername());
            return Msg.success();
        }
    }

    @RequestMapping("/logout")
    //注销
    public void logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("user");
        String contextPath = request.getContextPath();
        response.sendRedirect(contextPath+"/index.jsp");
    }
}