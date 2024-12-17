
<template>

	<view class="vw1" >

		<view class="title-s">
			<image src="../../static/robot.png" style="width: 35px; height: 35px;" mode=""></image>
			<text class="tiles-text">{{Custom}}</text>
		</view>
		<view class="vw2">
		<input class="ip1" placeholder="请输入要发送的信息" v-model="text"/>
		<button id="demox" class="bt1" type="primary" @click="click1" >发送</button>

		</view>
		<view id="lf" class="vw4 vw4-l const" v-for="(item,index) in msglist" >
			<view class="nones-l">
				<image class="nones-imgse"  mode="" style="width: 35px; height: 35px;"></image>
				<view class="centers-ft">
					<text class="centers">{{item}}</text>
				</view>

			</view>
	   </view>

	</view>




</template>

<script>
	// import int from '../../libs/ints/inst.js'
    export default {
        data() {
            return {
                text:"你好啊",   //用户输入框中输入的内容
                msglist:[],//用于存放对话内容的列表
				Custom:'我是智能机器人小智，有什么可以帮到您的吗!'


            }
        },  methods: {
                click1(){    //定义一个click1函数来实现存入对话及api请求
					if(this.text===''){
						return undefined
					}
                    let rights = this.msglist.push(this.text)  //将输入框中内容传入存放对话的列表
                    uni.request({   //发起api请求
                        url:'https://v.api.aa1.cn/api/api-xiaoai/talk.php?msg='+this.text,
                         //将用户输入框中的内容放入api的url中
                        success:(res) => {
                            this.text = ''    //清空输入框，方便用户下次输入
                            this.msglist.push(res.data)  //将机器人回复内容传入列表

                        },
                    })


                },



            },

			// onPageScroll(e) {
			// 	this.show = e.scrollBottom >= this.scroBottom
			// 	console.log(this.show)
			// 	let query =uni.createSelectorQuery().in(this);
			// 	query.select("#lf").boundingClientRect(data =>{
			// 		let cm = data.bottom
			// 		if(cm < 0){
			// 			uni.pageScrollTo({

			// 			})
			// 		}



			// 	}).exec()

			// },





	}

</script>


<style lang="scss" scoped>
	.title-s{
		display: flex;
		position: absolute;
		top: -38px;
		left: 5px;
	}
	.tiles-text{
		line-height: 35px;
		background-color: #c8c8c8;
		position: relative;
		left: 23px;
		border-radius: 9px;
		font-size: 13px;
		padding-left: 8px;
		padding-right: 8px;
	}

	.tiles-text::before{
		    content: '';
		    position: absolute;
		    border: 11px solid #000;
		    border-top-color: transparent;
		    border-bottom-color: transparent;
		    border-left-color: transparent;
		    border-right-color: #c8c8c8;
		    left: -27px;
		    top: 6px;

	}
	.tishi{
		position: fixed;
		bottom: 60px;
		width: 85px;
		background-color: #3a4750;
		color: #f1f1f1;
		padding: 5px;
		border-radius: 5px;
		right: 31px;
	}

	.tishi::before{
		left: 3px;
		content: '';
		position: absolute;
		top: 31px;
		border: 8px solid #000;
		border-top-color: #3a4750;
		border-bottom-color: transparent;
		border-left-color: transparent;
		border-right-color: transparent;
	}

 .ip1{
	   caret-color: #4e6ef2;
	   /* position: relative; */
	   z-index: 17;
	   box-sizing: border-box;
	   display: block;
	   padding: 10px 20px;
	   margin: 0;
	   height: 48px;
	   line-height: 20px;
	   width: 336px;
	   border-right: 1px solid #c8c8c8;
	   font-size: 18px;
	   color: #1f1f1f;
	   transition: .3s;
	   font-family: PingFangSC-Regular,Tahoma,Helvetica,"Microsoft Yahei","微软雅黑",Arial,STHeiti;
	   border-radius: 0px;
    }
    .bt1{
		height: 38px;
		line-height: 39px;
		background: #6a5252;
		border-radius: 10px;
		box-shadow: 1 6px 1px 2px #015249;
		font-size: 17px;
		font-weight: 800;
		border: 0;
		color: #f3f6f8;
		cursor: pointer;
    }
    .vw1{
        width: 100%;
        height: 100%;
        flex: 4;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 50px;
		position: relative;
    }
    .vw2{
		margin-bottom: 0px;
		width: 100%;
		background-color: #3a4750;
		display: flex;
		align-items: center;
		position: fixed;
		bottom: 0;
		z-index:9;
    }
    .vw3{
        margin-top:7px;
		display: flex;
    }
	.vw3 text{
		background: #332323;
		color: #f1f1f1;
		border-radius: 6px;
		line-height: 34px;
	}

	.vw4{
		display: flex;
		position: relative;
		width: 100%;
		margin-top: 13px;
	}
	.vw4-l{
		flex-direction: row-reverse;
	}

	.vw4-r{
		flex-direction: row;
	}
	.lf{
		display: flex;
		flex-direction: row;
	}
	.vw4-l{
		flex-direction: column;
	}
	.centers-ft{
		    width: 300px;
			position: relative;
			right: 18px;

			border-radius: 10px;
			display: flex;
			flex-direction: inherit;
	}

	.centers{

		   line-height: 2.5rem;
		   border-radius: 10px;
		   /* border-top-left-radius: 0; */
		   /* border-bottom-left-radius: 2px; */
		   margin-right: 6px;
		   font-size: 13px;
		   color: #fff;
		   overflow: hidden;
		   background-color: #3a4750;
		   padding-left: 8px;
		   padding-right: 8px;
	}
	.centers-ft::before{
		    content: '';
		    position: absolute;
		    top: 8px;
		    right: -22px;
		    height: 0px;
		    width: 0px;
		    border: 11px solid #000;
		    border-top-color: transparent;
		    border-bottom-color: transparent;
		    border-left-color: #3a4750;
		    border-right-color: transparent;
	}

	.nones-imgse{
		border-radius: 5px;
		margin-right: 5px;
		position: relative;
	}
	.nones-imgse::before{
		content: '';
		position: absolute;
		width: 35px;
		height: 35px;
		background-image: url("../../static/you.jpg");
		background-size: 100% cover;
	}




	#lf:nth-child(even){
		display: flex !important;
		flex-direction: row !important;
		.nones-l{
			display: flex;
			flex-direction: row;
		}
		.centers-ft{
			width: 300px;
			position: relative;
			left: 18px;
			border-radius: 10px;
			display: flex;
			margin-bottom: 50px;
		}


		// .centers-ft:nth-last-of-type{
		// 	margin-bottom: 50px;
		// }

		.centers{

		  line-height: 2.5rem;
		  border-radius: 10px;
			  /* border-top-left-radius: 0; */
			  /* border-bottom-left-radius: 2px; */
			  margin-left: 5px;
			  font-size: 13px;
			  color: #000000;
			  background-color: #c8c8c8;
		}



		.nones-imgse{
			border-radius: 5px;
			margin-left: 5px;
			position: relative;
		}
		.nones-imgse:before{
			content: '';
			position: absolute;
			width: 35px;
			height: 35px;
			background-image: url(../../static/robot.png);
		}

		.centers-ft:before{
			content: '';
			    position: absolute;
			    top: 8px;
			    left: -22px;
			    height: 0px;
			    width: 0px;
			    border: 11px solid #000;
			    border-top-color: transparent;
			    border-bottom-color: transparent;
			    border-left-color: transparent;
			    border-right-color: #1010103b;
		}

	}
	.nones-l{
		display: flex;
		flex-direction: row-reverse;
	}







</style>
