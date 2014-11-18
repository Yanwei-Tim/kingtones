package com.kingtone.jw.platform.auth;

import java.util.List;

import com.kingtone.jw.platform.bs.ButtonBS;
import com.kingtone.jw.platform.domain.Button;
import com.kingtone.ssi.action.SSIAction;

public class ButtonAC extends SSIAction {

	private Button button;
	private ButtonBS buttonBS;
	private String viewID;
	private boolean isViewID;
	public boolean isViewID() {
		return isViewID;
	}
	public void setViewID(boolean isViewID) {
		this.isViewID = isViewID;
	}
	public String getViewID() {
		return viewID;
	}
	public void setViewID(String viewID) {
		this.viewID = viewID;
	}
	public void setButtonBS(ButtonBS buttonBS) {
		this.buttonBS = buttonBS;
	}
	public String addButton() throws Exception{
		buttonBS.addButton(button);
		return JSON;
	}
	public Button getButton() {
		return button;
	}
	public void setButton(Button button) {
		this.button = button;
	}
}
