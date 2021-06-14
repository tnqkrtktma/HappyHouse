package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.mapper.HouseMapDao;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	
	@Autowired
	HouseMapDao dao;
	

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return dao.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		String si=sido.substring(0, 2);
		return dao.getGugunInSido(si);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return dao.getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return dao.getAptInDong(dong);
	}
	

	@Override
	public List<HouseDeal> getAptDeals(String dong, String aptName) throws Exception {
		return dao.getAptDeals(dong, aptName);
	}

	@Override
	public List<HouseInfoDto> findAptname(String sido, String gugun, String dong, String name) throws Exception {
		// TODO Auto-generated method stub
		String n= "%"+name+"%";
		
		if(sido.equals("0"))
			return dao.findAptnameall(n);
		else if(gugun.equals("0"))
		{
			String si=sido.substring(0, 2)+"%";
			return dao.findAptnamesido(si, n);
		}
		else if(dong.equals("0"))
		{
			String gu=gugun.substring(0, 5);
			return dao.findAptnamegugun( gu, n);
		}
		else
			return dao.findAptnamedong( dong,  n);
	}

	@Override
	public List<HouseDeal> show(String no) throws Exception {
		// TODO Auto-generated method stub
		return dao.show(no);
	}

}
