package com.project.UsERP.persistence;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.UsERP.vo.AccountStatementVO;
import com.project.UsERP.vo.AccountVO;
import com.project.UsERP.vo.BankVO;
import com.project.UsERP.vo.SalaryStatementVO;

@Repository
public class AdDAOImpl implements AdDAO {

	@Autowired
	SqlSession sqlSession;

	// 이재홍 - 기초 등록 - 계좌 리스트
	@Override
	public List<BankVO> bankList() {
		return sqlSession.selectList("com.project.UsERP.persistence.AdDAO.bankList");
	}

	// 강재현 - 기초 등록 - 계정 리스트
	@Override
	public List<AccountVO> accountList() {
		return sqlSession.selectList("com.project.UsERP.persistence.AdDAO.accountList");
	}

	// 강재현 - 회계보고서 - 재무상태표 상품
	@Override
	public int get1() {
		AdDAO dao = sqlSession.getMapper(AdDAO.class);
		return dao.get1();
		// return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.get1");
	}

	// 강재현 - 회계보고서 - 재무상태표 외상매출금
	@Override
	public int get2() {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.get2");
	}

	// 강재현 - 회계보고서 - 재무상태표
	@Override
	public int get3() {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.get3");
	}

	// 강재현 - 회계보고서 - 재무상태표 외상매입금
	@Override
	public int get4() {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.get4");
	}

	// 이재홍 : 회계보고서 - 손익계산서 매출액
	@Override
	public int sum() {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.sum");
	}

	// 이재홍 : 회계보고서 - 손익계산서 매출원가
	@Override
	public int sum1() {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.sum1");
	}

	// 이재홍 - 회계보고서 - 손익계산서 판매비와 관리비
	@Override
	public int sum2() {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.sum2");
	}

	// 강재현 - 전표 관리 - 회계 전표
	@Override
	public List<AccountStatementVO> statementList() {
		return sqlSession.selectList("com.project.UsERP.persistence.AdDAO.statementList");
	}

	// 강재현 - 전표 관리 - 회계 전표 상세 페이지
	@Override
	public AccountStatementVO getStamentDetail(int accs_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.getStamentDetail", accs_code);
	}

	// 강재현 - 전표 관리 - 회계 전표 (승인 & 미승인)
	@Override
	public int acupdatestatment(AccountStatementVO vo) {
		return sqlSession.update("com.project.UsERP.persistence.AdDAO.acupdatestatment", vo);
	}

	// 강재현 - 전표 관리 - 급여 전표
	@Override
	public List<SalaryStatementVO> salarystatementList() {
		return sqlSession.selectList("com.project.UsERP.persistence.AdDAO.salarystatementList");
	}

	// 강재현 - 전표 관리 - 급여 전표 상세 페이지
	@Override
	public SalaryStatementVO getsaStamentDetail(int ss_code) {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.getsaStamentDetail", ss_code);
	}

	// 강재현 - 전표 관리 - 급여 전표 (승인 & 미승인)
	@Override
	public int saupdatestatment(SalaryStatementVO vo) {
		return sqlSession.update("com.project.UsERP.persistence.AdDAO.saupdatestatment", vo);
	}

	// 이재홍 - 전표 관리 - 채권/채무 조회
	@Override
	public List<AccountStatementVO> bondDebtList() {
		return sqlSession.selectList("com.project.UsERP.persistence.AdDAO.bondDebtList");
	}

	// 이재홍 - 전표 관리 - 채권/채무 상세페이지
	@Override
	public AccountStatementVO bdStatementDetail(int num) {
		return sqlSession.selectOne("com.project.UsERP.persistence.AdDAO.bdStatementDetail", num);
	}

}
