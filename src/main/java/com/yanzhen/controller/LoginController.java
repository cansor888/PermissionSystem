package com.yanzhen.controller;

import com.yanzhen.codeutil.IVerifyCodeGen;
import com.yanzhen.codeutil.SimpleCharVerifyCodeGenImpl;
import com.yanzhen.codeutil.VerifyCode;
import com.yanzhen.po.User;
import com.yanzhen.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class LoginController {
    @Autowired
    private IUserService userService;
    @RequestMapping("/verifyCode")
    public void verifyCode(HttpServletRequest request, HttpServletResponse response) {
        IVerifyCodeGen iVerifyCodeGen = new SimpleCharVerifyCodeGenImpl();
        try {
            //设置长宽
            VerifyCode verifyCode = iVerifyCodeGen.generate(80, 28);
            String code = verifyCode.getCode();
//            LOGGER.info(code);
            //将VerifyCode绑定session
            request.getSession().setAttribute("VerifyCode", code);
            //设置响应头
            response.setHeader("Pragma", "no-cache");
            //设置响应头
            response.setHeader("Cache-Control", "no-cache");
            //在代理服务器端防止缓冲
            response.setDateHeader("Expires", 0);
            //设置响应内容类型
            response.setContentType("image/jpeg");
            response.getOutputStream().write(verifyCode.getImgBytes());
            response.getOutputStream().flush();
        } catch (IOException e) {
//            LOGGER.info("", e);
            System.out.println("异常处理");
        }
    }
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/loginIn")
    public String loginIndex(HttpServletRequest request, Model model){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        if(session == null){
            model.addAttribute("msg","session 超时了");
            return "login";
        }
        String trueCode = (String) session.getAttribute("VerifyCode");
        if(!trueCode.toLowerCase().equals(code.toLowerCase())){
            model.addAttribute("msg","验证码不正确，请重新输入...");
            return "login";
        }
        User user = userService.queryUserInfoByNameAndPwd(username, password);
        if(user==null){
            model.addAttribute("msg","用户名密码不正确");
            return "login";
        }
        session.setAttribute("user",user);
        return "redirect:/indexLogin";
    }
    @RequestMapping("/indexLogin")
    public String index(){
        return "index";
    }
    @RequestMapping("/logout")
    public String logOut(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login";
    }
}
