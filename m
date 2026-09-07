Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2F5C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:11:31 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30033.1788768687996023547
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=omFc4BNM;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fGpA2KNF;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68775pZ52615416
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Sep 2026 03:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Nshec3P5lrK+br2jj9wYTVs+NzTyfuhX9vI57tZ39
	TU=; b=omFc4BNMbHVWEZM2mY5c92QPeCM2zYCjYGvT4JfjQku1dw0DpEOXiONSX
	co0ifc8QTG89XdqSpigu2UspjB/VUIv2DUk1VyMwJY5dr69qYq/RL7CYLjhTebqL
	iCEhzecHUz8fcL7D5Q1xSp6G8v0w2U85ZoIy1sCwRK2+ExAFaqIg7uCiL+wcr+3B
	vEZuewm0sVubzy7U9gM4zkKz8W6GiTnnBsWYP/mV5l30SP/yLuaI2jKNQagsh5+6
	kbhD2yo0k/QIQhxaLV/CRgmjM3HWOaTr7nc45zqFYb+yGna+sYKFfF64OxTeoZ//
	W/6RFLXMDCKm7wia/bzhOfeg/U10A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013058.outbound.protection.outlook.com [40.93.196.58])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gh43n4gw2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 03:11:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFqkIJyVGSMwG5LLARleFTJd8bPPXbmGr7wjNwwhicO2PUrwEVHm/jfyd6iId4G60dKR0SlfPPUPo42nKPNwB6L9qD13SWTc+ZhUHJ/C3QhvlDuyHhtwDm4pgXtbbBp4vpozkvBHG1jDSfRDWUIJMXgF2DvFIQB4YdVo8jv9xCSp7hwBZSzmZjPGKGMGlBI/yA+C2M1h2SLgdF5OBUdiqy1Ub2HR3v7BztfLs2Df0aA1BpyDjZLBYLA5qJN1vrkPBsCvozPgTFZCqkbtz03jU9yyYfGApYJ0M5Tu3Pv4DbbqLIMBKLjF0Ws5D8hee6rQCZ45EN9MSQD78FmD6jdiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nshec3P5lrK+br2jj9wYTVs+NzTyfuhX9vI57tZ39TU=;
 b=cVWDf4YFOqODP8qdgitszZWOwfHSACEncYJQo0DwxadyahG8RqIg+RbnLgsifKO5Q4LIssYjnMxnIBLOqK2IjAucoW7s5mHjhYHEQWCOafVviDljsg7q4vyC9uSuVeMnU2k3b5NKHEr/8ty1elxfbWDAD23+JlNf1wn7Yiy1kD5yfCevtAinBzrwwiJTniSihosdX9vQfppCcf0a1oncw5rt1wJvwsuCyDhyHHb2xQYYoXjiTWbuYT2mFLgA/VJ7eMtC822zW5tsojLLrfm8j8my5og7fierTG5eDUwOMjKZNDJtMWFoD0UOg2LgY06zXlJie7vsp1vYeJQP2CQVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nshec3P5lrK+br2jj9wYTVs+NzTyfuhX9vI57tZ39TU=;
 b=fGpA2KNFVN9QIHNBC6wsuytGHaGHbHYXRVbe8NYpBOgJPRiVxqMY3ARP2Nhp5tY328MIxz8C4vrwgCutKVDJx0WUSKcIAJBTWikWc9qjzPuD8oiya3ZMKSXCDXgWJkt9YEcHFRUWocKWS4Lw1gRQY5+HKxTr4UZLOHtWZcdEigw=
Received: from CYZPR05CA0030.namprd05.prod.outlook.com (2603:10b6:930:a3::18)
 by MN2PR10MB4302.namprd10.prod.outlook.com (2603:10b6:208:199::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Mon, 7 Sep 2026
 08:11:25 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:a3:cafe::1b) by CYZPR05CA0030.outlook.office365.com
 (2603:10b6:930:a3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Mon, 7
 Sep 2026 08:11:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:11:23 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:42 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 03:10:42 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6878ALMU132583;
	Mon, 7 Sep 2026 03:10:40 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][RFC PATCH 9/9] conf: machine: j742s2-evm: Enable ECDSA multiconfig build
Date: Mon, 7 Sep 2026 13:40:21 +0530
Message-ID: <20260907081021.3876876-9-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907081021.3876876-1-a-dubey@ti.com>
References: <20260907081021.3876876-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|MN2PR10MB4302:EE_
X-MS-Office365-Filtering-Correlation-Id: a1af5397-6b89-435c-3a3a-08df0cb79b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	qXGGgmARQ9qBrOCmhe4As4jCSHTlEB/QxMLlxMZ/a2Lmu5T0ZTO8CD2WkPMuNwi12TBivOcphHC5xOfYjHwTudH/ukGTkdTL8TDojBO64b0KcbaFnyhmgo5sYHhco/jO/UZp/BWsA9tCoeWPScoFd4OZUxyz02HgQta0yb7a+SaVfSF47hr4ynM4pqb8OK+MMS7itwor3CI0HYIMENJouIAz2VQsjkYHePjo7ODlzxYAdgfcZ20pMsTemOIIyn93MEnrBRKvqAxm0Mfp9wokZ9FlNwEdT3vT87UMAdhJDGroJsZpNnx6ZvuigLXXe1LKcPNYqADnAvSbxu2jElD1mgYeuqKugILknlb9aCZE++pVSzkKPK+YGy6BinmZkZVxvFvDYDfbQ7m0r5zJsAzjm3XORjMexpxYrPXnASH9tOX07FtRddzUm9owmH6JIJle1DVeu/cxc1FrtqgMpKsWfzRD2Sa0mRkC16L+gEdnggpPxintrFPHs4g1cBzU8SS9aWVgWIMVdMdCUOl3i+iQe+RD29pTIMS0TcmDZZ9XNQwgFb2aZr0q9z98W9C71Zi0l7LpSsJZe6uLFU77zozlB8HuisktsXEW/eGDyRfFyhQGPhfBQbx3YTaja6Al/XYgZCY0b7hWF/QZ4J7mIxYg7pX1ipKzwdGmpAMVqzUthCYFeuF7PjP7x68Lkh9wWxcnB2Uf7gyR193kxEpU8sGHdQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	l8KqdGacglwDrqKDD0CY/N3xcII+8/6ggxdcKlwwEF3Q4XSeTU1KUxwHHlCyrjQOaIHJyZe70bCbL2/CVvC/d6aEFIRbDGScbWMTA3noxfUcO3fzZjeN5CaA6IO0sYF6ZDHCugXFagbXOJwylAabk9OeUkufdAAXSLECGNHYsNdf/Je0wql+JXTVs29tUWKwXP6Q7yEBCH2d55QP3zIyG6zUmkayL+ZBGKboAhsmUzSmG9tpPj564gnIt0yrZnDxD1IvFpZWDu4f4nQ3x+Y2eeJ4RAMDAp5Ujhx0286UbJJwSCooFgBOQEGD83Tm/dUgdtRuNjbL4LpSvTJUTNOLbotSjiCZEoYpbrRW0knLsm5yoVW833knwzmjuJnSbdvRwtS1QFR1udxqXrZzasS8Sd3/2A/bPUUvwWydcNSp4ixZRk8/fwOInYzFVEYJPta/
X-Exchange-RoutingPolicyChecked: 
	RJa09ak7q2ro6+U9LMAC9kouM/6cc8dWajEXBMgI87JBygJ1sMPtK9oWM695JuZ20eut6EkTFPoyvatQBuaOOGHY9zo4pcWr2z86URHixgZqryeFF5qofdsilbXLFqoLmBfMnRKd7zFkfLAQE6mOT9Y4YjUYs/rPd+dCN1lkwkykNy0w5n4QMK1rw2ePKaQhmfS+P7+KooV/yu+Qj5Bthk8p+04gM9LJhRYktw28Dh/D9wXxBK5vflWdKmoPu+lufWGP2LzWNBnM41VzG+I3JLkYv0TBZDiqErVoRSkAoXBDVdZPShHczDAwRLSNGA4VM4wYpOpYO6WwXM4d9NTziw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:11:23.5329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1af5397-6b89-435c-3a3a-08df0cb79b6f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4302
X-Proofpoint-GUID: cc5Ycfv4LM6VASgYv4GbU8bdAZOahtaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX6CiLfjtbsTwp
 9yWpUS130XdIGl8MrOWdxcPeDCcAIvxQEnIdciwzaRoDcNgw15Zd9tNO1dXkj5SP+s2mXUyuzEV
 87cnqJT7mzD8c/3722pBz9OuAr/UzMKDVgYjb6VZX5+7pNtaFMS7lrc49y7WfXIr6DaViqIvgZ1
 jk8TR0muVqv5wZ3XjHRDqL/nyof9Xw56KB4Zyyld9JpohkcdSZ/0ryw/Qho13/K2t/bTRqYVGYO
 8IDH1YVOJp6VxfgcasKA7aUG/sBDmX1HsmkPJ7XApwoB6AE7Ha1+Q/+Tq/NYXNHFdEaght/KLJq
 VVrWQVBh5sf6jQCNr995BNKdzM+NyAl63h//uMdA+VBBJwGfABoSHrb285T05AuBmWvLj+eQOYh
 i/xmbjktDWwN4c0sBxCNCKypG4i7EFTzdBbZMXhfmiMBbZoPTw/ItAr4/6e3TOKSukBpZWUMxv9
 RqlmOc5TLZcSGKnExoA==
X-Proofpoint-ORIG-GUID: cc5Ycfv4LM6VASgYv4GbU8bdAZOahtaY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfXwhs/cqJ9PZHT
 9gp8+gkXvRdTbBSRXy5WzJlqMzqCeFOZo0mfc5P5SuZla5eQeyW6+fK6ZfrK2+wC330wLavtpuZ
 MNa+LCftq4Bpm5xekwbeSJjCmUFlAQc=
X-Authority-Analysis: v=2.4 cv=JdSMa0KV c=1 sm=1 tr=0 ts=6a9e71af cx=c_pps
 a=5YU8ENXygJz5UkgxsLF+dA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=p09KAAdMMPrGaVGPVooA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:11:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20337

Add an "ecdsa" pass alongside "main" for j742s2-evm and j742s2-evm-k3r5,
so both RSA and ECDSA signed boot images come out of the same build.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf | 14 +++++++++++++-
 meta-ti-bsp/conf/machine/j742s2-evm.conf      | 19 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf
index 9adeb306..049dd847 100644
--- a/meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j742s2-evm-k3r5.conf
@@ -4,4 +4,16 @@
 
 require conf/machine/include/k3r5.inc
 
-UBOOT_MACHINE = "j742s2_evm_r5_defconfig"
+UBOOT_MACHINE = ""
+
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+
+UBOOT_CONFIG[main] = "j742s2_evm_r5_defconfig"
+UBOOT_CONFIG[ecdsa] = "j742s2_evm_r5_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
diff --git a/meta-ti-bsp/conf/machine/j742s2-evm.conf b/meta-ti-bsp/conf/machine/j742s2-evm.conf
index 110931cc..420409df 100644
--- a/meta-ti-bsp/conf/machine/j742s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j742s2-evm.conf
@@ -19,4 +19,21 @@ KERNEL_DEVICETREE_PREFIX = " \
 
 KERNEL_DEVICETREE = ""
 
-UBOOT_MACHINE = "j742s2_evm_a72_defconfig"
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+ECDSA_BOOT_FILES ?= "tiboot3.bin-ecdsa tiboot3-*-evm.bin-ecdsa tispl.bin-ecdsa u-boot.img-ecdsa"
+ECDSA_BOOT_FILES:bsp-ti-6_6 = ""
+ECDSA_BOOT_FILES:bsp-next = ""
+ECDSA_BOOT_FILES:bsp-mainline = ""
+
+UBOOT_MACHINE = ""
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+UBOOT_CONFIG[main] = "j742s2_evm_a72_defconfig"
+UBOOT_CONFIG[ecdsa] = "j742s2_evm_a72_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
-- 
2.34.1


