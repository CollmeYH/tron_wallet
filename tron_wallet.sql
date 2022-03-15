/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : tron_wallet

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 15/03/2022 10:51:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_coin_recharge
-- ----------------------------
DROP TABLE IF EXISTS `m_coin_recharge`;
CREATE TABLE `m_coin_recharge`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'd_currency',
  `amount` decimal(32, 8) NOT NULL DEFAULT 0.00000000 COMMENT '充值数量',
  `to_address` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'to充值地址',
  `from_address` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'from充值地址',
  `txid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '交易ID',
  `gas` int NULL DEFAULT 0 COMMENT '是否gas',
  `guiji_txid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归集txid',
  `status` int NULL DEFAULT 0 COMMENT '状态：0未归集，1已归集，2已入账',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '充值时间',
  `guiji_time` datetime(0) NULL DEFAULT NULL COMMENT '归集时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `to_address`(`to_address`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 308 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '币充值记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_coin_recharge
-- ----------------------------
INSERT INTO `m_coin_recharge` VALUES (307, 'USDT', 0.01000000, 'TLPRdGd35gkaktSMPm3QYnzEwqjoPFeoci', 'TFPodMGEAh6851cUzKeXr9PvuJVfgbbCis', '0e45f45dc73058e79a56507e1d9f6341d73b4278e44065439dd9dbdac22f4540', 0, '864f406631c7c41ca9ee9a296e9db9768d2485435cc79b059a8ce95944cff1a4', 1, '2022-03-03 07:48:02', '2022-03-03 15:55:17');
INSERT INTO `m_coin_recharge` VALUES (308, 'USDT', 0.02500000, 'TVTow7mLJvuFccFDdyLYm7XDxUqhE6ZT4q', 'TNsxBs3KyowuyT4cgA7RMmHBCMAuZXSKBz', '7c79cb72e5e4400556bc1594de6327ff8413143e7c72ce6f50addc88a5550a2b', 0, '08ddba898bf854bbfc56b6e7202748c6209f813d7b278077be146ec1140f90b9', 1, '2022-03-03 16:47:09', '2022-03-03 16:48:12');

-- ----------------------------
-- Table structure for m_coin_recharge_addr
-- ----------------------------
DROP TABLE IF EXISTS `m_coin_recharge_addr`;
CREATE TABLE `m_coin_recharge_addr`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '货币，如BTC',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '货币对应地址',
  `private_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '私钥',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `currency`(`currency`, `address`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址簿' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_coin_recharge_addr
-- ----------------------------
INSERT INTO `m_coin_recharge_addr` VALUES (5, 'TRX', 'TFPodMGEAh6851cUzKeXr9PvuJVfgbbCis', '24e47b68641c90175286d8c7f2f36948bc5fef1bed0d463a3429d29fbe835932', '2022-03-02 08:15:49');
INSERT INTO `m_coin_recharge_addr` VALUES (10, 'TRX', 'TLPRdGd35gkaktSMPm3QYnzEwqjoPFeoci', '1d45918cfa30f53f027c5fe496838ba540e4b11a70c74753c40ebd1e28c587d1', '2022-03-03 07:45:54');
INSERT INTO `m_coin_recharge_addr` VALUES (11, 'TRX', 'TVTow7mLJvuFccFDdyLYm7XDxUqhE6ZT4q', 'f10dd2393b50f7cccd9ce01c337ec8dcbe0a95350faf018c9ed61e8f5936ce53', '2022-03-03 16:41:17');

-- ----------------------------
-- Table structure for m_coin_recharge_addr_pool
-- ----------------------------
DROP TABLE IF EXISTS `m_coin_recharge_addr_pool`;
CREATE TABLE `m_coin_recharge_addr_pool`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `currency` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '货币，如BTC',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '货币对应地址',
  `private_key` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3705 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '地址簿池' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of m_coin_recharge_addr_pool
-- ----------------------------
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3606, 'TRX', 'TC9uEQunq1PHr6C2HaBY521G8xpNgxfAdK', '960abd4d0b60427ed4bb497e6ad019f9cedf9169589d1857122f9f163534ef18');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3607, 'TRX', 'TCD3svfLS3WrewJbcuZ9RttLAtb92n2nL4', 'c15c2972215588c95966516fdfb047552dc1b5d4cd3277a11d25a2edeecf0fb6');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3608, 'TRX', 'TQ5VE1BXPTPDMcepXs85ecbfpWBmgGLfjn', 'ebcb7f790d640f41b27d1b3c0a5cde0fda08a3e4643398c672a406489ca37620');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3609, 'TRX', 'TWvUDXt6JeeMHw36gfbZKxSLBnvPHWXng1', '7c664a8028d65745605df41be0483e42d8f6f3a71e0cb6369bccf36e7a8c5c4e');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3610, 'TRX', 'TAEgX7y2ohd3yZcbt7vKztz5FV8QBnmVHr', '58f8196b17271c0bf880eee6bbecb550d2e9ba8d4fe9929d173383642e229041');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3611, 'TRX', 'TPiJtrDik7hdysLN9cAfe3BpYKVTu9tNnn', '5989413897e7f32ded924ea2e8261aab336cb37e22fffddc53ca83fba95adc88');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3612, 'TRX', 'TVPPCcTzP8YjPyoX3vLHtSBtYNxcH8DDWC', '78dde2dd85232d4c38a0ef1b3cef5257d8266cbb24fd57ededa48b97ba455234');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3613, 'TRX', 'TMPCKDYpk5uJ36KC5vKQAdDxH6PnTPMJCS', '3d2347eb6d4d5c2bd823390cca96d7524587347c87946c62592370818c8eff3f');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3614, 'TRX', 'TGjbxcTNoawJGb4aT6GBEF58YU62m33sze', 'f2078b40b7941da134073bb29613a39b134638bc51fdbb38d4a38be7b7d2fd90');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3615, 'TRX', 'TYRbDCmQTHDDnxEJqwSczxi6EZxZFiS27X', '2023a72c7bec098b6dce95a3383e606c1091d2080778210d31721904ea56603f');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3616, 'TRX', 'TPBepiw5FobvYVLN73kdKnckMouYxvGKoG', 'f23a9ebdd79ffe4e305a21a4d8c309ea34ce8064af0ca8f40b6aac181fd50480');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3617, 'TRX', 'TYqZU2jFJgrAed4aDoz7dKfAmtK5mRjrYH', 'd5cd1f79b96601d6b602d402503b8f80ec855acec40ebb5f2b5ba0b12a833853');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3618, 'TRX', 'TXsd53b7HAg7NxbwAwqnFzeEkM8Zzuz8oy', '5403d50084c2bd038a620ad883e26c327d2dc03ea9b146619eaa1c6d6cd14f77');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3619, 'TRX', 'TFJTj5heuWDrXMJRebjkoC1N45uhFcnqLM', '2b6cdb499aa728d00c19d7612261552d184055185aeb608c4e4e41759ac4190a');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3620, 'TRX', 'TYWiapMTi1BVfLzt6Us2nq936AtuT858ry', 'd3a2ff4c866e415eb5ee7bcf6de17839f901af9c3559a0fb305cb4b209dbf415');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3621, 'TRX', 'TTGs1KUTU7MQzLu4JkUeyi6GrynU1MGxFn', '55adee50787b78cd44d7a48c66d6d0c1c0239a5466c765759c864b1d425d146c');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3622, 'TRX', 'TQsJaGNjzVn7WUsNkukEDLr5cFfHMBWqyK', 'f9bd32f48df1c36aefea048dd866ae87f2971bc9b45bde70bb8dc774c86a40d6');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3623, 'TRX', 'TFjCnL7rKs7w9EChcXssVvVPeJaPyMjdws', 'ab90c1b285b99a68564ea78440e99280f675543d35e4ee8c214c04d15a5dab19');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3624, 'TRX', 'TGmLaacMebbqaS1HV5qW7rVL39CtYUkxCT', 'acbcc4a1701facfe06ff6105798279b30f09e75eba492bf97cc321e3f5dae27d');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3625, 'TRX', 'TP3dKs29GFQVZwxAbU4dBYQVuq6T2sFY8E', 'd37529649fc9535a4175806a4e4ee1acd40c90a2f9eba5e84b7933e1329c09f6');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3626, 'TRX', 'TM1eSefnVPjyNZJuy5JsazFvaUMnY4LAk1', 'f9c7640a9212e4371dc27b853efdd33dcf9782a3e71851f8d3acc93a3b78b763');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3627, 'TRX', 'TFQEgkMH6u51mv3fDRvjcxd7DsQRThKJ5J', '86ddf8cfa2516eb8bab164539fec6a71969b0265df32333dfdbc3c45d9aaade8');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3628, 'TRX', 'TFhv7GmxQa1c1NWoojMscnwAzUwPagZ93A', '29149b173903ce106115aef1ef83cb10fa597cfd1f78ea2a88bc5e7876b26897');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3629, 'TRX', 'TKqGDXBqRheXB9JTmjJTCSdbSfRdxiUyvy', '61e2e35f6eea2f86451f1450613d168f0a06ec1e7c27778a81e795608106c5b6');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3630, 'TRX', 'TJifhxwQ2tq6pDZmEx5LfHd3vmUiDpWs9k', 'c2d4623881fc13806d4b976fdb22e27099a53f020e9b6b66b05a595d8e96d505');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3631, 'TRX', 'TLqM8rHgkCwewfrhN6kEWc9nWugGWhqXPP', 'c051afbd1fa61c5ab5e3480a8f1ad717dbb1958b07ebeb39e52abecd8ca90409');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3632, 'TRX', 'TJTAdEu9w2RiaK6z5ThjsEoC3ci1BxzKu7', '8eb2e5171eeeb124b0455bbcc4edcbccf54d544ae4eb2bbbcd777c199ebc07bd');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3633, 'TRX', 'TEBQGXsff5mjLV6XVxcpj2ojt5G4ExT2ze', 'd9769e521e45ba45f499cd247960a4992f301ceb44543c2f50fa9008d5b6d65c');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3634, 'TRX', 'TFFyz6U9DCMxmGc1gJAi88KNtRdeyugcK2', '6caa658c604d78321f8004f7b51e7222da7f1d471d9dff709dddd71aa39b5918');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3635, 'TRX', 'TLs2qYssxecJuPwnGrbreXzqaY1GTbk8QP', 'b9f478b6b1e8befb421fbc9a359d004204adb03b24b63f2e88190982f7d18fb0');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3636, 'TRX', 'THjAJg1hzBFnUZ7Jvz4Fqron4VxreLRYJq', '1caa4692ed79b355ac954ed6012b13a130e42932c9d51ce5d784b154cf9e8648');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3637, 'TRX', 'TF4YF8WBw5eMv2GySrG24y51J4PmUcieq7', 'ab1baefab9db4069bc68f86fe822b3ec43cb847a4573fccfa60ea2f6baedc760');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3638, 'TRX', 'TLNM28emn3MgP8du61idwVVX1R1YnRDwuc', '12d6266059022ef7053a8fc61cf4ccbd8d6b6a7cb0c7d62fceaf5142fa6e0421');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3639, 'TRX', 'TWzV8L66ZmnWS57fcosaL2Ci31557aJDSD', '5a35fc309aa96b7b53a4df249d4549733fa728070b6b239488600f6d27cd1561');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3640, 'TRX', 'TVaXisRkuWJoRt7vyDMrDwsC8jM2NQPas1', '737750294df9ca833f012bfc14c8f5792e2569b3c60bb98dacbfe42424279925');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3641, 'TRX', 'TJXe3P7eiDdzkziymog9ywLPEtf3fY5QLt', '0c1f974d6a22ecd9d32dcece6f61a76303fe0e809600318b46e886c03b33bda6');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3642, 'TRX', 'TSbDd4F56wQyDWiFuLH2muXe1V7jeGCZKp', '443568c3aac9d7f1efbfcf1f4c34c007170974137409016833e714fb1779cba8');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3643, 'TRX', 'TK858onaYqVrWfnYZpqPXe8ttaWo1ndD7F', '50f8415da0ef07cd9d510449d3eda26c6075523cd8fa7f71171c1e9478b03603');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3644, 'TRX', 'TSVW7jnHsZ9D44wnk5GDqWbGXx8HiqXMzD', 'f6ad8ad599a4d72070861bfa2061d2d935bfa28d7c1604421c38e2c5545986d1');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3645, 'TRX', 'TMQwAeDbnAByqHnnp1WYSMvspi51jSNUW9', '8d668d89c391de82362a660c555712613a40cd60fd8956670276e0b8aaf8fedf');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3646, 'TRX', 'TAbtpBegyemXdewxpTwsrWCKwN4iwSXhL4', '77d2926b2199df88017f0c7f59e61a5e3c7b743277a2d0cc62118fb1463c0c30');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3647, 'TRX', 'TAKhiidutGLfP742EFUKoqScJxECdzukFi', '55ed120f2e2d48558dde6a2b7978a47984c2920c723f5b2885fbc80e5e97c880');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3648, 'TRX', 'TGDXzwmGXfNiYioGEXBspbQMWfuWC4pbKT', '4023ab64cf9aa6e36d49142f999deb12b964f15ee1ee3bbf69f377f8e2a3255e');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3649, 'TRX', 'TVTp44TzoQxbv6gX5fmBYCSVbdfs8BFsY5', 'e19d841b5000ad949b83ec91491e9664a82fbe3cfb4b94b9458dcc05b2a7363c');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3650, 'TRX', 'TFWSQsnVxqEtdYhFj2MBN8f8Rc8zmMEpVZ', 'b3d657d1d0d93fcb9322ba918e9afb8cf456f8777d50c027ed22aba822a0bfed');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3651, 'TRX', 'TY79rXLy9Z7fbQUvg5Nd5uNeQhv4B9FwX1', '1b729cb19e1caac2293268a0d196221ea6bef9c1ef3591b88d55f316edfa323a');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3652, 'TRX', 'TMoEb5ufDWf6HkN4gRUrL4b6AhYupFweLo', '378779bde0af84b7670dde44c032b1fe8fa351db2f397f509fbb24eafe69c779');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3653, 'TRX', 'TEZMtrGXs5L7SxmEGbPwrAKVJQAuwgTcWx', 'c87d45f95ae1035b72ef4aa558fb4d749eb888fe2e22860d98d52181ccbe3974');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3654, 'TRX', 'TCyQGxWpiuKeGAmvmdn6Lr2EAKp9foeUJK', '0fa11b720aaa0bc6e0ad7fad8da55911a1243e531fa5cc317317811a7966339e');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3655, 'TRX', 'TUPVwKei4D2NgmNLD9kaSTJCNSx6pxBkR1', '01c81d6d7b2e06b8a5ab9d29ee39a1dbbf2930058b8d3616fbf9268adb82fba7');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3656, 'TRX', 'TWMhGKsTNNrmCB89pgtqAecZU9RRZAdLf1', 'd66e71263d63822b24e0c0ad5aaf3f10b7329c52afa309e99002f8971a7b7160');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3657, 'TRX', 'TEWknuyyt8UGK1VmQj9Z5rUqG18E45Stea', '3ec8b7031ac741147faa29b4093352ea86653224ba740626517d7ed897eb22ab');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3658, 'TRX', 'TQRUtEpTvto6g1yxvpZSUQZfBSf42QESRv', '240b81bcde162a1706f5d35c910bb73cb5bbd447cdf4b0a90b85028addf2500a');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3659, 'TRX', 'TAHEseofCNBwQ4kmhTvJzSaNz8ZnKJgesg', '02c71396730e10a2c6826b1f3b0893e09abf79a737eb53b45652018957052c41');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3660, 'TRX', 'TBfsfNJNceseTNppj4RMjiBcLKw3UhH3HX', '47c8721fe55e6f10be359b27d6e98ff5f6f39cf9b8615bc7496cd0b56cf84185');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3661, 'TRX', 'TN5eeNSfpiwQpDzJ6VDopK9pRbdW5eb2a6', '2b1546cbb880c9e2c56378cf46d57fed3b70bd42eb9d8d64c998833e4f57a91f');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3662, 'TRX', 'TXy2QhbJjm6nUWe4TmJAFwHExXbsDvNcmU', 'd1b2046fc826b2ffdc3b824635941049ee907df1eea65e6c851c5c8be8b8afa9');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3663, 'TRX', 'TFEEXNY8rGb8gB19wYLiYxnDcgMeFwgZhw', '50df347add920a95af2f9d259887f26600aa7353dc583dd33cf2bca13a6a2e41');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3664, 'TRX', 'TUQkBtcxk8ZeNESZ8zprgQDTtDUUcKJbrm', 'fb1b28ea68a66fc97c0e7645b20a24ffe8a0579aeb1b3fbcfe4dceee3a705528');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3665, 'TRX', 'TSkmE9BEgwSBFVrEdSaZtFNzkkGuwFUUUe', 'cb411a6e4bc299fd4d680127b8042a758e3e6bb576a2152abbd6605417cc00c8');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3666, 'TRX', 'TGWq3KWEWwfn2sMihY4a8LBRGcP8RDJUPh', 'd095ff9d08970b766cd03520a86efca69546c761c5872292e952eec57e48403d');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3667, 'TRX', 'THfiJFtq6uxh5ZDwdLniqsckVgmcgXiMRr', 'a0b3878468ecf16c20b8f12c4fd7b37c6a23202e43beee775dc9abf629bff7d4');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3668, 'TRX', 'TXbFJq6qe4MK8o4ym6JFYZQaGJTEUfsGUp', '45cc7c12aab2777dfbfe094261851416b92d40c93b7084e3c46beac2a9486a1b');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3669, 'TRX', 'TEsiAN7Xe6Cs2kETkZkrHLuwMH49amHNSN', '73b341f93fc86b322a79ad31a66955d3fad644035a187c55d7515249d28aad1f');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3670, 'TRX', 'THZuQbczDMrCL6ww24N5ffWM7a6Dar4LFe', '00a7a1c426e071f7f84cc08708ffdc16d01b7c554e8d0534f1b4226182906435');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3671, 'TRX', 'TVSdwygLboQ1JHQJPsxhgUKYWJ9aF4zbAE', '002827c255eae139047ad25fa1138bf97b64667fa99397d9f37d5f41495ff300');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3672, 'TRX', 'TWu4BSQVy3YMqcnfwg9WBM9SW3zySUhgqa', '29d678ba25dde1b01aad033d3be8b0989943f1ba3eb6a4ae8e702a8526f6d22e');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3673, 'TRX', 'TAb9t3F3y23SThQZPayUi331cNPyZrsNEA', '91ab82b5fad00e2c6bc72dbc970afb2fc13cc6086f3b81ff73dbd05b2cf1f6b7');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3674, 'TRX', 'TLqCVUdY66P674kc4VVgKgQiGvfGn1dRxK', '5ed754ecf77ee9d92f87e1b26e71da48662c3f7264e65b2db43c4d70f2d6c824');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3675, 'TRX', 'TKBkhgsnPd1NeHDiZQL4KUTY92A3wQMACv', '7e1df191209e0885abf2839741855adc10e20649ee1559e25916a66b3f01f51a');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3676, 'TRX', 'TCU2ejw41idohPWKgmYkrdLwCv5xMaxHhJ', '24b41ad9e18685f428ea71512910fb123803e897b049379535212b6fcc423639');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3677, 'TRX', 'TLHncUChRc3gMY9mxctdtMruJWM8QL5LRj', 'f7055cd3da2d6185c2c2bff9c112e43315ff47e6b80e6896699824787371551e');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3678, 'TRX', 'TMQrjWsKyuLe7C4Jf4FKvZHZD4GJgrxGGU', '081768c22ee1d314846e7622baede4743deb6bdf6247ee2b93bfde982370cb40');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3679, 'TRX', 'TPj1m8rEFdgUZG9grmqsMGZg6VUc9mRQft', 'cac480ab6a48f935715dc88299669130c361c15e148b3301ee319d3574e3f521');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3680, 'TRX', 'TC2yw8J58Ptd3FHyKgrGfTKw2JDHeZANhn', '3544b26a96526042856134ee53c3b80bb289eca10fd05dd9d54f3f1dd3c2b3d5');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3681, 'TRX', 'TUx6kRszZVm5UYNSSKYB29sv6DTTZjNVMY', 'ee82b3078642d6d3a10aa9d74b5dd2939adbf1b91899320c0f4ad2d6bb45a484');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3682, 'TRX', 'TBttNUwXPEmkpfWj5qpjQfXcDTNxMAUFc7', '0d23e7f2070bdabb4eb856b8c7b5186bdb15be5f15d2f803d3c518a500014d77');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3683, 'TRX', 'TMmDLvLNRxLhFtCExDJJP5Tni4xB7E2kAS', '095944301f3c6d290c08f6cd41d071db9547bb2411a4975a82bbd16c18c2810f');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3684, 'TRX', 'TGH71gKPR2jXBcRy7t8CfyU8BPFKoJFnoU', '38b2ef41bb84b699ef9646ae0faec6914a18a11241f6a3663c33c6ce9f0d81dc');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3685, 'TRX', 'TBWmZkoxggMBC9aBr4gXTN1sz6NGJcVUMf', 'f20d305f14a63684cbfcacda30071ea6392aa963538d8e4b8b4e4469476a53e3');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3686, 'TRX', 'TGbQz1aYbceweQuiQ3TLySAAiRrYKas2Na', '22bdb3f9f4be5b11ac81ffb42cd6d6bbf6d7b9c8863edcaa880b6d58d50d0769');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3687, 'TRX', 'TDS6wBm2eS7f1vxCogP39zVL3n1f85p2t5', '6f30642ccb8124bc0cdd6fa4be4d142f373f6de4905648bb3b5325b0bae67b7b');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3688, 'TRX', 'TJEyXjX6CDn9AbR1QXXwpcosmB8AcWBWLZ', '6eaa6ecb0bb22b2a103107738833eeca13515548ffb9d9295ea3c38f2d38502a');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3689, 'TRX', 'TTzKXEkQAJVoe7GzZb9U9CoNv5D1jec9Mi', 'd5b610613a830135da05cad52400eb8f320698c0ee7dbcfc15c56a7926c1efe4');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3690, 'TRX', 'TBDUSRhpW7mHK8eLnscbD9zkD4vAvnhKbZ', 'fca52254bd6986eb1ca094e18f60d4c6f36beee1b4cf4491a62aa31535f3bb03');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3691, 'TRX', 'TKCxxy2tbNR8E5AifksjvLAz1hCwtsX4dG', 'f76568bea6e60e4b3958a79a1fc80c3b267fa68ac6edac808538800b77b5dd7c');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3692, 'TRX', 'TAYivPrHBWWfF37bLHEceKem1tuVW2x1DQ', '8aee1e4d6d39814077dacd3b6db2d8c4bcee01d2339ce22b28e452aae091339b');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3693, 'TRX', 'TQJZ13hxrZGsZD9Pu5qQ2GiGUJsS3hnVoe', '226d6d2e2ad209c028c75884c1eac35cd66babc4cfa224318421c90ed5e64ef8');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3694, 'TRX', 'TPvZE8g5zKKouTxEu18AfoZsRrqqp3RvnA', 'e4c92c61eb5bc3c473e293b19b2621e3fa01cf0753e377ef54f561f1ea39718c');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3695, 'TRX', 'TXiyRhqUcCxN4chgokF5HsWga2D3ytQRCf', '0e87538eb166bd1d555ddfbeb1e2b50825276a2453855517118f6861c7dc8be3');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3696, 'TRX', 'TY5VKZyciKRRhjYG3mcycJxW27oTStA5NE', 'f960b94c0e58bfcce754d44aa3cbff1583c052ed9e230c8086b725054cd64752');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3697, 'TRX', 'TDMpM2Ztvk5HTTMMhA14aWdJXS1cS2nrtc', '2d08b98c6ef17d1f23eff51c883f5971a5ee2e18564fe852378b8490a5ddb377');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3698, 'TRX', 'TTr5iEsQU2kF1KxtyCdmJu5qocrRs23gSW', '1c4f64b484e45d24e200c1fc81989e64e4b7635e10c00c8a35ba523f0c761235');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3699, 'TRX', 'TGjrnp5MyV8zTYwTrgSMcfEc47fAWm8aq4', 'fdb15abc384efb3fb7b69483ab613905c9433333e3c61021011efc89d9376cb1');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3700, 'TRX', 'TFt9ehPgYJuwpTyC7A3yKrsfEuUkNeKfpy', 'c7939fdefc89e5701a5cd2e908afcc6437cafa7a7289b42f139a3cdae12ae0a1');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3701, 'TRX', 'TXxb42hobxRo5xnipvmVqCi8hVxDMcKEPp', 'd148f65f47003b9a66977a7fb77e015f760d155dadd28f37d50a7fee5de79c17');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3702, 'TRX', 'TRgcjRfCh3EFQbtTZfhadbdjhTQVfVBndZ', '818f5450b2869df3a3a48c513eef40d1f8baed320da231a8bbd4963fdd8d59ac');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3703, 'TRX', 'TF2zfjaaVJUUTdduU2dQUJsJUboHSH6sPY', '77f1542b0aa276723272ae6ad79e9d6a3759ca60362f0720fce78c310d58308c');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3704, 'TRX', 'TGfo3NBJ2wz7HZqfLSozFzq59koYnhC5V3', '8c086b0db71d827432bff6a432bc4def8a46a8c6ebb4909a826aeb731aadc5bd');
INSERT INTO `m_coin_recharge_addr_pool` VALUES (3705, 'TRX', 'TAKSfAaseXWB31ZN5F856qSKuHJvzMSfLi', '5ac806cadfc4c2d0107cbea5747e8eb46d35fce8727da7b6b2cbf32ad2391dfd');

-- ----------------------------
-- Table structure for m_config
-- ----------------------------
DROP TABLE IF EXISTS `m_config`;
CREATE TABLE `m_config`  (
  `id` int NOT NULL,
  `rz_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入账回调URL',
  `cz_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充值回调URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '钱包配置表，只有id=1生效' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_config
-- ----------------------------
INSERT INTO `m_config` VALUES (1, '1', '1');

-- ----------------------------
-- Table structure for m_currency_block
-- ----------------------------
DROP TABLE IF EXISTS `m_currency_block`;
CREATE TABLE `m_currency_block`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币种名称，例如：BTC',
  `current_height` bigint NULL DEFAULT NULL COMMENT '当前块高',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `currency`(`currency`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '币种区块信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_currency_block
-- ----------------------------
INSERT INTO `m_currency_block` VALUES (1, 'TRX', 0);

-- ----------------------------
-- Table structure for m_transfer
-- ----------------------------
DROP TABLE IF EXISTS `m_transfer`;
CREATE TABLE `m_transfer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `r_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识id',
  `address` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现地址',
  `num` decimal(32, 6) NULL DEFAULT NULL COMMENT '数量',
  `tx_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT 0 COMMENT '0待定 1成功 2失败',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `flag` int NULL DEFAULT 0 COMMENT '0未确定 1已确定',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '提现日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_transfer
-- ----------------------------
INSERT INTO `m_transfer` VALUES (1, '121212115', 'TNsxBs3KyowuyT4cgA7RMmHBCMAuZXSKBz', 0.001000, '44d3bc2c16d44a2e80ee2ebdc9ef2867ae89f6edcf955cd32483d249f94bbc32', 1, '2022-03-03 15:59:02', 0);
INSERT INTO `m_transfer` VALUES (2, '121212115', 'TNsxBs3KyowuyT4cgA7RMmHBCMAuZXSKBz', 0.025000, '99a0f46e16143322021000a6d9ac5d233c5a27a4307bfb645427eb9f3e4f5779', 2, '2022-03-03 16:51:53', 0);

SET FOREIGN_KEY_CHECKS = 1;
