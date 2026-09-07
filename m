Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33925C79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:10:51 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29673.1788768648942614348
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PGWwnBvt;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fIiQnK8F;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68775qns2615419
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Sep 2026 03:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eChQ+1LApAJRNUEcXYIzNV3x0tzCY0GOsEWVa1hYz
	xs=; b=PGWwnBvt7z7TFCez88VV5oTt8sIwjj2+t3Lp3xL49vw9b83lUTij+hseJ
	9o8jEh4kKDsQD4t/cvby+DgcpDXSXhND7a5XydV+iEQkVyTbig/riGT1zzXQ0Mz/
	Jxo4wuyKdeEkYY2JZsBlYoqlXp5QeWvwzO9xlU9IakgvFGoW7pNjc42ykKGxauyn
	iNhk9tXaw5DPzktZJ2z5uNRmimVUsHshoRLdOPaGPIZlMaMf9Brej/JwExsFamRf
	2KXU4bkRzrdhSKnE8MwSKLidlFdRd1OrWwPUEy+XhxNV+MDi9YBzh65p8kXvq5Py
	4/y5USlp7zhFXQaFzQVxo7Z5iZSLg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013023.outbound.protection.outlook.com [40.93.196.23])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gh43n4gqx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 03:10:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2ri5mvT+0jFdiPYN6AzUCliPr9rUQjktt6cT8MDZzWs+mJGeBP32mjOBud7szHZ4PxUqmAd0makrns+bcyEFCVnzNdAKkMkUcsM34UIc0ReLx7rx0DZWsXOpv6L4SF6Eq+vuN08Mck9GjTu2BXAlohk+7gsVD4RznWB8Qy98OaOG6P7yL0T4dbXGyIB5/1M4yY98gdg0SxBCW6oh5+hfQmyw/7Bf+XDK8EnO/0Hsd6Xi+MAtJkj8tswimxG34jGQsOXzx7oq+zweEe8uCnByD4shYO3R7jR3vw50l/TVQw7OZKCgMdS6sRPtxhlCln61DvNl1cdETqvbPVtcRqiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eChQ+1LApAJRNUEcXYIzNV3x0tzCY0GOsEWVa1hYzxs=;
 b=nZw49n+cKttxtJpilIIHlqwP2jiaOZS/ieUpv1b9eurvzgP1MDT8ZT0+1nVhdv1qkCghgKKZBrhQS7OmcqpLH70f4mePMqVqV2NSQRM7jk1R9HFzGbNxF3EuG6zxr2ei/OdUSBOoNO0NyoUSBw/iwuHKOZK88/RKZLBTH0QFgUSjama+gvRXdHDIxSzApYTyg5VV3jrkDHBrj13FBXERJlF5BTc4wpDO7kR/2UvtYN36hAHhs7Wee5NKY/wBdUHnsCAAvstFgVBCsH3wlM8j05mHPBHDysPOXIXe24N7aXETGwywWnEEIe1TNqyZBw8BZojml8yBypDtWXoA8N7oEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eChQ+1LApAJRNUEcXYIzNV3x0tzCY0GOsEWVa1hYzxs=;
 b=fIiQnK8Fyx9XgBQ4yOIDDLImGYrrjlqGomcbuVyi+HOM2FAUrsR/TRzxx4kbdEz8uoh3C67YTjgmdhp5I73XFQjKKqjxGRO5n+wxLjxlL7x684lCmMn7HDBYpLYdN6bWWdy3gHdV4UXVW2ImYI+km/RKC96xfAQHtKDzatxvric=
Received: from BN9PR03CA0589.namprd03.prod.outlook.com (2603:10b6:408:10d::24)
 by PH0PR10MB5755.namprd10.prod.outlook.com (2603:10b6:510:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Mon, 7 Sep 2026
 08:10:45 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::70) by BN9PR03CA0589.outlook.office365.com
 (2603:10b6:408:10d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 08:10:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:10:42 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:26 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 03:10:26 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6878ALMN132583;
	Mon, 7 Sep 2026 03:10:24 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][RFC PATCH 2/9] conf: machine: j784s4-evm: Enable ECDSA multiconfig build
Date: Mon, 7 Sep 2026 13:40:14 +0530
Message-ID: <20260907081021.3876876-2-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907081021.3876876-1-a-dubey@ti.com>
References: <20260907081021.3876876-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|PH0PR10MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb7c2e6-1412-4dab-a711-08df0cb7831d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	eKkNg4hiDZe1rJ9fqlrXzfjC3DuZxfdFs3zCwsy2ppSZo8N6g6nsx/nq/cGbb4IfK5kznFG8Grfd9BMgYR7nwfSRi1+mb4tjcGW3i95E1FniMDcE4EBK96M1Iro7XBv+ZRLUNuhUECr1sZ4zDX0IMUnf9mDpofkjTUeRADL5FKNhFOIMses+7JVbhjXRJ/n/pyWJkeEYfB9jqbkk6XNJ3Tda2mDvCoim8OyaQhK0T9YdK+N2xB4lWD/Mo1QU0jXz3EcwAtiEwFMjPCA/onOC9P3AZGiemIEqCBggFflJmll/zW+Ogw++EmT1HOI4pmGhg3Z7jh5enawu7PJmxQ7NuKVqVGlxUMStRZv/NOEXidbfc6bcLi+URFwjZitHiLMxCnolNkuoI03nBe5wFRFwfWNzcDSEoMfH1aUVF0BkcCwxsocbRMBfr/JB8jT0MKq+43cbQyAf3zmSJXk7tBQ9tWYk83vtMkjuBNrRSpnRaK3qkwT7NR/U0HQUpG4obpKLzj11AWiQ3fLQejQViH0kLuoNfLwJTrZfm6D3VKHoI32qL0dWcsvE3c+DNoDUksoE8kDV/FG6v0G1x8lYoBYRcPN/H1gsa4IgEqUseQriwlkQG9wX9d0pfzyIfn3jZj6tUjd0UNXNXTm6ayYD30ri6hNUKc1qaUEUqCyEYf7OKSmwscMKhPopom4AASubSpb50X73o6ysnT0yidLhKEPSaA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7JU/aHbspfodPjL+KV+eRZXv9z2RPqd4XXfX1MbLBIjDwmvGw2iBuhHAtIZynx14KfbXFa7TVbdVsHZ8wk9c5HOSIzH/cN2+tJzMJ1XvXd3t321cpRYItit1wv1k/4zkHzjOBCJb1TM4XQtlfkYF0S+q3VKtozKdRip8V++8fQib5z2A6VMgVDThfBgO1q4NQYGFlSE8JLe3S7lNNv1fbqd7MUwYRR9nNTsqOewUbg5Gr6pxJD04iS9oR7GUdTU8ySzrSZ3iLbQ5jVC7SqpNfYvfc2xlQTKScobcFSSLYqbDC28hpY7kXZ1A6q9+QqBOgeH06LWjb+HLJbEeHuags2jmGwb8Vov8lDmA6B2F8Nl6TDdU+p1fNmCYa1/Z+hRCCl/w+HV2sYkoKFm831pg515guRUkS/wOqnfk+EmxTuXYWqUVx2q65e/53ngNypau
X-Exchange-RoutingPolicyChecked: 
	Z45+FfsMO6ZrlJTV+79xpZjw3v34h1Z0Erg3c1dRBQvFgj0UjUG0XxzPnIhD2v9Axz/6ROyJcRblgfXYuUzZY73kxi0juAbqx1DpLYn1ifZW0My/I8WaJ2hN5dWGr3woNjfXbnfbOie1ZQRP/00++MBmVfkcs4OtvSNdMZ4NjgnLir0wM5uj0HozJIKvi9Tx87HuClBce67bhkVU3nzKlhA0F2ryHjsyvYXS0uwWMdHfJ4I2NRPmJfgg13KCQ7S6x+dHoxj5Vvl2fmbtCCWJG6jw6/mS40dDrUnknpqV9vHUfQZWNUeEwwYBZVfBPdHNGWW5yyiqItgESLM103+vAw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:10:42.6961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb7c2e6-1412-4dab-a711-08df0cb7831d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5755
X-Proofpoint-GUID: E18ghrDhfMdt9lfJ9wDuOarLyTRdOyJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX8eT3Oz+jCkPV
 TlR10cf/JfP5+55hUmBaTf7lyVd4svjthIIjR+m84wwjDwg17hwO5NxYB1PLwZSmgaiZGZg6cP1
 GLlnuI96/vn8NNDIvNcourBSnx+X3UM5qEG8YJnl2YxpI38TO0Zs06SHlgaQs91BaT1MpKp4ywR
 snmx6Z112aW7L7HaSajhqV4H/6Z4ww8vSWBVO6nrYbhwIMsTfsNTA3dtrqYXvKbppqEO7lZU01W
 7PrWHu9OyIA0DxmhIOuy2x8R/yer1hRFRZ22doMVZW+mRm6b3MjwTt8T5GUzkL1Btq7VgF22H30
 I2GE/c8YMN7/3if0OzYT6BdzZufxI2CjCfgGk7LcdL8xh+spDqmrzEh/ODLY7RwrIbQ3EpQfwZz
 nhaXnySQvTLawu8lCajV6bnji+lCmChkAqyFS/CXm2AoJ2v6aJ2bh3Da/ryaPilKO0fDyDjA0iV
 MTC6lngzgds86UA2DSA==
X-Proofpoint-ORIG-GUID: E18ghrDhfMdt9lfJ9wDuOarLyTRdOyJS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfXzMXN84/xMjYt
 MKoruZ0Bat8sMOvTxFX+RlD7MHMBRBi9OAm1oJ3Em6ygcWVhvSkq/bKTuhrX05TF1OfCXeK4XA5
 GcA2vCJ2dzb6RO46urL/LcOkVlPQFNY=
X-Authority-Analysis: v=2.4 cv=JdSMa0KV c=1 sm=1 tr=0 ts=6a9e7188 cx=c_pps
 a=iHXbSHwDNs+yH6wS+48/mw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=-DClDzS-CbWHGkJ-9gAA:9
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
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:10:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20331

Add an "ecdsa" pass alongside "main" for j784s4-evm and j784s4-evm-k3r5,
so both RSA and ECDSA signed boot images come out of the same build.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf | 14 +++++++++++++-
 meta-ti-bsp/conf/machine/j784s4-evm.conf      | 19 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
index 754eb5f6..6bb1592c 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5.conf
@@ -4,4 +4,16 @@
 
 require conf/machine/include/k3r5.inc
 
-UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
+UBOOT_MACHINE = ""
+
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+
+UBOOT_CONFIG[main] = "j784s4_evm_r5_defconfig"
+UBOOT_CONFIG[ecdsa] = "j784s4_evm_r5_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index a88f6f69..351094e0 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -26,6 +26,23 @@ KERNEL_DEVICETREE = " \
     ti/k3-j784s4-evm.dtb \
 "
 
-UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
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
+UBOOT_CONFIG[main] = "j784s4_evm_a72_defconfig"
+UBOOT_CONFIG[ecdsa] = "j784s4_evm_a72_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-eth-fw-j784s4"
-- 
2.34.1


