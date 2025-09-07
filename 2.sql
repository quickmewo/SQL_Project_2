-- 导入 return_status 表时发现有在父表 issued_status 中不存在的外键值,导致手动导入出错
set foreign_key_checks = 0;
-- 重新导入
set foreign_key_checks = 1;
-- 找出所有在 return_status 表中存在但在 issued_status 表中不存在的 issued_id
SELECT * FROM return_status r
LEFT JOIN issued_status i ON r.issued_id = i.issued_id
WHERE i.issued_id IS NULL 
AND r.issued_id IS NOT NULL;
-- 删除孤儿数据
delete r from return_status r left join issued_status i 
on r.issued_id=i.issued_id
where i.issued_id is null and r.issued_id is not null; 