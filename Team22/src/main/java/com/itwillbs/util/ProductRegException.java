package com.itwillbs.util;

public class ProductRegException extends RuntimeException {
	private String product_seller;
	
	public ProductRegException(String msg, Throwable cause, String product_seller) {
		super(msg, cause);
		this.product_seller = product_seller;
	}

	public String getProduct_seller() {
		return product_seller;
	}
}
