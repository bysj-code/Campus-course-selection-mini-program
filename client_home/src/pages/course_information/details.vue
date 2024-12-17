<template>
	<view class="page_course_information diy_detail diy_detail--new" id="course_information_details">
		<view class="warp">
			<view class="container-fluid">
				<view class="row">
					<view v-if="$check_field('get','course_no')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>课程编号</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["course_no"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','course_name')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>课程名称</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["course_name"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','cover')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>封面</span>
							</view>
								<view class="diy_field diy_img">
								<img :src="$fullUrl(obj['cover'])" />
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','course_type')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>课程类型</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["course_type"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','class_time')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>上课时间</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["class_time"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','class_location')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>上课地点</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["class_location"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','number_of_people_remaining')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>剩余人数</span>
							</view>
								<view class="diy_field diy_number">
								<span>
									{{ obj["number_of_people_remaining"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','teacher_user')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>教师用户</span>
							</view>
								<view class="diy_field diy_uid">
								{{ get_user_teacher_user(obj['teacher_user']) }}
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','teacher_name')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>教师姓名</span>
							</view>
								<view class="diy_field diy_text">
								<span>
									{{ obj["teacher_name"] }}
								</span>
							</view>
							</view>
					</view>
					<view v-if="$check_field('get','course_introduction')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>课程介绍</span>
							</view>
								<view class="diy_field diy_desc">
								<span>
									{{ obj["course_introduction"] }}
								</span>
							</view>
							</view>
					</view>
				</view>
			</view>
			<view class="row">
					<view class="col-12 col-md-4 view">
					<span>点赞{{ obj["praise_len"] }}</span>
				</view>
	
	
					<view class="col-12 col-md-4 view">
					<span>点击数{{ obj["hits"] }}</span>
				</view>
				</view>
		</view>

	<div class='warp' v-if='timeTypeShow'>
		<div class='container-fluid'>
			<div class='row'>
				<div class='col'>
					<div class='time_type'>
							<span>
								{{ obj['timer_title'] }}
							</span>
						<div>
							<span>{{ timer_start_day }}</span>天
							<span>{{ timer_start_hour }}</span>小时
							<span>{{ timer_start_min }}</span>分
							<span>{{ timer_start_sec }}</span>秒
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

		<div  class="warp">
			<div class='container-fluid'>
				<div class='row'>
					<div class='col'>
						<span >限制次数：{{ obj['limit_times'] }}</span>
					</div>
				</div>
			</div>
		</div>

		<!-- 评论区标题 -->
		<view class="bar_title comment_title">
			<view class="title">
				<navigator :url="bar_url">
					<text>
						{{ bar_title }}
					</text>
				</navigator>
			</view>
		</view>

		<!-- 评论区列表 -->
		<list_comment :list="list_comment"></list_comment>

		<view class="warp">
			<view class="container-fluid container-fluid-comment--new">
				<view class="row">
					<view class="col">
									<button type="button" class="btn btn-primary" v-if="$check_action('/course_schedule/edit','add')" @click="to_form('/pages/course_schedule/edit')">
							<span>确认选课</span>
						</button>
			
<!--						<button type="button" class="btn btn-primary" @click="cancel()">返回</button>-->

						<button type="button" class="btn btn-primary" @click="change_praise()">
							<span>点赞</span>
						</button>


						<navigator class="btn link"
							:url="'/pages/comment/edit?source_table=course_information&source_field=course_information_id&source_id=' + obj['course_information_id']">
							评论
						</navigator>

						<navigator @click="change_collect()" class="btn publish_box">
							<uni-icons type="heart"></uni-icons>
							<text>收藏</text>
						</navigator>

					</view>
				</view>
			</view>
		</view>


	</view>
</template>

<script>
	import list_comment from "@/components/diy/list_comment.vue";
	import bar_title from "@/components/diy/bar_title.vue";
	import form_editor from "@/components/diy/form_editor.vue";

	import mixin from "@/libs/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {
			list_comment,
			bar_title,
			form_editor
		},
		data() {
			return {
				url_get_obj: "~/api/course_information/get_obj?",
				field: "course_information_id",
				query: {
					"course_information_id": 0
				},
				// 商品详情初始化
				obj: {
						"course_no": "",
							"course_name": "",
							"cover": "",
							"course_type": "",
							"class_time": "",
							"class_location": "",
							"number_of_people_remaining": 0,
							"teacher_user": 0,
							"teacher_name": "",
							"course_introduction": "",
						"hits": 0,
					"praise_len": 0,
					"course_information_id": 0,
					"timer_title":'', // 计时器标题
					"timing_start_time":'', // 计时开始时间
					"timing_end_time":'', // 计时结束时间
					"limit_times":'', // 限制次数

				},
				// 点赞
				praise: 0,
				// 点赞状态
				state_praise: false,
				// 收藏
				collect: 0,
				// 收藏状态
				state_collect: false,
				// 评论列表初始化
				list_comment: [],
				// 评论bar标题
				bar_title: "评论区",
				// 评论bar的链接
				bar_url: "",
				timeTypeShow: true,
												// 用户列表
				list_user_teacher_user: [],
							timer_start_day:0,
				timer_start_hour:0,
				timer_start_min:0,
				timer_start_sec:0,
			}
		},
		methods: {

			/**
			 * 获取点赞
			 * @param {Object} obj
			 */
			get_praise(obj) {
				var user_id = this.user.user_id;

				this.$get("~/api/praise/count?", {
					source_table: "course_information",
					source_field: "course_information_id",
					source_id: obj["course_information_id"]
				}, (res) => {
					if (res.result || res.result === 0) {
						this.praise = res.result;
						console.log("点赞数：" ,res.result);
					}
					else if (res.error){
						this.$toast(res.error.message);
						console.error(res.error);
					}
				});

				this.$get("~/api/praise/count?", {
					source_table: "course_information",
					source_field: "course_information_id",
					source_id: obj["course_information_id"],
					user_id
				}, (res) => {
					if (res.result || res.result === 0) {
						this.state_praise = res.result ? true : false;
						console.log("点赞状态：" ,res.result);
					}
					else if (res.error){
						this.$toast(res.error.message);
						console.error(res.error);
					}
				})
			},

			/**
			 * 改变点赞数
			 */
			change_praise(obj) {
				var user_id = this.user.user_id;

				var query = {
					source_table: "course_information",
					source_field: "course_information_id",
					source_id: this.obj["course_information_id"],
					user_id
				};

				var _this = this;
        _this.obj.praise_len = parseInt(_this.obj.praise_len)
				// 点赞状态
				if (this.state_praise) {
					this.state_praise = false;
					this.$get('~/api/praise/del?', query, (res) => {
						if(res.result){
							var praise_len = _this.obj.praise_len-1
							this.$post('~/api/course_information/set?course_information_id=' + _this.obj["course_information_id"], {
								praise_len
							}, (res) => {
								if(res.result){
									console.log("添加点赞数状态：" ,res.result);
								}
								else if(res.error){
									console.error(res.error);
								}
							});
							this.$toast("取消点赞");
						}
						else if (res.error){
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				} else {
					this.state_praise = true;
					this.$post('~/api/praise/add?', query, (res) => {
						if (res.result) {
							var praise_len = _this.obj.praise_len+1
							this.$post('~/api/course_information/set?course_information_id=' + _this.obj["course_information_id"], {
								praise_len
							}, (res) => {
								if(res.result){
									console.log("添加点赞数状态：" ,res.result);
								}
								else if(res.error){
									console.error(res.error);
								}
							});
							this.$toast("点赞成功");
						}
						else if (res.error) {
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				};
			},

			/**
			 * 初始化收藏状态
			 * @param {Object} obj
			 */
			get_collect(obj) {
				var user_id = this.user.user_id;

				var query = {
					source_table: "course_information",
					source_field: "course_information_id",
					source_id: obj["course_information_id"],
					user_id
				};

				this.$get('~/api/collect/count?', query, (res) => {
					console.log(res);
					if (res.result || res.result === 0) {
						var bl = res.result ? true : false;
						this.state_collect = bl;
						console.log("收藏状态：" + bl);
					}
					else if(res.error) {
						console.error(res.error);
					}
				});
			},

			/**
			 * 改变收藏状态
			 */
			change_collect() {
				var user_id = this.user.user_id;

				var query = {
					source_table: "course_information",
					source_field: "course_information_id",
					source_id: this.obj["course_information_id"],
					user_id
				};

				// 收藏状态
				if (this.state_collect) {
					this.state_collect = false;
					this.$get('~/api/collect/del?', query, (res) => {
						if(res.result){
							this.$toast("取消收藏");
						}
						else if (res.error){
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				} else {
					this.state_collect = true;
													query.title = this.obj.course_name
														query.img = this.obj.cover
																																											this.$post('~/api/collect/add?', query, (res) => {
						if (res.result) {
							this.$toast("收藏成功");
						}
						else if (res.error) {
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				};
			},

			/**
			 * 获取评论
			 * @param {Object} obj
			 */
			get_comment(obj) {
				this.$get("~/api/comment/get_list?", {
					source_table: "course_information",
					source_field: "course_information_id",
					source_id: obj["course_information_id"]
				}, (res) => {
					if (res.result && res.result.list) {
						var list = res.result.list;
						this.list_comment = list;
						console.log("评论请求结果：" ,list);
					}
					else if (res.error){
						console.error(res.error);
					}
				});
			},

			/**
			 * 添加访问量
			 */
			add_hits(obj) {
				obj["hits"] = obj["hits"] + 1;
				var hits = obj["hits"];
				this.$post('~/api/course_information/set?course_information_id=' + obj["course_information_id"], {
					hits
				}, (res) => {
					if(res.result){
						console.log("添加访问量状态：" ,res.result);
						var body = {
							source_table: "course_information",
							source_field: "course_information_id",
							source_id: this.obj.course_information_id,
							user_id: this.$store.state.user.user_id,
						};
						this.$post("~/api/hits/add?", body, (res) => {
							console.log(res);
						});
					}
					else if(res.error){
						console.error(res.error);
					}
				});
			},

			/**
			 * 获取对象之后
			 * @param {Object} json 结果对象
			 */
			get_obj_after(json) {
				// 判断是否获取到数据
				if (this.obj) {
					var obj = this.obj;
					// 获取点赞数
					this.get_praise(obj);
					// 初始化收藏状态
					this.get_collect(obj);
					// 获取评论
					this.get_comment(obj);
					// 增加点击数
					this.add_hits(obj);
					this.runTiming();
				}
			},

			/**
			 * 倒计时
			 */
			// oDiv(el) {
			// 	if(typeof(el) == 'string') {
			// 		return(document.getElementById(el));
			// 	}
			// 	return(el);
			// },

			fillZero(num, digit) {
				var str = '' + num;
				if(str.length < digit) {
					str = '0' + str;
				}
				return str;
			},
			runTiming() {
				var timer = null;
				var _this = this;
				timer = setInterval(updateTime, 1000);
				updateTime();

				function updateTime() {
					var oEndDate = _this.obj.timing_end_time;
					var seart = _this.obj.timing_start_time;
					if (oEndDate.indexOf("-") != -1) {
						oEndDate = new Date(oEndDate).getTime();
					}
					if (seart.indexOf("-") != -1) {
						seart = new Date(seart).getTime();
					}
					var oNowDate = new Date();
					var iRemain = 0
					iRemain = parseInt((oNowDate.getTime() - seart) / 1000);
					if (iRemain <= 0) { //判断开始时间是否小于或等于今天
						clearInterval(timer);
						iRemain = 0;
						_this.timeTypeShow = false;
					} else {
						iRemain = parseInt((oEndDate - oNowDate.getTime()) / 1000);
						if (iRemain <= 0) { //判断结束时间是否小于或等于今天
							clearInterval(timer);
							iRemain = 0;
							_this.timeTypeShow = false;
						} else {
							_this.timeTypeShow = true;
							var iDay = parseInt(iRemain / 86400); //剩余天数

							iRemain %= 86400;
							var iHour = parseInt(iRemain / 3600); //剩余小时

							iRemain %= 3600;
							var iMin = parseInt(iRemain / 60); //剩余分钟

							iRemain %= 60;
							var iSec = iRemain; //剩余秒

							_this.timer_start_day = _this.fillZero(iDay, 2);
							_this.timer_start_hour = _this.fillZero(iHour, 2);
							_this.timer_start_min = _this.fillZero(iMin, 2);
							_this.timer_start_sec = _this.fillZero(iSec, 2);
						}
					}
				}
			},
											/**
			 * 获取教师用户用户列表
			 */
			async get_list_user_teacher_user() {
				var json = await this.$get("~/api/user/get_list?user_group=教师用户");
				if(json.result && json.result.list){
					this.list_user_teacher_user = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_teacher_user(id){
				let obj = this.list_user_teacher_user;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
			},
					},
		created() {
											this.get_list_user_teacher_user();
					},
		mounted() {
		},
	}

</script>

<style>
	.page_goods {
		padding-bottom: 3rem;
	}

	.link {
		text-align: center;
		padding: 0.5rem 0;
		border: 1px solid #DBDBDB;
		border-radius: 0.5rem;
	}

	.buy_wrap {
		position: fixed;
		bottom: 0;
		left: 0;
		width: 100%;
	}

	.dialog {
		width: 100%;
		height: 100vh;
		background: rgba(0, 0, 0, 0.5);
		z-index: 999;
		position: fixed;
		left: 0;
		top: 0;
		padding: 20vh 0;
	}

	.dialog-content {
		width: 500upx;
		height: 60vh;
		margin: 0 auto;
		background: #FFF;
		border-radius: 10upx;
		overflow: hidden;
		position: relative;
		display: flex;
		flex-direction: column;
		padding:  5vh;
		text-align: center;

	}
	.dialog-content span{
		margin-top:  3vh;
		}

	.dialog-close {
		width: 40upx;
		height: 40upx;
		border-radius: 20upx;
		position: absolute;
		right: 10upx;
		top: 10upx;
		font-size: 26upx;
		line-height: 40upx;
		text-align: center;
	}

	.dialog-list {
		padding: 40upx 20upx;
	}

	scroll-view {
		width: 100%;
		height: 100%;
	}

	.show-dialog {
		animation: 100ms showDialog linear forwards;
	}

	.hide-dialog {
		animation: 100ms hideDialog linear forwards;
	}

	@keyframes hideDialog {
		0% {
			opacity: 1;
		}


		100% {
			opacity: 0;
		}
	}

	@keyframes showDialog {
		0% {
			opacity: 0;
		}


		100% {
			opacity: 1;
		}
	}

	/* new style start */
	.diy_detail--new{
		padding: 5px;
	}
	.diy_detail--new .view {
		border-bottom: 1px solid #ccc;
		padding: 8px 0 ;
	}
	.diy_detail--new .view uni-view{
		display: inline-block;
	}
	.diy_detail--new .view .diy_title{
		color: var(--color_primary);
		margin-right: 5px;
		vertical-align: top;
	}
	.diy_detail--new .view .diy_img img{
		width: 100%;
	}
	.diy_detail--new .view .diy_music{
		vertical-align: text-top;
	}
	.diy_detail--new .bar_title{
		position: relative;
		background-color: #fff;
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 2px;
		background: var(--color_primary);
		border-radius: 10px;
		height: 46px;
	}
	.diy_detail--new .bar_title .title{
		margin: 0 auto;
		color: var(--color_white);
		font-weight: 600;
	}
	.diy_detail--new .container-fluid-comment--new{
		margin: 10px 0.6rem;
	}
	.diy_detail--new .container-fluid-comment--new .col{
		display: flex;
		flex: auto;
		flex-wrap: wrap;
		flex-direction: row;
		margin-left: -10px;
	}
	.diy_detail--new .container-fluid-comment--new .btn{
		display: inline-block;
		border: none;
		background: var(--color_primary);
		color: #fff;
		font-size: 16px !important;
		padding: 2px 12px !important;
		border-radius: 20px;
		line-height: inherit;
		margin-bottom: 5px;
		margin-left: 10px;
		margin-right: 0;
	}
	.diy_detail--new .container-fluid-comment--new .btn:after{
		display: none;
	}
	.diy_detail--new .container-fluid-comment--new .btn .uni-icons{
		color: #fff !important;
	}
	.diy_detail--new .comment_title{
		margin-top: 10px;
	}
	/* new style end */

</style>
