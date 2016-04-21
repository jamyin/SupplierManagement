package com.project.service.impl;

import java.util.List;

import com.project.dao.ContacterDao;
import com.project.dao.SupplierDao;
import com.project.entity.Linkman;
import com.project.service.ContacterService;

public class ContacterServiceImpl implements ContacterService {
	private ContacterDao contacterDao;

	public ContacterDao getContacterDao() {
		return contacterDao;
	}

	public void setContacterDao(ContacterDao contacterDao) {
		this.contacterDao = contacterDao;
	}

	@Override
	public List<Linkman> findAllLinkman() {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:36:59
		 */
		return contacterDao.findAllLinkman();
	}

	@Override
	public Linkman findLinkmanByID(int linkmanNo) {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:36:59
		 */
		return contacterDao.findLinkmanByID(linkmanNo); 
	}

	//通过姓名模糊查询
	@Override
	public List<Linkman> findLinkmanByName(String linkmanName , int startRow , int size) {
		return contacterDao.findLinkmanByName(linkmanName , startRow , size );
	}

	@Override
	public boolean addLinkman(Linkman linkman) {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:36:59
		 */
		return contacterDao.addLinkman(linkman);
	}

	@Override
	public boolean updateLinkman(Linkman linkman) {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:36:59
		 */
		return contacterDao.updateLinkman(linkman);
	}

	@Override
	public int deleteLinkman(int linkmanNo) {
		/**
		 * @author by Jam
		 * 2014-12-2 上午11:36:59
		 */
		return contacterDao.deleteLinkman(linkmanNo);
	}
	public int deletelinkman(String[] linkmanNos) {
		/**
		 * @author by Jam
		 * 2014-12-1 上午11:04:31
		*/
		return contacterDao.deleteLinkman(linkmanNos);

	}

	//分页查询
	@Override
	public List<Linkman> getAllPage(String supplierName,String linkmanName,int startRow, int size) {
		return contacterDao.getAllPage(supplierName,linkmanName,startRow, size);
	}

	@Override
	public int getCount(String supplierName,String linkmanName) {
		return contacterDao.getCount(supplierName,linkmanName);
	}

	@Override
	public List<Linkman> findContacterByName1(String linkmanName) {
		/**
		 * @author by Jam
		 * 2014-12-16 下午7:04:14
		*/
		return contacterDao.findContacterByName1(linkmanName);
	}

	//全部联系人，导出excle
	@Override
	public List<Linkman> findWholeContacter() {
		return contacterDao.findWholeContacter();
	}

}
