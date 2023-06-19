#开启二进制日志信任函数创建者
SHOW VARIABLES LIKE 'log_bin_trust_function_creators';
SET GLOBAL log_bin_trust_function_creators=1;
#随机生成字符串
DELIMITER $$
CREATE FUNCTION rand_string(n INT) RETURNS VARCHAR(255)
BEGIN
	DECLARE chars_str VARCHAR(100) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFJHIJKLMNOPQRSTUVWXYZ';
	DECLARE return_str VARCHAR(255) DEFAULT '';
	DECLARE i INT DEFAULT 0;
		WHILE i<n DO
			SET return_str = CONCAT(return_str,SUBSTRING(chars_str,FLOOR(1+RAND()*52),1));
			SET i = i + 1;
        END WHILE;
    RETURN return_str;
END $$
DELIMITER ;
#delimiter 修改语句结束符
#substring 分割字符串的聚合函数
#floor 向下取整聚合函数
#rand [0,1)随机数聚合函数

#随机生成数字
DELIMITER $$
CREATE FUNCTION rand_num RETURNS INT(5)
BEGIN
    DECLARE num INT DEFAULT 0;
    SET num = FLOOR(100+RAND()*10);
    RETURN num;
END $$
DELIMITER ;
#INT(5),5不代表值的宽度,INT类型在mysql中最大4字节,是配合zerofill属性为值补零使用