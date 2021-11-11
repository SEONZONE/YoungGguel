package com.sist.moviecrolling;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {

	/** ���� ������ ��ȣ */
	private int currentPageNo;

	/** �������� ����� ������ ���� */
	private int recordsPerPage;

	/** ȭ�� �ϴܿ� ����� ������ ������ */
	private int pageSize;

	/** �˻� Ű���� */
	private String searchKeyword;

	/** �˻� ���� */
	private String searchType;

	public Criteria() {
		this.currentPageNo = 1;
		this.recordsPerPage = 10;
		this.pageSize = 10;
	}

	public int getStartPage() {
		return (currentPageNo - 1) * recordsPerPage;
	}

}