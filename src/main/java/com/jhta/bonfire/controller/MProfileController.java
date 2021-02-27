package com.jhta.bonfire.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.UpdateProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.bonfire.service.MProfileService;
import com.jhta.bonfire.vo.MProfileVo;

@Controller
public class MProfileController {
	@Autowired ServletContext sc;
	@Autowired
	private MProfileService service;
	
	@GetMapping("/editProfile")
	public String editForm(HttpSession session,Model model) {
		String id=(String)session.getAttribute("id");
		MProfileVo vo=service.select(id);
		model.addAttribute("vo",vo);
		return ".feed.mypage.editProfile";
	}
	@PostMapping("/editProfile")
	public String edit(HttpSession session,MProfileVo vo, MultipartFile bfile, MultipartFile pfile) {
		String id=(String)session.getAttribute("id");
		//������
		String uPath=sc.getRealPath("/resources/upload");
		File uFile=new File(uPath);
		if (!uFile.isDirectory()) uFile.mkdirs();
		String pPath = sc.getRealPath("/resources/upload/profile");
		String bPath = sc.getRealPath("/resources/upload/banner");
		File pFile=new File(pPath);
		File bFile=new File(bPath);
		if (!pFile.isDirectory()) pFile.mkdirs();
		if (!bFile.isDirectory()) bFile.mkdirs();
		//���� Ȯ����
		String bExtension=FilenameUtils.getExtension(bfile.getOriginalFilename()).toLowerCase();
		String pExtension=FilenameUtils.getExtension(pfile.getOriginalFilename()).toLowerCase();
//		String orgpfilename = pfile.getOriginalFilename(); // ���۵� ���ϸ�
		String savepfilename = id + "." + pExtension; // �ߺ����� �ʴ� ���ϸ� �����
//		String orgbfilename = bfile.getOriginalFilename(); // ���۵� ���ϸ�
		String savebfilename = id + "." + bExtension; // �ߺ����� �ʴ� ���ϸ� �����
		
		//���� ���� �����.
		MProfileVo existVo=service.select(vo.getId());
		String existPfilename=existVo.getPfilename();
		String existBfilename=existVo.getBfilename();
		try {
			if(!(pfile.isEmpty())) {
				System.out.println("pfile:"+pfile);
				if(existPfilename!=null) {
					File f=new File(pPath+"//"+existPfilename);
					f.delete();
				}
				//1. ���Ͼ��ε�
				InputStream is = pfile.getInputStream(); // ���۵� ������ �о���� ���� ��Ʈ��
				FileOutputStream fos = new FileOutputStream(pPath + "\\" + savepfilename); // ������ ������ ���Ͻ�Ʈ�� ��ü
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				//2. DB�� �������� ����
				vo.setPfilename(savepfilename);
			}else {
				if(existPfilename!=null) {
					vo.setPfilename(existPfilename);
				}else {
					vo.setPfilename("");
				}
			}
			if(!(bfile.isEmpty())) {
				System.out.println("bfile:"+bfile);
				if(existBfilename!=null) {
					File f=new File(bPath+"//"+existBfilename);
					f.delete();
				}
				//1. ���Ͼ��ε�
				InputStream is = bfile.getInputStream(); // ���۵� ������ �о���� ���� ��Ʈ��
				FileOutputStream fos = new FileOutputStream(bPath + "\\" + savebfilename); // ������ ������ ���Ͻ�Ʈ�� ��ü
				FileCopyUtils.copy(is, fos);
				is.close();
				fos.close();
				//2. DB�� �������� ����
				vo.setBfilename(savebfilename);
			}else {
				if(existBfilename!=null) {
					vo.setBfilename(existBfilename);
				}else {
					vo.setBfilename("");
				}
				
			}
			service.updateProfile(vo);
			return "redirect:/@"+vo.getId();
		} catch (IOException ie) {
			ie.printStackTrace();
			return ".home";
		}
	}
	
}
