package service;

import dao.CustomerDao;
import dto.PageBean;

import java.util.List;
import java.util.Map;

public class PageServiceImpl implements PageService {
    CustomerDao dao = new CustomerDao();
    //    public List<Map<String,Object>> getAll(){
//        return dao.findALl();
//    }
    CustomerService service = new CustomerService();
    @Override
    public PageBean findItemByPage(String _currentPage, String cid) {
        int currentPage = Integer.parseInt(_currentPage);
        PageBean pb = new PageBean();
        List<Map<String,Object>> Count = dao.Count(cid);
        int pageSize = 6;
        int totalCount = Integer.parseInt(Count.get(0).get("count").toString());
        int totalPage = totalCount % pageSize == 0 ? totalCount/pageSize : totalCount/pageSize + 1;
        if (currentPage <= 1)
        {
            currentPage = 1;
        }
        if(currentPage >= totalPage)
        {
            currentPage = totalPage;
        }

        //1.创建空的PB对象
        pb.setCurrentPage(currentPage);
        pb.setPageSize(6);

        //调用dao查询总记录
        pb.setTotalRecord(totalCount);

        //dao查询list合集
        int startIndex = (currentPage-1)*pageSize;
        pb.setStartIndex(startIndex);
        List<Map<String,Object>> petList = dao.getPetListByPage(startIndex,cid);
        pb.setTotalPage(totalPage);
        pb.setList(petList);
        return pb;
    }

    public PageBean getPetListByname(String _currentPage, String cname) {
        int currentPage = Integer.parseInt(_currentPage);
        PageBean pb = new PageBean();
        List<Map<String,Object>> Count = dao.Count1(cname);
        int pageSize = 6;
        int totalCount = Integer.parseInt(Count.get(0).get("count").toString());
        int totalPage = totalCount % pageSize == 0 ? totalCount/pageSize : totalCount/pageSize + 1;
        if (currentPage <= 1)
        {
            currentPage = 1;
        }
        if(currentPage >= totalPage)
        {
            currentPage = totalPage;
        }

        //1.创建空的PB对象
        pb.setCurrentPage(currentPage);
        pb.setPageSize(6);

        //调用dao查询总记录
        pb.setTotalRecord(totalCount);

        //dao查询list合集
        int startIndex = (currentPage-1)*pageSize;
        pb.setStartIndex(startIndex);
        List<Map<String,Object>> petList = dao.getPetListByname(cname,startIndex);
        pb.setTotalPage(totalPage);
        pb.setList(petList);
        return pb;
    }


    public static void main(String[] args) {
        PageServiceImpl service = new PageServiceImpl();
        PageBean pb = new PageBean();
//        pb = service.findItemByPage("2","1");
        pb = service.getPetListByname("1","猫");
        System.out.println(pb.getList());
    }


}