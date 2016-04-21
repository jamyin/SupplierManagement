package com.project.dao.impl;

import java.io.FileInputStream;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.httpclient.util.DateParseException;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.project.dao.ContractDao;
import com.project.entity.Contract;
import com.project.entity.Product;
import com.project.util.HibernateSessionFactory;

public class ContractDaoImpl implements ContractDao{
	private HibernateTemplate hibernateTemplate;
	

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	//查询所有Contract
	@Override
	public List<Contract> allContract() {
		System.out.println("查询所有contract");
		List<Contract> list=hibernateTemplate.find("from Contract");
		System.out.println(list.get(0).getCompanyName());
		return list;
	}

	//增加合同
	@Override
	public boolean add(Contract contract) {
		System.out.println("addContract");
		boolean flag=false;
		//System.out.println(contract.getAttachment());
		try{
			/*try {
				FileInputStream fis = new FileInputStream("C:\\Documents and Settings\\user\\桌面\\supplierman（jam）.sql");
				byte[] bytes = new byte[fis.available()];
				fis.read(bytes);
				fis.close();
				contract.setAttachment(bytes.toString());
				String  attachment = contract.getAttachment();
			} catch (Exception e) {
				e.printStackTrace();
			}*/
			hibernateTemplate.save(contract);
			/*String hql="UPDATE Contract SET supplierId="+supplierId+" WHERE contractId="+contract.getContractId();
			Session session=HibernateSessionFactory.getSession();
			Transaction tran=session.beginTransaction();
			Query query=session.createQuery(hql);
			query.executeUpdate();
			tran.commit();
			session.close();*/
			flag=true;
		}catch(DataAccessException e){
			e.printStackTrace();
		}finally{
			getHibernateTemplate().flush();
		}
		return flag;
	}

	//修改Contract
	@Override
	public boolean update(Contract contract) {
		System.out.println("update Contract");
		boolean flag=false;
		try{
			hibernateTemplate.update(contract);
			flag=true;
		}catch(DataAccessException e){
			e.printStackTrace();
		}finally{
			getHibernateTemplate().flush();
		}
		return false;
	}

	//删除，真心删除
	@Override
	public boolean delete(Contract contract) {
		System.out.println("delete Contract");
		boolean flag=false;
		try {
			System.out.println(contract);
			hibernateTemplate.delete(contract);
			flag=true;
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return flag;
	}

	//通过合同名称来查询
	@Override
	public List findByName(final String contractName , final int startRow , final int size) {
		//实现分页查询
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {

				String hql = "from Contract where (flag0 is null or flag0 <>1) and contractName like '%"+contractName+"%'";
				Query query = session.createQuery(hql);
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				return query.list();
			}
		});
		
		
		
		//未实现分页查询
		/*List list=null;
		try{
			//String hql="from Contract where contractName='"+contractName+"'";
			String hql="from Contract where contractName like '%"+contractName+"%'";
			list=hibernateTemplate.find(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}*/
		return list;
	}
	
	
	//按姓名查询合同 (从供应商列表查相关连的合同)
	public List findContractByName(String supplierName) {
		StringBuffer hql=new StringBuffer("FROM Contract WHERE 1=1 " +
				" AND (flag0 IS  NULL " +
				" OR flag0<>1)");
		if(null!=supplierName&&!("".equals(supplierName))){
			hql.append(" and supplierName = '"+supplierName+"'");
		}

		System.out.println(hql.toString());
		List <Product> list =hibernateTemplate.find(hql.toString());
		return list;
	}

	//通过ID查询
	@Override
	public Contract findById(int id) {
		Contract contract=null;
		try{
			contract=(Contract) hibernateTemplate.get(Contract.class, id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return contract;
	}

	//通过ID模糊查询
	public List<Contract> findListById(final int id , final int startRow , final int size){
		//实现分页查询
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql = "from Contract where (flag0 is null or flag0 <>1) and contractId like '%"+id+"%'";
				Query query = session.createQuery(hql);
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				return query.list();
			}
		});
		
		
		
		//未实现分页查询
		/*List<Contract> list=null;
		try{
			String hql="from Contract where contractID like '%"+id+"%'";
			list=hibernateTemplate.find(hql);
			if(list!=null){
				return list;
			}else{
				list=hibernateTemplate.find(hql);
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
		}*/
		return list;
	}
	
	//组合查询
	@Override
	public List<Contract> findContract() {
		return null;
	}

	//分页查询，查询所有记录数
	@Override
	public int getCount(final String supplierName,final String contractName) {
		long count= (Long) getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = null;
				if(supplierName!=null){
					String hql = "select count(*) from Contract where (flag0 is null or flag0<>1) and supplierName like '%"+supplierName+"%'";
					query=session.createQuery(hql);
				}else if(contractName!=null){
					String hql = "select count(*) from Contract where (flag0 is null or flag0 <>1) and contractName like '%"+contractName+"%'";
					query = session.createQuery(hql);
				}else{
					final String hql="select count(*) from Contract where flag0 is null or flag0<>1";
					query=session.createQuery(hql);
				}
				return query.uniqueResult();
			}
		});
		return (int)count;
	}

	//分页查询走回调函数
	@Override
	public List getAllPage(final String supplierName,final String contractName,final int startRow,final int size) {
		List list=getHibernateTemplate().executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = null;
				StringBuffer hql = new StringBuffer("from Contract where ( flag0 is null or flag0<>1 ) ");
				if(supplierName!=null&&!"".equals(supplierName)){
					System.out.println("供应商名称查询");
					hql = hql.append(" and supplierName like '%"+supplierName+"%' "); 
							//"from Contract where (flag0 is null or flag0<>1) and supplierName like '%"+supplierName+"%'";
					//query=session.createQuery(hql);
				}
				if(contractName!=null&&!"".equals(contractName)){
					System.out.println("合同名称查询");
					hql = hql.append(" and contractName like '%"+contractName+"%' "); 
							//"from Contract where (flag0 is null or flag0 <>1) and contractName like '%"+contractName+"%'";
					//query=session.createQuery(hql);
				}
					System.out.println("全部查询");
					//String hql="from Contract where flag0 is null or flag0<>1";
					query=session.createQuery(hql.toString());
				query.setFirstResult(startRow);
				query.setMaxResults(size);
				return query.list();
			}
		});
		return list;
	}

	//查询所有合同
	@Override
	public List<Contract> wholeContract() {
		List<Contract> list=hibernateTemplate.find("from Contract");
		return list;
	}

	//修改flag0至不显示
	@Override
	public int notShowContract(final int contractId) {
		int i = (Integer) getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql = "update Contract set flag0 = 1 where contractID = ?";
				Query query = session.createQuery(hql);
				query.setInteger(0, contractId);
				return query.executeUpdate();
			}
		});
		return i;
	}

	//通过供应商查询
	@Override
	public List<Contract> findBySupplier(final String supplierName) {
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql = "from Contract where (flag0 is null or flag0<>1) and supplierName like '%"+supplierName+"%'";
				Query query = session.createQuery(hql);
				return query.list();
			}
		});
		return list;
	}

}
