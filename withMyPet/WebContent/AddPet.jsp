<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>AddPet.jsp</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>



<script>
	/* function inputSpecies() {
		$("#name_species").value("개");
	} */
</script>
</head>
<body>
	<div id="editPetProfile">
		<h2>펫 추가하기</h2>

		<fieldset class="edit_set">
			<legend>펫 프로필 정보를 입력하세요.</legend>
			<div class="editPetForm">
				<dl class="row-petname">
					<dt></dt>
					<dd>
						펫 이름 <input type="text" class="inputTxt" size="30" name="nickname"
							id="nickname" value="" />
					</dd>
				</dl>


				<dl class="row-kind">
					<dt></dt>
					<dd>
						종 <input type="hidden" name="id_species" id="id_species" value="" />
						<input type="text" class="inputTxt disabled" name="name_species"
							id="name_species" disabled="disabled" value=""
							title="동물을 선택, 검색 후 입력하실 수 있어요." />
						<button type="button">검색</button>
				</dl>

				<dl class="row-vcard">
					<dt></dt>
					<dd>
						프로필 사진
						<div class="profile-pic">
							<img id="alter_image" src="images/common/pet.png" witdh="30px"
								height="30px" alt="" />
						</div>
						<button class="btnsT openImgForm"
							onclick="toggle_img();return false;">
							<span>사진을 변경할까요?</span>
						</button>
						<div id="div_img_change" style="display: none;">
							<iframe height="610" frameborder="0" width="100%" scrolling="no"
								id="frm" allowTransparency="true"
								src="/ajax_common/form_file?sub_dir=media/pet/temp/38013_9wxVFERC.jpg"></iframe>
						</div>
					</dd>
				</dl>

				<dl class="row-gender">
					<dt></dt>
					<dd>
						성별 <input name="is_male" type="radio" id="male" class="radio"
							value="1" checked="checked" /> <label for="male">수컷</label> <input
							name="is_male" type="radio" id="female" class="radio" value="0" />
						<label for="female">암컷</label>
					</dd>
				</dl>
				<dl class="row-birth">
					<dt></dt>
					<dd>
						생일 <input type="date" id="date_birth" />
						<!-- <img
							alt="calendar" src="images/common/calendar.png" width="20px"
							height="30px" id="calendar"> -->


					</dd>
				</dl>


				<dl class="row-desc">
					<dt>소개</dt>
					<dd>
						<textarea rows="5" cols="30" id="welcome" name="welcome"></textarea>
					</dd>
				</dl>
			</div>
			<div class="btnwrap">
				<button class="btnsBT btn_save" onclick="go_submit();return false;"
					id="pet_add_submit_btn">펫 추가하기</button>

			</div>

		</fieldset>

	</div>


</body>
</html>