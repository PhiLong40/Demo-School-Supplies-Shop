/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package htplong.data.web;

import htplong.data.dao.Database;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author FPTHP
 */
@WebServlet(name = "ForgotServlet", urlPatterns = {"/Forgot"})
public class ForgotServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./views/Forgot.jsp").include(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final String from = "ngocthuy0258@gmail.com";
        final String password = "deklluxlqrfzhzno";
        // GỬi email
        final String to = request.getParameter("Email");
        //Properties: khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP HOST
        props.put("mail.smtp.post", "587");//TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        if(Database.getUserDao().findUser(to)==null){
            request.getSession().setAttribute("err_email", "Email này không tồn tại");
            response.sendRedirect("Forgot");
            System.out.println(from);
        }else{
        //create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);            
            }            
        };
        //Phiên làm việc
        Session session = Session.getInstance(props, auth);
        request.getSession().setAttribute("toEmail", to);
        //Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);
        try {
            msg.setFrom(from);//NGười gửi
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false)); // Kiểu người nhận
            //Tiêu đề email
            msg.setSubject("Đổi mật khẩu", "UTF-8");
            //Quy định ngày gửi
            msg.setSentDate(new Date());
            //Nội dung
            msg.setContent("Nhấp vào đây để "
                    + "<a href=\"http://localhost:8085/shopDoDungHocTap/Resetpwd?email="+to+"\">Đặt lại mật khẩu</a>"
                ,"text/HTML; charset=UTF-8");
            //Gửi mail
            Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
        request.getSession().removeAttribute("err_email");
        request.getSession().setAttribute("accept", "Gửi mail thành công");
        response.sendRedirect("Forgot");
        }
    }

}
