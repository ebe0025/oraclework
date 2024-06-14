/*
(') 홀따옴표 : 문자열
(") 쌍따옴표 : 컬럼명
*/

/*
    <SELECT>
    데이터 조회할 때 사용하는 구문
    
    >> RESULT SET : SELECT
    
*/
-- EMPLOYEE테이블의 모든 컬럼(*) 조회
SELECT *
    FROM employee;
    
SELECT *
FROM department;

select * FROM job;

-- EMPLOYEE테이블에서 사번, 이름 급여만 조회
SELECT EMP_ID, EMP_NAME, SALARY
    FROM employee;
    
SELECT DEPT_ID, DEPT_TITLE
    FROM department;

--1번    
SELECT JOB_NAME FROM JOB;

--2번
SELECT * FROM department;

--3번
SELECT DEPT_ID, DEPT_TITLE FROM department;

--4번
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY
    FROM employee;
    
/*
    <컬럼값을 통한 산술연산>
    SELECT절의 컬럼명 작성부분에 산술연산 기술 가능(이때 산술연산된 결과 조회)
*/
-- EMPLOYEE테이블에서 사원명, 사원 연봉(급여*12) 조회
SELECT EMP_NAME, SALARY*12
    FROM employee;
    
-- EMPLOYEE테이블에서 사원명, 급여, 보너스
SELECT EMP_NAME, SALARY, BONUS
    FROM employee;
-- EMPLOYEE테이블에서 사원명, 급여, 보너스, 연봉, 보너스를 포함한 연봉
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12, (SALARY + bonus * salary)*12 
    FROM employee;
    --> 산술연산 중 NULL갑이 존재할 경우 산술연산한 결과값도 무조건 NULL이 됨

-- EMPLOYEE테이블에서 사원명, 입사일 근무일수(오늘날짜-입사일)
-- DATE형태끼리도 연산 가능 :  결과값은 일 단위
-- * 오늘날짜 : SYSDATE
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
    FROM employee;
    
-----------------------------------------------------

/*
    <컬럼명에 별칭 지정하기>
    산술연산시 컬럼명이 산술에 들어간 수식 그대로 됨. 이때 별칭을 부여하면
    별칭이 컬럼명이 됨
    
    [표현법]
    컬럼명 별칭
    컬럼명 AS 별칭
    컬럼명 "별칭"
    컬럼명 AS "별칭"
*/

SELECT EMP_NAME, SALARY, BONUS, SALARY * 12 연봉, (SALARY + bonus * salary)*12 AS 총연봉 
    FROM employee;

--별칭에 특수기호나 띄어쓰기가 들어가면 반드시 쌍따옴표(")로 묶어줘야함
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12 "\연봉(원)", (SALARY + bonus * salary)*12 AS 총연봉 
    FROM employee;
    
-- 위의 예제에서 사원명, 급여, 보너스, 연봉 (원), 총 연봉
SELECT EMP_NAME 사원명, SALARY 급여, BONUS 보너스, SALARY * 12 "\연봉(원)", (SALARY + bonus * salary)*12 AS 총연봉 
    FROM employee;
    
------------------------------------------------------------------
/*
    <리터럴>
    임의로 지정한 문자열(')
    
    SELECT절에 리터럴을 넣으면 마치 테이블상에 존재하는 데이터럼 조회 가능
    조회된 RESULT SET의 모든 행에 반복적으로 출력
*/
-- EMPLOYEE 사번, 사원명, 급여 조회 - 컬럼을 하나 만들어서 원을 넣어주도록함
SELECT EMP_ID, EMP_NAME, SALARY, '원' AS 단위
    FROM employee;
    
---------------------------------------------------------------------
/*
    <연결 연산자 : ||>
    여러 컬럼값을 마치 하나의 컬럼값인것처럼 연결하거나, 컬럼값과 리터럴을 연결할 수 있음
*/
-- EMPLOYEE 사번, 사원명, 급여를 하나의 컬럼으로 조회
SELECT EMP_ID || ' '|| EMP_NAME || ' '|| SALARY AS "사원의 급여"
    FROM employee;

-- 컬럼값과 리터럴과 연결
SELECT EMP_NAME || '의 월급은 ' || SALARY || '원 입니다.'
    FROM employee;
    
SELECT EMP_ID, EMP_NAME, SALARY || '원'
    FROM employee;
    
-- EMPLOYEE에 부서코드 중복제거 조회
SELECT DISTINCT DEPT_CODE
FROM employee;

-- EMPLOYEE에 직급코드 중복제거 조회
SELECT DISTINCT JOB_CODE
FROM employee;

-- 주의사항 : DISTINCT는 SELECT절에 딱 한번만 기술 가능
SELECT DISTINCT DEPT_CODE, JOB_CODE
    FROM employee;
    
------------------------------------------------------------
/*
    <WHERE 절>
    조회하고자 하는 테이블로부터 특정조건에 만족하는 데이터만 조회할 때
    이때 WHERE절에 조건식을 쓰면 됨
    조건식에서는 다양한 연산자 사용가능
    
    [표현법]
    SELECT 컬럼명,....
    !=, ^-. <> --> 같지 않은지 비교
*/

-- EMPLOYEE에서 부서코드가 'D9'인 사원들의 모든 컬럼 조회
SELECT *
    FROM employee
    WHERE DEPT_CODE = 'D9';
    
-- EMPLOYEE에서 부서코드가 'D1'인 사원들의 사원명, 급여, 부서코드 조회
SELECT EMP_NAME, SALARY, DEPT_CODE
    FROM employee
    WHERE DEPT_CODE = 'D1';
    
-- EMPLOYEE에서 부서코드가 'D1'이 아닌 사원들의 사원명, 이메일, 부서코드 조회
SELECT EMP_NAME, EMAIL, DEPT_CODE
    FROM employee
    WHERE DEPT_CODE != 'D1';
    
-- EMPLOYEE에서 급여가 4백만원 이상인 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
    FROM employee
    WHERE SALARY >= '4000000';
    
-- EMPLOYEE에서 재직중인 사원의 사원명, 전화번호 조회
SELECT EMP_NAME, PHONE AS 전화번호
    FROM employee
    WHERE ENT_YN = 'N';
    
SELECT EMP_NAME 사원명, SALARY 급여, HIRE_DATE 입사일, SALARY * 12 AS "연봉"
    FROM employee
    WHERE SALARY >= 3000000;

SELECT EMP_NAME 사원명, SALARY 급여, SALARY * 12 AS 연봉, DEPT_CODE
    FROM employee
    WHERE SALARY * 12 >= 50000000;
    
SELECT EMP_ID ,EMP_NAME, JOB_CODE, ENT_YN 퇴사여부
    FROM employee
    WHERE JOB_CODE != 'J3';    
    
-----------------------------------------------------------------
/*
    <논리 연산자>
    AND (그리고, ~이면선)
    OR (또는, ~DLRJSK)
*/

-- 부서코드가 'D9'이면서 급여가 500만원 이상인 사원들 사원명, 부서코드, 급여조회
SELECT EMP_NAME, DEPT_CODE, SALARY
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D9' AND SALARY >= 5000000;
    
-- 부서코드가 'D9'이거나 급여가 300만원 이상인 사원들 사원명, 부서코드, 급여조회
SELECT EMP_NAME, DEPT_CODE, SALARY
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D5' OR SALARY >= 3000000;
    
-- EMPLOYEE에서 급여가 350만원 이상 600만원 이하인 사원들의 사원명, 사번, 급여 조회
SELECT EMP_NAME, EMP_ID, SALARY
    FROM EMPLOYEE
    WHERE SALARY <= 6000000 AND SALARY >= 3500000;
    
---------------------------------------------------------------
/*
    <BETWEEN AND>
    조건식에서 사용되는 구문
    ~이상 ~이하인 범위 대한 조건을 제시할 사용하는 연산자
    
    [표현법[
    비교대상컬럼 BETWEEN 하한값 AND 상한값
*/
SELECT EMP_NAME, EMP_ID, SALARY
    FROM EMPLOYEE
    WHERE SALARY BETWEEN 3500000 AND 6000000;
    
-- 입사일이 2000년 이전에 들어온 사원의 모든 컬럼 조회
SELECT EMP_NAME, HIRE_DATE
    FROM EMPLOYEE
 --   WHERE hire_date BETWEEN '90/01/01' AND '00/01/01';
 WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '99/12/31';
 
 -------------------------------------------------------------
 
 /*
    <LIKE>
    비교하고자하는 컬럼값이 내가 제시한 특정 패턴에 만족하는 경우 조회
    
    [표현법]
    비교대상컬럼 LIKE '특정패턴'
    : 특정패턴 제시시 '%''_'를 와일드카드로 쓸 수 있음
    
    >> '%' : 0글자이상
    EX) 비교대상컬럼 LIKE '문자%'=> 비교대상의 컬럼값이 '문자'로 시작되는 데이터 조회
    비교대상컬럼 LIKE '%문자'=> 비교대상의 컬럼값이 '문자'로 끝나는 데이터 조회
        비교대상컬럼 LIKE '%문자%'=> 비교대상의 컬럼값이 '문자'로 포함되어 있는 데이터 조회
        
    >> '_' : 1글자이상
        EX) 비교대상컬럼 LIKE '_문자'=> 비교대상의 컬럼값이 '문자'앞에 무조건 한글자가 들어있는 데이터 조회
    비교대상컬럼 LIKE '_ _문자'=> 비교대상의 컬럼값이 '문자'뒤에 무조건 2글자가 들어있는 데이터
        비교대상컬럼 LIKE '_문자_'=> 비교대상의 컬럼값이 '문자' 앞뒤에 한글자이상 포함되어 있는 데이터
    
 */
 
 --EMPLOYEE에서 사원 성이 전씨인 사원들의 사원명, 급여, 입사일 조회
 SELECT EMP_NAME, SALARY, HIRE_DATE
    FROM employee
    WHERE EMP_NAME LIKE '전%';
    
 --EMPLOYEE에서 사원의 이름에 '하'자가 들어 있는 사원의 사원명, 이메일, 전화번호
 SELECT EMP_NAME, EMAIL, PHONE
    FROM employee
    WHERE EMP_NAME LIKE '%하%';
 --EMPLOYEE에서 사원의 이름에 '하'자가 중간에 들어 있는 사원의 사원명, 이메일, 전화번호
  SELECT EMP_NAME, EMAIL, PHONE
    FROM employee
    WHERE EMP_NAME LIKE '_하_';

--EMPLOYEE에서 전화번호의 3번째 잘가 '1'인 사원의 사원명, 전화번호 조회

SELECT EMP_NAME, PHONE
    FROM employee
    WHERE PHONE LIKE '__1%';

--이메일중 _(언더바) 앞에 글자가 3글자인 사원들의 사원명, 아메일 조회
SELECT EMP_NAME, EMAIL
  FROM employee
  WHERE EMAIL LIKE '____%';
-- 와일드카드로 사용하는 문자와 컬럼값에 들어있는 문자가 동일하기 때문에 조회가 안됨
-- 모두다 와일드카드로 인식
/*
   > 와일드카드와 문자를 구분해줘야 함
   > 나만의 와일드카드로 ESCAPE로 등록
    - 데이터값으로 취급하고자하는 값 앞에 나만의 와일드카드(문자,숫자,특수문자)를 넣어줌
    - 특수기호 '&'는 안쓰는것이 좋다. 사용자로부터 입력받을 때 &사용함
*/

SELECT EMP_NAME, EMAIL
  FROM employee
  WHERE EMAIL LIKE '___$_%' ESCAPE '$';
  
SELECT EMP_NAME, EMAIL
  FROM employee
  WHERE EMAIL LIKE '___d_%' ESCAPE 'd';
 
SELECT EMP_NAME, HIRE_DATE
  FROM employee
  WHERE EMP_NAME LIKE '%연';

SELECT EMP_NAME, PHONE
  FROM employee
  WHERE PHONE NOT LIKE '010%';

SELECT EMP_NAME, SALARY
  FROM EMPLOYEE
  WHERE EMP_NAME LIKE '%하%' AND SALARY >= 2400000;

SELECT DEPT_ID, DEPT_TITLE
 FROM department
 WHERE DEPT_TITLE LIKE '%해외영업%';
 
-------------------------------------------------------------------
/*
    <IS NULL/IS NOT NULL>
    컬럼값에 NULL이 있을 경우 NULL값 비교에 사용하는 연산자
*/
-- EMPLOYEE에서 보너스를 받지 않는 사원의 사원명,  급여 보너스 조회
SELECT EMP_NAME, SALARY, BONUS
  FROM employee
  --WHERE BONUS = NULL; -- 조회안됨
  WHERE BONUS IS NULL;
  
-- EMPLOYEE에서 보너스를 받는 사원의 사원명, 급여, 보너스 조회
SELECT EMP_NAME, SALARY, BONUS
  FROM employee
  WHERE BONUS IS NOT NULL;

-- EMPLOYEE에서 사수가 없는(MANAGER_ID값이 NULL인) 사원의 사원명, 부서코드 조회
SELECT EMP_NAME, DEPT_CODE, MANAGER_ID
  FROM employee
  WHERE MANAGER_ID IS NULL;
  
-- EMPLOYEE에서 부서배치를 받지 않았지만 보너를 받는 사원의 사원명, 보너스, 부서코드
SELECT EMP_NAME, BONUS, DEPT_CODE
  FROM EMPLOYEE
  WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;
  
-------------------------------------------------------------
/*
    <IN/ NOT IN>
    IN : 컬럼값이 내가 제시한 목록 중에 일치하는 것만 있으면 조회
    NOT IN : 컬럼값이 내가 제시한 목록 중에 일치하는 값을 제외하고 조회
    
    [표현법]
    비교대상컬럼 IN ('값1', '값2', '값3',...)
*/
-- EMPLOYEE에서 부서코드가 D6이거나 D8이거나 D5인 사원드르이 사원명, 부서코드, 급여조회
SELECT EMP_NAME, DEPT_CODE, SALARY
  FROM employee
  --WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5'; 
  WHERE DEPT_CODE IN ('D6','D8', 'D5');
  
-- EMPLOYEE에서 부서코드가 D6이거나 D8이거나 D5가 아닌 사원드르이 사원명, 부서코드, 급여조회
SELECT EMP_NAME, DEPT_CODE, SALARY
  FROM employee
  --WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5'; 
  WHERE DEPT_CODE NOT IN ('D6', 'D8', 'D5');

----------------------------------------------------------
/*
   <연산자 우선순위>
   1.()
   2. 산술연산자
   3. 연결연산자
   4. 비교연산자
   5. IS NULL / LIKE '특정패턴' /IN
   6. BETWEEN AND
   7. NOT(논리연산자)
   8. AND(논리연산자)
   9. OR(논리연산자)
*/
-- ** AND가 OR보다 순위 더 높다
-- 직급코드가 J7이거나 J2인 사원들 중 급여가 200만원 이상인 사원들의 사원명, 급여, 직급코드 조회
SELECT EMP_NAME, SALARY, JOB_CODE
  FROM employee
  WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J2') AND SALARY >= 2000000;
  
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
  FROM employee
  WHERE DEPT_CODE IS NULL AND MANAGER_ID IS NULL;
  
SELECT EMP_ID, EMP_NAME, SALARY*12 연봉, BONUS
  FROM EMPLOYEE
  WHERE SALARY * 12 >= 30000000 AND BONUS IS NULL;
  
SELECT EMP_ID, EMP_NAME, HIRE_DATE, DEPT_CODE
  FROM EMPLOYEE
  WHERE HIRE_DATE >= '95/01/01' AND DEPT_CODE IS NOT NULL;
  
SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE, BONUS
  FROM EMPLOYEE
  WHERE SALARY BETWEEN '2000000' AND '5000000' 
  AND HIRE_DATE >= '01/01/01'
  AND BONUS IS NULL;

SELECT EMP_ID, EMP_NAME, SALARY, (SALARY + SALARY * BONUS) * 12 "보너스포함연봉" 
  FROM EMPLOYEE
  WHERE SALARY IS NOT NULL AND EMP_NAME LIKE '%하%';
  
----------------------------------------------------------------------------
/*
    <ORDER BY절>
    데이터를 정렬하여 보여줌
    SELECT문의 가장 마지막 줄에 작성 뿐만 아니라 실행 순서도 마지막에 실행
    
    [표현법]
    SELECT 조회할 컬럼1, 컬럼2,...
    FROM 테이블명
    WHERE 조건식
    ORDER BY 정렬기준 컬럼명 | 별명 | 컬럼 순번[ASC|DESC][NULLS FIRST | NULLS LAST]
    - ASC : 오름차순 정렬(생략시 기본값)
    - DESC : 내림차순 정렬
    
    - NULLS FIRST : 컬럼값에 NULL이 있을 경우 맨앞에 배치(생략시 DESC 일때의 기본값)
    - NULLS LIST : 컬럼값에 NULL이 있을 경우 맨뒤에 배치(생략시 ASC 일때의 기본값)
*/
SELECT *
  FROM EMPLOYEE
--ORDER BY BONUS;              -- 오름차순 정렬 NULL이 LAST
--ORDER BY BONUS ASC;
--ORDER BY BONUS NULLS FIRST;
--ORDER BY BONUS DESC;           -- 내림차순 정렬 NULL이 FIRST
ORDER BY BONUS DESC, SALARY;     -- 정렬기준 여러개일 때, 앞을 기준으로 정렬하고 값이 같으면 뒤에 기준으로 정렬

-- 모든 사원의 사원명, 연봉 조회(이때, 연봉의 내림차순 정렬 조회)
SELECT EMP_NAME, SALARY * 12 "연봉"
  FROM employee
--ORDER BY SALARY*12 DESC;
--ORDER BY 연봉 DESC; -- 별칭사용가능
ORDER BY 2 DESC; -- 2번째 컬럼

--------------------------------종합 문제-----------------------
--1
SELECT *
  FROM JOB;
--2
SELECT JOB_CODE, JOB_NAME
  FROM JOB;
--3
SELECT *
  FROM department;
--4
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE
  FROM EMPLOYEE;
--5
SELECT HIRE_DATE, EMP_NAME, SALARY
  FROM EMPLOYEE;
--6
SELECT EMP_NAME, SALARY *12 연봉, (SALARY + SALARY * BONUS)*12 총수령액,(SALARY + SALARY * BONUS)*12 - SALARY *12 * 0.03 AS 실수령액
  FROM EMPLOYEE;
--7
SELECT EMP_NAME, SALARY, HIRE_DATE, PHONE
  FROM EMPLOYEE
  WHERE JOB_CODE = 'J1';
--8
SELECT EMP_NAME, SALARY,(SALARY + SALARY * BONUS)*12 - SALARY *12 * 0.03 "실수령액", HIRE_DATE
  FROM EMPLOYEE
  WHERE (SALARY + SALARY * BONUS)*12 - SALARY *12 * 0.03 >= 50000000;
--9
SELECT *
  FROM employee
  WHERE SALARY >= 4000000 AND job_code = 'J2';
--10
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
  FROM EMPLOYEE
  WHERE (DEPT_CODE = 'D9' OR DEPT_CODE = 'D5') AND HIRE_DATE > '02/01/01';
--11
SELECT *
  FROM EMPLOYEE
  WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';
--12
SELECT EMP_NAME
  FROM EMPLOYEE
  WHERE EMP_NAME LIKE '%연';
--13
SELECT EMP_NAME, PHONE
  FROM EMPLOYEE
  WHERE PHONE NOT LIKE '010%';
--14
SELECT *
  FROM EMPLOYEE
  WHERE EMAIL LIKE '____$_%' ESCAPE '$'
  AND (DEPT_CODE = 'D9' OR DEPT_CODE = 'D6')
  AND HIRE_DATE BETWEEN '90/01/01' AND '00/12/01'
  AND SALARY >= 2700000;

  