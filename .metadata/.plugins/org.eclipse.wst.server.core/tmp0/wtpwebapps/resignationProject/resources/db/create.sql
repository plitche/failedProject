-- SEQUENCE들
CREATE SEQUENCE tbDiscussion;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbIdeaVoting;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbProject;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbStudy;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbSchedule;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbNeedParticipants;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbApplyParticipants;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbMessengerList;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbMessengerParticipants;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbMessenger;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbComment;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbSubComment;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbMainJob;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbSubJob;
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE tbTag;
START WITH 1
INCREMENT BY 1
NOCACHE;

-- CREATE TABLE

-- 유저
CREATE TABLE tbMember (
	vcMemberId 			 	VARCHAR(50) 		PRIMARY KEY,
	vcMemberPw 			 	VARCHAR(30) 		NOT NULL,
	vcMemberName 		 	VARCHAR(30) 		NOT NULL,
	vcMemberNicname	 	VARCHAR(50) 		NOT NULL,
	vcMemberAddress	 	VARCHAR(50) 		NOT NULL,
	vcMemberPhone 		 	VARCHAR(30) 		NULL,
	vcMemberAge 			 	VARCHAR(10) 		NULL,
	vcMemberMBTI 		 	VARCHAR(20) 		NULL,
	vcMemberTime 		 	VARCHAR(40) 		NOT NULL,
	vcMemberIntroduce   	VARCHAR(2000) 		NOT NULL,
	vcMemberEmail 		 	VARCHAR(50) 		UNIQUE NOT NULL,
	vcMemberGender		 	VARCHAR(10) 		NOT NULL,
	vcMemberLink1 		 	VARCHAR(30) 		NULL,
	vcMemberLink2 		 	VARCHAR(30) 		NULL
);

-- 프로젝트
CREATE TABLE tbProject (
	iProjectNo 					NUMBER 				PRIMARY KEY,
	vcMemberId				VARCHAR(50) 			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	vcLocation					VARCHAR(50) 			NULL,
	vcTime						VARCHAR(50)			NULL,
	dtStartDate					DATE						NOT NULL,
	dtEndDate					DATE						NOT NULL,
	dtRegDate					DATE						NOT NULL,
	vcProcess					VARCHAR(50)			NOT NULL,
	nStatus						NUMBER					NOT NULL,
	vcSubject					VARCHAR(50)			NOT NULL,
	vcContent					VARCHAR(1000)		NOT NULL
);

-- 스터디
CREATE TABLE tbStudy (
	iStudyNo					NUMBER					PRIMARY KEY,
	vcMemberId				VARCHAR(50) 			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	vcLocation					VARCHAR(50) 			NULL,
	vcTime						VARCHAR(50)			NULL,
	dtStartDate					DATE						NOT NULL,
	dtEndDate					DATE						NOT NULL,
	dtRegDate					DATE						NOT NULL,
	vcProcess					VARCHAR(50)			NOT NULL,
	nStatus						NUMBER					NOT NULL,
	vcSubject					VARCHAR(50)			NOT NULL,
	vcContent					VARCHAR(1000)		NOT NULL
);

-- 토론
CREATE TABLE tbDiscussion (
	iDiscussNo					NUMBER					PRIMARY KEY,
	vcMemberId				VARCHAR(50) 			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	vcDiscussTheme			VARCHAR(100)		NOT NULL,
	vcDiscussTitle				VARCHAR(150)		NOT NULL,
	dtStartDate					DATE						NOT NULL,
	dtEndDate					DATE						NOT NULL,
	dtRegDate					DATE						NOT NULL,
	vcDiscussContent			VARCHAR(1000)		NOT NULL,
	vcDiscussChanger			VARCHAR(30)			NOT NULL,
	vcDiscussChangeDate	DATE						NOT NULL,
	nDiscussStatus				NUMBER					NOT NULL
);

-- 아이디어 투표
CREATE TABLE tbIdeaVoting (
	iIdeaNo						NUMBER					PRIMARY KEY,
	vcMemberId				VARCHAR(50) 			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	vcIdeaTheme				VARCHAR(50)			NOT NULL,
	vcIdeaTitle					VARCHAR(100)		NOT NULL,
	vcIdeaContent				VARCHAR(1500)		NOT NULL,
	dtStartDate					DATE						NOT NULL,
	dtEndDate					DATE						NOT NULL,
	dtRegDate					DATE						NOT NULL,
	vcIdeaChangeDate		DATE						NOT NULL,
	vcIdeaChanger				VARCHAR(30)			NOT NULL,
	nIdeaStatus					NUMBER					NOT NULL
);

-- 주직무
CREATE TABLE tbMainJob (
	iMainJobNo				NUMBER					PRIMARY KEY,
	vcMemberId				VARCHAR(50) 			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	vcMainJob					VARCHAR(30)			NOT NULL,
	vcMainJobLevel			VARCHAR(20)			NOT NULL,
	vcMainJobField1			VARCHAR(30)			NOT NULL,
	vcMainJobField2			VARCHAR(30)			NULL,
	vcMainJobField3			VARCHAR(30)			NULL
);

-- 부직무
CREATE TABLE tbSubJob (
	iSubJobNo					NUMBER					PRIMARY KEY,
	vcMemberId				VARCHAR(50) 			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	vcSubJob					VARCHAR(50)			NOT NULL,
	vcSubJobLevel				VARCHAR(20)			NOT NULL,
	vcSubJobField1				VARCHAR(30)			NOT NULL,
	vcSubJobField2				VARCHAR(30)			NULL,
	vcSubJobField3				VARCHAR(30)			NULL
);

-- 흥미분야
CREATE TABLE tbInterestField (
	vcMemberId				VARCHAR(50) 			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	vcField1						VARCHAR(30)			NOT NULL,
	vcField2						VARCHAR(30)			NULL,
	vcField3						VARCHAR(30)			NULL,
	vcField4						VARCHAR(30)			NULL,
	vcField5						VARCHAR(30)			NULL,
	vcField6						VARCHAR(30)			NULL,
);

-- 프로젝트/스터디 찜리스트
CREATE TABLE tbSavedList (
	iSavedListNo				NUMBER					PRIMARY KEY,
	vcMemberId				VARCHAR(50) 			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	nSavedListType			NUMBER					NOT NULL
);

-- 댓글
CREATE TABLE tbComment (
	iCommentNo				NUMBER					PRIMARY KEY,
	vcCommentId				VARCHAR(50) 			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	nCommentType			NUMBER					NOT NULL,
	vcCommentContent		VARCHAR(1500)		NULL,
	dtCommentCreated		DATE						NOT NULL,
	dtCommentUpdated		DATE						NOT NULL,
);

-- 대댓글
CREATE TABLE tbSubComment (
	iSubCommentNo			NUMBER					PRIMARY KEY,
	iCommentNo				NUMBER					REFERENCES tbComment(iCommentNo) ON DELETE CASCADE NOT NULL,
	vcCommentId				VARCHAR(50)			REFERENCES tbComment(vcCommentId) ON DELETE	CASCADE NOT NULL,
	vcSubCommentContent	VARCHAR(1000)		NULL,
	dtSubCommentCreated	DATE						NOT NULL,
	dtSubCommentUpdated	DATE						NOT NULL,
	
);

-- 프로젝트/스터디 일정
CREATE TABLE tbSchedule (
	iScheduleNo				NUMBER					PRIMARY KEY,
	iProjectNo 					NUMBER					REFERENCES tbProject(iProjectNo) ON DELETE CASCADE NOT NULL,
	vcCreatorId					VARCHAR(50)     		REFERENCES tbProject(vcMemberId) ON DELETE CASCADE NOT NULL,
	nMeetingType				NUMBER					NOT NULL,
	vcContent					VARCHAR(1000)		NOT NULL,
	dtRegDate					DATE						NOT NULL,
	dtOnDate					DATE						NOT NULL,
	nDonePercent				NUMBER					NOT NULL
);

-- 프로젝트/스터디 필요한 참가자
CREATE TABLE tbNeedParticipants (
	iNeedParticipantsNo		NUMBER					PRIMARY KEY,
	iMeetingNo 				NUMBER					NOT NULL,
	vcNeedParticipantId		VARCHAR(50)			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	dtParticipateDate			DATE						NOT NULL,
	vcPosition					VARCHAR(50)			NOT NULL,
	nMeetingType				NUMBER					NOT NULL
);

-- 참가 희망자
CREATE TABLE tbApplyParticipants (
	iApplyParticipantsNo		NUMBER					PRIMARY KEY,
	iMeetingNo					NUMBER					NOT NULL,
	vcApplyParticipantId		VARCHAR(50)			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	dtParticipateDate			DATE						NOT NULL,
	vcPosition					VARCHAR(50)			NOT NULL,
	nMeetingType				NUMBER					NOT NULL
);

-- 대화목록 리스트
CREATE TABLE tbMessengerList (
	iMessListNo					NUMBER					PRIMARY KEY,
	iMeetingNo					NUMBER					NOT NULL,
	dtLastUpdateDate			DATE						NOT NULL,
	nMeetingType				NUMBER					NOT NULL
);

-- 대화 참가자 리스트
CREATE TABLE tbMessengerParticipants (
	iMessParicipantsNo		NUMBER					PRIMARY KEY,
	iMeetingNo					NUMBER					NOT NULL,
	nMeetingType				NUMBER					NOT NULL,
	vcMemberId1				VARCHAR(50)			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NOT NULL,
	vcMemberId2				VARCHAR(50)			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NULL,
	vcMemberId3				VARCHAR(50)			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NULL,
	vcMemberId4				VARCHAR(50)			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NULL,
	vcMemberId5				VARCHAR(50)			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NULL,
	vcMemberId6				VARCHAR(50)			REFERENCES tbMember(vcMemberId) ON DELETE CASCADE NULL,
);

-- 대화 메신저
CREATE TABLE tbMessenger (
	iMessNo						NUMBER					PRIMARY KEY,
	iMessParticipantsNo		NUMBER					REFERENCES tbMessengerParicipants(iMessParticipants) ON DELETE CASCADE NOT NULL,
	iMessListNo					NUMBER					REFERENCES tbMessengerList(iMessListNo) ON DELETE CASCADE NOT NULL,
	vcMessContent			VARCHAR(1000)		NOT NULL,
	dtRegDate					DATE						NOT NULL
);

-- 아이디어 투표 선택지
CREATE TABLE tbDistractor (
	iIdeaVotingNo				NUMBER					REFERENCES tbIdeaVoting(iIdeaNo) ON DELETE CASCADE NOT NULL,
	nDistractorType			NUMBER					NOT NULL,
	vcChoose1					VARCHAR(20)			NOT NULL,
	vcChoose2					VARCHAR(20)			NULL,
	vcChoose3					VARCHAR(20)			NULL,
	vcChoose4					VARCHAR(20)			NULL,
	vcChoose5					VARCHAR(20)			NULL
);

-- 첨부파일
CREATE TABLE tbAttachment (
	nPostReferNo				NUMBER					NOT NULL,
	nFileType					NUMBER					NOT NULL,
	vcFileName					VARCHAR(100)		NOT NULL,
	vcOrgFilename				VARCHAR(100)		NOT NULL,
	vcFilePath					VARCHAR(100)		NOT NULL
);

-- 공유 수
CREATE TABLE tbShare (
	nPostReferNo				NUMBER					NOT NULL,
	nShareType					NUMBER					NOT NULL,
	nShareCnt					NUMBER					NOT NULL
);

-- 좋아요/싫어요
CREATE TABLE tbGoodBad (
	nPostReferNo				NUMBER					NOT NULL,
	nGBType						NUMBER					NOT NULL,
	nGood						NUMBER					NOT NULL,
	nBad							NUMBER					NOT NULL
);

-- 조회수
CREATE TABLE tbHit (
	nPostReferNo				NUMBER					NOT NULL,
	nHitType						NUMBER					NOT NULL,
	nHit							NUMBER					NOT NULL
);

-- 태그
CREATE TABLE tbTag (
	iTagNo						NUMBER					PRIMARY KEY,
	nTagReferNo				NUMBER					NOT NULL,
	vcTag							VARCHAR(50)			NOT NULL,
	nTagType					NUMBER					NOT NULL
);







