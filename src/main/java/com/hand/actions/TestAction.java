package com.hand.actions;

import com.hand.entity.User;
import com.hand.paging.Pager;
import com.hand.paging.PagingService;
import com.opensymphony.xwork2.ActionSupport;
import javax.annotation.*;

/**
 * Created by tuberose on 16-9-4.
 */
public class TestAction extends ActionSupport{

    @Resource(name = "pagingService")
    private PagingService<User> pagingService;

    public void Index() {
        System.out.println("这是一个测试");
//        pagingService = new PagingService<User>(User.class);
        pagingService.PagingService(User.class);
        Pager pager = pagingService.paging(2,2,null);
        System.out.println("数据："+pager.toString());
        for (Object user: pager.getResult()){
            System.out.println("User --->：  "+((User)user).toString());
        }
    }

}
