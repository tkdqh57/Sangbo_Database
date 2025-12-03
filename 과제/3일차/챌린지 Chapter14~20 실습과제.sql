use oz_db_test;

-- employees 테이블을 생성
CREATE TABLE employees(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- -- employees 테이블에 직원데이터를 추가
INSERT INTO employees (name, position, salary)
VALUES 
('혜린', 'PM', 90000),
('은우', 'Frontend', 80000),
('가을', 'Backend', 92000),
('지수', 'Frontend', 78000),
('민혁', 'Frontend', 96000),
('하온', 'Backend', 130000);

-- 모든 직원의 이름과 연봉 정보만을 조회하는 쿼리를 작성
SELECT * FROM employees;

-- 11 Frontend 직책을 가진 직원 중 연봉이 90000이하인 직원의 이름과 연봉을 조회하세요.
SELECT name, salary FROM employees WHERE position = 'Frontend' AND salary <= 90000;

-- 2. PM직책을 가진 모든 직원의 연봉을 10% 인상한 후 그 결과를 확인하세요.
UPDATE employees
SET salary = salary * 1.10 
WHERE position = 'PM';  -- <-- 안전모드 때문에 실행이 되지 않음
SELECT * FROM employees WHERE position = 'PM';

-- 3. 모든 Backend 직책을 가진 직원의 연봉을 5% 인상하세요.
UPDATE employees
SET salary = salary * 1.05
WHERE position = 'Backend';  -- <-- 안전모드 때문에 실행이 되지 않음
-- 4. 민혁 사원의 데이터를 삭제 하세요.
DELETE FROM employees WHERE name = '민혁';  -- <-- 안전모드 때문에 실행이 되지 않음

-- 5. 모든 직원을 position 별로 그룹화 하여 각 직책의 평균 연봉을 계산하세요.
SELECT position, AVG(salary) AS average_salary FROM employees GROUP BY position;

-- 6. emplyoees 테이블을 삭제하세요.
DROP TABLE employees;
