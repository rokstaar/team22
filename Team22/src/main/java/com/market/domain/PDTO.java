package com.market.domain;

import java.util.List;

import lombok.Data;

@Data
public class PDTO {
	private List<ProductVO> list;
	private int token;
}
