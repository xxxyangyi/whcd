package com.hand.paging;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.io.Serializable;

/**
 * Created by tuberose on 16-9-4.
 */

@Transactional
@Service("pagingService")
public class PagingService<T extends Serializable> {

    private Class<T> tClass ;
    @Resource(name = "pagingDao")
    private PagingDao<T> pagingDao;

    public void PagingService (Class<T> tClass ){
        this.tClass = tClass;
        pagingDao.setClazz(tClass);
    }
    /**
     * @function 分页显示符合所有的记录数，将查询结果封装为Pager
     * @param pageNo
     *            当前页数
     * @param pageSize
     *            每页显示的条数
     * @param criterions
     *            不定参数Criterion
     * @return 查询结果Pager  每页条数/ 当前页 / 数据行数 / 结果集
     */
    public Pager paging(int pageNo, int pageSize, Criterion... criterions){
        return pagingDao.findPageByCriteria(pageNo,pageSize,criterions);
    }

    public Pager paging(int pageNo, int pageSize,String[] JOIN,Criterion... criterions){
        return pagingDao.findPageByCriteria(pageNo, pageSize,JOIN,criterions);
    }

    public Pager findPageBySQL(int pageNo, int pageSize,String sql){
        return  pagingDao.findPageBySQL(pageNo,pageSize,sql);
    }

}
