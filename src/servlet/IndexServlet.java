package servlet;

import dao.HeroDao;
import dto.Hero;
import dto.PageBean;
import service.CustomerService;
import service.PageServiceImpl;
import util.JsonResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;
/*
优先查询cid，当cid空时，判断cname
 */
@WebServlet(name = "IndexServlet", urlPatterns = "/Index")
public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =  request.getSession();
        //分页
        String currentPage = request.getParameter("currentPage");
        if (currentPage == null || currentPage.equals(""))
        {
            currentPage = "1";
        }



        String cid = request.getParameter("cid");
        String cname  = request.getParameter("cname");

        CustomerService customerService = new CustomerService();
        JsonResult result = new JsonResult();
        result.setSuccess(false);

        PageServiceImpl pageService = new PageServiceImpl();

        PageBean pb = null;
        pb = pageService.findItemByPage(currentPage, cid);

        if(cid != null){
            request.getSession().setAttribute("pageBean",pb);
            response.sendRedirect("index.jsp?cid="+cid);
            return;
        }else{
            if (cname != null && !cname.equals("")) {
                pb = pageService.getPetListByname(currentPage, cname);
                if (pb.getList().size() > 0) {
                    result.setSuccess(true);

                    System.out.println(pb);

                }


            }else {
                request.getSession().setAttribute("pageBean",pb);
                response.sendRedirect("index.jsp");
                return;
            }
        }
            request.getSession().setAttribute("pageBean",pb);
            if (cname !=null && ! cname.equals("") && Integer.parseInt(currentPage) > 1 ){
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }else  if (request.getParameter("biao") == null){
                response.sendRedirect("index.jsp?cname="+cname);
                return;
            }
            response.setContentType("text/json;charset=utf-8");
            response.setCharacterEncoding("utf-8");
            response.getWriter().println(result);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
