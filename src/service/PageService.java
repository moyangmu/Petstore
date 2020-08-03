package service;

import dto.PageBean;

public interface PageService {
    PageBean findItemByPage(String currentPage, String cid);

}
