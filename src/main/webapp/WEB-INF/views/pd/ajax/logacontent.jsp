<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   	
	function Check1() {
          if(!$("input[id='accscontent']").val()) {
             alert("내용을 입력하세요.");
             $("input[id='accscontent']").focus();
             return false;
          }
       }
</script>
</head>
<body>
	<div class="bg-white p-2">
		<form action="${path}/logsAppInsert" method="post" name="lololo" onsubmit="return Check1()">
			<input type="hidden" id="logs_code" name="logs_code" value="${shortContent.logs_code}">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
			<table class="table bg-white text-dark center ass2">
				<tr class="text-white table-bordered tap">
					<th colspan="3">구매 전표 등록</th>
				</tr>
				<tr>
					<td class="font-weight-semi-bold border-top-0 py-2 text-dark"
						colspan="2" style="vertical-align: middle;">전표유형</td>
					<td style="vertical-align: middle;"><select
						class="form-control" id="accs_type" name="accs_type"
						style="font-size: 20px">
							<option value="3">구매전표</option>
							<option value="4">채무전표</option>
					</select></td>
				</tr>
				<tr>
					<td class="font-weight-semi-bold border-top-0 py-2 text-dark"
						colspan="2" style="vertical-align: middle;">거래처명</td>
					<td class="font-weight-semi-bold border-top-0 py-2" colspan="2"><select
						class="form-control" id="com_code" name="com_code"
						style="font-size: 20px">
							<c:forEach var="company" items="${company}">
								<option value="${company.com_code}">${company.com_name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="py-3 text-dark" colspan="2"
						style="vertical-align: middle;"><b>상품명</b></td>
					<td class="py-3" colspan="2"
						style="vertical-align: middle; font-size: 20px; text-align: left;">
						<input class="form-control" style="font-size: 20px" type="hidden" id="pro_code"
						name="pro_code" value="${shortContent.product.pro_code}">${shortContent.product.pro_name}</td>
				</tr>
				<tr>
					<td class="py-3 text-dark" colspan="2"
						style="vertical-align: middle;"><b>단가</b></td>
					<td class="py-3" colspan="2"><input class="form-control"
						style="font-size: 20px" type="text" id="accs_price"
						name="accs_price" value="${shortContent.product.pro_pur_price}"></td>
				</tr>
				<tr>
					<td class="py-3" colspan="2" style="vertical-align: middle;"><b>수량</b></td>
					<td class="py-3" colspan="2">
						<input class="form-control"
						style="font-size: 20px" type="text" id="accs_quantity"
						name="accs_quantity" value="${shortContent.logs_shortage}"></td>
				</tr>
				<tr>
					<td class="py-3" colspan="2" style="vertical-align: middle;"><b>총액</b></td>
					<td class="py-3" colspan="2"><input class="form-control"
						style="font-size: 20px" type="text" id="accs_sum" name="accs_sum" value="${shortContent.logs_shortage * shortContent.product.pro_pur_price}"></td>
				</tr>
				<tr>
					<td class="py-3" colspan="2" style="vertical-align: middle;"><b>담당자</b></td>
					<td class="py-3" colspan="2"
						style="vertical-align: middle; font-size: 20px; text-align: left;">
						<input type="hidden" name="emp_code"
						value="${sessionScope.mem_id}"> ${sessionScope.mem_name}
					</td>
				</tr>
				<tr>
					<td class="py-3" colspan="2" style="vertical-align: middle;"><b>내용</b></td>
					<td class="py-3" colspan="2"><input class="form-control"
						style="font-size: 20px" type="text" id="accscontent"
						name="accs_content"></td>
				</tr>
				</tbody>
			</table>
			<br>
			<div align=center>
				<button type="submit" class="btn btn-outline-info">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-outline-info">재입력</button>
			</div>
		</form>
	</div><br><br>
</body>
</html>