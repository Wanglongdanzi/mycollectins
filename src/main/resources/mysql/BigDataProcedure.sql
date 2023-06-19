#存储过程
DELIMITER $$
CREATE PROCEDURE insert_emp(IN START INT(10),IN max_num INT(10))
BEGIN
	DECLARE i INT DEFAULT 0;
	#set autocommit = 0,关闭事务自动提交
	SET autocommit = 0;
	    #repeat until end repeat 循环,curdate()获取当前时间聚合函数
	    REPEAT
		    SET i=i+1;
            INSERT INTO emp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
            VALUES ((START+i),rand_string(5),'SALESMAN',0001,CURDATE(),2000,400,rand_num());
        UNTIL i=max_num
        END REPEAT;
    COMMIT;
END $$
DELIMITER ;

#
DELIMITER $$
CREATE PROCEDURE insert_dept(IN START INT(10),IN max_num INT(10))
BEGIN
    DECLARE i INT DEFAULT 0;
    SET autocommit = 0;
    REPEAT
        SET i = i + 1;
        INSERT INTO dept (deptno ,dname,loc ) VALUES ((START+i) ,rand_string(10),rand_string(8));
    UNTIL i = max_num
    END REPEAT;
    COMMIT;
END $$
# DELIMITER ;

#删除
# DROP PROCEDURE insert_dept;