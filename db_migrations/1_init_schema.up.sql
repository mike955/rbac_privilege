create database `rbac_privilege`;

DROP TABLE IF EXISTS `rbac_privilege`.`rp_user_group_map`;
CREATE TABLE `rbac_privilege`.`rp_role` (
  `id` BIGINT(32) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `auth_id` VARCHAR(64) NOT NULL COMMENT '用户id',
  `group_id` VARCHAR(64) NOT NULL COMMENT '用户角色',
  `prod` VARCHAR(64) NOT NULL COMMENT '产品名',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  UNIQUE KEY `UK_auth_group_id` (`auth_id`, `group_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色关系表';

DROP TABLE IF EXISTS `rbac_privilege`.`rp_group`;
CREATE TABLE `rbac_privilege`.`rp_group` (
  `id` BIGINT(32) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `group_id` VARCHAR(64) NOT NULL COMMENT '用户组id',
  `group_name` VARCHAR(64) NOT NULL COMMENT '用户组名称',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_group_id` (`group_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户组表';

DROP TABLE IF EXISTS `rbac_privilege`.`rp_group_privilege_map`;
CREATE TABLE `rbac_privilege`.`rp_group_privilege_map` (
  `id` BIGINT(32) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `group_id` VARCHAR(64) NOT NULL COMMENT '用户组id',
  `privilege_id` VARCHAR(64) NOT NULL COMMENT '权限id',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_group_privilege_id` (`group_id`, `privilege_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户组表';

DROP TABLE IF EXISTS `rbac_privilege`.`privilege`;
CREATE TABLE `rbac_privilege`.`privilege` (
  `id` BIGINT(32) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `privilege_id` VARCHAR(64) NOT NULL COMMENT '权限id',
  `privilege_name` VARCHAR(64) NOT NULL COMMENT '权限名称',
  `uri` VARCHAR(64) NOT NULL COMMENT '接口uri',
  `sn` VARCHAR(64) NOT NULL COMMENT '权限md5',
  -- `p_type` TINYINT(4) NOT NULL DEFAULT 0 COMMENT '权限类型:0:未知,1:前端显示权限:,2:api权限',
  `create_time` DATETIME NOT NULL COMMENT '创建时间',
  `update_time` DATETIME NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_privilege_id` (`privilege_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限表';
