/*
* Copyright (c)  2015, Newtouch
* All rights reserved. 
*
* $id: AccountController.java 9552 2015年2月25日 上午11:12:00 WangLijun$
*/
package com.newtouch.lion.admin.web.controller.system.user; 

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.newtouch.lion.admin.web.model.system.user.PasswordVo;
import com.newtouch.lion.admin.web.model.system.user.UserInfoVo;
import com.newtouch.lion.model.system.User;
import com.newtouch.lion.service.system.UserService;
import com.newtouch.lion.web.constant.ConstantMessage;
import com.newtouch.lion.web.controller.AbstractController;
import com.newtouch.lion.web.servlet.view.support.BindMessage;
import com.newtouch.lion.web.servlet.view.support.BindResult;
import com.newtouch.lion.web.shiro.credentials.PasswordEncoder;
import com.newtouch.lion.web.shiro.session.LoginSecurityUtil;

/**
 * <p>
 * Title: 用户账户信息管理
 * </p>
 * <p>
 * Description: 用户账户信息管理（用于密码修改、个人账户信息修改、）
 * </p>
 * <p>
 * Copyright: Copyright (c) 2015
 * </p>
 * <p>
 * Company: Newtouch
 * </p>
 * 
 * @author WangLijun
 * @version 1.0
 */
@Controller(value = "sysAccount")
@RequestMapping("/system/account/")
public class AccountController extends AbstractController{
	
	/**个账户首页**/
	private static final String INDEX_RETURN="/system/account/index";
	/**日历首页*/
	private static final String CALENDAR_RETURN="/system/account/calendar";
	/**通知消息*/
	private static final String NOTIFICATIONS_RETURN="/system/account/notifications";
	/**用户服务器*/
	@Autowired
	private UserService userService;
	/**密码服务器*/
	@Autowired
	private PasswordEncoder passwordEncoderService;
	/**个人主页*/
	@RequestMapping("index")
	public String index(Model model){
		User user = LoginSecurityUtil.getUser();
		user = this.userService.doFindById(user.getId());
		model.addAttribute("user", user);
		return INDEX_RETURN;
	}
	/**日历*/
	@RequestMapping("calendar")
	public String calendar(Model model){
		return  CALENDAR_RETURN;
	}
	/**消息*/
	@RequestMapping("notifications")
	public String notifications(){
		return NOTIFICATIONS_RETURN;
	}
	
	/**修改基本信息*/
	@RequestMapping("changeinfo")
	@ResponseBody
	public ModelAndView  changeInfo(@Valid @ModelAttribute("userInfoVo") UserInfoVo userInfoVo,Errors errors, ModelAndView modelAndView){
		User user =LoginSecurityUtil.getUser();
		// 获取用户登录的IP地址
		user = this.userService.doFindById(user.getId());
	
		user.setRealnameEn(userInfoVo.getRealnameEn());
		user.setRealnameZh(userInfoVo.getRealnameZh());		
		user.setMobile(userInfoVo.getMobile());
		user.setTelephone(userInfoVo.getTelephone());
		user.setOfficePhone(userInfoVo.getOfficePhone());
		user.setFax(userInfoVo.getFax());
		user.setPostcode(userInfoVo.getPostcode());
		user.setLocation(userInfoVo.getLocation());
		user.setDescription(userInfoVo.getDescription());
		this.userService.doUpdate(user);
		Map<String, String> params = new HashMap<String, String>();
		params.put(BindResult.SUCCESS,ConstantMessage.EDIT_SUCCESS_MESSAGE_CODE);
		modelAndView.addObject(BindMessage.SUCCESS, params);
		return this.getJsonView(modelAndView);
	}
	/**修改密码*/
	@RequestMapping("changepwd")
	@ResponseBody
	public ModelAndView changePwd(@Valid @ModelAttribute("passwordVo") PasswordVo passwordVo,Errors errors, ModelAndView modelAndView) {
		if (StringUtils.isEmpty(passwordVo.getOldpassword())) {
			errors.rejectValue("oldpassword", null, "请输入旧密码");
		}

		if (StringUtils.isEmpty(passwordVo.getPassword())) {
			errors.rejectValue("password", null, "请输入新的密码");
		}

		if (StringUtils.isEmpty(passwordVo.getConfirmpassword())) {
			errors.rejectValue("confirmpassword", null, "请输入新的确认密码");
		}
		/* 判断旧密码、新密码、确认新密码不能为空 */
		if (errors.hasErrors()) {
			modelAndView.addObject(BindMessage.ERRORS_MODEL_KEY, errors);
			return this.getJsonView(modelAndView);
		}

		// 判断旧密码不能新密码相同
		if (passwordVo.getOldpassword().equals(passwordVo.getPassword())) {
			errors.reject(null, "新密码不能和旧密码相同");
		}
		// 判断两次输入的新密码是否一致
		if (!passwordVo.getPassword().equals(passwordVo.getConfirmpassword())) {
			errors.reject(null, "两次输入密码不一致");
		}
		/* 返回旧密码不能与新密码相同，及新密码和确认新密码是否一致 */
		if (errors.hasErrors()) {
			modelAndView.addObject(BindMessage.ERRORS_MODEL_KEY, errors);
			return this.getJsonView(modelAndView);
		}

		User user =LoginSecurityUtil.getUser();
		// 获取用户登录的IP地址
		user = this.userService.doFindById(user.getId());
		String passwordEncoder = passwordEncoderService.encodePassword(passwordVo.getOldpassword(), user.getUsername());
		if (!passwordEncoder.equals(user.getPassword())) {
			// ValidationUtils.rejectIfEmpty(errors,
			// "oldPwd",null,"您输入的旧密码不正确，请重新输入");
			errors.reject("","旧密码不正确");
			modelAndView.addObject(BindMessage.ERRORS_MODEL_KEY, errors);
			return this.getJsonView(modelAndView);
		}
		String newPasswordEncoder = this.passwordEncoderService.encodePassword(passwordVo.getPassword(), user.getUsername());
		user.setPassword(newPasswordEncoder);
		this.userService.doUpdate(user);

		Map<String, String> params = new HashMap<String, String>();
		params.put(BindResult.SUCCESS,ConstantMessage.EDIT_SUCCESS_MESSAGE_CODE);
		modelAndView.addObject(BindMessage.SUCCESS, params);

		return this.getJsonView(modelAndView);
	}
}

	