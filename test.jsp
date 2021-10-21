<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>

<head>

<title>계산기</title>

<style type="text/css">
table {
	border-collapse: collapse;
}

input {
	width: 40px;
}

#idResult {
	width: 214px;
	font-weight: bold;
	text-align: right;
	font-size: 14px
}
</style>

<script type="text/javascript">
	// 연산 이후 input창 초기화를 위한 flag변수 선언

	var flag = "0";

	function inpNum(btnVal) {

		var objResult = document.form.calcResult;

		var objOper = document.form.calcOper;

		var objTemp = document.form.calcTemp;

		var num1;

		var num2;

		var numResult;

		/* 숫자가 입력 되었을 때 */

		if (isNaN(btnVal) == false) {

			// 최초 입력시 입력받은 값 그대로 표시

			if (objResult.value == "0") {

				objResult.value = btnVal;

			}

			// 결과창에 입력한 숫자가 있으면 붙이기

			else {

				if (flag == "1") {

					objResult.value = btnVal;

					flag = 0;

				} else {

					objResult.value = objResult.value + btnVal;

				}

			}

			// 결과창 표시

		}

		/* 문자(연산키)가 입력 되었을 때 */

		else {

			// 결과버튼 선택 시

			if (btnVal == "eq") {

				num1 = parseInt(objTemp.value);

				num2 = parseInt(objResult.value);

				switch (objOper.value) {

				case 'di': {

					numResult = num1 / num2;

					break;

				}
					;

				case 'mt': {

					numResult = num1 * num2;

					break;

				}
					;

				case 'mi': {

					numResult = num1 - num2;

					break;

				}
					;

				case 'pl': {

					numResult = num1 + num2;

					break;

				}
					;

				default:

					break;

				}

				objResult.value = numResult;

				objTemp.value = "";

				objOper.value = "";

				flag = "1";

			}

			// 초기화

			else if (btnVal == "C") {

				objResult.value = "0";

				objOper.value = "";

				objTemp.value = "";

			}

			// 백스페이스

			else if (btnVal == "bk") {

				objResult.value = objResult.value.substring(0,
						objResult.value.length - 1);

			}

			// 연산자

			else {

				objOper.value = btnVal;

				objTemp.value = objResult.value;

				objResult.value = "0";

			}

		}

	}
</script>

</head>

<body>

	<form name="form">

		<div class="calc">

			<br />
			<h1 align="center">계산기 예제</h1>

			<table border="1" align="center">

				<tr>

					<td colspan="5"><input type="text" name="calcResult"
						id="idResult" value="0" readonly="readonly"></td>

				</tr>

				<tr>

					<td><input type="button" value=7 name="btn_7"
						onClick="inpNum('7')"></td>

					<td><input type="button" value=8 name="btn_8"
						onClick="inpNum('8')"></td>

					<td><input type="button" value=9 name="btn_9"
						onClick="inpNum('9')"></td>

					<td><input type="button" value="/" name="btn_di"
						onClick="inpNum('di')"></td>

					<td><input type="button" value="<" name="
						btn_bk" onClick="inpNum('bk')"></td>

				</tr>

				<tr>

					<td><input type="button" value=5 name="btn_5"
						onClick="inpNum('5')"></td>

					<td><input type="button" value=6 name="btn_6"
						onClick="inpNum('6')"></td>

					<td><input type="button" value=7 name="btn_7"
						onClick="inpNum('7')"></td>

					<td><input type="button" value="*" name="btn_mt"
						onClick="inpNum('mt')"></td>

					<td><input type="button" value="C" name="btn_C"
						onClick="inpNum('C')"></td>

				</tr>

				<tr>

					<td><input type="button" value=2 name="btn_2"
						onClick="inpNum('2')"></td>

					<td><input type="button" value=3 name="btn_3"
						onClick="inpNum('3')"></td>

					<td><input type="button" value=4 name="btn_4"
						onClick="inpNum('4')"></td>

					<td><input type="button" value="-" name="btn_mi"
						onClick="inpNum('mi')"></td>

					<td rowspan="2"><input type="button" value="=" name="btn_eq"
						onClick="inpNum('eq')"></td>

				</tr>

				<tr>

					<td colspan="2"><input type="button" value=0 name="btn_0"
						onClick="inpNum('0')"></td>

					<td><input type="button" value=1 name="btn_1"
						onClick="inpNum('1')"></td>

					<td><input type="button" value="+" name="btn_pl"
						onClick="inpNum('pl')"></td>

				</tr>



			</table>



			<input type="hidden" name="calcTemp"> <input type="hidden"
				name="calcOper">

		</div>

	</form>

</body>

</html>