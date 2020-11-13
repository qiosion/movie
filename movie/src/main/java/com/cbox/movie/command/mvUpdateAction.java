package com.cbox.movie.command;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cbox.common.Action;
import com.cbox.common.FileRenamePolicy;
import com.cbox.common.FileUtil;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieVO;

public class mvUpdateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		MovieDAO dao = new MovieDAO();
		MovieVO vo = new MovieVO();

		vo.setMvNum(Integer.parseInt(request.getParameter("mvNum")));
		vo.setMvTitle(request.getParameter("mvTitle"));
		vo.setMvDir(request.getParameter("mvDir"));
		vo.setStrdate(Date.valueOf(request.getParameter("strdate")));
		vo.setFindate(Date.valueOf(request.getParameter("findate")));
		vo.setMvType(request.getParameter("mvType"));
		vo.setMvAge(request.getParameter("mvAge"));
		vo.setMvCha(request.getParameter("mvCha"));
		vo.setMvSum(request.getParameter("mvSum"));
		vo.setMvCont(request.getParameter("mvCont"));

		String addPath = request.getServletContext().getRealPath("/images");
		// 포스터 : 단일
		
		try {
			if (!request.getParameter("prevPost").equals("") && request.getParameter("mvPost") == null) {
				vo.setMvPost(request.getParameter("prevPost"));
			} else {
				Part  part = request.getPart("mvPost");
				String fileName = FileUtil.extractFileName(part);
				if (!fileName.equals("")) {
					String uploadFile = addPath + File.separator + fileName;
					part.write(new File(uploadFile).getAbsolutePath()); // 절대경로

					vo.setMvPost(new File(uploadFile).getName());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 스틸컷 : 단일
		if (request.getParameter("prevImg").equals("") && request.getParameter("mvImg") == null) {
			vo.setMvImg(request.getParameter("prevImg"));
		} else {
			try {
				Part part = request.getPart("mvImg");
				String fileName = FileUtil.extractFileName(part);
				if (!fileName.equals("")) {
					String uploadFile = addPath + File.separator + fileName; // File.separator 구분기호?
//					File renameFile = FileRenamePolicy.rename(new File(uploadFile));
					part.write(new File(uploadFile).getAbsolutePath()); // 절대경로

					vo.setMvImg(new File(uploadFile).getName());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 티저 : 단일
		if (request.getParameter("prevTeaser").equals("") && request.getParameter("mvTeaser") == null) {
			vo.setMvTeaser(request.getParameter("prevTeaser"));
		} else {
			try {
				Part part = request.getPart("mvTeaser");
				String fileName = FileUtil.extractFileName(part);
				if (!fileName.equals("")) {
					String uploadFile = addPath + File.separator + fileName; // File.separator 구분기호?
//					File renameFile = FileRenamePolicy.rename(new File(uploadFile));
					part.write(new File(uploadFile).getAbsolutePath()); // 절대경로

					vo.setMvTeaser(new File(uploadFile).getName());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		dao.movieUpdate(vo);

		try {
			response.getWriter().print("{\"result\":true}");
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

}
