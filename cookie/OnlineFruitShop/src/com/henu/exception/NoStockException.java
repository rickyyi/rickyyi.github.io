package com.henu.exception;

public class NoStockException extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8206334951490632096L;

	public NoStockException(){
		super("库存不足");
	}
}
