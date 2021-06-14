package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.mapper.HouseDao;

@Service
public class HouseServiceImpl implements HouseService {
	@Autowired
	HouseDao dao;

	@Override
	public List<HouseDeal> searchAll(int type, String dong) throws Exception {
		if (type == 1 || type == 3)
			return dao.searchAll13(dong);
		else
			return dao.searchAll24(dong);
	}

	@Override
	public HouseDeal search(int no) throws Exception {
		return dao.search(no);
	}

	@Override
	public List<HouseDeal> searchAllfind(String sido, String gugun, String dong, String name, int type)
			throws Exception {

		String n = "%" + name + "%";
		if (type == 1 || type == 3) {
			if (sido.equals("0"))
				return dao.searchAllfindall13(n);
			else if (gugun.equals("0")) {
				String si = sido.substring(0, 2) + "%";
				return dao.searchAllfindsido13(si, n);
			} else if (dong.equals("0")) {
				String gu = gugun.substring(0, 5);
				return dao.searchAllfindgugun13(gu, n);
			} else
				return dao.searchAllfinddong13(dong, n);
		} else {
			if (sido.equals("0"))
				return dao.searchAllfindall24(n);
			else if (gugun.equals("0")) {
				String si = sido.substring(0, 2) + "%";
				return dao.searchAllfindsido24(si, n);
			} else if (dong.equals("0")) {
				String gu = gugun.substring(0, 5);
				return dao.searchAllfindgugun24(gu, n);
			} else
				return dao.searchAllfinddong24(dong, n);
		}
	}
}
