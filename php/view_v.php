<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>CodeIgniter</title>
	<!--[if lt IE9]>
	<script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<link type="text/css" rel='stylesheet' href="/todo/include/css/bootstrap.css"/>
</head>
<body>
<div id="main">
	
	<header id="header" data-role="header" data-position="fixed"><!-- header start -->
		<blockquote>
			<p>만들면서 배우는 Codeigniter</p>
			<small>실행 예제</small>
		</blockquote>
	</header><!-- header end -->

	<nav id="gnb"><!-- gnb Start -->
		<ul>
			<li>
				<a rel="external" href="/todo/index.php/main/lists/">todo 애플리케이션 프로그램</a>
			</li>
		</ul>
	</nav><!-- gnb end -->
	<article id="board_area">
		<header>
			<h1>Todo 조회</h1>
		</header>
			<table cellspacing="0" cellpadding="0" class="table table-sriped">
				<thead>
					<tr>
						<th scope="col"><?php echo $views->id;?> 번 할일</th>
						<th scope="col">시작일 : <?php echo $views->created_on;?></th>
						<th scope="col">종료일 : <?php echo $views->due_date;?></th>
					</tr>
				</thead>
				<tbody>
			<tr>
				<th colspan="3">
					<?php echo $views->content;?>
				</th>
			</tr>
			
	</tbody>
	<tfoot>
		<tr>
			<th colspan="4"><a href="/todo/index.php/main/lists/" class="btn btn-success">목록</a>
			<a href="/todo/index.php/main/delete/<?php echo $this->uri->segment(3);?>" class="btn btn-danger">삭제</a>
			</th>
		</tr>
	</tfoot>

				</table>
				
				</article>

		<footer id="footer">
			<blockquote>
				<p><a class="azubu" href="http://www.cikorea.net/" target="blank">CodeIgniter한국사용자포럼</a></p>
				<small>Copyright by <em class="black"><a href="mailto:advisor@cikorean.net">웅파</a></small>
			</blockquote>
		</footer>
		
</div>
</body>
</html>