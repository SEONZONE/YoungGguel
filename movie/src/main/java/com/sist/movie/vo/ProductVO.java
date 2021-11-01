package com.sist.movie.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	
	private int PNO;
	private String PCATEGORY;
	private String PNAME;
	private String PCONTENTS;
	private int PPRICE;
	private String PIMG;
	private int PSALESRATE;
	
}
