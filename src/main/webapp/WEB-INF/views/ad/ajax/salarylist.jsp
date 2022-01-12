<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../setting.jsp"%>
</head>
<body>
	<div class="px-3 p-4">
		<ul id="tabs2" class="nav nav-tabs nav-v2 nav-primary mb-2"
			role="tablist">
			<li class="nav-item"><a class="nav-link px-2 pb-2 active ass2"
				href="#tabs2-tab3" role="tab" aria-selected="true" data-toggle="tab">승인
					전표 </a></li>
			<li class="nav-item ml-4"><a class="nav-link px-2 pb-2 ass2"
				href="#tabs2-tab4" role="tab" aria-selected="false"
				data-toggle="tab">미승인 전표 </a></li>
		</ul>
		<div id="tabsContent2" class="card-body tab-content p-3">
			<div class="tab-pane fade show active" id="tabs2-tab3"
				role="tabpanel">
				<div class="row">
					<div class="col">
						<div class="collapse multi-collapse" id="multiCollapseExample1">
							<table
								class="table table-bordered bg-white text-dark ass2 center">
								<tbody>
									<tr class="text-white con">
										<th colspan="4">입금전표</th>
									</tr>
									<tr>
										<th colspan="1">NO.</th>
										<td colspan="3">1234</td>
									</tr>
									<tr>
										<th scope="col">과목</th>
										<td scope="col">복리후생비</td>
										<th scope="col">항목</th>
										<td scope="col">식대</td>
									</tr>
									<tr>
										<th colspan="1">연결ID</th>
										<td colspan="3">음?</td>

									</tr>
									<tr>
										<th colspan="1">계정ID</th>
										<td colspan="3">??</td>
									</tr>
									<tr>
										<th colspan="3">적요</th>
										<th>금액</th>

									</tr>
									<tr>
										<td colspan="3">회계팀직원 저녁(홍길동외 5인) 5,000원 X 6명</td>
										<td>30,000</td>
									</tr>
									<tr>
										<td colspan="3">회계팀직원 저녁(홍길동외 5인) 5,000원 X 6명</td>
										<td>30,000</td>
									</tr>
									<tr>
										<td colspan="3">회계팀직원 저녁(홍길동외 5인) 5,000원 X 6명</td>
										<td>30,000</td>
									</tr>
									<tr>
										<th colspan="3">합계</th>
										<td>30,000</td>
									</tr>
								</tbody>
							</table>
							<br>
							<br>
							<br>
						</div>
					</div>
					<table class="table bg-white text-dark center ass2 table-striped">
						<thead class="text-white table-bordered tap">
							<tr>
								<th class="font-weight-semi-bold border-top-0 py-3 con2">전표번호</th>
								<th class="font-weight-semi-bold border-top-0 py-3 con2">담당자</th>
								<th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
								<th class="font-weight-semi-bold border-top-0 py-3 con2">승인상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${salarystatement}">
								<c:if test="${vo.ss_use_state == 1 }">
									<tr>
										<td class="py-1">
											<p>
												<a class="text-dark con2" data-toggle="collapse"
													href="#multiCollapseExample1" role="button"
													aria-expanded="false" aria-controls="multiCollapseExample1">${vo.ss_code}</a>
											</p>
										</td>
										<td class="py-1" style="vertical-align: middle">${vo.employee}</td>
										<td class="py-1" style="vertical-align: middle"><fmt:formatDate
												pattern="yyyy-MM-dd" value="${vo.ss_sal_date}" /></td>
										<td class="py-1" style="vertical-align: middle">승인</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane fade" id="tabs2-tab4" role="tabpanel">
				<div class="row">
					<div class="col">
						<div class="collapse multi-collapse" id="multiCollapseExample2">
							<div class="bg-white p-2">
								<table
									class="table table-bordered bg-white text-dark ass2 center">
									<tbody>
										<tr class="text-white con">
											<th colspan="4">입금전표</th>
										</tr>
										<tr>
											<th colspan="1">NO.</th>
											<td colspan="3">1234</td>
										</tr>
										<tr>
											<th scope="col">과목</th>
											<td scope="col">복리후생비</td>
											<th scope="col">항목</th>
											<td scope="col">식대</td>
										</tr>
										<tr>
											<th colspan="1">연결ID</th>
											<td colspan="3">음?</td>

										</tr>
										<tr>
											<th colspan="1">계정ID</th>
											<td colspan="3">??</td>
										</tr>
										<tr>
											<th colspan="3">적요</th>
											<th>금액</th>

										</tr>
										<tr>
											<td colspan="3">회계팀직원 저녁(홍길동외 5인) 5,000원 X 6명</td>
											<td>30,000</td>
										</tr>
										<tr>
											<td colspan="3">회계팀직원 저녁(홍길동외 5인) 5,000원 X 6명</td>
											<td>30,000</td>
										</tr>
										<tr>
											<td colspan="3">회계팀직원 저녁(홍길동외 5인) 5,000원 X 6명</td>
											<td>30,000</td>
										</tr>
										<tr>
											<th colspan="3">합계</th>
											<td>30,000</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div align=center>
								<button type="button" type="submit" class="btn btn-outline-info">승인</button>
								&nbsp;&nbsp;&nbsp;
								<button type="button" type="reset" class="btn btn-outline-info">승인거부</button>
							</div>
							<br>
							<br>
							<br>
						</div>
					</div>
					<table class="table bg-white text-dark center ass2 table-striped">
						<thead class="text-white table-bordered tap">
							<tr>
								<th class="font-weight-semi-bold border-top-0 py-3 con2">전표번호</th>
								<th class="font-weight-semi-bold border-top-0 py-3 con2">담당자</th>
								<th class="font-weight-semi-bold border-top-0 py-3 con2">등록일</th>
								<th class="font-weight-semi-bold border-top-0 py-3 con2">승인상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${salarystatement}">
								<c:if test="${vo.ss_use_state == 0 }">
									<tr>
										<td class="py-1">
											<p>
												<a class="btn" data-toggle="collapse"
													href="#multiCollapseExample1" role="button"
													aria-expanded="false" aria-controls="multiCollapseExample1">${vo.ss_code}</a>
											</p>
										</td>
										<td class="py-1" style="vertical-align: middle">${vo.employee}</td>
										<td class="py-1" style="vertical-align: middle"><fmt:formatDate
												pattern="yyyy-MM-dd" value="${vo.ss_sal_date}" /></td>
										<td class="py-1" style="vertical-align: middle">미승인</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>