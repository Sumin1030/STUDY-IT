# Study-IT
## 제가 맡은 부분의 파일은 src/com/studyit/mybatis/sumin에 있습니다.
## (dao관련 인터페이스와 매핑된 xml파일들은(쿼리) src/com/studyit/mybatis/sumin/mapperr에 있습니다.)

1. 공지사항 구현
Support_notice_Controller.java
Support_notice_list_DTO.java
ISupport_notice_list_DAO.java

2. 1:1질문게시판 구현
Suport_QA_Controller.java
Support_QA_list_DTO.java
ISupport_QA_list_DAO.java

3. 스터디 상세페이지 구현
StudyDetailController.java
Study_detail_DTO.java
Study_comment_DTO.java
Study_applyMem_DTO.java
IStudy_detail_DAO.java

4. 스터디 개설, 수정 구현
StudyInsertController.java(개설, 수정 폼 이동 부분 제외)

5-1. 관리자게시판-신고처리게시판 목록 구현
Report_list_Controller.java(목록, 상세페이지)
Board_report_list_DTO.java(처리할게시물목록)
IBoard_report_list_DAO.java
Participant_report_list_DTO.java(처리할스터디원목록)
IParticipant_report_list_DAO.java

5-2. 관리자게시판-신고처리게시판 상세페이지 신고목록 조회
Report_detail.DTO.java(게시물신고목록)
IReport_detail_DAO.java
Report_DTO.java(스터디원신고목록)
IReportDAO.java

5-3. 관리자게시판-신고처리게시판 상세페이지 신고처리기능 구현
Report_handle_Controller.java
IReport_handle_DAO.java
