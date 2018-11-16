package com.jsite.modules.file.entity;

import com.jsite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 文件管理Entity
 * @author liulin
 * @version 2018-03-28
 */
public class SysFile extends DataEntity<SysFile> {
	
	private static final long serialVersionUID = 1L;
	private String fileTreeId;		// 文件所在文件夹
	private String fileTreeName;	//文件所在文件夹名称
	private String name;		// 文件名称
	private String path;		// 文件路径
	private String saveName;    // 文件服务器保存名称
	private String fileSize;    // 文件大小
	
	public SysFile() {
		super();
	}

	public SysFile(String id){
		super(id);
	}

	@Length(min=1, max=64, message="文件分类长度必须介于 1 和 64 之间")
	public String getFileTreeId() {
		return fileTreeId;
	}

	public void setFileTreeId(String fileTreeId) {
		this.fileTreeId = fileTreeId;
	}
	
	@Length(min=1, max=256, message="文件名称长度必须介于 1 和 256 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=256, message="文件路径长度必须介于 0 和 256 之间")
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	
	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileTreeName() {
		return fileTreeName;
	}

	public void setFileTreeName(String fileTreeName) {
		this.fileTreeName = fileTreeName;
	}
	
	
}