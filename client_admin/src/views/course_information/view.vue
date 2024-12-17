<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','course_no') || $check_field('add','course_no') || $check_field('set','course_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程编号" prop="course_no">
												<el-input id="course_no" v-model="form['course_no']" placeholder="请输入课程编号"
							  v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','course_no')) || (!form['course_information_id'] && $check_field('add','course_no'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','course_no')">{{form['course_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程名称" prop="course_name">
												<el-input id="course_name" v-model="form['course_name']" placeholder="请输入课程名称"
							  v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','course_name')) || (!form['course_information_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_name')">{{form['course_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','cover') || $check_field('add','cover') || $check_field('set','cover')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="封面" prop="cover">
								<el-upload :disabled="disabledObj['cover_isDisabled']" id="cover" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_cover"
						:show-file-list="false" v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','cover')) || (!form['course_information_id'] && $check_field('add','cover'))">
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
								<el-select id="course_type" v-model="form['course_type']"
						v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','course_type')) || (!form['course_information_id'] && $check_field('add','course_type'))">
						<el-option v-for="o in list_course_type" :key="o['course_type']" :label="o['course_type']"
							:value="o['course_type']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','course_type')">{{form['course_type']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','class_time') || $check_field('add','class_time') || $check_field('set','class_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="上课时间" prop="class_time">
												<el-input id="class_time" v-model="form['class_time']" placeholder="请输入上课时间"
							  v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','class_time')) || (!form['course_information_id'] && $check_field('add','class_time'))" :disabled="disabledObj['class_time_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','class_time')">{{form['class_time']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','class_location') || $check_field('add','class_location') || $check_field('set','class_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="上课地点" prop="class_location">
												<el-input id="class_location" v-model="form['class_location']" placeholder="请输入上课地点"
							  v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','class_location')) || (!form['course_information_id'] && $check_field('add','class_location'))" :disabled="disabledObj['class_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','class_location')">{{form['class_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','number_of_people_remaining') || $check_field('add','number_of_people_remaining') || $check_field('set','number_of_people_remaining')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="剩余人数" prop="number_of_people_remaining">
								<el-input-number id="number_of_people_remaining" v-model.number="form['number_of_people_remaining']"
						v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','number_of_people_remaining')) || (!form['course_information_id'] && $check_field('add','number_of_people_remaining'))" :disabled="disabledObj['number_of_people_remaining_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','number_of_people_remaining')">{{form['number_of_people_remaining']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_user') || $check_field('add','teacher_user') || $check_field('set','teacher_user')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师用户" prop="teacher_user">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_teacher_user(form['teacher_user']) }}
							<!--<el-input id="business_name" v-model="form['teacher_user']" placeholder="请输入教师用户"-->
							<!--v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','teacher_user')) || (!form['course_information_id'] && $check_field('add','teacher_user'))" :disabled="disabledObj['teacher_user_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','teacher_user')">{{form['teacher_user']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','teacher_user')) || (!form['course_information_id'] && $check_field('add','teacher_user'))" id="teacher_user" v-model="form['teacher_user']" :disabled="disabledObj['teacher_user_isDisabled']">
								<el-option v-for="o in list_user_teacher_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','teacher_user')" id="teacher_user" v-model="form['teacher_user']" :disabled="true">
								<el-option v-for="o in list_user_teacher_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="teacher_user" v-model="form['teacher_user']" :disabled="disabledObj['teacher_user_isDisabled']">
							<el-option v-for="o in list_user_teacher_user" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_name') || $check_field('add','teacher_name') || $check_field('set','teacher_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师姓名" prop="teacher_name">
												<el-input id="teacher_name" v-model="form['teacher_name']" placeholder="请输入教师姓名"
							  v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','teacher_name')) || (!form['course_information_id'] && $check_field('add','teacher_name'))" :disabled="disabledObj['teacher_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teacher_name')">{{form['teacher_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','course_introduction') || $check_field('add','course_introduction') || $check_field('set','course_introduction')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程介绍" prop="course_introduction">
								<el-input type="textarea" id="course_introduction" v-model="form['course_introduction']" placeholder="请输入课程介绍"
						v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','course_introduction')) || (!form['course_information_id'] && $check_field('add','course_introduction'))" :disabled="disabledObj['course_introduction_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_introduction')">{{form['course_introduction']}}</div>
							</el-form-item>
			</el-col>
					
	
				<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="计时器标题" prop="timer_title">
					<el-input id="timer_title" v-model="form['timer_title']" placeholder="请输入计时器标题"
							  v-if="user_group === '管理员' || $check_action('/course_information/view','set') || $check_action('/course_information/view','add')" :disabled="disabledObj['timer_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','timer_title')">{{form['timer_title']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="计时开始时间" prop="timing_start_time">
					<el-date-picker id="timing_start_time" v-model="form['timing_start_time']" placeholder="选择计时器开始时间"
						v-if="user_group === '管理员' || $check_action('/course_information/view','set') || $check_action('/course_information/view','add')" :disabled="disabledObj['timing_start_time_isDisabled']" type="datetime" >
					</el-date-picker>
					<div v-else-if="$check_field('get','timing_start_time')">{{form['timing_start_time']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="计时结束时间" prop="timing_end_time">
					<el-date-picker id="timing_end_time" v-model="form['timing_end_time']" placeholder="选择计时器开始时间"
						v-if="user_group === '管理员' || $check_action('/course_information/view','set') || $check_action('/course_information/view','add')" :disabled="disabledObj['timing_end_time_isDisabled']" type="datetime" >
					</el-date-picker>
					<div v-else-if="$check_field('get','timing_end_time')">{{form['timing_end_time']}}</div>
				</el-form-item>
			</el-col>
	
	
	
	      <el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
        <el-form-item label="限制次数" prop="limit_times">
          <el-input id="limit_times" v-model="form['limit_times']" placeholder="限制次数"
                    v-if="user_group === '管理员' || (form['course_information_id}'] && $check_action('/course_information/view','set')) || (!form['course_information_id}'] && $check_action('/course_information/view','add')) "
          ></el-input>
          <div v-else-if="$check_action('/course_information/view','get')" v-html="form['limit_times']"></div>
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
				field: "course_information_id",
				url_add: "~/api/course_information/add?",
				url_set: "~/api/course_information/set?",
				url_get_obj: "~/api/course_information/get_obj?",
				url_upload: "~/api/course_information/upload?",

				query: {
					"course_information_id": 0,
				},

				form: {
								"course_no": this.$get_stamp(), // 课程编号
										"course_name":  '', // 课程名称
										"cover":  '', // 封面
										"course_type":  '', // 课程类型
										"class_time":  '', // 上课时间
										"class_location":  '', // 上课地点
										"number_of_people_remaining":  0, // 剩余人数
										"teacher_user": 0, // 教师用户
										"teacher_name":  '', // 教师姓名
										"course_introduction":  '', // 课程介绍
											"course_information_id": 0, // ID
									"timer_title":'', // 计时器标题
					"timing_start_time":'', // 计时开始时间
					"timing_end_time":'', // 计时结束时间
							"limit_times": "", // 限制次数
		          			"limit_type":2,
				
				},
				disabledObj:{
								"course_no_isDisabled": false,
										"course_name_isDisabled": false,
										"cover_isDisabled": false,
										"course_type_isDisabled": false,
										"class_time_isDisabled": false,
										"class_location_isDisabled": false,
					          			"number_of_people_remaining_isDisabled": false,
										"teacher_user_isDisabled": false,
										"teacher_name_isDisabled": false,
										"course_introduction_isDisabled": false,
										"timer_title_isDisabled": false,
					"timing_start_time_isDisabled": false,
					"timing_end_time_isDisabled": false,
							"limit_times_isDisabled": false, // 限制次数
					},

	
		
		
						// 课程类型选项列表
				list_course_type: [""],
	
		
		
		
		
					// 用户列表
				list_user_teacher_user: [],
						// 用户组
				group_user_teacher_user: "",
				
		
	
			}
		},
		methods: {


	
	
			
	
						/**
			 * 上传封面
			 * @param {Object} param 图片参数
			 */
			upload_cover(param){
						this.uploadFile(param.file, "cover");
					},
	
	
			
				/**
			 * 获取课程类型列表
			 */
			async get_list_course_type() {
				var json = await this.$get("~/api/course_type/get_list?");
				if(json.result && json.result.list){
					this.list_course_type = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
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
                    this.list_user_teacher_user = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取教师用户用户组
			 */
			async get_group_user_teacher_user() {
							this.form["teacher_user"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=教师用户");
				if(json.result && json.result.obj){
					this.group_user_teacher_user = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_teacher_user(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_teacher_user.source_table+"/get_obj?"
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
												_this.form["teacher_user"] = id
									_this.disabledObj['teacher_user' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "teacher_user") {
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
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
								
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


																														
				if (this.form["timing_end_time"] && JSON.stringify(this.form["timing_end_time"]).indexOf("-")===-1) {
					this.form["timing_end_time"] = this.$toTime(parseInt(this.form["timing_end_time"]), "yyyy-MM-dd hh:mm:ss")
				}
				if (this.form["timing_start_time"] && JSON.stringify(this.form["timing_start_time"]).indexOf("-")===-1) {
					this.form["timing_start_time"] = this.$toTime(parseInt(this.form["timing_start_time"]), "yyyy-MM-dd hh:mm:ss")
				}

			},


			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/course_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_information/view','get');
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
										this.get_list_course_type();
													this.get_list_user_teacher_user();
					this.get_group_user_teacher_user();
									},
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
