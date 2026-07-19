SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS travel_rag;
CREATE DATABASE travel_rag CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE travel_rag;

-- ----------------------------
-- Table structure for concert_tickets
-- ----------------------------
DROP TABLE IF EXISTS `concert_tickets`;
CREATE TABLE `concert_tickets`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `artist` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '艺人名称',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '举办城市',
  `venue` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '场馆',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `ticket_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '票类型',
  `total_seats` int NOT NULL COMMENT '总座位数',
  `remaining_seats` int NOT NULL COMMENT '剩余座位数',
  `price` decimal(10, 2) NOT NULL COMMENT '票价',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_concert`(`start_time` ASC, `artist` ASC, `ticket_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '演唱会门票信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of concert_tickets
-- ----------------------------
INSERT INTO `concert_tickets` VALUES (1, '周杰伦', '北京', '北京国家体育场(鸟巢)', '2026-03-02 19:00:00', '2026-03-02 22:00:00', 'VIP', 5000, 123, 1280.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (2, '周杰伦', '北京', '北京国家体育场(鸟巢)', '2026-03-02 19:00:00', '2026-03-02 22:00:00', '内场', 8000, 456, 880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (3, '周杰伦', '北京', '北京国家体育场(鸟巢)', '2026-03-02 19:00:00', '2026-03-02 22:00:00', '看台A', 12000, 789, 580.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (4, '周杰伦', '北京', '北京国家体育场(鸟巢)', '2026-03-02 19:00:00', '2026-03-02 22:00:00', '看台B', 15000, 2345, 380.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (5, '周杰伦', '北京', '北京国家体育场(鸟巢)', '2026-03-02 19:00:00', '2026-03-02 22:00:00', '看台C', 10000, 1234, 280.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (6, '周杰伦', '上海', '上海体育场', '2026-03-03 19:00:00', '2026-03-03 22:00:00', 'VIP', 5000, 89, 1280.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (7, '周杰伦', '上海', '上海体育场', '2026-03-03 19:00:00', '2026-03-03 22:00:00', '内场', 8000, 345, 880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (8, '周杰伦', '上海', '上海体育场', '2026-03-03 19:00:00', '2026-03-03 22:00:00', '看台A', 12000, 567, 580.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (9, '周杰伦', '上海', '上海体育场', '2026-03-03 19:00:00', '2026-03-03 22:00:00', '看台B', 15000, 1890, 380.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (10, '周杰伦', '上海', '上海体育场', '2026-03-03 19:00:00', '2026-03-03 22:00:00', '看台C', 10000, 987, 280.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (11, '周杰伦', '杭州', '杭州奥体中心体育场', '2026-03-04 19:00:00', '2026-03-04 22:00:00', 'VIP', 4000, 67, 1280.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (12, '周杰伦', '杭州', '杭州奥体中心体育场', '2026-03-04 19:00:00', '2026-03-04 22:00:00', '内场', 6000, 234, 880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (13, '周杰伦', '杭州', '杭州奥体中心体育场', '2026-03-04 19:00:00', '2026-03-04 22:00:00', '看台A', 10000, 456, 580.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (14, '周杰伦', '杭州', '杭州奥体中心体育场', '2026-03-04 19:00:00', '2026-03-04 22:00:00', '看台B', 12000, 1567, 380.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (15, '周杰伦', '杭州', '杭州奥体中心体育场', '2026-03-04 19:00:00', '2026-03-04 22:00:00', '看台C', 8000, 876, 280.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (16, '宋云', '北京', '北京工人体育馆', '2026-03-03 19:30:00', '2026-03-03 22:00:00', 'VIP', 800, 34, 3880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (17, '宋云', '北京', '北京工人体育馆', '2026-03-03 19:30:00', '2026-03-03 22:00:00', '内场', 1200, 89, 2680.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (18, '宋云', '北京', '北京工人体育馆', '2026-03-03 19:30:00', '2026-03-03 22:00:00', '看台', 2000, 234, 1680.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (19, '宋云', '北京', '北京工人体育馆', '2026-03-04 19:30:00', '2026-03-04 22:00:00', 'VIP', 800, 56, 3880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (20, '宋云', '北京', '北京工人体育馆', '2026-03-04 19:30:00', '2026-03-04 22:00:00', '内场', 1200, 123, 2680.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (21, '宋云', '北京', '北京工人体育馆', '2026-03-04 19:30:00', '2026-03-04 22:00:00', '看台', 2000, 345, 1680.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (22, '宋云', '上海', '上海梅赛德斯-奔驰文化中心', '2026-03-05 19:30:00', '2026-03-05 22:00:00', 'VIP', 800, 23, 3880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (23, '宋云', '上海', '上海梅赛德斯-奔驰文化中心', '2026-03-05 19:30:00', '2026-03-05 22:00:00', '内场', 1200, 78, 2680.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (24, '宋云', '上海', '上海梅赛德斯-奔驰文化中心', '2026-03-05 19:30:00', '2026-03-05 22:00:00', '看台', 2000, 189, 1680.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (25, '宋云', '上海', '上海梅赛德斯-奔驰文化中心', '2026-03-06 19:30:00', '2026-03-06 22:00:00', 'VIP', 800, 45, 3880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (26, '宋云', '上海', '上海梅赛德斯-奔驰文化中心', '2026-03-06 19:30:00', '2026-03-06 22:00:00', '内场', 1200, 98, 2680.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (27, '宋云', '上海', '上海梅赛德斯-奔驰文化中心', '2026-03-06 19:30:00', '2026-03-06 22:00:00', '看台', 2000, 234, 1680.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (28, '宋云', '杭州', '杭州大剧院', '2026-03-07 19:30:00', '2026-03-07 22:00:00', 'VIP', 600, 12, 3580.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (29, '宋云', '杭州', '杭州大剧院', '2026-03-07 19:30:00', '2026-03-07 22:00:00', '内场', 1000, 67, 2480.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (30, '宋云', '杭州', '杭州大剧院', '2026-03-07 19:30:00', '2026-03-07 22:00:00', '看台', 1400, 156, 1480.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (31, '宋云', '杭州', '杭州大剧院', '2026-03-08 19:30:00', '2026-03-08 22:00:00', 'VIP', 600, 34, 3580.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (32, '宋云', '杭州', '杭州大剧院', '2026-03-08 19:30:00', '2026-03-08 22:00:00', '内场', 1000, 89, 2480.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (33, '宋云', '杭州', '杭州大剧院', '2026-03-08 19:30:00', '2026-03-08 22:00:00', '看台', 1400, 178, 1480.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (34, '梁伟', '北京', '北京展览馆剧场', '2026-03-02 20:00:00', '2026-03-02 22:30:00', 'VIP', 400, 23, 8880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (35, '梁伟', '北京', '北京展览馆剧场', '2026-03-02 20:00:00', '2026-03-02 22:30:00', '内场', 600, 56, 5880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (36, '梁伟', '北京', '北京展览馆剧场', '2026-03-02 20:00:00', '2026-03-02 22:30:00', '看台', 1000, 123, 2880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (37, '梁伟', '北京', '北京展览馆剧场', '2026-03-03 20:00:00', '2026-03-03 22:30:00', 'VIP', 400, 34, 8880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (38, '梁伟', '北京', '北京展览馆剧场', '2026-03-03 20:00:00', '2026-03-03 22:30:00', '内场', 600, 78, 5880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (39, '梁伟', '北京', '北京展览馆剧场', '2026-03-03 20:00:00', '2026-03-03 22:30:00', '看台', 1000, 156, 2880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (40, '梁伟', '上海', '上海东方艺术中心', '2026-03-04 20:00:00', '2026-03-04 22:30:00', 'VIP', 400, 12, 8880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (41, '梁伟', '上海', '上海东方艺术中心', '2026-03-04 20:00:00', '2026-03-04 22:30:00', '内场', 600, 45, 5880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (42, '梁伟', '上海', '上海东方艺术中心', '2026-03-04 20:00:00', '2026-03-04 22:30:00', '看台', 1000, 98, 2880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (43, '梁伟', '上海', '上海东方艺术中心', '2026-03-05 20:00:00', '2026-03-05 22:30:00', 'VIP', 400, 27, 8880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (44, '梁伟', '上海', '上海东方艺术中心', '2026-03-05 20:00:00', '2026-03-05 22:30:00', '内场', 600, 63, 5880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (45, '梁伟', '上海', '上海东方艺术中心', '2026-03-05 20:00:00', '2026-03-05 22:30:00', '看台', 1000, 134, 2880.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (46, '梁伟', '杭州', '杭州剧院', '2026-03-06 20:00:00', '2026-03-06 22:30:00', 'VIP', 300, 8, 8580.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (47, '梁伟', '杭州', '杭州剧院', '2026-03-06 20:00:00', '2026-03-06 22:30:00', '内场', 500, 34, 5580.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (48, '梁伟', '杭州', '杭州剧院', '2026-03-06 20:00:00', '2026-03-06 22:30:00', '看台', 800, 89, 2580.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (49, '梁伟', '杭州', '杭州剧院', '2026-03-07 20:00:00', '2026-03-07 22:30:00', 'VIP', 300, 15, 8580.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (50, '梁伟', '杭州', '杭州剧院', '2026-03-07 20:00:00', '2026-03-07 22:30:00', '内场', 500, 42, 5580.00, '2026-07-19 11:56:28');
INSERT INTO `concert_tickets` VALUES (51, '梁伟', '杭州', '杭州剧院', '2026-03-07 20:00:00', '2026-03-07 22:30:00', '看台', 800, 96, 2580.00, '2026-07-19 11:56:28');

-- ----------------------------
-- Table structure for flight_tickets
-- ----------------------------
DROP TABLE IF EXISTS `flight_tickets`;
CREATE TABLE `flight_tickets`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自增，唯一标识每条记录',
  `departure_city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '出发城市（如“北京”）',
  `arrival_city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '到达城市（如“上海”）',
  `departure_time` datetime NOT NULL COMMENT '出发时间（如“2025-08-12 08:00:00”）',
  `arrival_time` datetime NOT NULL COMMENT '到达时间（如“2025-08-12 10:30:00”）',
  `flight_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '航班号（如“CA1234”）',
  `cabin_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '舱位类型（如“经济舱”）',
  `total_seats` int NOT NULL COMMENT '总座位数（如 200）',
  `remaining_seats` int NOT NULL COMMENT '剩余座位数（如 10）',
  `price` decimal(10, 2) NOT NULL COMMENT '票价（如 1200.00）',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，自动记录插入时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_flight`(`departure_time` ASC, `flight_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '航班机票信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flight_tickets
-- ----------------------------
INSERT INTO `flight_tickets` VALUES (1, '北京', '上海', '2026-03-02 08:00:00', '2026-03-02 10:30:00', 'CA1234', '经济舱', 200, 15, 1200.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (2, '北京', '上海', '2026-03-03 09:30:00', '2026-03-03 12:00:00', 'CA1236', '经济舱', 200, 42, 1350.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (3, '北京', '上海', '2026-03-04 11:00:00', '2026-03-04 13:30:00', 'CA1238', '经济舱', 200, 8, 1180.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (4, '北京', '上海', '2026-03-05 14:30:00', '2026-03-05 17:00:00', 'CA1240', '经济舱', 200, 23, 1250.50, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (5, '北京', '上海', '2026-03-06 16:00:00', '2026-03-06 18:30:00', 'CA1242', '经济舱', 200, 31, 1420.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (6, '北京', '上海', '2026-03-07 18:30:00', '2026-03-07 21:00:00', 'CA1244', '经济舱', 200, 12, 1150.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (7, '北京', '上海', '2026-03-08 20:00:00', '2026-03-08 22:30:00', 'CA1246', '经济舱', 200, 27, 1280.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (8, '北京', '杭州', '2026-03-02 07:30:00', '2026-03-02 09:50:00', 'CA1501', '经济舱', 180, 6, 1350.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (9, '北京', '杭州', '2026-03-03 10:00:00', '2026-03-03 12:20:00', 'CA1503', '经济舱', 180, 34, 1420.50, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (10, '北京', '杭州', '2026-03-04 12:30:00', '2026-03-04 14:50:00', 'CA1505', '经济舱', 180, 18, 1280.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (11, '北京', '杭州', '2026-03-05 15:00:00', '2026-03-05 17:20:00', 'CA1507', '经济舱', 180, 41, 1460.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (12, '北京', '杭州', '2026-03-06 17:30:00', '2026-03-06 19:50:00', 'CA1509', '经济舱', 180, 9, 1320.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (13, '北京', '杭州', '2026-03-07 19:00:00', '2026-03-07 21:20:00', 'CA1511', '经济舱', 180, 22, 1390.50, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (14, '北京', '杭州', '2026-03-08 20:30:00', '2026-03-08 22:50:00', 'CA1513', '经济舱', 180, 15, 1250.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (15, '上海', '北京', '2026-03-02 07:45:00', '2026-03-02 10:15:00', 'MU5101', '经济舱', 220, 28, 1220.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (16, '上海', '北京', '2026-03-03 09:15:00', '2026-03-03 11:45:00', 'MU5103', '经济舱', 220, 45, 1380.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (17, '上海', '北京', '2026-03-04 10:45:00', '2026-03-04 13:15:00', 'MU5105', '经济舱', 220, 11, 1190.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (18, '上海', '北京', '2026-03-05 13:15:00', '2026-03-05 15:45:00', 'MU5107', '经济舱', 220, 33, 1290.50, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (19, '上海', '北京', '2026-03-06 15:45:00', '2026-03-06 18:15:00', 'MU5109', '经济舱', 220, 19, 1410.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (20, '上海', '北京', '2026-03-07 18:15:00', '2026-03-07 20:45:00', 'MU5111', '经济舱', 220, 7, 1170.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (21, '上海', '北京', '2026-03-08 20:30:00', '2026-03-08 23:00:00', 'MU5113', '经济舱', 220, 24, 1310.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (22, '上海', '杭州', '2026-03-02 08:30:00', '2026-03-02 09:20:00', 'FM9251', '经济舱', 150, 12, 450.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (23, '上海', '杭州', '2026-03-03 10:30:00', '2026-03-03 11:20:00', 'FM9253', '经济舱', 150, 36, 480.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (24, '上海', '杭州', '2026-03-04 14:30:00', '2026-03-04 15:20:00', 'FM9255', '经济舱', 150, 8, 420.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (25, '上海', '杭州', '2026-03-05 16:30:00', '2026-03-05 17:20:00', 'FM9257', '经济舱', 150, 21, 510.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (26, '杭州', '北京', '2026-03-02 08:15:00', '2026-03-02 10:35:00', 'CZ6161', '经济舱', 190, 14, 1380.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (27, '杭州', '北京', '2026-03-03 11:45:00', '2026-03-03 14:05:00', 'CZ6163', '经济舱', 190, 29, 1290.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (28, '杭州', '北京', '2026-03-04 15:15:00', '2026-03-04 17:35:00', 'CZ6165', '经济舱', 190, 7, 1450.50, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (29, '杭州', '北京', '2026-03-05 18:45:00', '2026-03-05 21:05:00', 'CZ6167', '经济舱', 190, 18, 1350.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (30, '杭州', '上海', '2026-03-06 09:00:00', '2026-03-06 09:50:00', 'MF8121', '经济舱', 140, 25, 430.00, '2026-07-19 11:56:28');
INSERT INTO `flight_tickets` VALUES (31, '杭州', '上海', '2026-03-07 13:00:00', '2026-03-07 13:50:00', 'MF8123', '经济舱', 140, 13, 470.00, '2026-07-19 11:56:28');

-- ----------------------------
-- Table structure for train_tickets
-- ----------------------------
DROP TABLE IF EXISTS `train_tickets`;
CREATE TABLE `train_tickets`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，自增，唯一标识每条记录',
  `departure_city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '出发城市（如“北京”）',
  `arrival_city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '到达城市（如“上海”）',
  `departure_time` datetime NOT NULL COMMENT '出发时间（如“2025-08-12 07:00:00”）',
  `arrival_time` datetime NOT NULL COMMENT '到达时间（如“2025-08-12 11:30:00”）',
  `train_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '火车车次（如“G1001”）',
  `seat_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '座位类型（如“二等座”）',
  `total_seats` int NOT NULL COMMENT '总座位数（如 1000）',
  `remaining_seats` int NOT NULL COMMENT '剩余座位数（如 50）',
  `price` decimal(10, 2) NOT NULL COMMENT '票价（如 553.50）',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，自动记录插入时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_train`(`departure_time` ASC, `train_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '火车票信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of train_tickets
-- ----------------------------
INSERT INTO `train_tickets` VALUES (1, '北京', '上海', '2026-03-02 07:00:00', '2026-03-02 11:30:00', 'G1001', '二等座', 1000, 234, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (2, '北京', '上海', '2026-03-03 08:00:00', '2026-03-03 12:30:00', 'G1003', '二等座', 1000, 567, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (3, '北京', '上海', '2026-03-04 09:00:00', '2026-03-04 13:30:00', 'G1005', '一等座', 800, 89, 876.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (4, '北京', '上海', '2026-03-05 10:00:00', '2026-03-05 14:30:00', 'G1007', '二等座', 1000, 432, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (5, '北京', '上海', '2026-03-06 14:00:00', '2026-03-06 18:30:00', 'G1009', '二等座', 1000, 121, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (6, '北京', '上海', '2026-03-07 15:00:00', '2026-03-07 19:30:00', 'G1011', '二等座', 1000, 345, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (7, '北京', '上海', '2026-03-08 16:00:00', '2026-03-08 20:30:00', 'G1013', '二等座', 1000, 678, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (8, '北京', '杭州', '2026-03-02 08:30:00', '2026-03-02 13:45:00', 'G1081', '二等座', 900, 123, 625.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (9, '北京', '杭州', '2026-03-03 09:30:00', '2026-03-03 14:45:00', 'G1083', '一等座', 720, 45, 998.00, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (10, '北京', '杭州', '2026-03-04 10:30:00', '2026-03-04 15:45:00', 'G1085', '二等座', 900, 234, 625.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (11, '北京', '杭州', '2026-03-05 11:30:00', '2026-03-05 16:45:00', 'G1087', '二等座', 900, 345, 625.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (12, '北京', '杭州', '2026-03-06 13:30:00', '2026-03-06 18:45:00', 'G1089', '二等座', 900, 56, 625.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (13, '北京', '杭州', '2026-03-07 14:30:00', '2026-03-07 19:45:00', 'G1091', '二等座', 900, 178, 625.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (14, '北京', '杭州', '2026-03-08 15:30:00', '2026-03-08 20:45:00', 'G1093', '二等座', 900, 290, 625.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (15, '上海', '北京', '2026-03-02 07:30:00', '2026-03-02 12:00:00', 'G1102', '二等座', 1000, 45, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (16, '上海', '北京', '2026-03-03 08:30:00', '2026-03-03 13:00:00', 'G1104', '二等座', 1000, 234, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (17, '上海', '北京', '2026-03-04 09:30:00', '2026-03-04 14:00:00', 'G1106', '二等座', 1000, 567, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (18, '上海', '北京', '2026-03-05 10:30:00', '2026-03-05 15:00:00', 'G1108', '一等座', 800, 78, 876.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (19, '上海', '北京', '2026-03-06 15:30:00', '2026-03-06 20:00:00', 'G1110', '二等座', 1000, 123, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (20, '上海', '北京', '2026-03-07 16:30:00', '2026-03-07 21:00:00', 'G1112', '二等座', 1000, 456, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (21, '上海', '北京', '2026-03-08 17:30:00', '2026-03-08 22:00:00', 'G1114', '二等座', 1000, 789, 553.50, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (22, '上海', '杭州', '2026-03-02 09:00:00', '2026-03-02 10:30:00', 'G1201', '二等座', 600, 123, 135.00, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (23, '上海', '杭州', '2026-03-03 10:00:00', '2026-03-03 11:30:00', 'G1203', '二等座', 600, 45, 135.00, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (24, '上海', '杭州', '2026-03-04 14:00:00', '2026-03-04 15:30:00', 'G1205', '二等座', 600, 234, 135.00, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (25, '上海', '杭州', '2026-03-05 15:00:00', '2026-03-05 16:30:00', 'G1207', '二等座', 600, 56, 135.00, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (26, '上海', '杭州', '2026-03-06 16:00:00', '2026-03-06 17:30:00', 'G1209', '二等座', 600, 178, 135.00, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (27, '上海', '杭州', '2026-03-07 17:00:00', '2026-03-07 18:30:00', 'G1211', '二等座', 600, 89, 135.00, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (28, '上海', '杭州', '2026-03-08 18:00:00', '2026-03-08 19:30:00', 'G1213', '二等座', 600, 267, 135.00, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (29, '杭州', '上海', '2026-03-05 08:00:00', '2026-03-05 09:30:00', 'G1302', '二等座', 600, 145, 135.00, '2026-07-19 11:56:28');
INSERT INTO `train_tickets` VALUES (30, '杭州', '上海', '2026-03-08 09:00:00', '2026-03-08 10:30:00', 'G1304', '二等座', 600, 234, 135.00, '2026-07-19 11:56:28');

-- ----------------------------
-- Table structure for weather_data
-- ----------------------------
DROP TABLE IF EXISTS `weather_data`;
CREATE TABLE `weather_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市名称',
  `fx_date` date NOT NULL COMMENT '预报日期',
  `sunrise` time NULL DEFAULT NULL COMMENT '日出时间',
  `sunset` time NULL DEFAULT NULL COMMENT '日落时间',
  `moonrise` time NULL DEFAULT NULL COMMENT '月升时间',
  `moonset` time NULL DEFAULT NULL COMMENT '月落时间',
  `moon_phase` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '月相名称',
  `moon_phase_icon` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '月相图标代码',
  `temp_max` int NULL DEFAULT NULL COMMENT '最高温度',
  `temp_min` int NULL DEFAULT NULL COMMENT '最低温度',
  `icon_day` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '白天天气图标代码',
  `text_day` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '白天天气描述',
  `icon_night` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '夜间天气图标代码',
  `text_night` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '夜间天气描述',
  `wind360_day` int NULL DEFAULT NULL COMMENT '白天风向360角度',
  `wind_dir_day` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '白天风向',
  `wind_scale_day` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '白天风力等级',
  `wind_speed_day` int NULL DEFAULT NULL COMMENT '白天风速 (km/h)',
  `wind360_night` int NULL DEFAULT NULL COMMENT '夜间风向360角度',
  `wind_dir_night` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '夜间风向',
  `wind_scale_night` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '夜间风力等级',
  `wind_speed_night` int NULL DEFAULT NULL COMMENT '夜间风速 (km/h)',
  `precip` decimal(5, 1) NULL DEFAULT NULL COMMENT '降水量 (mm)',
  `uv_index` int NULL DEFAULT NULL COMMENT '紫外线指数',
  `humidity` int NULL DEFAULT NULL COMMENT '相对湿度 (%)',
  `pressure` int NULL DEFAULT NULL COMMENT '大气压强 (hPa)',
  `vis` int NULL DEFAULT NULL COMMENT '能见度 (km)',
  `cloud` int NULL DEFAULT NULL COMMENT '云量 (%)',
  `update_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_city_date`(`city` ASC, `fx_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '天气数据表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
