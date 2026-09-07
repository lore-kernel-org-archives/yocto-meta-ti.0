Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47059C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:11:31 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30035.1788768689050328202
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ExvP1eqi;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dxRmsO+F;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68776M0v2796284
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Sep 2026 03:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ScEJlPy+MyOVaejh2g7oc0of1NeIX1qvot7K40fbi
	CY=; b=ExvP1eqiotwwWjBTgtadhSYGVJBEK4tdxUOG1ZP3Ur9K8OiMgj7Sq5DW7
	CzqudqVSjnuvlDcIQkxFwiLPq2A2mGEDXuz1Oc1zHqh0SKBJVZtKlF8dKTmqTFI9
	ySKMdgqmTYLiZWu91fqUBZgGXcw4apdxjN4p7shQZxEEVee03U1mMDW7VZ9oTjK3
	lKmj+gLL/r6jtPov3gKSIvcrsenWzpt1Yy0kGOcXkW9wpUGH8s4gZqsSihbHd+u3
	1ecM/DHgWFbKKE4NFxkHzwlFvHYBnXqfZSOBE5FI43575dQ/PrTK5boUqnPn0SXn
	IQxikDfvW63O484lND49BOGBNYYiw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh2f6crrd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 03:11:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJkCJ0qevYXMrSVzBnt0fPkh9ZLlZw138kJzwwbOr5gozc2k2TLyIQWhWn2jEyq3U7Xa19li4LlYparhHARS6YiIYx5ZPcX9/S+7+v744cYAqgiTsnA+EOUh6YD/fv649BikQiDPJhyrf7my55Ta1ejYITDkaHdLutrZZX1N7e+1DoJ/oy1J1e/cLmRLVD7I5yGRrYq/1Z+VxS+8ho8Rw0ReMxZh1Cml7a/X9GhdadeiwOJBPvG+PzalXxhfCB4gMDjjNIAXidC4sNtUXKJa6pHEnGGqQEjCOQZj9QbQvLhVewqaghPSQUxiUIwBe0H3fn/LGB5Hw2QFTfinF2CkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScEJlPy+MyOVaejh2g7oc0of1NeIX1qvot7K40fbiCY=;
 b=qGgK7+jUKvBZw+fhqVWVktX1kCx9dq2J23G4G/k+XWEquUVQ3mjpGkS6utfewDVmImKkVMuD4naWVve3/L9BD89pugrDNugiYCffvCYnWILvQKGEUb9ItrDhQawfmuy9txi5bTDktzvyXKVT2RCu/8CSLPQAw3BQWaWNGwkoqJA3teSyWm4rFY1w9aaub6f2o/wnXaJ2lrkJDMO7cWXlWn2/juDQ+mgAcRJMlXPZAb8LpeZWGo53sXcsO8aU/KVtZgR6yGWkJrE2YXwmkIRzGXz2N5CFyq6q1eXf1vYspl6gLjT3wX0dF6OE0vPR5q5RpHhElzM8zxRxMjKJ60kMcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScEJlPy+MyOVaejh2g7oc0of1NeIX1qvot7K40fbiCY=;
 b=dxRmsO+FVe1GBtt3PZItvwSkCHFtmgyax3eN1h+zHcrvsO96U/e6OzP+Pc7OzKW+TucrCQMhaU743n6kNooff5s/ywz2fNKdnecgtOQ1ByWCtDY4IG8aVGZDXYlpxk3//kcBUOZBqf09yyKAbzaSBkd6Ve02XDiwpII9GM2J3y4=
Received: from PH7PR17CA0019.namprd17.prod.outlook.com (2603:10b6:510:324::16)
 by IA1PR10MB5969.namprd10.prod.outlook.com (2603:10b6:208:3ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 08:11:22 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:324:cafe::12) by PH7PR17CA0019.outlook.office365.com
 (2603:10b6:510:324::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 08:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:11:21 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:37 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 03:10:37 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6878ALMS132583;
	Mon, 7 Sep 2026 03:10:35 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][RFC PATCH 7/9] conf: machine: j721s2-evm: Enable ECDSA multiconfig build
Date: Mon, 7 Sep 2026 13:40:19 +0530
Message-ID: <20260907081021.3876876-7-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907081021.3876876-1-a-dubey@ti.com>
References: <20260907081021.3876876-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|IA1PR10MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bde375b-acce-43c2-5ccc-08df0cb799fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Scgz0vVqPvQE24w4lkNYlDm+65QWhHej7xZSIfV+xN4sXYife+74QvfVmbS1GfRevL2P9IPpSo25eaB6KVYKi3ySN/j2velwrAN4f23jzPB4ZY/e8J1SVOyKrhuS5g3CCQKG43kSA7GvH5hSluPKmOeh7OigsxDfMsZx+GlBUxFnhJm/qZ3zF7k9de3CZzV+/Dw/XoujQuGl5PyHWUCdD2tDBj59blGk2kgCQLLI/O0LpjqYx76rSyrxCttnkPVbO9Cenz5jlH0kKKRndCT26n6uQ/viWxgkm+tfrJv72gdYXUmJUZ87v3WrUH6p6z+ub2w3LOle/UGA6mHC4v6iMIznxbtIMgj+tjURhaxM7XlowEKHVbwW0hD0+YdERdAG7oUf17NpN5+8YKviZdjb83NnzF2kGkg+XyfWo85kxZNasU52Kk276sKNCgDRxeoM4ABoK5Qh6eLJw5ISviowl83DqXXGun7vtmLFJSNqs1zXo9SB9srRuX7Qnv6uMNrKY9ATquvBGYoCPpqO6I9Mc3YveTreSAQHONM2Dw+zPHEFVeqc5ik2ikYNSOzXnA+kzajB+1w92Xck6doDCkCgNDY5g0CcmmOaSsc5h/edRQ1eC79bBZtX+FOb4O7r18ysyswsntAIJV7ur3XwTjdYbMX+mZDzmu1ytt4/KvjwOhUDezc9v+5ai7+BM5IYUbNFwVwh8Q/RLZvSBDmNNoeptw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	C9FEbdw1jROXCNdeB/Nz446gfgXUrbCJ29X17O84XcIeRGIfESAplUmnYiQbe3jXVEWEht0UtVfAerhpjFnELpoXwR6Tj8MFEYyYi0zIIvuTJS7wxmt/l/w1U8KFIdzma2RISDAMY9p2Xd7Kps/5aClMg3dyBtAVcD8QiXWXDuEAhFJu08ipm5Zt2yEzjoPwRSsX7wwUqFbhZGKs075fiG+GdxjBx91CQid2bwZB23nlfZV3jPGAwUT9BpODyduSAzpID8D7Q4vgg2Mjkp3vgvcjJGchK6YvsXr4cMdkYsIMc09Jrg4P9o5NIWZbGZ5noqyQ/uOMgmhkyyCTHSYMvMIRlhtCnsNsJiSYyWsDJLdu8F6NqZUZM97Jt3mwX44XatyiaJiECI/uepgce3qT5QO+OPLVW+6lsgGf9Y8CWs3glJkCOobW57GzRX08mKx5
X-Exchange-RoutingPolicyChecked: 
	r7OiWs6nJDi98zAhzQKq/YuDVfPrEdpiaD0mWAGyrZv+ZthGImLIfI0HOFN00Ozig+Mvh9uoU/9QyxYrbJ7A+St1NYl2DObrm8UFYBcLkak9WDa5nAZbOYFDl0sjJEepaQNfm+1lPaumM6gDIlle6mZ7A2d70RgOQWyEk9giD4pm6zaQ6VUVo18uqufovfqSzF3HOtMSahHueUpiHsbnpF5R0M12FviqswPe4FUafUWeko/2J4fb93fhZ7EbaNp1S3wzD70QM9iuusUfAalfbsG6F/GnqDTUU6ZSDRI7nZQW1G2H5SS8+io8oEJKvHhp4VVjfARgs0aX481jqtnMSQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:11:21.0742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bde375b-acce-43c2-5ccc-08df0cb799fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5969
X-Proofpoint-GUID: GE8QcbOnBpjpoam8dAiceATv6FDnYSFh
X-Authority-Analysis: v=2.4 cv=Wqkb99fv c=1 sm=1 tr=0 ts=6a9e71af cx=c_pps
 a=N7UEZcGu6nKKiVkixTDHSg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=y3ATUOAXGIOl3jWdPNQA:9
X-Proofpoint-ORIG-GUID: GE8QcbOnBpjpoam8dAiceATv6FDnYSFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX0+oPzxNbyR29
 MXGtOV/EXZi74uaQb1Kh92QLzTDMGyzpcqz3UiafGGdBxgkR31mYxTK+T/iENNwaMharGMVcoIh
 UKmBeIB8c+8DDopOCW7Y1Ms3Pn5jFEyzACL/1QP90LNa8wHwlBBwd1VR84usX8B8PAiP6uQTaas
 m4IE/LXDghEHB+0HALfESI07y8NpnkVsLCLb37grYZ/mPiTQN+XjO2ZnzA/TCx7Xy7hISpDiqep
 bq0J8JXe18HKxNuCZp8qtVWqBThJUhQJ2qc3UpJBX1Gr9oOPQWdXo0XPBl8BVOJ2EvEET0Bg9cu
 E4/7PBjrUuT5m0+O7CsjcBSZzpnlJSN9s7GEQjb7kDGRWMA0TtrkFiWSMB9czyiC0BEFbBhowEx
 MkYts0eqC8Y3IoUyXDfaFon9O5SKQxXsGUszHwyjSFTG3rLI60H5f9h9mNYlBs+YiI5y56j34Zq
 +PhLIuYBeEU/IGnBh6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX4peJEShnUNaN
 pA8Qkhk82rjQrvtrgBuoBpECzKxn4cyE9w4XiF4P+ZyGXd0YRXifoEJcgZgDGSfVK4X0bqxX6Y8
 xLhzYwzvQneR3O4BnaXe5zgkn68xzfo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:11:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20338

Add an "ecdsa" pass alongside "main" for j721s2-evm and j721s2-evm-k3r5,
so both RSA and ECDSA signed boot images come out of the same build.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf | 14 +++++++++++++-
 meta-ti-bsp/conf/machine/j721s2-evm.conf      | 19 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
index 40d10f13..bfb5e1bc 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5.conf
@@ -4,4 +4,16 @@
 
 require conf/machine/include/k3r5.inc
 
-UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
+UBOOT_MACHINE = ""
+
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+
+UBOOT_CONFIG[main] = "j721s2_evm_r5_defconfig"
+UBOOT_CONFIG[ecdsa] = "j721s2_evm_r5_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 2d7e6ebe..4ce75e1a 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -26,4 +26,21 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721s2-evm-pcie1-ep.dtbo \
 "
 
-UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
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
+UBOOT_CONFIG[main] = "j721s2_evm_a72_defconfig"
+UBOOT_CONFIG[ecdsa] = "j721s2_evm_a72_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
-- 
2.34.1


