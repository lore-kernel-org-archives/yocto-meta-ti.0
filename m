Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18418.1792659137611188831
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 01:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=hAX9MuTn;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=YeaoC3Ix;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: r-sharma3@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69M6wnid3671514;
	Thu, 22 Oct 2026 03:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=R3CmcyQk11nQB
	TJyhkjGlQkTwVbkZM/tJhrBmdBV+6c=; b=hAX9MuTnYZMidgvQWVpC98TYxaSS9
	YwYOEncW4rsfjeaVvSzr/3pEnzj/T2yIdS8e9ihnex7UjI6m/7aGTHXunbNGkOMi
	r9a9VZQMDXdLGXk9Dnnu34LkpXSP9iqOEPxYuvCKIavbFJqfES2gfiWQEjeL2FOI
	Ag+mSFsFw1CHqbTWxL/KHvpAjW5sJZjEBIArlwSMELwAyGAyo8i/dg8Rm0px7Q+W
	lihSXEQ/9x4tkrtqYWvLwCcDGDSfKK/noLcQf3OPVvck09W2vgywmueerLLFtB8W
	FxEzq6ad2qvRadgCdBizveBnGQ6FdHNaOa5BSMNLiEgC+BSfKJCz0X6vQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hf9hmhvt4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 03:52:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUjObToyFP6XaZy4bJ4q2mr0K6iCpy6zJkLAeGn9cla7ZN4lu9jmgkre/lVyj/iu1m+vBR0WQgS4+oeBscQZwttF6mUP/tzz1jOLmnaY7MHmfoiNfcim32Hv2FvaWxoR557vk5A1dNpqwrNTGhYdhY4n3CX7UwuSl5+neC9FSFFeB1suNJwSJvswYTFtHT3DbX0V7ZTSpdNbZEi/AUDaQ1H5RfbLkygNnbaJwrrKEFI4osO8FNYmXFgPbGwYyUKZ2tKu5HTqAw524qgU/EeKQ+AokJUukta0EkU/Trnya6lXrIHF6r8uaXx2Y8vpi4RCfumRH+iJs663shzNm0mZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3CmcyQk11nQBTJyhkjGlQkTwVbkZM/tJhrBmdBV+6c=;
 b=CeD86bT+EBVzIXm99YCNpSHJxCzZmciBexpE89zQ+U4bR1FGz2+dDotQhvmOBtCvFrzBd9m40vfsOXnjgQ/sIEoQZiq6WiS85nwLbd5PhlLLPKWGbdIQGIDJLZ4QF5Gch3CRp6xCYEelij7lQbVhGPAL+fVG4GF31ahL8STlaqVT7Vem72veEoQpp7lynN4BqJ2y46NQO7e89vCuMLJB3fWNyjX1VkJIlR/eHhnvrkiMbzPEF7ZKE/hab3UB3zA1LMKtg2+LWxyMnDXPj40zEM6ymld5Z045AnIIBOK1et9YrGGyv4KxxTkDiRBAhS0vBL+HHM0jB1ZZnfflUTG6nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3CmcyQk11nQBTJyhkjGlQkTwVbkZM/tJhrBmdBV+6c=;
 b=YeaoC3IxkAuXv+Xw77jS//TuaGHy5zjqUFTumieE8T9Yu71bdYvez281kJUC5aL5P/tF/nXNxc11ZDNeEgCm/t9PUqaiyQaWE7IvB6Qpw3WR7wrnY6dsRnCSrcBJJk601ZF6vSisToDK/upME+wK6zmCZ3o+/pnhMp/GIJhD/2c=
Received: from CH5P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::21)
 by DS4PPFA0AD88203.namprd10.prod.outlook.com (2603:10b6:f:fc00::d3a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:52:13 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::4e) by CH5P222CA0017.outlook.office365.com
 (2603:10b6:610:1ee::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 08:52:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 08:52:13 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 03:52:02 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 03:52:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 03:52:02 -0500
Received: from uda1253387.dhcp.ti.com (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69M8q00f122659;
	Thu, 22 Oct 2026 03:52:00 -0500
From: Rahul Sharma <r-sharma3@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@konsulko.com>, Rahul Sharma <r-sharma3@ti.com>
Subject: [master/wrynose][PATCH v2 1/2] am62pxx-evm: Add OLDI config fragment for Microtips MF101HIE panel
Date: Thu, 22 Oct 2026 14:21:55 +0530
Message-ID: <20261022085156.1753733-1-r-sharma3@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|DS4PPFA0AD88203:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f3863e-3015-4855-a2c0-08df3019c45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|261021121427099003|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: RxL/QZt+A5pO5RQ/EV0O1RLz43F2eIdCnK3b2axugOEB//0xq1DsG/hstdV6ZSlrj6qwiPMY/y3OwHnbmw2sNwIsU4EcxBB4V47aWKu3hRmb12IHcwA89xS7v0Ba6Smy+bvQOMK8Y+lJBrYrqngKe4KgGkXPp37PQpeRjoJPL/FmdvklSkNCN2IX8wmWk48jE0duPX2x8xGi/NVSs7RnqMYpS7ITA0ci/GnolnjSlMr+I6tq1vM6J1uo/xlKp7YcPNUT2I/kmFPA5BwbzTcGfy+p9q+e87Q9MVygGi/2wTKOKkR0fUthTxpLv+LyP3ZlWorg77zIGqOQIGmv78hbucBncS0kZpw3LoFD+1hRvtD7JmxNdp6InMq/glh73jqT04ecbxpgY/fLidyFeAJF9r4TtMkAyufCRfUGPBI+tDhXoFh4l2d0PPqaWl86/2zN9mZwauNjpzGVyBPiOfOn6XcWpvWD/EsfIZMLJMVoPwMzC3x3mP7X82fTsn58ZNB0uo7Q6exSqsdygYJgtyB848aAKwOa/AOpQy4hT7zxZNTIZ+cvwDBAC1sB1BU0ihLpPC1f9imc00z60xl2iOKMo69dGxJpP/oaq0bH4BabYppXYlD4IaLpntWQu06uLOL6Kj9FAatpNlZO5pbKLQkIrfI1S1q+qKFSwnOKuVe6nyFHTI+mK6TYh6stJwv1Eg04DEFnjE4t5T6csvsiLlpPGA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(261021121427099003)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ysEHcBQZA0Hzheq517xMBITIOoW6uAV9gQgqURUUY1AxyZDX6IqpdrwQwGRfenVjfzf+KPmLUGYRFAp6SeciHupMPNTsgtVCRwix45Vj6QAI+vltCLbs1kANelqFXCni0aWDEPnbGqPe/Gtf20kWkjGjWjCmIwxmd5IBtwIqbHqzb9fgALtS61ArA9deUB0UPj522Dao9BDtcOVk2Rt+BsURz91IR9oY63aYr9BKzTIw2Iy+umrBVkMwdcI2IwTQUmqOKSKsohof0tDYHGYgBxb7iZN3FtHjGRypib2mHXYXDw5nY7YdQK1spxwQbFVR530sMnl+LYo+3hep/o03Yv/+AHd2MJPa4OCaTYIK55gH8B1kXJMWSVzYwQ5WxcF/O0GEC/cuItPhXiFfZRzHS7ZTu4GQDckmBzoq38ow1zZ5ehcgNkHmiph420JrqHlU
X-Exchange-RoutingPolicyChecked: VD9eZIkQVCnwcHKZj8IW51WrgzHiGiZTroZdkLmi9MihVUIhOuKXzMha0G49np9Tv0p1HgSMzs03+YEAeLoe3muJPPuwYhErrykzkLHX7LaE1ZvzRVBjx99Hi5B4QsJseCVCjPLDkVrTmcj1pEN2iaaqss2AwupBSb1jx+WndP1BJ9qJ21/4vkDYlfv0oYVDnxsUywm6qEirVBrdSukzRZWrut4WWGdK7ND3o6ShzFABu2FbymtV/esGWz3cGW2gO9nLPeCCMs0vYke2SmlTSilcNB4mqZfPoLeAgpCRHU6rJgyqoRXE80ZBTnHxis04xBVyN5VdrkPQEdHZqzYb4A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 08:52:13.5572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f3863e-3015-4855-a2c0-08df3019c45f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA0AD88203
X-Proofpoint-ORIG-GUID: 5QMyhNHjjyHdKYczV77RFaTgS4ld1Gt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX1jEh/DN1VK4I
 qD61RKBR84xXZkVnDkPAg/IetsTYrr+w4K5IQ80mYoW+4mXTSw8wFU0iF844SNlGGh8jEyJGUP6
 9DYHq2mH4uxL3ciyXl3Kj5Kskjs9s8cb79XGeQl0X/veX0BSCXHoFOIDmCRi9/Htkv7DmYrDTum
 KRT2eE/G3ELTyeSE9M2U6OqACk7RyXZeSN5k+sRhSN1Yqb8KlKDm1CY6tbHWY3cWT2novzIpxIW
 f9EOshaiAZHHfYpk7OnH0mjLHbOM45GRTeA+jPWtcm4D1B/PXGNaEk6fSXEVE1mff9udy2scjl5
 xbVUEzlt6t9QbBvoSq0hwkBUPSbqumEwNKS9W9XeYmixZ2VQO/KIfPl66cOIVMWoatO8qxNCpvN
 XJjkYaz2ayOu48GUcAr8q31HnrSXuJEOsEuE1mnOhZlLKGUQOKUnSTCycLJyu2MrCGbwX6KE8Gz
 o5WmS4KYojYPsKGOZkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX2lu0B0jqqWX6
 ZqPxozFpIElU4FOFje4BscAf+ug5xYHSI4rW0skcG6FvoTOftOLBF90esGNq6D+lXOR+Touh1Qo
 Tkm9wMXdYgWojozRATifKxrIC5R//4U=
X-Authority-Analysis: v=2.4 cv=O5qsLx9W c=1 sm=1 tr=0 ts=6ad9cec0 cx=c_pps
 a=xBU3AFOX62plvdJ7VrUh9g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=bP0pJ2iEsDT7gXVmwc4A:9
X-Proofpoint-GUID: 5QMyhNHjjyHdKYczV77RFaTgS4ld1Gt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220034
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2026 08:52:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20481
Content-Type: text/plain; charset="utf-8"

Add U-Boot configuration fragment for OLDI display support with
Microtips MF101HIE panel on AM62P5 EVM.

The fragment am62p5_j722s_evm_oldi-microtips-mf101hie-panel.config
enables OpenLDI/LVDS Display Interface support for the panel.

Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index cbae21c4..d78d8a3a 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -48,3 +48,6 @@ IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
 # For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
 # Hence, disable the A53 based splash screen using the am62x_evm_prune_splashscreen.config fragment present in ti-u-boot tree
 UBOOT_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62x_evm_prune_splashscreen.config', '', d)}"
+
+# OLDI config fragment for Microtips MF101HIE panel display support
+UBOOT_FRAGMENTS:bsp-ti-6_18 += "am62p5_j722s_evm_oldi-microtips-mf101hie-panel.config"
-- 
2.34.1

