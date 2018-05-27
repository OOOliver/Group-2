<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String plantId = request.getParameter("plantId");
String plantname = request.getParameter("plantname");
plantname = new String(plantname.getBytes("ISO8859-1"),"utf-8");   //转换乱码
 %>
 <div class="modal-body" id="delete-info-details">
					<label class="radio checked"><span class="icon"></span><span class="icon-to-fade"></span>
           			<input type="radio" name="deleteNodeType" id="deleteNodeType0" value="0"  checked="">
            			删除<span style="background-color:#00ff40"><%=plantname %></span>及其下级分类
          			</label>
          			<label class="radio "><span class="icon"></span><span class="icon-to-fade"></span>
           			<input type="radio" name="deleteNodeType" id="deleteNodeType1" value="1">
           				删除<span style="background-color:#00ff40"><%=plantname %></span>的下级分类
           				（不删除<span style="background-color:#00ff40"><%=plantname %></span>）
          			</label>
				</div>
				<div class="modal-footer">
					 <button class="btn btn-primary" onclick="deleteNode('<%=plantId %>')">确定</button>
					 <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
				</div>
