Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CD1C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 14:08:32 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12312.1785247707697792879
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 07:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PN9vh1N8;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=pwxohwRD;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDPb914118752;
	Tue, 28 Jul 2026 09:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=thnslOZ+Bc1sY
	FtQNk7r8wKLxpigPBfIJvpZLAVwZ7M=; b=PN9vh1N8b7T1bHtc9fNff7KULo0Q/
	tXN+CzNYTrd0XXv6awH+/Y1QT7juq3BVuA9lRHIoFBACJXVSRFxdQXkhSmRUrKpM
	42gb2dP82fSjBWM52ikQIrYJSSG4uztbKTjtkxYjuLHsQ7XoBK5RBo6k9kWDLFVr
	9itNKoOMj1tqCvw9OxdEn++brlWnuzVT4WXg69K2clB9Mo8eIJc6w/gsQTmybccW
	ZeH04c7l8BoZdOz6cOf9cLcDxYYooN6JdQtQJEjmQI6vRwjD41qEgVv1K2Ph9uoO
	eTEzGWKvE6gR6CknpLC71UbN06hkQBVD+RCBdeccuDBV3jARFH8BT59hg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpseb1k9g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 09:08:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4coxQ9R4U93AB4IkorcCCUxX/l2qafQVMY5mFnPlZSI9DQRvqTB5nfgc0q7wGiaD32IRPAU2tSi1q6m1ei74FPD0h7874HmC4JM7hx0ohjpsDpQHr9xiXAzFvVfp8LPIWqPWEj6JVV9c/PspEyuHlYuLD4pxyKOU3QVILGo6zCMjm7K1Gw1ptPGgbAbtFraDk6jQH2N5EtdD4rX38ijTYvF6JHxcxf48hBOWKTR5wT92HadTKm+KI2UUyVrxT7F9cqwcwYmdGbnz2b2euxcB838z1deAYF+Bv3K92loJyjLdGbNGr6Y9O53M/MIH4m+mIHliMhakxOhsK6iG0oxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thnslOZ+Bc1sYFtQNk7r8wKLxpigPBfIJvpZLAVwZ7M=;
 b=RvGtpGULw7sNXvYS7PTrl9ji2Vv7sIT6Y5C7VKNKfZWY0agO9A5CmKFgIq/UVRW2J3VpG3HwEFMwgW5Rff2FTzCxmMZBzfUuo+rpaJYUn5qvlABFZDuGIS831xHd/3dW+TpUPMCvxHfCNqN3tghO9S4ftGujO89swgb4BcIcwbrcAURlWhrcUFvSwN0/EdV4t6P1Os4sG6gezO1lSs6WxAqrguE8Q4BHdeKHVR+E+5MXq7/7W1LerjPk5+r9gw12tRazE1zkNSbEfbL04rCU0JbFSZcLD+MR0ZlU7YS3ij/lcKZ0d3nvCO1h10hsbrt0mt+4QfcwNi+MPooNRFf6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thnslOZ+Bc1sYFtQNk7r8wKLxpigPBfIJvpZLAVwZ7M=;
 b=pwxohwRDIjEfxVmzufy0+OsLO/vzaluPMx+qftZ3jzciIXNbw6Z8kIlyA6aiPefLetNng10QfFrDCWPmrOzvqWmoDQ62Td2APxA2QJ6DqHtwzTOLo/UFxsTh2PhP897CRrMBCddSqY3Q8+N3TPHzvrRu6EZhIFPV1DckJgtc1FY=
Received: from MW4PR03CA0173.namprd03.prod.outlook.com (2603:10b6:303:8d::28)
 by DM3PR10MB7969.namprd10.prod.outlook.com (2603:10b6:0:45::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 14:08:20 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:303:8d:cafe::91) by MW4PR03CA0173.outlook.office365.com
 (2603:10b6:303:8d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 14:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 14:08:18 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 09:07:59 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 09:08:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 09:07:59 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SE7xOX2819289;
	Tue, 28 Jul 2026 09:07:59 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1woiTP-0000000BxeC-2aVw;
	Tue, 28 Jul 2026 09:07:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH] linux-ti-mainline: Bump to v7.1
Date: Tue, 28 Jul 2026 09:07:59 -0500
Message-ID: <20260728140759.2850885-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|DM3PR10MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: e188d47c-05c5-4ceb-cdc0-08deecb1acd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cRMcXgO/I4/q0FIRDKNY5KGcDBsw925DedrhaTHhb8NuwLXQdMGDv60rUFFWRr4CxGlKRkzbu26OxZLUqrmNDKBPJmjS4vNLGNXHvdjbFjOqm0o6aK/RnCowYaMSZUtvr5Xm8llxIWnX8DPzMywp90AYwAXYDKRSRGL5nQ2V55GgN2KrGGexA/evNOhKdqXnbF5tJy9/XbotqDcz3C76uIO5LkkCnOXKj1qV/LO38jrVGGTmZdb8RkP/bvZPTIr8w0pTyRG5LxUG3k8KTgrfEiZkRXdkPRqdnSHRscrmfZYUvNrNLFL4WFgU5eP2+5QgykLmrfZe4b0bWR4/G/0/74tEdV1dgPpIzbLIh4wf7G1zlcCi6Fp/14jwpaJMvTmDcXh2TOpZDWAuS3Wzd9XlSCMI6sGO1KFZI7BschOlF2O+3P5yckx7wbooWV2AVYExAbLcDoqoC+iyQzNkWcp14VXeZCEVY/LASdD6GvSxIH3X292ZTG6E0riHZQHm1IFKSlxY+dAJFGh9IsuA0NMvjLr+hqsKVzbcNCbGKZKL/04dXBH0F55sE8j8BcvKtiJ4zBafOztJ0Kv47338sLuXTder7Gn+K+LGsbQET8dDN8nUCjlW2t9VQsmqql2c7Bi5BLVcr8DV3KiXkK8MpJ585OSHkYOc/Z9Rmf1aYnZ8OntIVAhf21E/o4R2T5l4x/Uh9CBOkRZZaenQaW/p9EzHqQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EzSOemjiSIbioMUdJFobUSuPcKoE7sE+yc942kD/jFwKWIgA7gL46GxEH7qzXAEHEzgoeIzuKNT9Rb/PmTbwpFO7O+Qu9CHgjwR/p8OuQXLvlLl+kp3PMZko7B91ogPvVzcdpt/0bmA/zs4ipImvV9SdKwiTZQ6TzZKNxwSFsBf8Oqija6ZGc80GSbz/nIoFV1swUwgaD9vY2P7KccUvQOgjQb9xfIUEC9Rjl/x/uIJudiHNBTuAf+mtXHHbQ4UWrQ7Dsc7vEAj9qttmmEzXszD9zaFlXxPxRkaFCLHvKTxsk/0tnwcIQKvbekessXvWudSjA1YKGDMr9tZ2kcg7w/7WoxbMmF+VNSl88DHqJyd+wqVFW31mPIjA6Fo9HLmHuZgj68Zxs5Ge7obDtXCDXOC8+lnqkHUHvyPfLE985Fwy+Dg8PAhL65X57RB+EDID
X-Exchange-RoutingPolicyChecked: 
	NPxfgRduhHZbRB7LwinJYRJ1v/1t5n06CEAikFgYMqyRN2YMSDTc26fO0EZ8sg0Ejxl4lkTBmKVlk4QhSRf2RL7k9HR+HWAipwn0XDDHgy7lYuhL8UvzFDeAm3RZ5KTF/TCHpySDHHRNwAcYGxwXf+jJ3cc1kbmts+NXh4M3NJrzPABIt0J0W9M8eg7SnzS0gtK20ty8Swln/NASx3dj8tzh4meQ7VwtwzXcU/2fHbfgwv8qBlQWIgicqNN4lS6jR5skbzkl+NGFPjdg10mv+XD4jsnNrKbrE3lH5DZsU2bFcWmkJ6EQRLzts76MKw9obfsiOoZgvh1sOHfaqTbziA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:08:18.5013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e188d47c-05c5-4ceb-cdc0-08deecb1acd6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7969
X-Authority-Analysis: v=2.4 cv=c46bhx9l c=1 sm=1 tr=0 ts=6a68b7d9 cx=c_pps
 a=QjrP5IPIVlaYm/X31SuGbg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=jVrr7ZZ3BqIMKuuo6OcA:9
X-Proofpoint-ORIG-GUID: fedezhhPhfd4oyqWPZo9OVJts4p5edaC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX4TRhNAHwgkC6
 9rQsJxm4zWm6jEw+VBo1XalaIXrhJKPXp3oNhDsC7BA79WyuAggr7RwcbLRPJh0A5VaN+ZN2N89
 RmyAea5+7pY0f8PshSWperooTm3YKLU=
X-Proofpoint-GUID: fedezhhPhfd4oyqWPZo9OVJts4p5edaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfXwNsx7Hj+IQCw
 ARBFX7pwi1ArSLrk793ddPRhLusauNNyBeCbHaOBYmQp6ZDNK4ero7coTUqcl0RBZiwSBKdx7W1
 QkUFcyCbsWA7pDYh2Y+k/h8oaO5BD5RsKxDImobjmfOcPn4ZU8JSoyHXUyviXKjbTF0fckt9bk+
 V7fodVO0hRRHNs9/3WkdLEWsyhgUsdcRafhN9DUiW/gfIAWsOnDARLJeVkKI8jXBJAGRt7T2+uj
 2SpWrXAT3RQyTat1kfkKgR+0dk3IkRbx+RpcTc/9behizy5xjpPKsilJd13pAE1L/muzPjkZGn1
 E8VYlyjq0T+Ei3KkF33ouqMUY9wqz+WftK5/bp7ZtOLDJ0GQF5OOvafmeYpm8KJLmwjKZZHSM6Y
 y7ihF1QDDvV7IFcys1sXGyKxUHGrx6OI+WJ5Je/E0RXmX6ldSXhPtM2zfP1fnBteWUKywwhUQfT
 1Hm6/tBWKaKCeILanig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280125
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 28 Jul 2026 14:08:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20195

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 180a5d92..0721e582 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -13,9 +13,9 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
 S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
-# 6.12 Mainline version
-SRCREV = "adc218676eef25575469234709c2d87185ca223a"
-PV = "6.12"
+# 7.1 Mainline version
+SRCREV = "8cd9520d35a6c38db6567e97dd93b1f11f185dc6"
+PV = "7.1"
 
 KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
 BRANCH = "master"
@@ -23,7 +23,7 @@ BRANCH = "master"
 KERNEL_DEFCONFIG = ""
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
-    file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
+    file://0001-arm-Remove-build-path-from-generated-mach-types.h.patch \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
 "
 
-- 
2.43.0


