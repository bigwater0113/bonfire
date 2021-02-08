<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- search.jsp -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<style>
	label{width:100px;display:inline-block;}
	#search_left{width:600px;float:left;}
	#search_right{width:600px;float:right;}
</style>
<div id="searchApp">
	<div id="search_left">
		<label for="id_name">이름</label><input type="text" id="id_name" v-model="id_name"><br>
		<label for="id_email">이메일</label><input type="email" id="id_email" v-model="id_email"><br>
		<button @click="searchId">아이디 찾기</button>
		<br><br>
		<div >
			{{idMsg}}<br>
			<button @click="loginPage" v-show="id_show">로그인 페이지</button>
		</div>
	</div>
	<div id="search_right">
		<label for="pwd_id">아이디</label><input type="text" id="pwd_id" v-model="pwd_id"><br>
		<label for="pwd_name">이름</label><input type="text" id="pwd_name"v-model="pwd_name"><br>
		<label for="pwd_email">이메일</label><input type="email" id="pwd_email"v-model="pwd_email"><br>
		<button @click="searchPwd">비밀번호 찾기</button>
		<br><br>
		<div>
			{{pwdMsg}}<br>
			<input type="text" v-model="codeNum"  v-show="pwd_show">
			<span v-show="pwd_show">{{mm}}:{{ss}}</span>
			<button @click="goEditPwd" v-show="pwd_show">비밀번호 변경</button>
		</div>
	</div>
</div>
<script>
	new Vue({
		el:'#searchApp', 
		data:{ 
			idMsg:'',
			pwdMsg:'test',
			id_show:false,
			pwd_show:false,
			id_name:'',
			id_email:'',
			pwd_id:'test',
			pwd_name:'윤태수',
			pwd_email:'xotnwnl@naver.com',
			timer:125,
			mm:0,
			ss:0,
			codeNum:'',
			sendCode:''
		},
		methods:{
			searchId:function(){
				var ajax=axios({
					method:'get',
					params:{
						name:this.id_name,
						email:this.id_email
					},
					url:'${pageContext.request.contextPath}/searchId'
				});
				ajax.then(function(resp){
					if(resp.data!=''){
						this.id_show=true;
						this.idMsg="회원님의 아이디는 ["+resp.data+"]입니다.";
					}else{
						this.id_show=false;
						this.idMsg="해당회원이 존재하지 않습니다.";
					}
				}.bind(this));//bind라는 메소드를 사용하여 this를 연결
				
// 				axios.post('${pageContext.request.contextPath}/searchid').then(function(resp){
// 					alert(resp.data);
// 				}.bind(this));
			},
			searchPwd:function(){
				var ajax=axios({
					method:'get',
					params:{
						id:this.pwd_id,
						name:this.pwd_name,
						email:this.pwd_email
					},
					url:'${pageContext.request.contextPath}/searchPwd'
				});
				ajax.then(function(resp){
					alert(resp.data);
					if(resp.data!=''){
						this.pwdMsg="이메일로 인증코드를 발송하였습니다.";
						this.sendCode=resp.data;
						this.pwd_show=true;
						setInterval(function() {
							this.mm=parseInt(parseInt(this.timer)/60);
							this.ss=parseInt(parseInt(this.timer)-(60*parseInt(this.mm)));
							if(this.ss<10){
								this.ss = "0"+this.ss;
							}
							this.timer = parseInt(this.timer)-1;
							if(this.timer==0){
								location.href='${cp }/searchIdPwd';
							}
						}.bind(this), 1000);
					}else{
						this.pwd_show=false;
						this.pwdMsg="해당회원이 존재하지 않습니다.";
					}
				}.bind(this));//bind라는 메소드를 사용하여 this를 연결
			},
			loginPage:function(){
				location.href='${cp }/login';
			},
			goEditPwd:function(){
				if(this.codeNum==this.sendCode){
					location.href='${cp }/editPwd?searchId='+this.pwd_id;
				}else{
					alert("인증번호가 틀렸어요~");
				}
			}
		}
	});
</script>