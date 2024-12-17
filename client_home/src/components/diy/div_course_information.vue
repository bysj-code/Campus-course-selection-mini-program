<template>
	<view class="diy_details diy_div_course_information">
		<view v-if="Object.keys(obj).length!==0" class="warp">
			<view class="container">
				<view class="row">
					<view v-if="$check_field('get','course_no')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>课程编号:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["course_no"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','course_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>课程名称:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["course_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','cover')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>封面:</span>
						</view>
							<view class="diy_field diy_img">
							<image style="width:100%;height:auto;" :src="$fullUrl(obj['cover'])" mode="widthFix"></image>
						</view>
						</view>
					<view v-if="$check_field('get','course_type')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>课程类型:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["course_type"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','class_time')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>上课时间:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["class_time"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','class_location')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>上课地点:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["class_location"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','number_of_people_remaining')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>剩余人数:</span>
						</view>
							<view class="diy_field diy_number">
							<text>
								{{ obj["number_of_people_remaining"] }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','teacher_user')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>教师用户:</span>
						</view>
							<view class="diy_field diy_uid">
							<text>
								{{ get_user_teacher_user(obj['teacher_user']) }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','teacher_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>教师姓名:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["teacher_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','course_introduction')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>课程介绍:</span>
						</view>
							<view class="diy_field diy_desc">
							<text>
								{{ obj["course_introduction"] }}
							</text>
						</view>
						</view>
				</view>
			</view>
		</view>

			<view class="warp">
			<view class="container">
				<view class="row">
					<view class="col">
						<button type="button" class="diy_btn" @click="to_form('/pages/course_schedule/edit')" v-if="$check_action('/course_schedule/edit','add') || $check_action('/course_schedule/edit','set')" >确认选课</button>
					</view>
				</view>
			</view>
		</view>
		</view>
</template>

<script>
	import mixin from "@/libs/mixins/component.js";
	export default {
		mixins: [mixin],
		props: {
			obj_goods: {
				type: Object,
				default(){
					return {}
				}
			},
			query:{
				type: Object,
				default(){
					return {
						course_information_id: 0
					}
				}
			}
		},
		data() {
			return {
				obj_goods_type: {},
				obj: {},
												// 用户列表
				list_user_teacher_user: [],
						}
		},
		methods: {
			async get_obj_goods_type() {
				var res = await this.$get("~/api/goods_type/get_obj", {
					name: this.obj_goods.type
				})

				if (res.result.obj) {
					this.obj_goods_type = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
			async get_obj_by_goods() {
				var {
					source_table,
					source_field
				} = this.obj_goods_type
				var {
					source_id
				} = this.obj_goods
				var query = {}
				query[source_field] = source_id
				this.$get("~/api/" + source_table + "/get_obj", {}, (res) => {
					if (res.result.obj) {
						this.obj = res.result.obj
					} else {
						console.log("没有请求到商品分类");
					}
				})
			},
			async get_obj_by_id(){
				var res = await this.$get("~/api/course_information/get_obj", {
					course_information_id:this.query.course_information_id
				})

				if (res.result && res.result.obj) {
					this.obj = res.result.obj
				} else {
					console.log("没有请求到商品分类");
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
		async onLoad(){
			if (Object.keys(this.obj_goods).length !== 0) {
				await this.get_obj_goods_type();
				await this.get_obj_by_goods();
			} else if (this.query["course_information_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_course_information_details {}

	.details {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
		border-bottom: 1px solid #eee;
	}

	.left_text {
		flex: 0 0 25%;
	}

	.right_text {
		flex: 0 0 75%;
	}
	.edit_nav{
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}
</style>
