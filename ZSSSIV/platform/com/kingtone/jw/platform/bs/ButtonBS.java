package com.kingtone.jw.platform.bs;

import java.util.List;

import com.kingtone.jw.platform.domain.Button;

public interface ButtonBS {
	public void addButton(Button button)throws Exception;
	public List queryButtonID(String role_id)throws Exception;
}
