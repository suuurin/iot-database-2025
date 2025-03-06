-- 데이터베이스 관리
show DATABASES;

-- information_schema, performance_schema, mysql등은 시스템 DB라서 개발자, DBA 사용하는 게 아님
use madang;

-- 하나의 DB내 존재하는 테이블들 확인
show tables;

-- 테이블의 구조
desc madang.NewBook;

select * from v_orders;

-- 사용자 추가
-- madang 데이터베이스만 접근할 수 있는 사용자 madang 생성
-- 내부접속용
create user madang@localhost IDENTIFIED by 'madang';

-- 외부접속용
create user madang@'%' IDENTIFIED by 'madang';

-- DCL : grant, revoke
-- 데이터 삽입, 조회, 수정만 권한을 부여
grant select, insert, update on madang.* to madang@localhost with grant option;
grant select, insert, update on madang.* to madang@'%' with grant option;

-- 모든 권한 부여
grant all PRIVILEGES on madang.* to madang@localhost with grant option;
grant all PRIVILEGES on madang.* to madang@'%' with grant option;
flush privileges;

-- 권한 해제
-- madang 사용자의 권한 중 select 권한만 제거
revoke select on madang.* from madang@localhost;
revoke all PRIVILEGES on madang.* from madang@localhost;
revoke all PRIVILEGES on madang.* from madang@'%';
flush 
