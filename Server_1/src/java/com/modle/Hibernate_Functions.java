/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.modle;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Damith Roma
 */
public class Hibernate_Functions {
    Session ses;
    public Hibernate_Functions(Session sesFac){
        this.ses = sesFac;
    }
    
    public void saveEntries(Object value){
        Transaction  tr = ses.beginTransaction();
        
        ses.save(value);
        tr.commit();
        ses.flush();
//        ses.close();
    }
    //Hybernet set criteriya object
    public Object setCriteria(String col_name ,Object keyWord ,Class class_name){
        Object ob;
        Criteria cr = ses.createCriteria(class_name);
        cr.add(Restrictions.eq(col_name,keyWord));
        ob = cr.uniqueResult();
        
        return  ob;
    }
    public void delectEntries(Object object){
        Transaction tr = ses.beginTransaction();
        
        ses.delete(object);
        ses.flush();
//        sess.close();
        tr.commit();
        
    }
    
    //return criteria list
    public List setCriteriaList(String col_name ,String keyWord ,Class class_name,MatchMode searchType){
        Criteria cr = ses.createCriteria(class_name);
        cr.add(Restrictions.like(col_name,keyWord,searchType));
        List list = cr.list();
        return list;
    }
    public List setCriteriaList(String col_name ,Object keyWord ,Class class_name){
        List ob;
        Criteria cr = ses.createCriteria(class_name);
        cr.add(Restrictions.eq(col_name,keyWord));
        ob = cr.list();
//        ses.close();
        return  ob;
    }
    
    public List setCriteriaList(Class class_name){
        Criteria cr = ses.createCriteria(class_name);
        List list = cr.list();
        return  list;
        
    }
    public void updateObjectDetails(Object obj){
        Transaction tr = ses.beginTransaction();
        
        ses.saveOrUpdate(obj);
        tr.commit();
        ses.flush();
//        ses.close();
    }

}
