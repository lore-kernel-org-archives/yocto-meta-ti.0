Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4807AC79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:11:11 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29699.1788768662854195997
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=koxWpk8P;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=D7ulwLBa;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68775viR2615545
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Sep 2026 03:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=cO2mO5LwcZQ8Qhn3xAGCiGfYtQhirtIFeqIFXvd6t
	Jw=; b=koxWpk8PVF9Jd+iO6kfjDkkanH7xmsVyMt7/3imk+HXynqgeW098GSxtb
	/cFyJzoufOhQFK3C8ofrlnPuM42/dv3yojKiy4rmqGTF10CqrbpLDVJ4vbfPLMCt
	Ks1Bf/VUI1WviII6PrfnAKax2KcYpk2vtOuZqjqptIY2zqbB6DR2MgS4G7VlKIwU
	twP3ri2jAwhqH2aRTookorRVeQs/A+BuS9NKSL44hhhBYwjhqhwSWjd88ieJJUfy
	ESQHzDyAIgZmCI11Os7BGrQjRwOKdTDKC6UbxUVB4Yt25rfXOX8SSS6LGF/9tlKT
	GL5BgLI/llh/o/gj6p5eUVTG5FYgg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011010.outbound.protection.outlook.com [40.93.194.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gh43n4gsv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 03:11:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MltVCEHiSVutwaAxm7VdL42af1wPWjFKwdvtN0k38Lq1CtOkm5/sFZrsQZCYx901Oe6jIu+jz9SsX57dBg0+ASgLN1Ei9dT9O7OXj2hZD/8baC4fx4pc130Vr+PmU/YqMN21e1yadraHwFLwMXahEcK0miv/A7ug/wzVSNBlyt3h109K94ZbYnDz9AiPtdgSV3+RhQIitfHM9tRZ+GAZU29QTwMXfizM8Hm4dQ0Igl8r2Bc3A7PBSAYffF6Q7GlKRNQjjsjyuGIBm4rohmUOpGRk13G/nEq/RmtUv3ZWsVPM3d3gEUjn0zKHnmXEgKwgbj5HMgKZKHGwPerm8gILLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO2mO5LwcZQ8Qhn3xAGCiGfYtQhirtIFeqIFXvd6tJw=;
 b=M/Z7uCEHQS6O+cx1QPdD+jLqQTY+s1HbiiMfS1YvIhI6E8qlzw2RgoaY1wTz/1hurOmrZPptUB3S5Zzgae8NdTMiyhtpAr9QZBxGTFHR3wi9MmVejbLSsU9AQvoIJT1QX0hpox4iNVjzAc7IoHYmBQ88H5zHRDyolAu+xp8rC5eplfEoG980kltiGT/RnlMVpufteaDcUeY4hehHFhvyIQ4PUGdNB/Vt3ic1Y+Xqn6qdjo88M8udsMqsy+fESBAW9Qt4KjzOml5Ua/S3j6ebt5OmvJi2bpHbQQOfGYB1W+sjJjz4rT+jkx7lAEOmij2PkC6xHybnb9sEgJLHyWoR0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO2mO5LwcZQ8Qhn3xAGCiGfYtQhirtIFeqIFXvd6tJw=;
 b=D7ulwLBaXpuS33H0MCTp9tNilwlEZXzAuqaajPzEL2ngHAUMPJ5NTWGojS8Akj3fefnEyqr4a/H4zNhL4x5a0lPxdvimbLIMv/yC/sSJHSgBBQygriNd9P47BZu+pbSHdjgOWJG2IEwZRq1bQUnEs7+YrTnoJwlHGK9w21grHtw=
Received: from BL1PR13CA0119.namprd13.prod.outlook.com (2603:10b6:208:2b9::34)
 by DM4PR10MB6181.namprd10.prod.outlook.com (2603:10b6:8:88::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 08:10:58 +0000
Received: from BN1PEPF0001854C.namprd05.prod.outlook.com
 (2603:10b6:208:2b9:cafe::2a) by BL1PR13CA0119.outlook.office365.com
 (2603:10b6:208:2b9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Mon, 7
 Sep 2026 08:10:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0001854C.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:10:58 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:40 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 03:10:40 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6878ALMT132583;
	Mon, 7 Sep 2026 03:10:38 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][RFC PATCH 8/9] conf: machine: j722s-evm: Enable ECDSA multiconfig build
Date: Mon, 7 Sep 2026 13:40:20 +0530
Message-ID: <20260907081021.3876876-8-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907081021.3876876-1-a-dubey@ti.com>
References: <20260907081021.3876876-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854C:EE_|DM4PR10MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4733d4-1a2e-41b1-f7be-08df0cb78c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	Z3W/Ep6nsgTeSp/jHRVJ2dsTmddV/d1aTgH/HoqmNFuDOhofxl5riePanhlHWh+3mEeyb4+MTc4Muz2ASs6ovpUo2rGZeJiacuVPWWv9h8Lt8NcKxvRLqwjF9b4LQikvRuQJRhbKvY0bqUv8GFrZRK1s/TIEApkisdhnFWvLx48jTIOzmDmDItlJtjpEES01OMque7RH37xERjfKnaAmdNFxcBrFKlRbX7kEa4uV1tcEF7ztuH3H5wumJT55rh6MT+Yx/0KaueIMrPvcwHdfV/QjW/mzarvmJHvwkSF4f+bUQShAomR6qA6YCD25tGvyweRamisZ4HPKZkQVYIZF8a+japC7cDS5tlPLfR72i8TAk4yKlCJpYQNL04dYeXCuKuWatGdjHU6sU9HHv3PzcFKGxBmFDjmPDP2QeIg3ZM85PbxaozZ9CMc66NXCk5vS5fOWXB/N60NHSY8IBItlk2CJfvvJQFRibvXJjgg71qA5R5il9mwq53cMEFQjgIDU5tPq4QRq1wz8fdF9PSr/UP1yMUOMpxuBlm45uIWXtLSdg4oWCrqLF8fKSdpL3LIxCC7zJDWrzsfV9fJaGAgQ+mwHQgozF8+0lfWIgCwXq7p6wFcXRGgZQFalnQ3FErqvowcSX50bMBUqJYQdVPcXQlemyg60mxpk5Xm1YA25oQbJOYPjVAlHAb7PVOQ/kLlgVo5YoYhhH437o0AyE8P3eQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xB7l647Gcnb8+uBamgxyQTOmwYFXGC1Opi+QyDR9Y5HTF5G5nQ+t5f3PfnG5ixVwDedc5sxaxi5BFhjomM3kYYTK5pR3/R+Yhez1U4vtQeqkl5GCxfQVy3thVdP91HSKPcuTCjl1RtVQZgOkIpbfU/sUBs88FToabmsz/eT4IUulUhLvHbJ3wgkQBmkNr3K+OJBXD/CnBjKhHCLt2kQy9M1R3eafW/hBI/KgI7iMmTxXkCxQCbjYejhjAgPsAPGHwu0XMddT8/55HibDG3ZGFLFCi83+6jqa/VL7nZP3r98kkjVaQmhZndROJxVy1L2K/yrJPrfYSyTokE36MnxUcU9dsB147q26Ya3Eql2ZvWXbyxXyx31LktU+7kc2yx5aZXUhTkm+PhvJzHbE5M85TMnxaFd2YSnDAeBPCr0B3lV1jUWAKIyAZm9Pcyb8vcTn
X-Exchange-RoutingPolicyChecked: 
	JdTmaQSBH+7ed3ciiVJRaSBLvBHwZeCFbuJrez8giz/i0OXF9oWFkrMtdBtSDlnIcHiMQYY90wA2RsC3DbZlpK2OXQP+sPnkPf/GoBpF3T/pYGOkfaq+MeExovHlqTIHZ0cwnh31i5ZPoODfAbjyp95OlzEBxvszrWj8h1P22KTcusexa/F1FuPln4NRVQwVBk0L0i5ZuWEeomct4hXk/cthm9qnq1xGjl8/AwydiJyfRJkkwcBQ4NQKnUB3lowB/kkHgWwW26Pquiiq/bRK4jzv6HKfMt5IKpxzJoPkaVwIfe7Jl8QMQJKW+L9omnMiDD1DJs/DcW2TT6Tq8bxupw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:10:58.0693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4733d4-1a2e-41b1-f7be-08df0cb78c46
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0001854C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6181
X-Proofpoint-GUID: lTrXy_oKun2ZKujCAe10a2pX9Fyxkfdg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfXzGLAOjfP7Boz
 11jA86MId4tWLjxsb6QcD58tXNQBb4F9VyNTjm69KUC6+wXITcGlRaiICLsgQFzRmbxqhLY86QV
 h82eslASaMsBuwgs6dC9ftNko3jtglfykrPYXu/nGxDcY/w0SNjXthW4klCnO7Ey9CJju4qQqzL
 W/TW+CDQbVKrebZdmtxGK+Ed0M7ZbmnYfSxzYLFY8/8bBKvWYetVwdQq+lnfxJGXCZC3g/YirNZ
 nV7t/mVtEBvvK6NolHbHZ1oOS9Nce64JweorUCurX+wgyKnqNl4fnx7L3j+HRfhXGnIfn3E3J2W
 3DcazpatEhxjMa75xjY9aTp10fhriKYImvy/iZLeKFfkHsr0HvfLvsFfTlPSIfMWCSK75RSoJ/j
 AgJipojm8EIs+TP9Izch8ztvBpnL5Xxpt2IGSTAAu94adM093lXcneBiQfM/637xTdQMhYq2iCW
 Gqst1fEIaCQz+GG7axA==
X-Proofpoint-ORIG-GUID: lTrXy_oKun2ZKujCAe10a2pX9Fyxkfdg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX0iC1B+lmxXk2
 IxdZGYH0hQtllfYe8tEM26rr5dHGTbrs9QW2mFWOnvKpQL126qOQeDQY4dQZ0hFmCPEldKFoNTk
 QuTaKDSSc+MDsrPYIx5Q5j/rfsU11F4=
X-Authority-Analysis: v=2.4 cv=JdSMa0KV c=1 sm=1 tr=0 ts=6a9e7196 cx=c_pps
 a=PJn3dW4q50A9PoMJtOr6Ng==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=KL4W96eIwhoGK6plx5AA:9
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
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:11:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20335

Add an "ecdsa" pass alongside "main" for j722s-evm and j722s-evm-k3r5,
so both RSA and ECDSA signed boot images come out of the same build.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf | 12 +++++++++---
 meta-ti-bsp/conf/machine/j722s-evm.conf      | 19 ++++++++++++++++++-
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
index 3cb95142..947ed1a4 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm-k3r5.conf
@@ -4,12 +4,18 @@
 
 require conf/machine/include/k3r5.inc
 
-UBOOT_MACHINE = "j722s_evm_r5_defconfig"
-UBOOT_MACHINE:tie-test-builds = ""
+UBOOT_MACHINE = ""
 
-UBOOT_CONFIG = ""
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
 UBOOT_CONFIG:tie-test-builds = "usbdfu main"
 UBOOT_CONFIG[main] = "j722s_evm_r5_defconfig"
+UBOOT_CONFIG[ecdsa] = "j722s_evm_r5_defconfig"
 UBOOT_CONFIG[usbdfu] = "j722s_evm_r5_defconfig"
 
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
 UBOOT_CONFIG_FRAGMENTS[usbdfu] = "am62x_r5_usbdfu.config"
diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
index 8d69a23e..97b81bd7 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
@@ -15,4 +15,21 @@ KERNEL_DEVICETREE = " \
     ti/k3-j722s-evm.dtb \
 "
 
-UBOOT_MACHINE = "j722s_evm_a53_defconfig"
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
+UBOOT_CONFIG[main] = "j722s_evm_a53_defconfig"
+UBOOT_CONFIG[ecdsa] = "j722s_evm_a53_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
-- 
2.34.1


