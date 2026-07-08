Return-Path: <danishanwar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E5BC43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 10:41:13 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5599.1783507272944589818
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 03:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KHDmb9I4;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=a0KzWnD+;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: danishanwar@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6688AcoJ1800209
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Jul 2026 05:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=XU5Z+2tnZVo7d
	vRSQhO3k1jG/2QHyNLr10iyZOz8TQQ=; b=KHDmb9I4dVvMKRcxyMRZo6bCpzqdR
	gzX/reWR10Ermn2OOtlOKuIlgeQe/VW66w5Mg9iGQUaJCXfC6qnY3NjjU5CLKHOX
	GX7HmyKGiElK8uR17bEuAPajNY+N2lJg7hNCzJdILVkYPlv2h5k5NWXmuf4oLxkz
	kQ9boQgbunsgWXhUbP+x8zJ4ZO2z+1V1Q6uxz3iQgr5skGhnZv3rkWRNU+XlWP7+
	TZP1OlCXj1PtLW7+aI+tEGXBACt0EIOxOjk1CGJpoKgKKHqhSnKmOwusypXRud54
	OKFVMrl/dpHRhvPfskHuopo3+W6qwgCDYmYxPRwXFVAmYt87Upid+O6/w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010001.outbound.protection.outlook.com [52.101.201.1])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f9dpxjc79-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 05:41:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9ZptOb94WazSW62Cdhl4wnC0/ngBYNM8Da9+TDIMM8b6zJUP0VP3Fa06VwtKZbrkPwLIkRA8Eb8YG4qjicD788X/h5su10KmU22SYL8BE29CCihxvBDMm1Q5JJsyBhQMJ0ha3lcW3ZKC0G9MPzNianxOSnRtS5ZKqU0VnUcHT58DhCwYy8+Nl8ryLCAOV+MYm/NZFtSYGhyiVEJv+ZLa7eLsufg8wmY8gXODJ/CjPyA1WmH2CIJ4/iCjV8kMwRQBfHZbUGT1WG3Sw6PpTAZTxOsh0Z6C3Zv4kB84hsfWdjupuAHlfwPQDV0ue1+M0U9/9MzBAuoZ5C8nCLKgRj4EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU5Z+2tnZVo7dvRSQhO3k1jG/2QHyNLr10iyZOz8TQQ=;
 b=nH7PphJijGFFnEBbzfONQA9kYqwgJXch4vYv8yF/+bvReI96LA0WICjga3keGqqNS+BN9bvI22dWBralUaWYx0it9HRVdvXVSX9JIDceb1Q68foLMhIigRk8B+KDv9njXy2qPSom28RmUK1OQKm4SFzaSIDzAt2UumdqrSgRKUcVaGLy+WhksYiTEjMOZtToE6ffEMekYQLaZVRAVp0wbeqjlmuDh8ETqqf57dzxe7ZIDEXrg25mje8iZfNM40ZrqBA2/ZBMvUI0yLlFZbfFOqCMHZkfezmgWCEzjppMXuMUDexybdhz5kdAswBGYeEQVrpJnFf/OEQsLHwyhcGrtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU5Z+2tnZVo7dvRSQhO3k1jG/2QHyNLr10iyZOz8TQQ=;
 b=a0KzWnD+yItEDJwzn+N2cxvxbkgPvaguXAF3DOsBWn9CxAIPnlb/TmA78vrAdaMGG3+z2nyGP7zx+GnvhIB3XTPf2BZjXXttSaxRHGBf0V1XIfRkAjpvCCSLfkIpKD8O/HLYsnfqm0RTmeVdJjH0f0NnH0vLV7dAL4eZLd2jww4=
Received: from SJ0PR03CA0255.namprd03.prod.outlook.com (2603:10b6:a03:3a0::20)
 by IA1PR10MB7488.namprd10.prod.outlook.com (2603:10b6:208:44f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 10:41:08 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::20) by SJ0PR03CA0255.outlook.office365.com
 (2603:10b6:a03:3a0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 10:41:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 10:41:05 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 05:41:01 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 8 Jul
 2026 05:41:01 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 8 Jul 2026 05:41:01 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 668Af11S1518332;
	Wed, 8 Jul 2026 05:41:01 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 668Aexko005903;
	Wed, 8 Jul 2026 05:41:00 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <j-rameshbabu@ti.com>, <reatmon@ti.com>,
        MD Danish Anwar
	<danishanwar@ti.com>
Subject: [meta-ti][wrynose][PATCH] meta-ti-bsp: Add prusw-fw for ti33x and ti43x
Date: Wed, 8 Jul 2026 16:10:58 +0530
Message-ID: <20260708104058.1287917-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|IA1PR10MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 2132c474-79e2-48db-f659-08dedcdd69fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	MKoFWHk205H6zvlj9k0I4xddTWbnUSinpHPAqTLDsZ33JcajOwqTyqHxfy5d1ITiegf2av4Gmpuy4Gsjx0U6AG8FDr+Wbhl3eYW279H0dvTAd9ZzpV0XMeODRtXnSFoHRl/S2ATkKZCULfNheMntelh/5Cm60gHj8RXHTmIuiGbdBCZOn0z2X4JfpdmaKe3fjoKBS298OX8I8ByOA6b2biUgaWRH8CaNQElTdwgJBOQjVs94Exl6zBFthHodXKGF4jmrwSegxb6Zn+zHR5iF6TIWQYaICiVHZtApW3aNkumaC/1T7XqvGbn8if5DBQwxAg9xSlAcejhDLb+GdNA/q1wAxCK9OtoudcLk/c12RtcVstAPb8LUjl4aiNAZaJnRxzJHBPvG9IKY+X5A5wO1CcbX9++a2GIo/MmT6CUCHP1/sqGEWMUQCGNSHTHrAM/DvaHJ3K0tmy1jzjNcvf8xSn0vzES9q+bcqSgCzxQ0+vuaU0bONlugLUF00dHYgR4KF3k8+kAcNAyoF97ky5w9zvk4Jxq8ziZq/8TBBD1d44zub7t0KtBL5PL3jucbOZ71ts5ymm4GJF14fDW/dDT6VreVEowPCNh/fw0r2iWdkxXfllHezt4sdyj9YYfnB5Pe/BoAC8DE/LGenzTqsoorEfXEOhqkTasragzvX6B4WUBI0E/IXHxtn2y80/5lCQvWQexfnEhxZAenH04YlGr6oA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xWioxPRrWWLvafhBBmE3q4Xs3d25dgKqGt8OYVkhczTW9vUXHVt9hDIcm0d98+U0A509tV3+mysbKMqzjdlgoq1/v1Vco7HmWbepbEAe+rObIQXsHs6n4kaL6Ohjb8EHsQKd+UPwalp2S8KVzmDBgoDE4b0jnHHnAm+AvWzyk4O5mdIdBIuG/qGDUi5/f3GyQIo5J4DAG+lcBRWK7HQMkQ90HenAAM+5VEbUIrsWvP8gMGuxgzOI8bD96MJC90zC3CptaUj1DlvRK4SsD1TIErU2ywsfCp4hiYpmyCzDI4cCtftUg+AoQKsVG1ZSF7Q4mzRMZCPF0xv27G1C5QpsvGyEXBmFQYJJDJsv/6OAy0NTXKKbjfldy4OfFj0N4xHHxwPKFoWMBbmNDTSUnv2xVOa33d8BZUTGDuqqE3KaY751iZ1+26ErhwqgNFW4I4x3
X-Exchange-RoutingPolicyChecked: 
	iFo0MCDNwmUDb+rpBcu3oxGP/GL2xvictE/g2dW5ndXCT5LniWzJH/fbJsy48WsZ6+PZgiPFf7t1MEUzLrKu5FJl0QHSgK3gS3SCELEME6ShXOnMPq8B/vZVcHEIQ4phzcHXXqxVZAhl3EfFBKkCikjp1VESNurEvHCVFk5s4h3CwfMaK1j5lnZRyee0Y3qkizDKEZ3q2/5ka7cKi+LwkYzhBnKqwFIbgaQt0gvvCtPCrx0y0cyDQI0QiIKybVIfItrol5uK/oLQ2bF7M9D1+RG7+lXHKE6aqmkZgRXwC32t1jP6h6cRJdsI/dDmtM42N/CeLEg/0SpCuuOcGSV0iA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:41:05.5944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2132c474-79e2-48db-f659-08dedcdd69fc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7488
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwMyBTYWx0ZWRfX86nH6HLSVDl5
 NWOTB+bvy4JEYWi/JX4soCshcEBIuK8aURAOyek4rEPBiKwt3HPyRbYET0J/9JYkTqmhBCrNgfb
 z0+BLZEGdbXXdFRb1Cp6NNSw+NhbC6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwMyBTYWx0ZWRfX+raTvw9LqVcE
 tJd0TIW07MBZsPYfkLu+oKmC4Q46xUmazGgYHyRQnEK5qLYcSTVYJzsPSgDR9VVW2HlMZFc8hai
 96pJGeuqMpIod48+UDAQGAb0YVw19PblVBzD71pnY0NkiC5tMNb+A5cDwqPpl22t5WTWFH5azl9
 FsftMA62k9q8P0Tacu7iHYimYW9cdPz0da7ZXRForGc/i08e2O7vmc6I1S7FE+xNRNf47IvoK58
 IvEwLb/GR2KykRDMAbyRQ282/3M1OHQY2Z5Z0rcQYqPgyC4QQs9DYlPVuw0fGy3s6vRXvcLH4mP
 UGn5ZwSIJ6FBygqPWkwy81M/adedmx0lkRe3vNAPt9r97G2gJRFsPcoqfI4kAKMb3V1kPgIEgni
 h+tEFm5b16lzloaF67D77uhZWzZLrAsUlSCrsO8UyhKpLvU9lOfWqZ8SPPig/OW+769+HulEpN7
 Dv8OrRjMSG3InmPt8Mw==
X-Proofpoint-ORIG-GUID: 8QsyfH1z3VFxikNWonMc8ZpYvPDmb1T5
X-Authority-Analysis: v=2.4 cv=CIoamxrD c=1 sm=1 tr=0 ts=6a4e2948 cx=c_pps
 a=k7JwuLoshMfzPsPeu96bmQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=AKqFFLX6f2-qlrdebkwA:9
X-Proofpoint-GUID: 8QsyfH1z3VFxikNWonMc8ZpYvPDmb1T5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080103
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jul 2026 10:41:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20126

ti33x and ti43x supports switch mode. Add prusw-fw to ti33x and ti43x
so that switch firmware can be packaged for ti33x and ti43x

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti33x.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index 2b5ee53b..05e4bd80 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -84,7 +84,7 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw prusw-fw"
 
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index 0c37871a..f20a34b5 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -56,7 +56,7 @@ EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
 
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw prusw-fw"
 
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa"

base-commit: 46deb02b60023b967f71c7db610883c19ab0d184
-- 
2.34.1


