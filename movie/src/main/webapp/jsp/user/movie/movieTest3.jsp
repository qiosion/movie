<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

console.log(">>");
var key = "?key=0b20e5176c77db3f706f2e8a0783dec3" // key 앞에 <?key=>를 붙여야함 : prameter
	var itemPerPage = "&itemPerPage=20" //20개를 가져올것이라서
	const url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json"
	            + key
	            + itemPerPage 
	var item_int = 20

	var title = document.getElementById('a'); //html에서 id a에 해당하는 것
	fetch(url).then(response.json())
	            .then(function(msg){ //아래부터는 html로 가져오기 위한 코드
	                for(var i =0; i<item_int; i++){
	                    var div = document.createElement('div');
	                    var low_div = document.createElement('div')
	                    var title_div = document.createElement('div')
	                    var br = document.createElement('br');

	                    var mp = document.createElement('p');
	                    mp.id = 'movieNm'
	                    var np = document.createElement('p');
	                    np.id = 'nationAlt'
	                    var gp = document.createElement('p');
	                    gp.id = 'genreAlt'
	                    var pp = document.createElement('p');
	                    pp.id = 'prdtYear'
	                    title_div.id = 'title_div'
	                    low_div.id = 'low_div'
	                    div.id = 'movies'
	                    short_url = msg.movieListResult.movieList[i]
	                    console.log(short_url);
	                    div.appendChild(title_div)
	                    div.appendChild(low_div)
	                    title.appendChild(div);
	                    var movieNm = document.createTextNode(short_url.movieNm);
	                    var nationAlt = document.createTextNode(short_url.nationAlt);
	                    var genreAlt = document.createTextNode(short_url.genreAlt);
	                    var prdtYear = document.createTextNode(short_url.prdtYear);
	                    
	                    mp.appendChild(movieNm);
	                    np.appendChild(nationAlt);
	                    gp.appendChild(genreAlt);
	                    pp.appendChild(prdtYear);

	                    title_div.appendChild(mp);
	                    low_div.appendChild(br);
	                    low_div.appendChild(np);
	                    low_div.appendChild(gp);
	                    low_div.appendChild(pp);
	                }     
	            });
</script>
</head>
<body>
	<div id="a"></div>
</body>
</html>