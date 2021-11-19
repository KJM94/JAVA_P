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
			<h1>Todo 쓰기</h1>
		</header>
			<form class="form-horizontal" method="post" action="" id="write_action">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="input01">내용</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="input01" name="content">
							<p class="help-block"></p>
						</div>
						<label class="control-label" for="input02">시작일</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="input02" name="created_on">
							<p class="help-block"></p>
						</div>
						<label class="control-label" for="input03">종료일</label>
						<div class="controls">
							<input type="text" class="input-xlarge" id="input03" name="due_date">
							<p class="help-block"></p>
						</div>

						<div class="form-actions">
							<input type="submit" class="btn btn-primary" id="write_btn" value="작성">
						</div>
					</div>
				</fieldset>
			</form>
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