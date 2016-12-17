<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-select.min.css">

<style>
.upload_box {
	width: 800px;
	margin: 1em auto;
}

.upload_main {
	border-width: 1px 1px 2px;
	border-style: solid;
	border-color: #ccc #ccc #ddd;
	background-color: #fbfbfb;
}

.upload_choose {
	padding: 1em;
}

.upload_drag_area {
	display: inline-block;
	width: 60%;
	padding: 4em 0;
	margin-left: .5em;
	border: 1px dashed #ddd;
	background: #fff url() no-repeat 20px center;
	color: #999;
	text-align: center;
	vertical-align: middle;
}

.upload_drag_hover {
	border-color: #069;
	box-shadow: inset 2px 2px 4px rgba(0, 0, 0, .5);
	color: #333;
}

.upload_preview {
	border-top: 1px solid #bbb;
	border-bottom: 1px solid #bbb;
	background-color: #fff;
	overflow: hidden;
	_zoom: 1;
}

.upload_append_list {
	height: 300px;
	padding: 0 1em;
	float: left;
	position: relative;
}

.upload_delete {
	margin-left: 2em;
}

.upload_image {
	max-height: 250px;
	padding: 5px;
}

.upload_submit {
	padding-top: 1em;
	padding-left: 1em;
}

.upload_submit_btn {
	display: none;
	height: 32px;
	font-size: 14px;
}

.upload_loading {
	height: 250px;
	background: url() no-repeat center;
}

.upload_progress {
	display: none;
	padding: 5px;
	border-radius: 10px;
	color: #fff;
	background-color: rgba(0, 0, 0, .6);
	position: absolute;
	left: 25px;
	top: 45px;
}
</style>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.js"></script>
<script src="js/myjs/util.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top class center-block"
		role="navigation">
		<div class="container">
			<div class="col-md-12 column">
				<div class="col-md-4 column"></div>
				<div class="col-md-6 column">
					<ul class="nav navbar-nav ">
							<li><a href="index">Home</a></li>
							<li><a href="search?keywords=">Buy</a></li>
							<li  class="active"><a href="seller.jsp">Sell</a></li>
							<li><a href="auction.jsp">Auction</a></li>
							<c:if test="${sessionScope.user==null}">
								<li><a href="login.jsp"><span
										class="glyphicon glyphicon-user"></span> Account</a></li>
							</c:if>

							<c:if test="${sessionScope.user!=null}">
								<li><a href="xxx"><span
										class="glyphicon glyphicon-user"></span>${sessionScope.user.username}</a></li>
								<li><a href="logout"><span
										class="glyphicon glyphicon-log-out"></span> log out</a></li>
							</c:if>
						</ul>
				</div>
				<div class="col-md-2 column"></div>
			</div>
		</div>
	</nav>
	<form id="uploadForm" action="post" method="post"
		enctype="multipart/form-data">
		<div style="padding: 60px 0px 0px 40px" class="row clearfix">
			<div class="col-md-12 column">
				<h2>Choose things you want to sell</h2>
			</div>
			<div id="itemInput">
				<div class="col-md-12 column" style="padding: 10px 0px 0px 18px">
					<!--  <div class="col-md-2 column">
						<input type="text" class="form-control input-lg" id="category.0"
							placeholder="category" name="category.0"
							onkeyup="inputSuggest(0);">
						<div id="result_display.0" style="border: 1px solid #FFFFFF;" class="form-control input-lg"></div>
					</div>-->
					<div class="col-md-1 column" style="padding: 8px 0px 0px 0px;">
						<span class="label label-default" style="font-size:30px;">Item
							1:</span>
					</div>
					<div class="col-md-2 column">
						<select id="category0" name="category0" class="selectpicker "
							data-width="100%" data-style="btn-lg" data-live-search="true"
							title="Please select a category" data-size="10"
							onchange="selectItem(this[selectedIndex].value);">
							<option value="textbooks">textbooks</option>
							<option value="bowl">bowl</option>
							<option value="plate">plate</option>
							<option value="chopstick">chopstick</option>
							<option value="knife & fork & spoon">knife & fork &
								spoon</option>
							<option value="pot">pot</option>
							<option value="microwave onvens">microwave onvens</option>
							<option value="blenders">blenders</option>
							<option value="teakettles">teakettles</option>
							<option value="desk & table">desk & table</option>
							<option value="chairs & stools">chairs & stools</option>
							<option value="mattress">mattress</option>
							<option value="bed box spring">bed box spring</option>
							<option value="bed frame">bed frame</option>
							<option value="nightstand">nightstand</option>
							<option value="cabinet">cabinet</option>
							<option value="sofa">sofa</option>
							<option value="bookshelf">bookshelf</option>
							<option value="shoe rack">shoe rack</option>
							<option value="lamps">lamps</option>
							<option value="garment rack">garment rack</option>
							<option value="sweeping">sweeping</option>
							<option value="vacuum">vacuum</option>
							<option value="dust can">dust can</option>
							<option value="mop">mop</option>
							<option value="bucket">bucket</option>
							<option value="laptop">laptop</option>
							<option value="cell phone">cell phone</option>
							<option value="speakers & headphones">speakers &
								headphones</option>
							<option value="video games">video games</option>
							<option value="camera">camera</option>
							<option value="TV">TV</option>
							<option value="screen monitors">screen monitors</option>
							<option value="routers">routers</option>
							<option value="printers">printers</option>
							<option value="stapler">stapler</option>
							<option value="paper">paper</option>
							<option value="video projectors">video projectors</option>
							<option value="caculators">caculators</option>
							<option value="pen">pen</option>
							<option value="washers">washers</option>
							<option value="dryers">dryers</option>
							<option value="refrigerator">refrigerator</option>
							<option value="vehicles">vehicles</option>
							<option value="bikes">bikes</option>
							<option value="UTD parking stickers">UTD parking
								stickers</option>
							<option value="guitars">guitars</option>
							<option value="piano">piano</option>
							<option value="hangers">hangers</option>
							<option value="weight scales">weight scales</option>
							<option value="cap & gown">cap & gown</option>
							<option value="umbrellas">umbrellas</option>
							<option value="packing boxes">packing boxes</option>
							<option value="shower curtains">shower curtains</option>
							<option value="mats & carpets">mats & carpets</option>
						</select>
					</div>

					<div class="col-md-6 column">
						<input type="text" class="form-control input-lg" id="headline0"
							placeholder="You can still add something to the headline if needed"
							name="headline0">
					</div>
					<div class="col-md-2 column">
						<div class="input-group">
							<span class="input-group-addon">$</span> <input type="text"
								class="form-control input-lg" id="price0"
								placeholder="Set Price" name="price0"
								onkeypress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false">
						</div>
					</div>
					<div class="col-md-1 column"></div>
				</div>
				<div class="col-md-12 column" style="padding: 20px 0px 20px 18px">
					<div class="col-md-11 column">
						<textarea class="form-control input-lg" id="description0"
							placeholder="description" name="description0" rows="4"></textarea>
					</div>
					<div class="col-md-1 column"></div>
				</div>
			</div>

		</div>
		<div class="col-md-12 column" style="padding: 20px 0px 0px 40px">
			<div class="col-md-1 column">
				<button type="button" class="btn btn-inverse btn-lg"
					onclick="addAnotherItem()">Add another item</button>
			</div>
			<div class="col-md-11 column"></div>
		</div>
		<div style="padding: 60px 0px 0px 40px" class="row clearfix">
			<div class="col-md-12 column">
				<div class="col-md-3 column">
					<h3>Upload pictures when you finish adding all the items to
						save time</h3>
				</div>
				<div class="col-md-2 column"></div>
				<div class="col-md-7 column">
					<div id="main">
						<div id="body" class="light">
							<div id="content" class="show">
								<div class="demo">
									<div class="upload_box">
										<div class="upload_main">

											<div class="upload_choose">
												<div class="row clearfix">
													<div class="col-md-12 column">
														<div class="col-md-9 column">
															<input id="fileImage" type="file" size="30"
																name="fileselect" multiple /> <span id="fileDragArea"
																class="upload_drag_area"><h3>drag to here</h3> <br>
																(you can drag more than one picture at the same time)</span>
														</div>
														<div class="col-md-3 column">
															<div id="itemNO">
																<h3>Item No.</h3>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div id="preview" class="upload_preview"></div>
										</div>
										<div class="upload_submit">
											<button type="submit" id="fileSubmit">confirm submit</button>
										</div>
										<div id="uploadInf" class="upload_inf"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 column" style="padding: 60px 0px 0px 40px">
				<div>
					<h1>delivery</h1>
					<label class="checkbox-inline"> <input type="radio"
						name="optionsRadiosinline" id="optionsRadios3" value="option1"
						checked>Included
					</label> <label class="checkbox-inline"> <input type="radio"
						name="optionsRadiosinline" id="optionsRadios4" value="option2">
						Only small product
					</label> <label class="checkbox-inline"> <input type="radio"
						name="optionsRadiosinline" id="optionsRadios4" value="option2">
						Not included
					</label>
				</div>
				<div style="padding: 60px 0px 0px 0px">
					<h1>Contact Information</h1>
					Phone: <input type="text" id=""><br> Wechat: <input
						type="text" id=""><br> Facebook: <input type="text"
						id=""><br> Email: <input type="text" id=""><br>
					Others: <input type="text" id="">
				</div>
			</div>
		</div>
	</form>
</body>
<script>
	var ZXXFILE = {
		fileInput : null,
		dragDrop : null,
		upButton : null,
		url : "",
		fileFilter : [],
		filter : function(files) {
			return files;
		},
		onSelect : function() {
		},
		onDelete : function() {
		},
		onDragOver : function() {
		},
		onDragLeave : function() {
		},
		onProgress : function() {
		},
		onSuccess : function() {
		},
		onFailure : function() {
		},
		onComplete : function() {
		},

		funDragHover : function(e) {
			e.stopPropagation();
			e.preventDefault();
			this[e.type === "dragover" ? "onDragOver" : "onDragLeave"]
					.call(e.target);
			return this;
		},
		funGetFiles : function(e) {
			this.funDragHover(e);

			var files = e.target.files || e.dataTransfer.files;
			this.fileFilter = this.fileFilter.concat(this.filter(files));
			this.funDealFiles();
			return this;
		},

		funDealFiles : function() {
			for (var i = 0, file; file = this.fileFilter[i]; i++) {
				file.index = i;
			}
			this.onSelect(this.fileFilter);
			return this;
		},

		funDeleteFile : function(fileDelete) {
			var arrFile = [];
			for (var i = 0, file; file = this.fileFilter[i]; i++) {
				if (file != fileDelete) {
					arrFile.push(file);
				} else {
					this.onDelete(fileDelete);
				}
			}
			this.fileFilter = arrFile;
			return this;
		},

		funUploadFile : function() {
			var self = this;
			if (location.host.indexOf("sitepointstatic") >= 0) {
				return;
			}
			for (var i = 0, file; file = this.fileFilter[i]; i++) {
				(function(file) {
					var xhr = new XMLHttpRequest();
					if (xhr.upload) {
						xhr.upload.addEventListener("progress", function(e) {
							self.onProgress(file, e.loaded, e.total);
						}, false);

						xhr.onreadystatechange = function(e) {
							if (xhr.readyState == 4) {
								if (xhr.status == 200) {
									self.onSuccess(file, xhr.responseText);
									self.funDeleteFile(file);
									if (!self.fileFilter.length) {
										self.onComplete();
									}
								} else {
									self.onFailure(file, xhr.responseText);
								}
							}
						};

						xhr.open("POST", self.url, true);
						xhr.setRequestHeader("X_FILENAME",
								encodeURIComponent(file.name));
						xhr.send(file);
					}
				})(file);
			}

		},

		init : function() {
			var self = this;

			if (this.dragDrop) {
				this.dragDrop.addEventListener("dragover", function(e) {
					self.funDragHover(e);
				}, false);
				this.dragDrop.addEventListener("dragleave", function(e) {
					self.funDragHover(e);
				}, false);
				this.dragDrop.addEventListener("drop", function(e) {
					self.funGetFiles(e);
				}, false);
			}

			if (this.fileInput) {
				this.fileInput.addEventListener("change", function(e) {
					self.funGetFiles(e);
				}, false);
			}

			if (this.upButton) {
				this.upButton.addEventListener("click", function(e) {
					self.funUploadFile(e);
				}, false);
			}
		}
	};

	var params = {
		fileInput : $("#fileImage").get(0),
		dragDrop : $("#fileDragArea").get(0),
		upButton : $("#fileSubmit").get(0),
		url : $("#uploadForm").attr("action"),
		filter : function(files) {
			var arrFiles = [];
			for (var i = 0, file; file = files[i]; i++) {
				if (file.type.indexOf("image") == 0) {
					if (file.size >= 10240000) {
						alert(file.name
								+ '"is too big, supposed smaller than 500k');
					} else {
						arrFiles.push(file);
					}
				} else {
					alert('file:"' + file.name + '"is not a picture');
				}
			}
			return arrFiles;
		},
		onSelect : function(files) {
			var html = '', i = 0;
			$("#preview").html('<div class="upload_loading"></div>');
			var funAppendImage = function() {
				file = files[i];
				if (file) {
					var reader = new FileReader()
					reader.onload = function(e) {
						html = html
								+ '<div id="uploadList_'+ i +'" class="upload_append_list"><p><strong>'
								+ file.name
								+ '</strong>'
								+ '<a href="javascript:" class="upload_delete" title="delete" data-index="'+ i +'">delete</a><br />'
								+ '<img id="uploadImage_' + i + '" src="' + e.target.result + '" class="upload_image" /></p>'
								+ '<label>Enter itemNo: </label><input type="text" class="input-default" name="pictag'+file.name+'" id="pictag'+file.name+'">'
								+ '<span id="uploadProgress_' + i + '" class="upload_progress"></span>'
								+ '</div>';

						i++;
						funAppendImage();
					}
					reader.readAsDataURL(file);
				} else {
					$("#preview").html(html);
					if (html) {
						//delete
						$(".upload_delete")
								.click(
										function() {
											ZXXFILE
													.funDeleteFile(files[parseInt($(
															this).attr(
															"data-index"))]);
											return false;
										});
						//submit button
						$("#fileSubmit").show();
					} else {
						//submit button hiden
						$("#fileSubmit").hide();
					}
				}
			};
			funAppendImage();
		},
		onDelete : function(file) {
			$("#uploadList_" + file.index).fadeOut();
		},
		onDragOver : function() {
			$(this).addClass("upload_drag_hover");
		},
		onDragLeave : function() {
			$(this).removeClass("upload_drag_hover");
		},
		onProgress : function(file, loaded, total) {
			var eleProgress = $("#uploadProgress_" + file.index), percent = (loaded
					/ total * 100).toFixed(2)
					+ '%';
			eleProgress.show().html(percent);
		},
		onSuccess : function(file, response) {
			$("#uploadInf").append("<p>success: " + response + "</p>");
		},
		onFailure : function(file) {
			$("#uploadInf").append(
					"<p>picture " + file.name + "upload faild</p>");
			$("#uploadImage_" + file.index).css("opacity", 0.2);
		},
		onComplete : function() {
			//submit button hiden
			$("#fileSubmit").hide();
			//file empty value
			$("#fileImage").val("");
			$("#uploadInf").append("<p>all done, continue</p>");
		}
	};
	ZXXFILE = $.extend(ZXXFILE, params);
	ZXXFILE.init();

	/* 	function inputSuggest(number) {
	 var xhr = getXHR();
	 var categoryValue = document.getElementById('category.' + number).value;
	 xhr.onreadystatechange = function() {
	 if (xhr.readyState == 4) {
	 if (xhr.status == 200) {
	 var str = xhr.responseText.split("#");
	 var s = document.getElementById('result_display.' + number)
	 s.innerHTML = '';
	 for (i = 0; i < str.length - 1; i++) {
	 var suggest = '<div onmouseover="onmouseOver(this);" ';
	 suggest += 'onmouseout="onmousetOut(this);" ';
	 suggest += 'onclick="setSuggestValue(this.innerHTML,'
	 + number + ');" ';
	 suggest += 'class="onmouset_out">' + str[i] + '</div>';
	 s.innerHTML += suggest;
	 }
	 }
	 }

	 }

	 url = "suggest?time=" + new Date().getTime() + "&category." + number
	 + "=" + categoryValue + "&count=" + number;
	 xhr.open("Get", url, false);
	 xhr.send(null);

	 //2.connect to the server  
	 //xhr.open("GET", "suggest" + "?time=" + new Date().getTime(), false);
	 //alert(number)
	 //3.send request to the server  
	 //xhr.send("category." + number + "=" + categoryValue + "&count=" + number);
	 }
	 function onmouseOver(div) {
	 div.className = 'onmouse_over';
	 }
	 function onmousetOut(div) {
	 div.className = 'onmouset_out';
	 }
	 function setSuggestValue(value, number) {
	 document.getElementById('category.' + number).value = value;
	 document.getElementById('result_display.' + number).innerHTML = '';
	 } */
	var count = 0;
	function addAnotherItem() {
		count++;
		if (count >= 15) {
			alert("no more than 15 items");
			return;
		}
//		var itemInfo = document.getElementById("itemInput").innerHTML;
//		document.getElementById("itemInput").innerHTML = itemInfo
		$("#itemInput").append('<hr style="border:3px double #000" size="2"/> <div class="col-md-12 column" style="padding: 10px 0px 0px 18px">'
				+ '<div class="col-md-1 column" style="padding: 8px 0px 0px 0px;"><span class="label label-default" style="font-size:30px;">Item '
				+ (count + 1)
				+ ':</span></div>'
				+ '	<div class="col-md-2 column"><select id="category'
				+ count
				+ '" name="category'
				+ count
				+ '" class="selectpicker " data-width="100%" data-style="btn-lg" data-live-search="true" title="Please select a category" data-size="10" onchange="selectItem(this[selectedIndex].value);">'
				+ '<option value="textbooks">textbooks</option>'
				+ '<option value="bowl">bowl</option>'
				+ '<option value="plate">plate</option>'
				+ '<option value="chopstick">chopstick</option>'
				+ '<option value="knife & fork & spoon">knife & fork & spoon</option>'
				+ '<option value="pot">pot</option>'
				+ '<option value="microwave onvens">microwave onvens</option>'
				+ '<option value="blenders">blenders</option>'
				+ '<option value="teakettles">teakettles</option>'
				+ '<option value="desk & table">desk & table</option>'
				+ '<option value="chairs & stools">chairs & stools</option>'
				+ '<option value="mattress">mattress</option>'
				+ '<option value="bed box spring">bed box spring</option>'
				+ '<option value="bed frame">bed frame</option>'
				+ '<option value="nightstand">nightstand</option>'
				+ '<option value="cabinet">cabinet</option>'
				+ '<option value="sofa">sofa</option>'
				+ '<option value="bookshelf">bookshelf</option>'
				+ '<option value="shoe rack">shoe rack</option>'
				+ '<option value="lamps">lamps</option>'
				+ '<option value="garment rack">garment rack</option>'
				+ '<option value="sweeping">sweeping</option>'
				+ '<option value="vacuum">vacuum</option>'
				+ '<option value="dust can">dust can</option>'
				+ '<option value="mop">mop</option>'
				+ '<option value="bucket">bucket</option>'
				+ '<option value="laptop">laptop</option>'
				+ '<option value="cell phone">cell phone</option>'
				+ '<option value="speakers & headphones">speakers & headphones</option>'
				+ '<option value="video games">video games</option>'
				+ '<option value="camera">camera</option>'
				+ '<option value="TV">TV</option>'
				+ '<option value="screen monitors">screen monitors</option>'
				+ '<option value="routers">routers</option>'
				+ '<option value="printers">printers</option>'
				+ '<option value="stapler">stapler</option>'
				+ '<option value="paper">paper</option>'
				+ '<option value="video projectors">video projectors</option>'
				+ '<option value="caculators">caculators</option>'
				+ '<option value="pen">pen</option>'
				+ '<option value="washers">washers</option>'
				+ '<option value="dryers">dryers</option>'
				+ '<option value="refrigerator">refrigerator</option>'
				+ '<option value="vehicles">vehicles</option>'
				+ '<option value="bikes">bikes</option>'
				+ '<option value="UTD parking stickers">UTD parking stickers</option>'
				+ '<option value="guitars">guitars</option>'
				+ '<option value="piano">piano</option>'
				+ '<option value="hangers">hangers</option>'
				+ '<option value="weight scales">weight scales</option>'
				+ '<option value="cap & gown">cap & gown</option>'
				+ '<option value="umbrellas">umbrellas</option>'
				+ '<option value="packing boxes">packing boxes</option>'
				+ '<option value="shower curtains">shower curtains</option>'
				+ '<option value="mats & carpets">mats & carpets</option>'
				+ '</select>'
				+ '	</div>'
				+ '		<div class="col-md-6 column">'
				+ '		<input type="text" class="form-control input-lg" id="headline'+count+'"'
					+ '		placeholder="You can still add something to the headline if needed"'
					+ '		name="headline'+count +'">'
				+ '</div>'
				+ '	<div class="col-md-2 column">'
				+ '	<div class="input-group">'
				+ '	<span class="input-group-addon">$</span> <input type="text"'
				+ '	class="form-control input-lg" id="price'
				+ count
				+ '" placeholder="Set Price"'
				+ 'name="price'
				+ count
				+ '"'
				+ '				onkeypress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false">'
				+ '		</div>'
				+ '	</div>'
				+ '	<div class="col-md-1 column"></div>'
				+ '				</div>'
				+ '			<div class="col-md-12 column" style="padding: 20px 0px 20px 18px">'
				+ '			<div class="col-md-11 column">'
				+ '			<textarea class="form-control input-lg" id="description'+count+'"'
				+ '			placeholder="description" name="description'+count+'" rows="4"></textarea>'
				+ '	</div>' + '	<div class="col-md-1 column"></div>'
				+ '		</div>');
			$('.selectpicker').selectpicker("refresh");
	}
	function selectItem(val) {
		$('#itemNO').html("<h3>Item NO.</h3>");
		$('.selectpicker').each(function(key, value) {
			$('#itemNO').append('<h4>item '+(key+1)+': '+$(this).val()+'</h4> <input type="hidden" value="'+value+'" name="listItem'+key+'">');
		});
	}
</script>
</html>
