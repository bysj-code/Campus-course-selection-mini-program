<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','course_no') || $check_field('add','course_no') || $check_field('set','course_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程编号" prop="course_no">
												<el-input id="course_no" v-model="form['course_no']" placeholder="请输入课程编号"
							  v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','course_no')) || (!form['course_schedule_id'] && $check_field('add','course_no'))" :disabled="disabledObj['course_no_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_no')">{{form['course_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程名称" prop="course_name">
												<el-input id="course_name" v-model="form['course_name']" placeholder="请输入课程名称"
							  v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','course_name')) || (!form['course_schedule_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_name')">{{form['course_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','cover') || $check_field('add','cover') || $check_field('set','cover')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面" prop="cover">
								<el-upload :disabled="disabledObj['cover_isDisabled']" id="cover" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover"
						:show-file-list="false" v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','cover')) || (!form['course_schedule_id'] && $check_field('add','cover'))">
						<img v-if="form['cover']" :src="$fullUrl(form['cover'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','cover')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['cover'])" :preview-src-list="[$fullUrl(form['cover'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','course_type') || $check_field('add','course_type') || $check_field('set','course_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程类型" prop="course_type">
												<el-input id="course_type" v-model="form['course_type']" placeholder="请输入课程类型"
							  v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','course_type')) || (!form['course_schedule_id'] && $check_field('add','course_type'))" :disabled="disabledObj['course_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_type')">{{form['course_type']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','class_time') || $check_field('add','class_time') || $check_field('set','class_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="上课时间" prop="class_time">
												<el-input id="class_time" v-model="form['class_time']" placeholder="请输入上课时间"
							  v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','class_time')) || (!form['course_schedule_id'] && $check_field('add','class_time'))" :disabled="disabledObj['class_time_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','class_time')">{{form['class_time']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','class_location') || $check_field('add','class_location') || $check_field('set','class_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="上课地点" prop="class_location">
												<el-input id="class_location" v-model="form['class_location']" placeholder="请输入上课地点"
							  v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','class_location')) || (!form['course_schedule_id'] && $check_field('add','class_location'))" :disabled="disabledObj['class_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','class_location')">{{form['class_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_user') || $check_field('add','teacher_user') || $check_field('set','teacher_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师用户" prop="teacher_user">
													<el-select v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','teacher_user')) || (!form['course_schedule_id'] && $check_field('add','teacher_user'))" id="teacher_user" v-model="form['teacher_user']" :disabled="disabledObj['teacher_user_isDisabled']">
							<el-option v-for="o in list_user_teacher_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','teacher_user')" id="teacher_user" v-model="form['teacher_user']" :disabled="true">
							<el-option v-for="o in list_user_teacher_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_name') || $check_field('add','teacher_name') || $check_field('set','teacher_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师姓名" prop="teacher_name">
												<el-input id="teacher_name" v-model="form['teacher_name']" placeholder="请输入教师姓名"
							  v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','teacher_name')) || (!form['course_schedule_id'] && $check_field('add','teacher_name'))" :disabled="disabledObj['teacher_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teacher_name')">{{form['teacher_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_users') || $check_field('add','student_users') || $check_field('set','student_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生用户" prop="student_users">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_student_users(form['student_users']) }}
							<!--<el-input id="business_name" v-model="form['student_users']" placeholder="请输入学生用户"-->
							<!--v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','student_users')) || (!form['course_schedule_id'] && $check_field('add','student_users'))" :disabled="disabledObj['student_users_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','student_users')">{{form['student_users']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','student_users')) || (!form['course_schedule_id'] && $check_field('add','student_users'))" id="student_users" v-model="form['student_users']" :disabled="disabledObj['student_users_isDisabled']">
								<el-option v-for="o in list_user_student_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','student_users')" id="student_users" v-model="form['student_users']" :disabled="true">
								<el-option v-for="o in list_user_student_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="student_users" v-model="form['student_users']" :disabled="disabledObj['student_users_isDisabled']">
							<el-option v-for="o in list_user_student_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_name') || $check_field('add','student_name') || $check_field('set','student_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生姓名" prop="student_name">
												<el-input id="student_name" v-model="form['student_name']" placeholder="请输入学生姓名"
							  v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','student_name')) || (!form['course_schedule_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','student_name')">{{form['student_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','confirm_the_number_of_people') || $check_field('add','confirm_the_number_of_people') || $check_field('set','confirm_the_number_of_people')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="确认人数" prop="confirm_the_number_of_people">
								<el-select id="confirm_the_number_of_people" v-model="form['confirm_the_number_of_people']"
						v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','confirm_the_number_of_people')) || (!form['course_schedule_id'] && $check_field('add','confirm_the_number_of_people'))">
						<el-option v-for="o in list_confirm_the_number_of_people" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','confirm_the_number_of_people')">{{form['confirm_the_number_of_people']}}</div>
							</el-form-item>
			</el-col>
							<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
				</el-form-item>
			</el-col>
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核回复" prop="examine_reply">
					<el-input id="examine_reply" v-model="form['examine_reply']" placeholder="请输入审核回复"
						v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())"></el-input>
					<div v-else>{{form["examine_reply"]}}</div>
				</el-form-item>
			</el-col>
	
	
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "course_schedule_id",
				url_add: "~/api/course_schedule/add?",
				url_set: "~/api/course_schedule/set?",
				url_get_obj: "~/api/course_schedule/get_obj?",
				url_upload: "~/api/course_schedule/upload?",

				query: {
					"course_schedule_id": 0,
				},

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
							"course_schedule_id": 0, // ID
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
						// 用户组
				group_user_student_users: "",
				
						// 确认人数选项列表
				list_confirm_the_number_of_people: ['1'],
	
	
        limit_times: 0, // 限制次数
        limit_type:0,
        act_limit_times:0,
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
			 * 上传封面
			 * @param {Object} param 图片参数
			 */
			upload_cover(param){
						this.uploadFile(param.file, "cover");
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
                    this.list_user_teacher_user = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_teacher_user(id){
				var obj = this.list_user_teacher_user.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
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
                    this.list_user_student_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取学生用户用户组
			 */
			async get_group_user_student_users() {
							this.form["student_users"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=学生用户");
				if(json.result && json.result.obj){
					this.group_user_student_users = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_student_users(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_student_users.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["student_users"] = id
									_this.disabledObj['student_users' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "student_users") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_student_users(id){
				var obj = this.list_user_student_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
									// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
								
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
																										$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																																	

			},


			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/course_schedule/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_schedule/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_schedule/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_schedule/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_schedule/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
																	this.get_list_user_teacher_user();
										this.get_list_user_student_users();
					this.get_group_user_student_users();
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

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
