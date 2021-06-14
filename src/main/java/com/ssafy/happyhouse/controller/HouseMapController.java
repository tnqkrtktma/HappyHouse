
package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.service.*;

@RestController
@RequestMapping("/map")
public class HouseMapController {

	@Autowired
	private HouseMapService service;
	
	@Autowired
	private HouseService hservice;

	@GetMapping("/sido")
	public ResponseEntity<List<SidoGugunCodeDto>> getSido() {
		try {
			List<SidoGugunCodeDto> list = service.getSido();
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping(value="/gugun")
	public ResponseEntity<List<SidoGugunCodeDto>> getGugun(String sido) {
		try {
			List<SidoGugunCodeDto> list = service.getGugunInSido(sido);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("/dong")
	public ResponseEntity<List<HouseInfoDto>> getDong(String gugun) {
		try {
			List<HouseInfoDto> list = service.getDongInGugun(gugun);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@GetMapping("/aptRent")
	public ResponseEntity<List<HouseDeal>> aptRent(String dong, int type) {
		try {
			List<HouseDeal> list = hservice.searchAll(type, dong);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@GetMapping("/aptRentfind")
	public ResponseEntity<List<HouseDeal>> aptRentfind(String sido,String gugun,String dong,String name, int type) {
		try {
			List<HouseDeal> list = hservice.searchAllfind( sido,  gugun,  dong,  name,  type);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("/aptTrade")
	public ResponseEntity<List<HouseDeal>> aptTrade(String dong, int type) {
		try {
			List<HouseDeal> list = hservice.searchAll(type, dong);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@GetMapping("/aptTradefind")
	public ResponseEntity<List<HouseDeal>> aptTradefind(String sido,String gugun,String dong,String name, int type) {
		try {
			List<HouseDeal> list = hservice.searchAllfind( sido,  gugun,  dong,  name,  type);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@GetMapping("/houseRent")
	public ResponseEntity<List<HouseDeal>> houseRent(String dong, int type) {
		try {
			List<HouseDeal> list = hservice.searchAll(type, dong);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@GetMapping("/houseRentfind")
	public ResponseEntity<List<HouseDeal>> houseRentfind(String sido,String gugun,String dong,String name, int type) {
		try {
			List<HouseDeal> list = hservice.searchAllfind( sido,  gugun,  dong,  name,  type);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@GetMapping("/houseTrade")
	public ResponseEntity<List<HouseDeal>> houseTrade(String dong, int type) {
		try {
			List<HouseDeal> list = hservice.searchAll(type, dong);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@GetMapping("/houseTradefind")
	public ResponseEntity<List<HouseDeal>> houseTradefind(String sido,String gugun,String dong,String name, int type) {
		try {
			List<HouseDeal> list = hservice.searchAllfind( sido,  gugun,  dong,  name,  type);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/apt")
	public ResponseEntity<List<HouseInfoDto>> getApt(String dong) {
		try {
			List<HouseInfoDto> list = service.getAptInDong(dong);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@GetMapping("/find")
	public ResponseEntity<List<HouseInfoDto>> findAptname(String sido,String gugun,String dong,String name) {
		try {
			List<HouseInfoDto> list = service.findAptname( sido, gugun, dong, name);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	@GetMapping("/show")
	public ResponseEntity<List<HouseDeal>> show(String no) {
		try {
			List<HouseDeal> list = service.show(no);
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/detail")
	public ResponseEntity<HouseDeal> detail(String no) {
		try {
			int num=Integer.parseInt(no);
			HouseDeal deal= hservice.search(num);
			return new ResponseEntity<>(deal, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}