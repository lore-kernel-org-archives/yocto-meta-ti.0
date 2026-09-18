Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43C4C982D8
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:41 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10646.1789736911738222973
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=AxKov2q5;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=n17wl8JV;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68I9cVSw3870475;
	Fri, 18 Sep 2026 08:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=QOQfnr7Jf4VSh
	lTI3OX1b2J2uewLHpQbVpECOoi8zNg=; b=AxKov2q5gZoLYaDhMhgIQHX09wf0/
	/svHeYiTrG3P0eQvVP+9VOzmP5dwCXYKQ3vnJWWYWzQC5HTQ3JsRVNDdFb1RZwBG
	zJJw+dyWMFsOclym4X/dZHe4tyk7VCBtcoFJUmZbL8EnO0mvndlLeNU4RtaOnYM5
	VpJwtI2rYZXZN/ano0z4brhyhBAqvmWJybk/y92NqHo6CFugdbvJ5gqZUnhCgx7H
	cl6SRiVshBuxTEyQT0lc+qPyGSd6+hSvbttMcCVlYpYVKZuYvVPmBUU69nJ2vvY0
	Jo3DktC7pkeiPKGgdql+Ku0Wmll68w4GH+vIpRHigJZo/fzhfNo/B83pA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4grx6dau94-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 08:08:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUi6iWTLMj7iBKzHpCtOteQIUEAXNDPF7w3oeExNjbvWsWTmFYTg9mSgN6WtloAbRK82HO6i0FJOxziQgzY8j0hAFTBhDEwuwl4GOIaCAepGFx8ynzWE5xTK+EdNVlB4127vQu0OujcTcoWX/WL2yXR6+UOohfQ/grMp96UE42DXeuNlfZCgwAcoQQ3gEve6cjCHcDQ5mdNoVg3SqyaNgOpMdRT0ra/PdX8ClsevSglWvP1yRuRG6+9DuoRzsldhjOGfH+lv1cH5ZGufWaca27Yv4TB57AJdAIdGhJckp3sNUEZsSEltQUgZdi7hTlM95RverxRvpEzWvnA0iOV8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOQfnr7Jf4VShlTI3OX1b2J2uewLHpQbVpECOoi8zNg=;
 b=fklLRPddDv08k556WCjBxSxK2EBnjOHDT9udxzT6Runx6UxpgJr44nwZ7oXCdY8BUHfKYgzpOcUyuw4ZpxeqZwmaVyMjruIOkFU6VSwWHFZGko7w1sQIEy6UtwW6VHG7zRGqXdMcai6kjP2pTB9sMppCDSKmjXpnikENiFbF+jY9oAfyLqZCswS9WjySacvdK2Se9Dk4AhqVnduRB+iut4xmeF1g5rsThHqXEoVoC99wWdzz4aGsqz4bhEUyfK0AOX3ww3bjv43czQASa6nseqpdGirbdx88gmEgVPNt89nXw7aJXiepqzrWqAcupeF/uQ+EijxOI7P8yc/St/RW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOQfnr7Jf4VShlTI3OX1b2J2uewLHpQbVpECOoi8zNg=;
 b=n17wl8JVHDjLgTkTzA1ExsV8S2nh9Wwjn7BPCjDDLxyIAg0mIKV6tpVNCKrOeTA4gUGdAovykGl1wuq7YcoEg2aXhrT18hU5EcqSiXkDhc5qeVRO3RJRkZZhq7XaaifKbmX5wc7VB+qGZ6obS3Ts5HHxVM93kX5WvDMIjDRG4vU0HYuMi1VJ6uhgUW+740bM2+E8g3fYJVdDpDAPIsmHpmCN7wkvNsS/ZpvZiPFcV+tIVwrLf8sJKKlvyTAYsUsqJrdYA+rPUz8pHH8oPGYuwhKnB0OGrd31lMqFv6AUDmgPyNqE3vulb3GmimFislc7Hyh72I0O8jku60e+I25X7g==
Received: from SJ0PR03CA0389.namprd03.prod.outlook.com (2603:10b6:a03:3a1::34)
 by BN0PR10MB4918.namprd10.prod.outlook.com (2603:10b6:408:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Fri, 18 Sep
 2026 13:06:16 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::e) by SJ0PR03CA0389.outlook.office365.com
 (2603:10b6:a03:3a1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 13:06:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 13:06:14 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 08:05:11 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 08:05:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 18 Sep 2026 08:05:10 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68ID5AH81756385;
	Fri, 18 Sep 2026 08:05:10 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 386202A61; Fri, 18 Sep 2026 08:05:10 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202609172130
Date: Fri, 18 Sep 2026 08:05:10 -0500
Message-ID: <20260918130510.2979809-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|BN0PR10MB4918:EE_
X-MS-Office365-Filtering-Correlation-Id: dce4d59a-eec2-4bf1-b25d-08df15859eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|6133799003|18002099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	5IqTKfOHiLDJJ4LZcOSMQs4vM9+A6NpZWjsXPKkiBpIf2y8jcEC769BHJx6tVVhk9x0UYU/ZsVloa27nXd6OLQuDS68GeWstcpYJ7oxN55ZzEbOkeZOn4CaStZO1ymNwTMruv5QLf0q83014TwUmpUYkaHGRAtd+/ckx9kMyl0LZ5r7Z0kAoO2KgWxUYazOvyZmsuc8Iaqk5ZMjmd7nefaj8FzM5HFDN5o2VLKr9FLDosE/qVDK56PSzLzkfl58UY6Ubb8jGiW7T3z/jR5XiPyW0gwzfya9ClnIb5m0Dc3me4YLYfHgb+twT9f8Qn/gLBunh7H68y5AVJkfrC88FsriqD3wqpEPAF0G6cuxO1BTpg1Yp3UFSx1qCeVH84o8PKRoVF/fpL0pSVP2O/Atdt25tIJzxnb423z31RBkN05fLGIqi7QeCAD4Jx1XWi9dhhMT+6s291XBhlzbXbY2yETHaWAk36E257W4GbK6E0Yfs4zBYN0TTKGiGgXql7v879Fuk+H0tHBQ0/AKK0Ys0snIGHOCqthsqkwQQLkIxSP3UTkcScxAmwjuKQsijzHtucPo+plYz+LpeefgWGGyVD6LGpkgA49rswV5n3cJZX/IZXQEAHdXkBo0TTPQl/QHgezof4aOoul9z3N2GJgfhCRa2t6w+eP/4gs+DOfkplpQbzuR7kxhMvd7qRSu7/Uw13wniaMNXbXEB7PzVu5npGQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(6133799003)(18002099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ILJqW7q9/a95abFVHJX8NgyPdTkvH1r8OymKO8f4Cx+CtyjjbIzGG10/MWr/d51uBpexD5btkd8Rg6b+14j1eODimlp79ogyVOCHJxc/G6dpWH/hqUMVFbHUqTiNDTAXGFPJxm/GW3ELqrTkBX9W/SD0Fb7z3lrOebI5ZOTWMwYJioBLDl8GgecFWPE4rfvqAHCbKanp+qunHA5Lm6FdSv6jR2/fIhZIT44/nQS94J93En73o/ZY/0qqjZKCXfbH/XO37bC2JtZn23fqqFlUN9yh/MyA+BDPn3icF4Jr2gZYiBUAJemhmnqprB+ty7C3v0rmmEWyX/OppmufuWI8Klxt79fWfS93l3s7+KoE75VA1STJMsLMmUklbMlfcavjtZcmPEXDzAFwbpcYrNufbcpoehkMLZvHH2wvjfrUDYY12LiM7EkqqB05+KcPgjuu
X-Exchange-RoutingPolicyChecked: 
	U2APvu389/DBKnqdADgTNmeKcN3E3mUAW1MrOnVxRqhfTIHnySkbk+AAkf1Vi8uw8zkKRlCro46maeuP3Kc/Iqt3/oJ/ZSa1SEeLya/pWX+aixK+IOMjw7xZnvcSaRRUtYqqR+Xq9M4xIu6eZ6W0UX5QRw5CbrL4/AZQU+EsASTqkd+D1hoaODCqIkrmK6LkorKsNqc/WV+BBqHtDI5KxdQC9zqsYgKUio1So5Itef7fPtLapaN0ciKaBtf8pyT0tur8erRwR9IrF2q58hUSbAdxbNmIvDM0qlA1RfHJr44l8azpAQOi+GRpwgehtBLEXRfqSw193xUxoft8AhuPcw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 13:06:14.7551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dce4d59a-eec2-4bf1-b25d-08df15859eca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4918
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NSBTYWx0ZWRfX/JGy9xJn2cHI
 I6xG+a5yb/4PHw2HNa8CeQ/EFOOvAcbnoTd3EQgkhI0c5RKtUgxlJ70gix24WBbxZU2O8+sWR9O
 HSWLeF+7Ek+Yc+h7FM6Mc1Q6lqAMgh0=
X-Authority-Analysis: v=2.4 cv=Cswq4X4D c=1 sm=1 tr=0 ts=6aad37cd cx=c_pps
 a=FnNH6Hr+id3EzXqhVuY+iw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8
 a=xv_xUiXEJWnkiTv_rDIA:9 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NSBTYWx0ZWRfX+xDQJXAWJE8n
 cPHKIX++ghDQLCn7W/AE1O+ZXYVpQe4/W7zTM360BxVNngVnYBPrwXG+8hq6/jAA0CBt+VwiXfk
 joIsRo4A4sFaOGP/UA+M3/zNIH8EU0wx1TV8aOSudkvQ1I+GbutAPsCHg1RC2bKandIpDPR7H8J
 /W52nILH3nV7ERxOwayeXrbmL+1+P5Os4dk89DeXuMY8njNpxi9Dqyb5FUkSF5xRKOpjHM9sFQH
 QKvnXo5J1WEX14TYfJRFHgGovDLAQ/5zjaVAi/Mq4jNf9KgtN4uOjKLb81DXrt/FK/XaSvxeS5s
 bLSUeYMv8Yg4NSOcqNErFtkVMBzPE+jEN6bJU/7sqMdaW+juJwhntqXwd0Loq7sMPU19GxWugnL
 uqKEdDx7cyYYpqxMI1BnqXjBZStsiWmk/uzRlZ+bEANyHIE5QnMT2PBAsltX3roKaWA/LX9ytQN
 i5qKzqlT4QkopAu/fFA==
X-Proofpoint-ORIG-GUID: IY7XJEUlPQbBpUXcn63G8uFPyRGiyrsd
X-Proofpoint-GUID: IY7XJEUlPQbBpUXcn63G8uFPyRGiyrsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180185
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:08:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20386

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging-rt_6.18: PV_ARM32,SRCREV_ARM32
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=9dffeff8264765a462d6f96b50ba12e4ad7fba70..e853cc767f4b5431ea10f8f986b455e14a60b282
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200..3eefe4b257b6fd2ef649c25bfc37551df2154165
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=2a55868676119435c408642191d1b5523910f288..5ac4102f15847164e94c94ccd38a77a39246eeab
  linux-ti-staging-rt_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=65cf808e0410dd16ff0bb1f03a1bb7e67cbd6c32..d1be33790a0c6d9241b08a8bcf0b702729ac2b79
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=2cb14eda73fdb89b09e5cb92ce9d691a6a36c250..fff856a50d43288671eaa733f9f59aa25f2fed77
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=38638d15d7e5797387d43b56708a16b3af52f2e4..fe064c0799d988e6dc4684ffd8792950640f57b1

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb   | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb             | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb  | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb     | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index c27f8ae5..6eb84cca 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,13 +15,13 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.02.07"
-TI_SYSFW_VERSION = "12.01.02"
+TI_SYSFW_VERSION = "12.01.03"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "9dffeff8264765a462d6f96b50ba12e4ad7fba70"
+TI_LINUX_FW_SRCREV ?= "e853cc767f4b5431ea10f8f986b455e14a60b282"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 1e33306b..25472162 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "72b61c96ce11c54530bd68d721321022d031b628"
+SRCREV_tfa:am62lxx = "4e190e1d2b6ab5467228dd35f236a31185863f9a"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 7637cfaf..84099186 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200"
+SRCREV_uboot = "3eefe4b257b6fd2ef649c25bfc37551df2154165"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index ed4ab0ee..91a52e2c 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "2a55868676119435c408642191d1b5523910f288"
+SRCREV = "5ac4102f15847164e94c94ccd38a77a39246eeab"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index 96b3b2b6..53873476 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -10,8 +10,8 @@ BRANCH_ARM64 = "ti-linux-6.18.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
-SRCREV_ARM32 = "65cf808e0410dd16ff0bb1f03a1bb7e67cbd6c32"
-PV_ARM32 = "6.18.47+git"
+SRCREV_ARM32 = "d1be33790a0c6d9241b08a8bcf0b702729ac2b79"
+PV_ARM32 = "6.18.51+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 8ffd6072..b08eac87 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "2cb14eda73fdb89b09e5cb92ce9d691a6a36c250"
-PV = "6.18.47+git"
+SRCREV ?= "fff856a50d43288671eaa733f9f59aa25f2fed77"
+PV = "6.18.51+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 044244f5..5e4726a6 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "38638d15d7e5797387d43b56708a16b3af52f2e4"
+SRCREV = "fe064c0799d988e6dc4684ffd8792950640f57b1"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


