<template>
	<view class="diy_edit page_course_schedule" id="course_schedule_edit">
		<view class='warp'>
			<view class='container'>
				<view class='row'>
						<view v-if="$check_field('set','course_no') || $check_field('add','course_no') || $check_field('get','course_no')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								课程编号:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_course_no" v-model="form['course_no']" placeholder="请输入课程编号" v-if="(form['course_no'] && $check_field('set','course_no')) || (!form['course_no'] && $check_field('add','course_no'))" :disabled="disabledObj['course_no_isDisabled']" />
							<text v-else-if="$check_field('get','course_no')">{{ form['course_no'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','course_name') || $check_field('add','course_name') || $check_field('get','course_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								课程名称:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_course_name" v-model="form['course_name']" placeholder="请输入课程名称" v-if="(form['course_name'] && $check_field('set','course_name')) || (!form['course_name'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']" />
							<text v-else-if="$check_field('get','course_name')">{{ form['course_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','cover') || $check_field('add','cover') || $check_field('get','cover')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								封面:
							</text>
						</view>
								<!-- 图片 -->
						<!-- 修改权限 -->
						<view class="diy_field diy_img diy_text_row" v-if="form['cover'] && $check_field('set','cover')">
							<image v-if="disabledObj['cover_isDisabled']" :src="$fullUrl(form['cover'])" />
							<image v-if="!disabledObj['cover_isDisabled']" :src="$fullUrl(form['cover'])" @click="change_img('cover')" />
						</view>
						<!-- 添加权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="!form['cover'] && $check_field('add','cover')">
							<view v-if="disabledObj['cover_isDisabled']" class="btn_add_img">
								<text>+</text>
							</view>
							<view v-if="!disabledObj['cover_isDisabled']" class="btn_add_img diy_text_row" @click="change_img('cover')">
								<text>+</text>
							</view>
						</view>
						<!-- 查询权限 -->
						<view class="diy_field diy_img diy_text_row" v-else-if="$check_field('get','cover')">
							<image :src="$fullUrl(form['cover'])" />
						</view>
						<uni-icons style="display: none;" class="forward" type="forward" id="form_img_cover"></uni-icons>
							</view>
							<view v-if="$check_field('set','course_type') || $check_field('add','course_type') || $check_field('get','course_type')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								课程类型:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_course_type" v-model="form['course_type']" placeholder="请输入课程类型" v-if="(form['course_type'] && $check_field('set','course_type')) || (!form['course_type'] && $check_field('add','course_type'))" :disabled="disabledObj['course_type_isDisabled']" />
							<text v-else-if="$check_field('get','course_type')">{{ form['course_type'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','class_time') || $check_field('add','class_time') || $check_field('get','class_time')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								上课时间:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_class_time" v-model="form['class_time']" placeholder="请输入上课时间" v-if="(form['class_time'] && $check_field('set','class_time')) || (!form['class_time'] && $check_field('add','class_time'))" :disabled="disabledObj['class_time_isDisabled']" />
							<text v-else-if="$check_field('get','class_time')">{{ form['class_time'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','class_location') || $check_field('add','class_location') || $check_field('get','class_location')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								上课地点:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_class_location" v-model="form['class_location']" placeholder="请输入上课地点" v-if="(form['class_location'] && $check_field('set','class_location')) || (!form['class_location'] && $check_field('add','class_location'))" :disabled="disabledObj['class_location_isDisabled']" />
							<text v-else-if="$check_field('get','class_location')">{{ form['class_location'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','teacher_user') || $check_field('add','teacher_user') || $check_field('get','teacher_user')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								教师用户:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_teacher_user"
									v-model="form['teacher_user']"
									:localdata="list_user_teacher_user"
									:clear="!disabledObj['teacher_user_isDisabled']"
									:disabled="disabledObj['teacher_user_isDisabled']"
									v-if="(form['teacher_user'] && $check_field('set','teacher_user')) || (!form['teacher_user'] && $check_field('add','teacher_user'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','teacher_user')">{{ form['teacher_user'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','teacher_name') || $check_field('add','teacher_name') || $check_field('get','teacher_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								教师姓名:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_teacher_name" v-model="form['teacher_name']" placeholder="请输入教师姓名" v-if="(form['teacher_name'] && $check_field('set','teacher_name')) || (!form['teacher_name'] && $check_field('add','teacher_name'))" :disabled="disabledObj['teacher_name_isDisabled']" />
							<text v-else-if="$check_field('get','teacher_name')">{{ form['teacher_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','student_users') || $check_field('add','student_users') || $check_field('get','student_users')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								学生用户:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_student_users"
									v-model="form['student_users']"
									:localdata="list_user_student_users"
									:clear="!disabledObj['student_users_isDisabled']"
									:disabled="disabledObj['student_users_isDisabled']"
									v-if="(form['student_users'] && $check_field('set','student_users')) || (!form['student_users'] && $check_field('add','student_users'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','student_users')">{{ form['student_users'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','student_name') || $check_field('add','student_name') || $check_field('get','student_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								学生姓名:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_student_name" v-model="form['student_name']" placeholder="请输入学生姓名" v-if="(form['student_name'] && $check_field('set','student_name')) || (!form['student_name'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']" />
							<text v-else-if="$check_field('get','student_name')">{{ form['student_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','confirm_the_number_of_people') || $check_field('add','confirm_the_number_of_people') || $check_field('get','confirm_the_number_of_people')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								确认人数:
							</text>
						</view>
								<!-- 选项 -->
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_confirm_the_number_of_people"
									v-model="form['confirm_the_number_of_people']"
									:localdata="list_confirm_the_number_of_people"
									v-if="(form['confirm_the_number_of_people'] && $check_field('set','confirm_the_number_of_people')) || (!form['confirm_the_number_of_people'] && $check_field('add','confirm_the_number_of_people'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','confirm_the_number_of_people')">{{ form['confirm_the_number_of_people'] }}</text>
						</view>
							</view>
						<view v-if="user_group === '管理员' || $check_examine()" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								审核状态:
							</text>
						</view>
						<view class="diy_field diy_text diy_text_row diy_select_flex">
							<uni-data-select
									v-model="form['examine_state']"
									:localdata="list_examine_state"
							></uni-data-select>
						</view>
						<view class="diy_field diy_text diy_text_row">
							<text>
								{{ form['examine_state'] }}
							</text>
						</view>
					</view>
					<view v-if="user_group === '管理员' || $check_examine()" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								审核回复:
							</text>
						</view>
						<view class="diy_field diy_text diy_text_row">
							<textarea v-model="form['examine_reply']">
							</textarea>
						</view>
						<view class="diy_field diy_text diy_text_row">
							<text>
								{{ form['examine_reply'] }}
							</text>
						</view>
					</view>

				</view>
				<view class="row">
					<view class="col-12">
						<view class="btn_box">
							<button class="btn_submit primary_btn" @click="submit()">提交</button>
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
import mixin from "@/libs/mixins/page.js";
export default {
	mixins:[mixin],
	components:{},
	data(){
		return{
			url_get_obj:"~/api/course_schedule/get_obj?",
			url_add:"~/api/course_schedule/add?",
			url_set:"~/api/course_schedule/set?",

			// 登录权限
			oauth: {
				"signIn": true,
				"user_group": []
			},

			// 查询条件
			query: {
					"course_no": "",
						"course_name": "",
						"cover": "",
						"course_type": "",
						"class_time": "",
						"class_location": "",
						"teacher_user": 0,
						"teacher_name": "",
						"student_users": 0,
						"student_name": "",
						"confirm_the_number_of_people": "",
					"course_schedule_id": 0
			},

			obj: {
					"course_no":  '', // 课程编号
						"course_name":  '', // 课程名称
						"cover":  '', // 封面
						"course_type":  '', // 课程类型
						"class_time":  '', // 上课时间
						"class_location":  '', // 上课地点
						"teacher_user": 0, // 教师用户
						"teacher_name":  '', // 教师姓名
						"student_users": 0, // 学生用户
						"student_name":  '', // 学生姓名
						"confirm_the_number_of_people":  '', // 确认人数
					"examine_state": "未审核",
				"examine_reply": "",
				"course_schedule_id": 0,

        		"user_id": this.$store.state.user.user_id,
			},

			// 表单字段
			form: {
					"course_no":  '', // 课程编号
						"course_name":  '', // 课程名称
						"cover":  '', // 封面
						"course_type":  '', // 课程类型
						"class_time":  '', // 上课时间
						"class_location":  '', // 上课地点
						"teacher_user": 0, // 教师用户
						"teacher_name":  '', // 教师姓名
						"student_users": 0, // 学生用户
						"student_name":  '', // 学生姓名
						"confirm_the_number_of_people":  '', // 确认人数
					"examine_state": "未审核",
				"examine_reply": "",
				"course_schedule_id": 0,
        		"user_id": this.$store.state.user.user_id,
			},
			disabledObj:{
					"course_no_isDisabled": false,
						"course_name_isDisabled": false,
						"cover_isDisabled": false,
						"course_type_isDisabled": false,
						"class_time_isDisabled": false,
						"class_location_isDisabled": false,
						"teacher_user_isDisabled": false,
						"teacher_name_isDisabled": false,
						"student_users_isDisabled": false,
						"student_name_isDisabled": false,
						"confirm_the_number_of_people_isDisabled": false,
				},

																	// 用户列表
			list_user_teacher_user: [],
								// 用户列表
			list_user_student_users: [],
							list_confirm_the_number_of_people: [],
		
			field:"course_schedule_id",
			table_key:"course_schedule",

      limit_times:0, // 限制次数
      limit_type:0,
      act_limit_times:0,
	list_examine_state:[{value:"未审核",text:"未审核"},{value:"已通过",text:"已通过"},{value:"未通过",text:"未通过"}],
		}
	},
	methods: {
    /**
     * 提交前验证事件
     * @param {Object} 请求参数
     * @return {String} 验证成功返回null, 失败返回错误提示
     */
    submit_check(param) {
      if(this.act_limit_times>=this.limit_times){
        return "已超过提交次数";
      }
      return null;
    },

    check_limit(){
      /**
       * 提交前验证事件
       * @param {Object} 请求参数
       * @return {String} 验证成功返回null, 失败返回错误提示
       */
      let _this = this;
      if (_this.$store.state.user.user_group==='管理员'){
        _this.limit_times = 999;
      }else {
        _this.$get("~/api/course_information/get_obj?",
            {"course_no":_this.form.course_no}, function(res) {
          if (res.result && res.result.obj) {
            _this.limit_times=res.result.obj.limit_times;
            _this.limit_type=res.result.obj.limit_type;
            let user_id = _this.$store.state.user.user_id;
            let limit_url = "~/api/course_schedule/count?course_no="+_this.form.course_no+"&user_id="+user_id;
            if (_this.limit_type === 1){
              let day = _this.$toTime(parseInt((new Date()).getTime()), "yyyy-MM-dd");
              let time = "&create_time_min="+day+" 00:00:00&create_time_max="+day+" 23:59:59"
              limit_url = limit_url +time;
            }
            _this.$get(limit_url ,{}, function(res) {
              _this.act_limit_times = res.result;
            });
          }
        });
      }
    },
			
	
				
	
				
	
				
	
				
	
				
	
					/**
		 * 获取教师用户用户列表
		 */
		async get_list_user_teacher_user() {
			// if(this.user_group !== "管理员" && this.form["teacher_user"] === 0) {
			//     this.form["teacher_user"] = this.user.user_id;
			// }
			var json = await this.$get("~/api/user/get_list?user_group=教师用户");
			if(json.result && json.result.list){
				json.result.list.map((o) => this.list_user_teacher_user.push({value:o.user_id,text:o.nickname + '-' + o.username}));
			}
			else if(json.error){
				console.error(json.error);
			}
		},
		
	
				
	
					/**
		 * 获取学生用户用户列表
		 */
		async get_list_user_student_users() {
			// if(this.user_group !== "管理员" && this.form["student_users"] === 0) {
			//     this.form["student_users"] = this.user.user_id;
			// }
			var json = await this.$get("~/api/user/get_list?user_group=学生用户");
			if(json.result && json.result.list){
				json.result.list.map((o) => this.list_user_student_users.push({value:o.user_id,text:o.nickname + '-' + o.username}));
			}
			else if(json.error){
				console.error(json.error);
			}
		},
				async get_user_session_student_users(){
			var _this = this;
			var json = await this.$get("~/api/user_group/get_obj?name=学生用户");
			if(json.result && json.result.obj){
				var source_table = json.result.obj.source_table;
				var user_id = _this.$store.state.user.user_id;
				if (user_id){
					var url = "~/api/"+source_table+"/get_obj?"
					this.$get(url, {"user_id":_this.$store.state.user.user_id}, function(res) {
						if (res.result && res.result.obj) {
							var arr = []
							for (let key in res.result.obj) {
								arr.push(key)
							}
							var arrForm = []
							for (let key in _this.form) {
								arrForm.push(key)
							}
							_this.form["student_users"] = user_id
							_this.disabledObj['student_users' + '_isDisabled'] = true
							for (var i=0;i<arr.length;i++){
                if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
                  for (var j = 0; j < arrForm.length; j++) {
                    if (arr[i] === arrForm[j]) {
                      if (arr[i] !== "student_users") {
                        _this.form[arrForm[j]] = res.result.obj[arr[i]]
                        _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                        break;
                      }
                    }
                  }
                }
							}
						}
					});
				}
			}
			else if(json.error){
				console.error(json.error);
			}
		},
	
	
				
	
				/**
		 * 获取确认人数列表
		 */
		async get_list_confirm_the_number_of_people() {
					['1'].map((o) => this.list_confirm_the_number_of_people.push({value:o,text:o}));
						},
			
	
			change_file(key_name){
			var _self = this;
				this.$chooseFile().then(res=>{
					console.log(res)

						const uploadTask = uni.uploadFile({
							url: _self.$fullUrl("/api/feedback/upload?"),
							filePath: res[0].path,
							name: "file",
							formData: {
								i_want_to_customize: "test",
							},
							header: {
								"x-auth-token": _self.$store.state.user.token,
							},
							success: function(uploadFileRes) {
								console.log(uploadFileRes)
								var filename = JSON.parse(uploadFileRes.data).result.url;
								_self.form[key_name] = filename;
							},
						});

						uploadTask.onProgressUpdate(function(res) {
							_self.percent = res.progress;
							console.log("上传进度" + res.progress);
							console.log("已经上传的数据长度" + res.totalBytesSent);
							console.log(
								"预期需要上传的数据总长度" + res.totalBytesExpectedToSend
							);
						});

				})
		},
		change_img(key_name) {
			var _self = this;
			_self.upload_img_flag = false
			// 选择图像方法
			uni.chooseImage({
				count: 1,
				sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
				sourceType: ['album'], //从相册选择
				success: function(res) {
					const tempFilePaths = res.tempFilePaths;
					const uploadTask = uni.uploadFile({
						url: _self.$fullUrl('/api/course_schedule/upload?'),
						filePath: tempFilePaths[0],
						name: 'file',
						formData: {
							'course_schedule': 'test'
						},
						header: {
							'x-auth-token': _self.$store.state.user.token
						},
						success: function(uploadFileRes) {
							var filename = JSON.parse(uploadFileRes.data).result.url
							var img_url = filename
							_self.form[key_name] = img_url
						}
					});

					uploadTask.onProgressUpdate(function(res) {
						_self.percent = res.progress;
						console.log('上传进度' + res.progress);
						console.log('已经上传的数据长度' + res.totalBytesSent);
						console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
					});
				},
				error: function(e) {
					console.log(e);
				}
			});
		},

		/**
		 * 获取对象后获取缓存表单
		 * @param {Object} json
		 * @param {Object} func
		 */
		get_obj_before(param){
			var form = uni.db.get("form");
			if (form) {
        delete(form.examine_state)
        delete(form.examine_reply)
				this.obj = uni.push(this.obj ,form);
				this.form = uni.push(this.form ,form);
			}
			var arr = []
			for (let key in form) {
				arr.push(key)
			}
			for (var i=0;i<arr.length;i++){
				this.disabledObj[arr[i] + '_isDisabled'] = true
			}
																									uni.db.del("form");
			return param;
		},

		/**
		 * 获取对象后获取缓存表单
		 * @param {Object} json
		 * @param {Object} func
		 */
		get_obj_after(json ,func){
			var form = uni.db.get("form");
			var obj = Object.assign({} ,form ,this.obj);
			if (form) {
				this.obj = uni.push(this.obj ,obj);
			}
			if (form) {
				this.form = uni.push(this.form ,form);
			}
			if(func){
				func(json);
			}
		},

	},
	onLoad(){
																							this.get_list_user_teacher_user();
								this.get_user_session_student_users();
				this.get_list_user_student_users();
							this.get_list_confirm_the_number_of_people();
				},
  watch: {
    'form.course_no': {
      handler: function() {
        this.check_limit();
      }
    }
  }
}
</script>

<style scoped>
	input{
		font-size: 10px;
	}

	.form_edit {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
	}

	.left_text {
		flex: 0 0 25%;
		display: flex;
		align-items: center;
	}

	.right_text {
		flex: 0 0 75%;
		border-bottom: 1px solid #eee;
	}
	.right_text.btn_warp{
		border-bottom: 0;
	}

	.btn_submit {
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}

	.btn_submit:hover {
		opacity: 0.5;
	}
	.btn_add_img{
		color: #D3D3D3;
		text-align: center;
		border: 1px solid #eee;
		height: 5rem;
		width: 5rem;
		position: relative;
	}
	.btn_add_img text{
		font-size: 35px;
		position: absolute;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
	}




</style>
<style scoped>
/*新样式*/
.diy_text_row {
  display: inline-block;
}
.container {
	margin-top:1rem ;
	padding: 1rem;
    -webkit-box-shadow: 0px 0px 0px #888888;
    box-shadow: 0px 0px 0px #888888;
}
.primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
	.btn_submit{
		padding: 0;
		margin-top:1rem ;
	}
	.row-item {
		padding: 10px 10px;
	    background: #f8f6fc;
		margin-bottom: 1rem;
	}
	.diy_field{
		padding-left: 1rem;
	}
	.diy_title{
		align-items: center;
        font-size: 14px;
        color: #333;
	}

	.row-item{
		display: flex !important;
		align-items: baseline;
	}
	.diy_select_flex{
		flex: 1;
	}
	.query_select{
		flex: 1;
		border-color: rgb(229, 229, 229);
		background-color: rgb(255, 255, 255);
		border-radius: 4px;
		box-sizing: border-box;
		flex: 1;
		width: 100%;
		line-height: 2;
		font-size: 14px;
		height: 2.4em;
		min-height: 2.4em;
		display: block;
		outline:none;
	}
</style>

