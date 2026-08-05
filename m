Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB68C55ABF
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 23:19:11 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8201.1785971948512847508
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 16:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Q15HW/JY;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=E18EXtz4;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HVnId2147849;
	Wed, 5 Aug 2026 18:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Aw+9o59Q4r9oi
	6/JFjue8MvZRuPVrFSRF5E2EgB1iGc=; b=Q15HW/JYrKsnfTB5RNMdULDnJKYwR
	Xga0aAjHRt9KhYBspeT4iyK9C8oHILgSz8xn4nIzA/F1SLW48EtfSYgZq0K8BGIA
	7DRTwJ3PfeY1q8fp7//Lw2DeZ/J1LStnQRW09zAkE6Lbye0wS7wCp9ADXh5ujBCC
	6xuqhYCoO086Qb/kF5RfGzSoGDMbXkXLdxzBgy1lCfZR+v1alkfy/d9uTYQtApVO
	N10b68rzc9ca9W/isx6Fx1zP4dYESjWYpHF+KTJ/PB5Sd9/Z2LYo0VyhF451v6So
	1/LfMmpio9hWnfFlkPJ2cHQRuajNlEbFTKjJCGsN6MtygFCVAIrvqw0Lw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fv43f50e8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 18:19:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1vTdVeKcFs8mJLvFclp+PmwuXlcbBXBoJfMHoYdY8sk8UvLef1ZImz3Rm2NrTUypQ8qjPxbiCUYBu+DrhwRnfwnqUK3NxzzHZ6rxbURA1DEHo6/pgjJEwG+YaFSe5P0mft3jfeJR1n+S2seT23GVXcEb4x9Qg8VN97O08vWCEBAxwmpnpxE3Dvn8oO3q18crnIhM2NHcKaPZhc/lpTT9R7a8tlDY3JGkM4ux2SEhHzm7X6yDHlgoppNoCUoiHiYGoVtaCzijoubNfEHfO5B2Z+64+xX8ivgjjF6BNXNTXsrgC2vbxOu54O0cI342ZmyFh40umFq5WDH1s2uD6P3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aw+9o59Q4r9oi6/JFjue8MvZRuPVrFSRF5E2EgB1iGc=;
 b=Ptt3QNnYL88xMW7riShcwKZd4cFIdtnDzE7viYa7H9aYwAcmgbbFPGOnp8DRpdNKAkvrwh51Ud98vHWPhoV2qzWd9hVYMkOwySrHgzmdhR3dAyYzODx5u3i1L54Re3iJt7NO54G4jKMcLXO90Lnq3QzvKYipbWlLlDfscKkJoYYDkpl/9UcUPnO2m1f8oLw+l6sCqyQ7PjRXWW3Ev52Vw4iHJ2Rnj+EeX2mpmQLDLaYq/3G0Mb2LxzSfv4elzW5agAgEAxwUfGy8TNJHYjKCLhFte1FA8KZH8r9x4AbaGmzgSWMiS4FXg7jlUkzjqjWv6pIkXYtT+tahgHo1dDF7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aw+9o59Q4r9oi6/JFjue8MvZRuPVrFSRF5E2EgB1iGc=;
 b=E18EXtz4PdaCmaGOudzQl8x7Ygpk3g7sGzCvhqQ0QMFaHa+ymssGiZBgI/W/9ThH4LgCrCGeTVNPLW2/EmWnDswIf5/MejC6Yvh2b6H3Xayt82Mi4eWkfH7OcgN50s+bK/lEF5YEDx/PnLFX+LRHzFWvDHugKzRxIYHYhann98kRt1qCHkUdkAR76qlMrg8/2SnHxYvRPWILDO/yxr2QE/XTImIHkF2yzs3CEVh93v+B8luLAVx9NGK8nnyN4NjoXcv9vSvkwpAH0gxFk/AyryIuSso9sQHDgM79NXo2ejUJQpGhctpw+LEyIB/J3iTHKzttHksYCqdgyXzA1ECf6Q==
Received: from PH5P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::17)
 by DSVPR10MB997915.namprd10.prod.outlook.com (2603:10b6:8:3bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 23:19:02 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::73) by PH5P222CA0003.outlook.office365.com
 (2603:10b6:510:34b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 23:19:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 5 Aug 2026 23:19:00 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 18:18:59 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 18:18:59 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 18:18:59 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675NIxDY3480824;
	Wed, 5 Aug 2026 18:18:59 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 7F7F72A65; Wed,  5 Aug 2026 18:18:59 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202608051433
Date: Wed, 5 Aug 2026 18:18:59 -0500
Message-ID: <20260805231859.1814953-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|DSVPR10MB997915:EE_
X-MS-Office365-Filtering-Correlation-Id: 84bfd5cf-7d07-4710-e9eb-08def347eebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+GiGF4VlGbk0HvJVeP6c8UUuNVz7pzlmCDAoe7GYSDVfbE1rapu6goKe01L5h7dyPLUizg36jOXAvj0/kcJ4ezVKLly/w4hllyL/9qEhjiAhqe3t1RGUploA93uisxT+H0bFXrRbmtYcP6qnTNjp4f2foQRcXdDBiE5O1c55yZ5MYgYYL/yYrXMsMANb54DFvZnUM5ieowYRdtQgF12MizHXHBtASr5WLTyGZrlgfI7VZNqMvfgzUHBpq2e7/3q7td3MICX7aVEc5JsPcKHusSEUd7b7FpFZGMOzSb7HLbZV6B+s6oumhJbf+pUrKBHdSTxyN5iibZd0uYi8j0udHmcnE9NjbIMNv8S+j4p67Oo4ijeoeK94X61//0km96kKUjpwJMGJ+81pWlrtY8fCtU6sxwSqFgJgFE0wB10+OubTdMwXdByEoSZt+4FWbl63jrIs/kvxlwY7vfQwaPhWxxtA7kxg2szG/j/FKhvsUH96a91W4xqUzc72awniL6/E2MQ4P1S36vHmv1RtMcaigkS9PLMXX7ei+JelTqAuxZGPnbUZ6kxXPUAG6E4NWEVY1obDvH/gdyWGc/1zsUApzwMa5QDkN+up6H8EKvfKyjMVYzpan0zhzBVJ7/huRMBEF0MUsv1uu00VefoAF5L4Clv6bMl9gfo2j8FIawLvTKiEJbpAlQwcKjpy0zB3psLe
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7XtpJo+DKQ8SnUPM38YOGoj+iiiG3WOriAYw+WsLDe3YXnO0+nrz4wuErGI5vRM8HdaX0FHml7ecIyhK8OKzsMQ9xkwV23HMPsZyzlgcYTKaNNOM5Al8XhewHcUXr9o/4k3dQh89CiFebHoC8nWm4I/WwBJa3BxNz+3IE7eBGGv6gpl74LeMlem9FIUI37KGXkQvpaWaCuWFMFQ/X+O7Tylg+5pS4Nvp1DsUjQyUqj8N46rHXjd6qePNsnOYAxBvc80jaFcWXeX0sQTL8pR7je91GaGuLa9oGLhQ7SIN8LIs32PdMIsX+9ohjnf5Cm85d6ZEkmnsdDprT2UhWrSeTnoSXJC43IoYZ3tMAmEpLO2pzy7vf1RxELWjsPuiPy2Tgknd8MDVFDH2CAODBn5undVMU3GCeJdO7FbP+MWLvnzyx8ZYbgRsmHx+vYNqY8BJ
X-Exchange-RoutingPolicyChecked: 
	UVvi08so55MT1IwjgKFW/p1lsAufHJaSQjODIn4Ky9+T07hD4zav8P1vQDQ7x2MdL+9llSrj4IJLo04/X24iIKmEvenLBN8htgxEG4sA7KHkU8K1Lvg7W/L2Fhn3tl/UcGVvt77Nj89aNSiVQHbdwVr0FeEvdKTB8kf3D9n+nUvosxLeItRApAh9MwQMFlQYyKBsHoTBqJ8lSiMw1IVVli+3ulRzsueLzHeTce7RBjQoPVZYHrRHuFhNNTsnWqa54i2Vjwi2B1KVXMJs8/zzQS4lS4cqKLvvNI8NqcfVv0+E4/B+Zxp8GAln7S1AV1FTZSHdznzInZfPmqkyq4+XSQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 23:19:00.6066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84bfd5cf-7d07-4710-e9eb-08def347eebe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997915
X-Proofpoint-ORIG-GUID: d_C1136egr7HwEvbSODh5rFnPPMF14p9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE5MCBTYWx0ZWRfX5wkjdFacdzbK
 yOFlCD7rafwK/CmGsAr15dZ4fufsIijIcSrFImrECw4fponQxVe6hMS0htHj1Uc2fDVFdAFNB9R
 5FdLO9OWu5mXJ0ODXWk4GtaxMnrCXqc=
X-Authority-Analysis: v=2.4 cv=Ircutr/g c=1 sm=1 tr=0 ts=6a73c4ea cx=c_pps
 a=48c6PaPq82/B1OY+thwv9A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=cNuy3d2XXKvVQjFnGCQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE5MCBTYWx0ZWRfX8lmaYUgBxzC3
 1+LrSuAiD/vW43bgyeZzMC3bifirbydaAGynSw2boeYKMwxqEVyD+dR0LiaoXECk8Ex2ywExx1I
 RT9VMnv5xqaXeub/icMRculA7WeWcF4DDUoBoGnwjoAIreAVmBS5uZT+W+gkL6ZIREyn70mJK1U
 GEZG0V3H5WHq0sI6I0hSztafqKuxy2YgxKCw1VdEspcX40fVQuke4fvvZx7RwXpY8DWWZsmHs56
 FtgHxWQtETrQgMR12DnEvD9cwX3j4GKujqS1X6V7zkcOTbkwmMsYWDOdlk3FLuosyrRmnwKRXb2
 Xac9SSRR5M7Aah5QSeJJnRtFhSR+616DXMQOQLFRMY7fr2W39M8XV7ZXIIK4Yo0h0FQenxddeIN
 VuqsfnTWT+CE9DSlSU9kZoHZS3crnXchh9jeXGfBUswj0z2An6PYCx5l8EGvv59wj8eQjcQrk+N
 tMdwfDd4VSdi2wGKc5A==
X-Proofpoint-GUID: d_C1136egr7HwEvbSODh5rFnPPMF14p9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050190
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Aug 2026 23:19:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20217

Updated the value(s) for:
  ti-linux-fw: TI_DM_FW_VERSION,TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=8de2d25bc69fd9dfb79e9a96940b0a1d6081198e..a69c2feb11f85c8678a09eecef5d05677efc3946
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=ea09c8fdc98285f8359e5faa2d4372fd58aa4165..13f4e50ff203b9581dec599a620b57bb9ff1ed9d
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=1c85543e02318c573c4bd190a7db9ab4f7e03906..43493bcb9d02b98e4e52e0fa6639c25d97eaab78
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=8715cc31cfe8a191ade660ff787fedbadcb187d4..7bbb58844e0ba096c6fc4f078fe20b5f9419bc6c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 932be1d2..7e2227fd 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -14,7 +14,7 @@ GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
-TI_DM_FW_VERSION = "11.02.07"
+TI_DM_FW_VERSION = "11.02.14"
 TI_SYSFW_VERSION = "11.02.05"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "8de2d25bc69fd9dfb79e9a96940b0a1d6081198e"
+TI_LINUX_FW_SRCREV ?= "a69c2feb11f85c8678a09eecef5d05677efc3946"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware-6.12.y"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 235b0b5a..deac7772 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "ea09c8fdc98285f8359e5faa2d4372fd58aa4165"
+SRCREV_uboot = "13f4e50ff203b9581dec599a620b57bb9ff1ed9d"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index a5b98b1d..eff4c1f5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "1c85543e02318c573c4bd190a7db9ab4f7e03906"
+SRCREV_ARM32 = "43493bcb9d02b98e4e52e0fa6639c25d97eaab78"
 PV_ARM32 = "6.12.57+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 0842176e..142e2f0e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "8715cc31cfe8a191ade660ff787fedbadcb187d4"
+SRCREV ?= "7bbb58844e0ba096c6fc4f078fe20b5f9419bc6c"
 PV = "6.12.57+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


