<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030" />
<title>Jane shopping</title>
<link rel="stylesheet" href="styles/main.css" type="text/css" />
<link rel="stylesheet" href="styles/index.css" type="text/css" />
<link rel="stylesheet" href="styles/skin/skin_0.css" type="text/css" id="cssfile" />
<script src="scripts/jquery-1.3.1.js" type="text/javascript"></script>
<script src="scripts/jquery.cookie.js" type="text/javascript"></script>
<script src="scripts/nav.js" type="text/javascript"></script>
<script src="scripts/changeSkin.js" type="text/javascript"></script>
<script src="scripts/slide.js" type="text/javascript"></script>
<script src="scripts/scroll.js" type="text/javascript"></script>
<script src="scripts/tooltip.js" type="text/javascript"></script>
<script src="scripts/tree.js" type="text/javascript"></script>
<script src="scripts/ad.js" type="text/javascript"></script>
<script src="scripts/imgHover.js" type="text/javascript"></script>
<script src="scripts/imgSlide.js" type="text/javascript"></script>
</head>
<body>
<!--ͷ����ʼ-->
<div id="header">
	<a id="logo" href="#">Jane Shopping</a>
	<ul id="skin">
		<li id="skin_0" title="��ɫ" class="selected">��ɫ</li>
		<li id="skin_1" title="��ɫ">��ɫ</li>
		<li id="skin_2" title="��ɫ">��ɫ</li>
		<li id="skin_3" title="����ɫ">����ɫ</li>
		<li id="skin_4" title="��ɫ">��ɫ</li>
		<li id="skin_5" title="����ɫ">����ɫ</li>
	</ul>

</div>
<!--ͷ������-->
<!--������ʼ-->
<div id="navigation">
	<ul>
		 <li><a href="#">�� ҳ</a></li>
		 <li><a href="#">�� ��</a>
				<ul>
					 <li><a href="#">�������</a></li>
					 <li><a href="#">�������</a></li>
					 <li><a href="#">�������</a></li>
				</ul>
		</li>
		<li><a href="#">�� ��</a>
				<ul>
					 <li><a href="#">��������</a></li>
					 <li><a href="#">��ͷ����</a></li>
				</ul>
		 </li>
		<li><a href="#">�� ��</a>
				<ul>
					 <li><a href="#">���п�</a></li>
					 <li><a href="#">�����</a></li>
					 <li><a href="#">ţ�п�</a></li>
                     <li><a href="#">�̿�</a></li>
                </ul>
         </li>
		 <li><a href="#">��ϵ����</a></li>
		
		 <li><a href="login.jsp" >��¼</a></li>
		 <li><a href="register.jsp" >ע��</a></li>
	</ul>
</div>
<!--��������-->
<!--���忪ʼ-->
<div id="content">
	<div class="content_left">
		<div class="global_module news">
			<h3>���¶�̬</h3>
			<div class="scrollNews" >
				<ul>
					<li><a href="#" class="tooltip" title="��������ë�½���һ����.">��������ë�½���һ����.</a></li>
					<li><a href="#" class="tooltip" title="��װ�ٴ�С��ײ���50Ԫ.">��װ�ٴ�С��ײ���50Ԫ.</a></li>
					<li><a href="#" class="tooltip" title="������С��װ���˷���.">������С��װ���˷���.</a></li>
					<li><a href="#" class="tooltip" title="��ĩѩ�ĵ��������˦��.">��ĩѩ�ĵ��������˦��.</a></li>
					<li><a href="#" class="tooltip" title="����������Ƽ�����װ.">����������Ƽ�����װ.</a></li>
					<li><a href="#" class="tooltip" title="48Ԫ������֯С����������.">48Ԫ������֯С����������.</a></li>
					<li><a href="#" class="tooltip" title="����ѩ���������ڴ����.">����ѩ���������ڴ����.</a></li>
				</ul>
			</div>
			<p class="module_up_down"><img src="images/down.gif" alt="" /></p>
		</div>
 		<div class="global_module procatalog">
			<h3>��Ʒ����</h3>
			<ul class="m-treeview">
				<li class="m-expanded">
					<span>����</span>
					<ul>
						<li><span>�������</span></li>
						<li><span>�������</span></li>	
					</ul>
				</li>
				<li class="m-expanded">
					<span>����</span>
					<ul>
						<li ><span>��������</span></li>
						<li ><span>��ͷ����</span></li>	
					</ul>
				</li>
				<li class="m-expanded">
					<span>����</span>
					<ul>
						<li><span>���п�</span></li>
						<li><span>���̿����</span></li>	
						<li><span>ţ�п�</span></li>
						<li><span>�̿�</span></li>
					</ul>
				</li>
		   </ul>
			<p class="module_up_down"><img src="images/down.gif" alt="" /></p>
		</div>
    </div>
	<div class="content_right">
		<div class="ad" >
			 <ul class="slider" >
				<li><img src="images/ads/1.gif"/></li>
				<li><img src="images/ads/2.gif"/></li>
				<li><img src="images/ads/3.gif"/></li>
				<li><img src="images/ads/4.gif"/></li>
				<li><img src="images/ads/5.gif"/></li>
			  </ul>
			  <ul class="num" >
				<li>1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li>5</li>
			  </ul>
		</div>
  		<div class="global_module prolist">
			<h3>�¿�����</h3>
            <div  class="prolist_content">
                <ul>
                    <li>
                        <a href="detail.html"><img src="images/img_1.jpg" alt="" /></a><span>���̸�֧�޳���1</span><span>$120.00</span>
                    </li>
                    <li>
                        <a href="detail.html"><img src="images/img_2.jpg" alt="" /></a><span>����б�Ƴ���</span><span>$129.00</span>
                    </li>
                    <li>
                        <a href="detail.html"><img src="images/img_3.jpg" alt="" /></a><span>��С������װ����</span><span>$129.00</span>
                    </li>
                    <li>
                        <a href="detail.html"><img src="images/img_4.jpg" alt="" /></a><span>С�����������ɫ</span><span>$129.00</span>
                    </li>
                        <li>
                        <a href="detail.html"><img src="images/img_1.jpg" alt="" /></a><span>���̸�֧�޳���2</span><span>$120.00</span>
                    </li>
                    <li>
                        <a href="detail.html"><img src="images/img_2.jpg" alt="" /></a><span>����б�Ƴ���</span><span>$129.00</span>
                    </li>
                    <li>
                        <a href="detail.html"><img src="images/img_3.jpg" alt="" /></a><span>��С������װ����</span><span>$129.00</span>
                    </li>
                    <li>
                        <a href="detail.html"><img src="images/img_4.jpg" alt="" /></a><span>С�����������ɫ</span><span>$129.00</span>
                    </li>
                        <li>
                        <a href="detail.html"><img src="images/img_1.jpg" alt="" /></a><span>���̸�֧�޳���3</span><span>$120.00</span>
                    </li>
                    <li>
                        <a href="detail.html"><img src="images/img_2.jpg" alt="" /></a><span>����б�Ƴ���</span><span>$129.00</span>
                    </li>
                    <li>
                        <a href="detail.html"><img src="images/img_3.jpg" alt="" /></a><span>��С������װ����</span><span>$129.00</span>
                    </li>
                    <li>
                        <a href="detail.html"><img src="images/img_4.jpg" alt="" /></a><span>С�����������ɫ</span><span>$129.00</span>
                    </li>
                </ul>
            </div>
            <p class="module_left_right"><img class="goLeft" src="images/left.gif" alt="" /><img class="goRight" src="images/right.gif" alt="" /></p>
		</div>
   </div> 
</div>
<!--�������-->
</body>
</html>
    