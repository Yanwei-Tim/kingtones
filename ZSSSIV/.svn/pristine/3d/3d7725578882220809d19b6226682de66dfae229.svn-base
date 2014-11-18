/**
 * 文件名：CascadeDataOperator.java
 * 
 * 创建人：邹甲乐 - zoujiale@kingtoneinfo.com
 * 
 * 创建时间：Apr 2, 2011
 * 
 * 版权所有：西安联合信息技术股份有限公司
 */
package com.kingtone.ssi.util;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>[描述信息：说明类的基本功能]</p>
 *
 * @author 邹甲乐 - zoujiale@kingtoneinfo.com
 * @version 1.0 Created on Sep 3, 2008 7:01:37 PM
 */
public abstract class CascadeDataOperator {

	public List<List<String>> queryNodeIdByLevel(String nodeId) throws Exception {
		// 构造一个根结点
		List<String> root = new ArrayList<String>();
		root.add(nodeId);
		// 将参数节点加入到列表中，保证while循环会进行便利
		List<List<String>> list = new ArrayList<List<String>>();
		list.add(root);
		// 初始化层级
		int level = 0;
		// 循环遍历列表中节点的子节点
		while (level < list.size()) {
			List<String> resIds = list.get(level);
			// 初始化下一层级中的子节点列表（将同一个层级的子节点放在一个列表中）
			List<String> currentLevelResIds = new ArrayList<String>();
			// 遍历当前层级的子节点，找到他们的子节点，加入到下一层级的子节点列表中
			for (String resId : resIds) {
				// 查询某个节点的子节点
				List<String> childResIds = queryChildNodeIdList(resId);
				currentLevelResIds.addAll(childResIds);
			}
			if (currentLevelResIds.size() != 0) {
				list.add(currentLevelResIds);
			}
			level++;
		}
		return list;
	}

	public List<String> queryChildNodeIdList(String parentNodeId, boolean cascade) throws Exception {
		if (!cascade)
			return queryChildNodeIdList(parentNodeId);
		List<List<String>> list = queryNodeIdByLevel(parentNodeId);
		// 删除第一个节点，及删除父节点本身
		if (list.size() > 0) {
			list.remove(0);
		}
		List<String> result = new ArrayList<String>();
		for (List<String> e : list) {
			result.addAll(e);
		}
		return result;
	}

	public void deleteNodeById(String[] nodeIds) throws Exception {
		for (String parentId : nodeIds) {
			// 按照层次结构给出所查询节点的子节点列表，[[一级],[二级],[三级],...]
			List<List<String>> childIdListByLevel = queryNodeIdByLevel(parentId);
			// 从最下一级开始删除节点，保证外键关系的约束
			for (int level = childIdListByLevel.size() - 1; level >= 0; level--) {
				// 获取某级中的节点Id
				List<String> resIds = childIdListByLevel.get(level);
				// 删除指定的节点，因为是最底层节点，因此不会违反外键约束
				batchDeleteNodeById((String[]) resIds.toArray(new String[resIds.size()]));
			}
		}
	}

	public abstract List<String> queryChildNodeIdList(String parentNodeId) throws Exception;

	public abstract void batchDeleteNodeById(String[] nodeIds) throws Exception;
}
