<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','course_no') || $check_field('add','course_no') || $check_field('set','course_no')" label="课程编号" name="course_no">
                                <uni-easyinput type="text" v-model="form['course_no']" v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','course_no')) || (!form['course_schedule_id'] && $check_field('add','course_no'))" :disabled="disabledObj['course_no_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','course_no')">
                  {{ form['course_no'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" label="课程名称" name="course_name">
                                <uni-easyinput type="text" v-model="form['course_name']" v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','course_name')) || (!form['course_schedule_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','course_name')">
                  {{ form['course_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','cover') || $check_field('add','cover') || $check_field('set','cover')" label="封面" name="cover">
                        <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['cover'] && $check_field('set','cover')">
                  <image v-if="disabledObj['cover_isDisabled']" :src="$fullUrl(form['cover'])" />
                  <image v-if="!disabledObj['cover_isDisabled']" :src="$fullUrl(form['cover'])" @click="change_img('cover')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['cover'] && $check_field('add','cover')">
                  <view v-if="disabledObj['cover_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['cover_isDisabled']" class="btn_add_img" @click="change_img('cover')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','cover')">
                  <image :src="$fullUrl(form['cover'])" />
                </view>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','course_type') || $check_field('add','course_type') || $check_field('set','course_type')" label="课程类型" name="course_type">
                                <uni-easyinput type="text" v-model="form['course_type']" v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','course_type')) || (!form['course_schedule_id'] && $check_field('add','course_type'))" :disabled="disabledObj['course_type_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','course_type')">
                  {{ form['course_type'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','class_time') || $check_field('add','class_time') || $check_field('set','class_time')" label="上课时间" name="class_time">
                                <uni-easyinput type="text" v-model="form['class_time']" v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','class_time')) || (!form['course_schedule_id'] && $check_field('add','class_time'))" :disabled="disabledObj['class_time_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','class_time')">
                  {{ form['class_time'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','class_location') || $check_field('add','class_location') || $check_field('set','class_location')" label="上课地点" name="class_location">
                                <uni-easyinput type="text" v-model="form['class_location']" v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','class_location')) || (!form['course_schedule_id'] && $check_field('add','class_location'))" :disabled="disabledObj['class_location_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','class_location')">
                  {{ form['class_location'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','teacher_user') || $check_field('add','teacher_user') || $check_field('set','teacher_user')" label="教师用户" name="teacher_user">
                        <uni-data-select
                  id="form_teacher_user"
                  v-model="form['teacher_user']"
                  :localdata="list_user_teacher_user"
                  :clear="!disabledObj['teacher_user_isDisabled']"
                  :disabled="disabledObj['teacher_user_isDisabled']"
                  v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','teacher_user')) || (!form['course_schedule_id'] && $check_field('add','teacher_user'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['teacher_user']"
                  :localdata="list_user_teacher_user"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','teacher_user')" id="teacher_user"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','teacher_name') || $check_field('add','teacher_name') || $check_field('set','teacher_name')" label="教师姓名" name="teacher_name">
                                <uni-easyinput type="text" v-model="form['teacher_name']" v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','teacher_name')) || (!form['course_schedule_id'] && $check_field('add','teacher_name'))" :disabled="disabledObj['teacher_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','teacher_name')">
                  {{ form['teacher_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','student_users') || $check_field('add','student_users') || $check_field('set','student_users')" label="学生用户" name="student_users">
                        <uni-data-select
                  id="form_student_users"
                  v-model="form['student_users']"
                  :localdata="list_user_student_users"
                  :clear="!disabledObj['student_users_isDisabled']"
                  :disabled="disabledObj['student_users_isDisabled']"
                  v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','student_users')) || (!form['course_schedule_id'] && $check_field('add','student_users'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['student_users']"
                  :localdata="list_user_student_users"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','student_users')" id="student_users"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','student_name') || $check_field('add','student_name') || $check_field('set','student_name')" label="学生姓名" name="student_name">
                                <uni-easyinput type="text" v-model="form['student_name']" v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','student_name')) || (!form['course_schedule_id'] && $check_field('add','student_name'))" :disabled="disabledObj['student_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','student_name')">
                  {{ form['student_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','confirm_the_number_of_people') || $check_field('add','confirm_the_number_of_people') || $check_field('set','confirm_the_number_of_people')" label="确认人数" name="confirm_the_number_of_people">
                        <uni-data-select
                  v-model="form.confirm_the_number_of_people"
                  :localdata="list_confirm_the_number_of_people"
                  :clear="!disabledObj['confirm_the_number_of_people_isDisabled']"
                  :disabled="disabledObj['confirm_the_number_of_people_isDisabled']"
                  v-if="user_group === '管理员' || (form['course_schedule_id'] && $check_field('set','confirm_the_number_of_people')) || (!form['course_schedule_id'] && $check_field('add','confirm_the_number_of_people'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','confirm_the_number_of_people')">
                  {{ form['confirm_the_number_of_people'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item label="审核状态" name="examine_state">
                <uni-data-select
                    v-model="form['examine_state']"
                    :localdata="list_examine_state"
                    v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())"
                ></uni-data-select>
                <text v-else>{{form["examine_state"]}}</text>
              </uni-forms-item>
              <uni-forms-item label="审核回复" name="examine_reply">
                <uni-easyinput type="text" placeholder="请输入审核回复" v-model="form['examine_reply']"
                               v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())" />
                <!-- 仅查看 -->
                <text v-else>{{form["examine_reply"]}}</text>
              </uni-forms-item>


            </uni-forms>
            <view class="form_button">
              <button size="mini" type="primary" @click="submit()" class="primary_btn">提交</button>
              <button size="mini" @click="cancel()">取消</button>
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
          list_confirm_the_number_of_people: [],
                                    limit_times: 0, // 限制次数
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
    changeLog(v,value){
      this.form[value] = v
    },
    /**
     * 上传文件
     * @param {Object} param文件参数
     */
    change_file(key_name){
      var _self = this;
      // 选择图像方法
      uni.chooseFile({
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
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
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
     * 上传图片
     * @param {Object} param文件参数
     */
    change_img(key_name){
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
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
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
            /**
     * 获取学生用户用户组
     */
    async get_group_user_student_users() {
      this.form["student_users"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=学生用户");
      if(json.result && json.result.obj){
        this.group_user_student_users = json.result.obj;
        this.get_user_session_student_users(this.form['student_users'])
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
            
            
            /**
     * 获取确认人数列表
     */
    async get_list_confirm_the_number_of_people() {
          ['1'].map((o) => this.list_confirm_the_number_of_people.push({value:o,text:o}));
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

  },
  created() {
                                                            this.get_list_user_teacher_user();
                                this.get_list_user_student_users();
            this.get_group_user_student_users();
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

.form_button{
  padding-bottom: 15px;
  display: flex;
}
.form_button button{
  width: 40%;
}
.query_select{
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

.query_option{
  width: 100%;
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
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.form_button {
  padding-bottom: 15px;
  display: flex;
}
.form_button button {
  width: 40%;
}
.query_select {
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
  outline: none;
}

.query_option {
  width: 100%;
}

.btn_add_img {
  color: #d3d3d3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text {
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
/*新样式*/
.uni-forms{
padding-top:1rem;
}
.uni-forms-item {
	padding: 6px 10px;
    background: #f8f6fc;
}
.uni-forms .is-input-border{
	border: 0;
}
.container{
	    -webkit-box-shadow: 0px 0px 0px #888888;
	    box-shadow: 0px 0px 0px #888888;
}
.form_button .primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
</style>
