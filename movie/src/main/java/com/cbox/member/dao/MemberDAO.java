package com.cbox.member.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;

import com.cbox.member.vo.MemberVO;

public class MemberDAO extends DAO{
	private PreparedStatement pstmt;
	private ResultSet rs;
	private MemberVO vo;

	private final String SELECT_ALL = "SELECT * FROM MEMBER";
	private final String SELECT_ONE = "SELECT * FROM MEMBER WHERE MBR_ID = ?";
	private final String LOGIN = "SELECT * FROM MEMBER WHERE MBR_ID = ? AND MBR_PW = ?";
	private final String LOGIN_CHK = "SELECT MBR_PW FROM MEMBER WHERE MBR_ID = ?";
	private final String SELECT_INFO = "SELECT * FROM MEMBER WHERE MBR_ID = ?";
	private final String MEMBER_LIST = "SELECT * FROM ( SELECT A.*, ROWNUM RN FROM ( "
			+ "SELECT * FROM MEMBER ORDER BY MBR_NO ) A ) B WHERE RN BETWEEN ? AND ?";
	private final String INSERT = "INSERT INTO MEMBER(MBR_NO, MBR_ID, MBR_PW, MBR_NM, MBR_BIRTH, MBR_EMAIL, MBR_PHONE, MBR_E_YN)"
								+ "VALUES (MBR_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
	private final String UPDATE = "UPDATE MEMBER SET MBR_PW = ?, MBR_EMAIL = ?, MBR_PHONE = ?, MBR_E_YN = ? WHERE MBR_ID = ?";
	private final String DELETE = "UPDATE MEMBER SET MBR_NM = 'DELETED', MBR_PW = 'DELETED', MBR_EMAIL = 'DELETED', MBR_PHONE = '0', MBR_E_YN = '', MBR_POINT='' WHERE MBR_ID = ?";
	//private final String DELETE = "DELETE FROM MEMBER WHERE MBR_ID = ?";

	public List<MemberVO> selectAll(){
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			pstmt = conn.prepareStatement(SELECT_ALL); // dbms에 sql 전달
			rs = pstmt.executeQuery(); // pstmt 수행결과를 받아서 rs에 담음
			while(rs.next()) {
				vo = new MemberVO();
				vo.setMbr_no(rs.getInt("mbr_no"));
				vo.setMbr_id(rs.getString("mbr_id"));
				vo.setMbr_pw(rs.getString("mbr_pw"));
				vo.setMbr_nm(rs.getString("mbr_nm")); 
				vo.setMbr_birth(rs.getDate("mbr_birth"));
				vo.setMbr_email(rs.getString("mbr_email"));
				vo.setMbr_phone(rs.getString("mbr_phone"));
				vo.setMbr_regi_date(rs.getDate("mbr_regi_date"));
				vo.setMbr_point(rs.getInt("mbr_point"));
				vo.setMbr_e_yn(rs.getString("mbr_e_yn"));
				vo.setMbr_author(rs.getString("mbr_author"));
				// vo에 다 담았으면 list에 추가해주자
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	public MemberVO selectOne(MemberVO vo) {
		try {
			pstmt = conn.prepareStatement(SELECT_ONE);
			pstmt.setString(1, vo.getMbr_id());
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setMbr_no(rs.getInt("mbr_no"));
				vo.setMbr_id(rs.getString("mbr_id"));
				vo.setMbr_pw(rs.getString("mbr_pw"));
				vo.setMbr_nm(rs.getString("mbr_nm")); 
				vo.setMbr_birth(rs.getDate("mbr_birth"));
				vo.setMbr_email(rs.getString("mbr_email"));
				vo.setMbr_phone(rs.getString("mbr_phone"));
				vo.setMbr_regi_date(rs.getDate("mbr_regi_date"));
				vo.setMbr_point(rs.getInt("mbr_point"));
				vo.setMbr_e_yn(rs.getString("mbr_e_yn"));
				vo.setMbr_author(rs.getString("mbr_author"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	close();
        }
        return vo;
    }
	
	public MemberVO login(MemberVO vo) {
		try {
			pstmt = conn.prepareStatement(LOGIN);
			pstmt.setString(1, vo.getMbr_id());
			pstmt.setString(2, vo.getMbr_pw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setMbr_no(rs.getInt("mbr_no"));
				vo.setMbr_id(rs.getString("mbr_id"));
				vo.setMbr_pw(rs.getString("mbr_pw"));
				vo.setMbr_nm(rs.getString("mbr_nm")); 
				vo.setMbr_birth(rs.getDate("mbr_birth"));
				vo.setMbr_email(rs.getString("mbr_email"));
				vo.setMbr_phone(rs.getString("mbr_phone"));
				vo.setMbr_regi_date(rs.getDate("mbr_regi_date"));
				vo.setMbr_point(rs.getInt("mbr_point"));
				vo.setMbr_e_yn(rs.getString("mbr_e_yn"));
				vo.setMbr_author(rs.getString("mbr_author"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
	// 로그인시 아이디, 비밀번호 체크 메소드
	public int loginCheck(MemberVO vo) {
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int x = -1;
 
        try {
        	pstmt = conn.prepareStatement(LOGIN_CHK);
        	pstmt.setString(1, vo.getMbr_id());
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 입력된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("mbr_pw"); // 비번을 변수에 넣는다.
                if (dbPW.equals(vo.getMbr_pw())) 
                    x = 1; // 넘겨받은 비번과 꺼내온 비번 비교. 같으면 인증성공
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
            } else {
                x = -1; // 해당 아이디가 없을 경우
            }
            return x;
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    }
	// 로그인된 세션 아이디(sid)에 맞는 값들을 가져오는 메소드
	public MemberVO selectInfo(String sid) {
		try {
			pstmt = conn.prepareStatement(SELECT_INFO);
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			vo = new MemberVO();
			if(rs.next()) {
				vo.setMbr_no(rs.getInt("mbr_no"));
				vo.setMbr_id(rs.getString("mbr_id"));
				vo.setMbr_pw(rs.getString("mbr_pw"));
				vo.setMbr_nm(rs.getString("mbr_nm")); 
				vo.setMbr_birth(rs.getDate("mbr_birth"));
				vo.setMbr_email(rs.getString("mbr_email"));
				vo.setMbr_phone(rs.getString("mbr_phone"));
				vo.setMbr_regi_date(rs.getDate("mbr_regi_date"));
				vo.setMbr_point(rs.getInt("mbr_point"));
				vo.setMbr_e_yn(rs.getString("mbr_e_yn"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
	
	public List<MemberVO> member_list(MemberVO mvo) {
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			pstmt = conn.prepareStatement(MEMBER_LIST);
			pstmt.setInt(1, mvo.getFirst());
			pstmt.setInt(2, mvo.getLast());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setMbr_no(rs.getInt("mbr_no"));
				vo.setMbr_id(rs.getString("mbr_id"));
				vo.setMbr_nm(rs.getString("mbr_nm")); 
				vo.setMbr_birth(rs.getDate("mbr_birth"));
				vo.setMbr_email(rs.getString("mbr_email"));
				vo.setMbr_phone(rs.getString("mbr_phone"));
				vo.setMbr_regi_date(rs.getDate("mbr_regi_date"));
				vo.setMbr_point(rs.getInt("mbr_point"));
				vo.setMbr_e_yn(rs.getString("mbr_e_yn"));
				vo.setMbr_author(rs.getString("mbr_author"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public int count(MemberVO vo) { // 전체건수
		int cnt = 0;
		try {
			String SQL = "SELECT COUNT(*) FROM MEMBER";
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1); // 첫번쨰열. 카운트 결과
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	} 
	
	public int insert(MemberVO vo) {
		int n = 0;
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, vo.getMbr_id());
			pstmt.setString(2, vo.getMbr_pw());
			pstmt.setString(3, vo.getMbr_nm());
			pstmt.setDate(4, vo.getMbr_birth());
			pstmt.setString(5, vo.getMbr_email());
			pstmt.setString(6, vo.getMbr_phone());
			if (vo.getMbr_e_yn() == "" || vo.getMbr_e_yn() == null) {
				pstmt.setString(7, "n");
			} else {
				pstmt.setString(7, vo.getMbr_e_yn());
			}
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	public int update(MemberVO vo) {
		int n = 0;
		try {
			pstmt = conn.prepareStatement(UPDATE);
			pstmt.setString(1, vo.getMbr_pw());
			pstmt.setString(2, vo.getMbr_email());
			pstmt.setString(3, vo.getMbr_phone());
			if (vo.getMbr_e_yn() == "" || vo.getMbr_e_yn() == null) {
				pstmt.setString(4, "n");
			} else {
				pstmt.setString(4, vo.getMbr_e_yn());
			}
			pstmt.setString(5, vo.getMbr_id());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	public int delete(MemberVO vo) {
		int n = 0;
		try {
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setString(1, vo.getMbr_id());
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	private void close() { // 커넥션 끊어주는 close()메소드
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}