Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2065BC88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:33:44 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5105.1789500822206574590
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 12:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=WoLfsBWw;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=uE85dzbo;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FJN9k21179410;
	Tue, 15 Sep 2026 14:33:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=uuX/vPTsqWsDm
	/wEH48jF7Yf1Mry5gV6eI8I5L/oSyk=; b=WoLfsBWw3H/nNi4Db44ynmz0VNc9w
	c6R8ZCTz7CLH1jyMaTURFYP/AUqziIYmqU/T3quZAOtnsN1pFabJmakmAUMFB7uG
	jVh0ZciK+ap86UggeALS9lLK8ZqXPf3AGxcgvyYBxMtJ+9hh+uQ7jilLyHZMOICa
	OAKLh6FklfWLJ8rVGAXaJNkHoKEDD9qQkXefNq+4Me9BSa4pnT87pEVqTbOmaYKf
	hHgMan+VS052gXrWpAvwUNOr2kgAGvOlgGbqS1OZe+NuS0jpIzKzNR3A4sV6CiT4
	a0RvSX3dx3fOumM7CmohTKsRG/6ZnNQ8DuwpibXit+OAML89ZFAQghB1A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gqc4p830k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 14:33:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Czm6EoCAVenddEnz6YVDJksYBS7bNNhxSoAS0UbAC8BOoEHiiKVHKUXLGL4r9kFdrHwT1STHI5aDU94Ayoafabi0fnZ7ZecxQbqDS4WOHnigZn/FA8fWQQPw9zqO/IjZ2ZLSKm4UuzXfdtKSdE5afZQKwPU/EpIT7UdQRpDDqeEiWjdY8j7PCqe4n4h9t5X5prQBF2A8L9x3tlGxGTeQJ84LfXIhYORT+zNLUAIOwG5qaw9VPTXCTLROqfXRy5z2dm1E68ZosqvhwIK9uTtPo9PXI0XT5eM2T08QttaXeBUaApwH/Pp1xlvaBro4jvvdnb9r02xo15UXnUIN3VYYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuX/vPTsqWsDm/wEH48jF7Yf1Mry5gV6eI8I5L/oSyk=;
 b=DtbAjzYJLwcmVyh5XDQehOTdU3u2XnvxYZmp3v9eECvrCh//Bai9R/UxuyQ/i6+AD+82cx6dn/WD4hsayga+VqKNVR/EnjrXscFoZ+HuTAL/TTsyItdAB4Fjbttjt5P1gFJzBWzgk934LnmO1jnWzOfFlgX2xM6ofr+Y62L77Ovq2LLUObzK2uCJWki67HOandUEU25prWKYYMOUDB9XE4yrk0wxdjfZZX5V80SdteotOkeh5VS9x1+hakXlxWny4sZvJV0lJdWG61EIsyTenj5GQcMCspnAwSnHB2oRaBrG+xZXNNkzFuqM/ZIw7v9IMiyoWo9zf3tjp8ah1fFnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuX/vPTsqWsDm/wEH48jF7Yf1Mry5gV6eI8I5L/oSyk=;
 b=uE85dzbouRw46wSj3oEFETB1vbt2lW+4HCJEDwSf/VPdp+dOTJiCOcLwYFmkF8jwvtT3DjxMbRsVvJCj3sAlXu6iiVQZCImfOnHEi3GxlYxU5fC2rftZl1O77HBZWjEeiXIZKrC4bnsHIy4D/LRZ6ancFxK+RrXKQ68ov2m0xoM=
Received: from DM6PR06CA0092.namprd06.prod.outlook.com (2603:10b6:5:336::25)
 by DS4PR10MB997596.namprd10.prod.outlook.com (2603:10b6:8:31a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:33:33 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:5:336:cafe::9) by DM6PR06CA0092.outlook.office365.com
 (2603:10b6:5:336::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 19:33:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 19:33:33 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:33:11 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:33:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 14:33:11 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FJXBC13817099;
	Tue, 15 Sep 2026 14:33:11 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x6Ytz-00000009wQV-0iqw;
	Tue, 15 Sep 2026 14:33:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 1/3] Revert "u-boot-ti-staging: Fixes for OpenSSL 4.0"
Date: Tue, 15 Sep 2026 14:33:09 -0500
Message-ID: <20260915193311.2369532-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|DS4PR10MB997596:EE_
X-MS-Office365-Filtering-Correlation-Id: 77066ac3-157d-49f0-e31a-08df13603ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|10067099003|56012099006|6133799003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	BCQaCfjmoNDn2h40mbN23qn/flMScKztHrWLmfk8BQqaiUzHpLYS3Ua3PnG4RASnUepCgaHmPh0QPfEhYq0kPA//ED3SjVaLTW/u0W/IZzEk8ZebUu/GKSBLibNFfpCw8sWygK0cjPhdWC7WwRYN/aobRVBiFyRtE/K2+yyFYmcStk3MGCH8b9DmvgdOPXOhbpITpZl7FeRNVzTd/cusMBcYE1Z+0OVeh/2PJowdv1Tz+M53H6Tv6Rk2C8t3y08K1LdsOmUB4DaJbAQOEA1DqGYe3J5fsexVoZTH52RyILzY4fbGzrBuqlJtI/YdSSJ0RE8vC+YisR6kiVemqYv5lQ8votmHIBQ2k1574j6uy+NfgAW2IIF149no4JYrlLthvXy1FIcI0Lhmwnqj+J78lOpAD0RBlu13J5Ye/FZFaOVyLryVsVAMkEAW8ME+rM26FeBbwO4u7TlutuvyuysTQg6lRb5YzeWomTZd1i9TY22E09cLiJLlGUt2zRlRC3EZivyPyRGo5oerdE9UP/uUYNglz9B8RRuihY5z0Ft7IaX0GHkaQifp3ZXrE81YdHeKnFjdmlnPEBR9TOC+vnqR2+p4rK12aF37RKdl4mZON023prDW3jnWFiYivszixMczPJvFPtk9WMTBjSI0v1zfew6QZntv73MYSWLz2Z1lm1iMtDpTRBsHMXnlyVLGI7bqU2+QdjAMRW79518wKne2PQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QAA2Cci2b8bt6rMngq0SnpHMBjIXxtMQjGHIXH9ULLNl7SMctdaC33BUPbVqb2h0vt8XM8JTuRkJGwIfbAMwhYAGb/KBbknBITvaAezZBG+vinUIgythWcG5oWWt+X//WC60ZpNWXLR/05AtoTucMdjygtCvP3//gV8gvzcYb8ZhH9btRBIk39e1UJOCggJJ/9Uf8btrI/VhL+YE3NgEh5B1FBAyhKn41Z1AmByAHEmam79nJY7jzdZTs+2DWrDmcXDX6hus+Oc//aR4jYONTIS+ltfkTjyaLW7O2LVtpbLaMAthKLivOCRekJToh5dDpFAg2OyXanmCGu7BllBF2zvot2JoFdrJ+qVvZOp35UbGr9m6NP9RBFKIQGeVUUs1uB1IQM/XTguDbGPaAPU16eUaOkRsN2pV/OOohhzNT+Sw/uM8+FVZcZHNWPdtagll
X-Exchange-RoutingPolicyChecked: 
	peQh6a9LPPBpkmFx2dgQ0dAc0A7GnarjhTBYdAA/D667nrvpY2UT949wAwHDaWXgr1nGxQSvja1y7S1R2qjt87fpCqkHY+UiIARvjIOjkXQzbd9LJJY0QOTs8zJKYqbiw8MHwjA1JKNFojQeArqaUfXiEhOfgbytcSe2LZ64eRWDF0NLFxhf/O51EvYGWQL8MNy91OFcaRoNF+0Geg1VgRjqd87zu3ctPUnLRiHcFl79/cfhn4py3MA3iVGQG3ltgx0nxmBGdvVIZGnvtDpVwuxTuAaghPqIfEgQuUMzp6wxqAykUD79DlcFChyrN6KcIEnZjrRf9yVgha+MjdWVCA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:33:33.5008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77066ac3-157d-49f0-e31a-08df13603ae7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997596
X-Authority-Analysis: v=2.4 cv=HP9WhYtv c=1 sm=1 tr=0 ts=6aa99d94 cx=c_pps
 a=ImwGUT2bfrWU7DBu6bNfJw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=sozttTNsAAAA:8
 a=ptNznvi-AAAA:8 a=eXIX07nra3o8fY77v5kA:9 a=__MQohX_fo54y4GeBRKl:22
X-Proofpoint-GUID: zZc7mzkREgBpBAQz2HhfejxnUSS2TaEm
X-Proofpoint-ORIG-GUID: zZc7mzkREgBpBAQz2HhfejxnUSS2TaEm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI4NSBTYWx0ZWRfXwdbP38KdxmyW
 NA1e/lwmLd6bY0q3pW+/6WHvha/CWCh+OTsOnyLaTy2vzYK3hT7r+d+Nq2Ic58Oe8s0QPAXyQUV
 2AhsOvkkxJFjlw/CJdiZ3J+vseaGT60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI4NSBTYWx0ZWRfX39UC++anakS7
 DSt+qtRVMJ8zzpEjZxVcREscJKa18KYZSU+Ojf44TqkTNT8H1b11nMDKrvwfD4EYh0yFDeXzQVT
 ZcGhsVcFgTUxhT8t+foXhBcPKeFV8Y6FtcKHxVzJE15CrAHyWUGu2V6xAIVOmIk2GfKEgMrvpzX
 WdGUOe5L4LD0cxhsrJl+xKbR7xEnwDoAqP/bX13SPMW+EIMgeknBNck/NE+Fw2sA824+2sseyen
 eNTTA5WQPo99DDVQkA6el995MkdaGCvBEh4LYqG8QX3NCI8VlSARP5wmEgth+y5ss9Q+XE8zOR1
 Eh8YyGMuim3Zvy4TeJt/33YKjzbIjwfRSYFEjs18/own5E6a5QzSJI09n3vqUOPavam9QH12q1R
 UTdCTpSBDQ/41fM42/mTd7Zc3QBg+2Mm/I70tOYLWIOkuSJ+7/IJ907B6Y6NUWbBCwUyR+1n7o5
 4eAD+r1wd0xsqA5L+hA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150285
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Sep 2026 19:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20381

This reverts commit f06fbe6712395dff2df8fdc145c9c24db7101c50.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add Signed-off-by

 ...ort-for-OpenSSL-Provider-API-2024-04.patch | 300 ----------------
 ...ort-for-OpenSSL-Provider-API-2025-01.patch | 300 ----------------
 ...ort-for-OpenSSL-Provider-API-2026-01.patch | 340 ------------------
 .../u-boot/u-boot-ti-staging_2024.04.bb       |   6 +-
 .../u-boot/u-boot-ti-staging_2025.01.bb       |   1 -
 .../u-boot/u-boot-ti-staging_2026.01.bb       |   2 -
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |   1 -
 7 files changed, 2 insertions(+), 948 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
deleted file mode 100644
index 9f67644b..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
+++ /dev/null
@@ -1,300 +0,0 @@
-From 401c19f6b0a7c63afad92e9d3f2cbb75d6ed8566 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Wed, 9 Sep 2026 10:04:50 -0500
-Subject: [PATCH] Add support for OpenSSL Provider API
-
-Backport from 2026.01 patch [1] by Ryan Eatmon <reatmon@ti.com>
-
-Upsatream-Status: Inappropriate [OE-specific]
-
-The Engine API has been deprecated since the release of OpenSSL 3.0. End
-users have been advised to migrate to the new Provider interface.
-Several distributions have already removed support for engines, which is
-preventing U-Boot from being compiled in those environments.
-
-Add support for the Provider API while continuing to support the existing
-Engine API on distros shipping older releases of OpenSSL.
-
-This is based on similar work contributed by Jan Stancek updating Linux
-to use the Provider interface.
-
-    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
-    Author: Jan Stancek <jstancek@redhat.com>
-    Date:   Fri Sep 20 19:52:48 2024 +0300
-
-        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
-
-The changes have been tested with the FIT signature verification vboot
-tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
-Engine library installed and with the Provider API.
-
-Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
-
-Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
-
-Note: Modified to make pkcs11 provider loading optional. The upstream
-patch unconditionally requires the pkcs11 provider, which is not
-available in the OE build environment. File-based key signing only needs
-the default provider; pkcs11 is only required for pkcs11: URI keys.
-Changes from upstream:
- - Load default provider first (was pkcs11 first)
- - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
-   of ERR(1, ...) which calls errx/abort)
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- lib/aes/aes-encrypt.c |  4 +-
- lib/rsa/rsa-sign.c    | 95 ++++++++++++++++++++++++++++++++++++++++++-
- 2 files changed, 97 insertions(+), 2 deletions(-)
-
-diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
-index e74e35eaa28..8a6f7715df9 100644
---- a/lib/aes/aes-encrypt.c
-+++ b/lib/aes/aes-encrypt.c
-@@ -16,7 +16,9 @@
- #include <openssl/err.h>
- #include <openssl/ssl.h>
- #include <openssl/evp.h>
--#include <openssl/engine.h>
-+#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
-+# include <openssl/engine.h>
-+#endif
- #include <uboot_aes.h>
- 
- #if OPENSSL_VERSION_NUMBER >= 0x10000000L
-diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
-index 2304030e32f..29b3bd3dbb1 100644
---- a/lib/rsa/rsa-sign.c
-+++ b/lib/rsa/rsa-sign.c
-@@ -19,7 +19,47 @@
- #include <openssl/err.h>
- #include <openssl/ssl.h>
- #include <openssl/evp.h>
--#include <openssl/engine.h>
-+#if OPENSSL_VERSION_MAJOR >= 3
-+# define USE_PKCS11_PROVIDER
-+# include <err.h>
-+# include <openssl/provider.h>
-+# include <openssl/store.h>
-+#else
-+# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
-+#  define USE_PKCS11_ENGINE
-+#  include <openssl/engine.h>
-+# endif
-+#endif
-+
-+#ifdef USE_PKCS11_PROVIDER
-+#define ERR(cond, fmt, ...)				\
-+	do {						\
-+		bool __cond = (cond);			\
-+		drain_openssl_errors(__LINE__, 0);	\
-+		if (__cond) {				\
-+			errx(1, fmt, ## __VA_ARGS__);	\
-+		}					\
-+	} while (0)
-+
-+static void drain_openssl_errors(int l, int silent)
-+{
-+	const char *file;
-+	char buf[120];
-+	int e, line;
-+
-+	if (ERR_peek_error() == 0)
-+		return;
-+	if (!silent)
-+		fprintf(stderr, "At main.c:%d:\n", l);
-+
-+	while ((e = ERR_peek_error_line(&file, &line))) {
-+		ERR_error_string(e, buf);
-+		if (!silent)
-+			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
-+		ERR_get_error();
-+	}
-+}
-+#endif
- 
- static int rsa_err(const char *msg)
- {
-@@ -98,6 +138,7 @@ err_cert:
-  * @evpp	Returns EVP_PKEY object, or NULL on failure
-  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
-  */
-+#ifdef USE_PKCS11_ENGINE
- static int rsa_engine_get_pub_key(const char *keydir, const char *name,
- 				  ENGINE *engine, EVP_PKEY **evpp)
- {
-@@ -157,6 +198,7 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
- 
- 	return 0;
- }
-+#endif
- 
- /**
-  * rsa_get_pub_key() - read a public key
-@@ -170,8 +212,10 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
- static int rsa_get_pub_key(const char *keydir, const char *name,
- 			   ENGINE *engine, EVP_PKEY **evpp)
- {
-+#ifdef USE_PKCS11_ENGINE
- 	if (engine)
- 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
-+#endif
- 	return rsa_pem_get_pub_key(keydir, name, evpp);
- }
- 
-@@ -207,6 +251,38 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
- 		return -ENOENT;
- 	}
- 
-+#ifdef USE_PKCS11_PROVIDER
-+	EVP_PKEY *private_key = NULL;
-+	OSSL_STORE_CTX *store;
-+
-+	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
-+		ERR(1, "OSSL_PROVIDER_try_load(default)");
-+	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
-+	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
-+		ERR_clear_error();
-+
-+	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
-+	ERR(!store, "OSSL_STORE_open");
-+
-+	while (!OSSL_STORE_eof(store)) {
-+		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
-+
-+		if (!info) {
-+			drain_openssl_errors(__LINE__, 0);
-+			continue;
-+		}
-+		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
-+			private_key = OSSL_STORE_INFO_get1_PKEY(info);
-+			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
-+		}
-+		OSSL_STORE_INFO_free(info);
-+		if (private_key)
-+			break;
-+	}
-+	OSSL_STORE_close(store);
-+
-+	*evpp = private_key;
-+#else
- 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
- 		rsa_err("Failure reading private key");
- 		fclose(f);
-@@ -214,6 +290,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
- 	}
- 	fclose(f);
- 
-+#endif
- 	return 0;
- }
- 
-@@ -226,6 +303,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
-  * @evpp	Returns EVP_PKEY object, or NULL on failure
-  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
-  */
-+#ifdef USE_PKCS11_ENGINE
- static int rsa_engine_get_priv_key(const char *keydir, const char *name,
- 				   const char *keyfile,
- 				   ENGINE *engine, EVP_PKEY **evpp)
-@@ -293,6 +371,7 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
- 
- 	return 0;
- }
-+#endif
- 
- /**
-  * rsa_get_priv_key() - read a private key
-@@ -306,9 +385,11 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
- static int rsa_get_priv_key(const char *keydir, const char *name,
- 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
- {
-+#ifdef USE_PKCS11_ENGINE
- 	if (engine)
- 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
- 					       evpp);
-+#endif
- 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
- }
- 
-@@ -325,6 +406,7 @@ static int rsa_init(void)
- 	return 0;
- }
- 
-+#ifdef USE_PKCS11_ENGINE
- static int rsa_engine_init(const char *engine_id, ENGINE **pe)
- {
- 	const char *key_pass;
-@@ -372,6 +454,7 @@ err_engine_init:
- 	ENGINE_free(e);
- 	return ret;
- }
-+#endif
- 
- static void rsa_engine_remove(ENGINE *e)
- {
-@@ -471,11 +554,13 @@ int rsa_sign(struct image_sign_info *info,
- 	if (ret)
- 		return ret;
- 
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id) {
- 		ret = rsa_engine_init(info->engine_id, &e);
- 		if (ret)
- 			return ret;
- 	}
-+#endif
- 
- 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
- 			       e, &pkey);
-@@ -487,16 +572,20 @@ int rsa_sign(struct image_sign_info *info,
- 		goto err_sign;
- 
- 	EVP_PKEY_free(pkey);
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id)
- 		rsa_engine_remove(e);
-+#endif
- 
- 	return ret;
- 
- err_sign:
- 	EVP_PKEY_free(pkey);
- err_priv:
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id)
- 		rsa_engine_remove(e);
-+#endif
- 	return ret;
- }
- 
-@@ -636,11 +725,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
- 	ENGINE *e = NULL;
- 
- 	debug("%s: Getting verification data\n", __func__);
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id) {
- 		ret = rsa_engine_init(info->engine_id, &e);
- 		if (ret)
- 			return ret;
- 	}
-+#endif
- 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
- 	if (ret)
- 		goto err_get_pub_key;
-@@ -717,8 +808,10 @@ done:
- err_get_params:
- 	EVP_PKEY_free(pkey);
- err_get_pub_key:
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id)
- 		rsa_engine_remove(e);
-+#endif
- 
- 	if (ret)
- 		return ret;
--- 
-2.43.0
-
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
deleted file mode 100644
index c5f3655e..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
+++ /dev/null
@@ -1,300 +0,0 @@
-From 0525693750b1b7a8fb7228dbb97bf592a21322fc Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Wed, 9 Sep 2026 10:04:50 -0500
-Subject: [PATCH] Add support for OpenSSL Provider API
-
-Backport from 2026.01 patch [1] by Ryan Eatmon <reatmon@ti.com>
-
-Upsatream-Status: Inappropriate [OE-specific]
-
-The Engine API has been deprecated since the release of OpenSSL 3.0. End
-users have been advised to migrate to the new Provider interface.
-Several distributions have already removed support for engines, which is
-preventing U-Boot from being compiled in those environments.
-
-Add support for the Provider API while continuing to support the existing
-Engine API on distros shipping older releases of OpenSSL.
-
-This is based on similar work contributed by Jan Stancek updating Linux
-to use the Provider interface.
-
-    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
-    Author: Jan Stancek <jstancek@redhat.com>
-    Date:   Fri Sep 20 19:52:48 2024 +0300
-
-        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
-
-The changes have been tested with the FIT signature verification vboot
-tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
-Engine library installed and with the Provider API.
-
-Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
-
-Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
-
-Note: Modified to make pkcs11 provider loading optional. The upstream
-patch unconditionally requires the pkcs11 provider, which is not
-available in the OE build environment. File-based key signing only needs
-the default provider; pkcs11 is only required for pkcs11: URI keys.
-Changes from upstream:
- - Load default provider first (was pkcs11 first)
- - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
-   of ERR(1, ...) which calls errx/abort)
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- lib/aes/aes-encrypt.c |  4 +-
- lib/rsa/rsa-sign.c    | 95 ++++++++++++++++++++++++++++++++++++++++++-
- 2 files changed, 97 insertions(+), 2 deletions(-)
-
-diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
-index e74e35eaa28..8a6f7715df9 100644
---- a/lib/aes/aes-encrypt.c
-+++ b/lib/aes/aes-encrypt.c
-@@ -16,7 +16,9 @@
- #include <openssl/err.h>
- #include <openssl/ssl.h>
- #include <openssl/evp.h>
--#include <openssl/engine.h>
-+#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
-+# include <openssl/engine.h>
-+#endif
- #include <uboot_aes.h>
- 
- #if OPENSSL_VERSION_NUMBER >= 0x10000000L
-diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
-index fa9e143b4ca..af5b18e0c95 100644
---- a/lib/rsa/rsa-sign.c
-+++ b/lib/rsa/rsa-sign.c
-@@ -19,7 +19,47 @@
- #include <openssl/err.h>
- #include <openssl/ssl.h>
- #include <openssl/evp.h>
--#include <openssl/engine.h>
-+#if OPENSSL_VERSION_MAJOR >= 3
-+# define USE_PKCS11_PROVIDER
-+# include <err.h>
-+# include <openssl/provider.h>
-+# include <openssl/store.h>
-+#else
-+# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
-+#  define USE_PKCS11_ENGINE
-+#  include <openssl/engine.h>
-+# endif
-+#endif
-+
-+#ifdef USE_PKCS11_PROVIDER
-+#define ERR(cond, fmt, ...)				\
-+	do {						\
-+		bool __cond = (cond);			\
-+		drain_openssl_errors(__LINE__, 0);	\
-+		if (__cond) {				\
-+			errx(1, fmt, ## __VA_ARGS__);	\
-+		}					\
-+	} while (0)
-+
-+static void drain_openssl_errors(int l, int silent)
-+{
-+	const char *file;
-+	char buf[120];
-+	int e, line;
-+
-+	if (ERR_peek_error() == 0)
-+		return;
-+	if (!silent)
-+		fprintf(stderr, "At main.c:%d:\n", l);
-+
-+	while ((e = ERR_peek_error_line(&file, &line))) {
-+		ERR_error_string(e, buf);
-+		if (!silent)
-+			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
-+		ERR_get_error();
-+	}
-+}
-+#endif
- 
- static int rsa_err(const char *msg)
- {
-@@ -98,6 +138,7 @@ err_cert:
-  * @evpp	Returns EVP_PKEY object, or NULL on failure
-  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
-  */
-+#ifdef USE_PKCS11_ENGINE
- static int rsa_engine_get_pub_key(const char *keydir, const char *name,
- 				  ENGINE *engine, EVP_PKEY **evpp)
- {
-@@ -157,6 +198,7 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
- 
- 	return 0;
- }
-+#endif
- 
- /**
-  * rsa_get_pub_key() - read a public key
-@@ -170,8 +212,10 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
- static int rsa_get_pub_key(const char *keydir, const char *name,
- 			   ENGINE *engine, EVP_PKEY **evpp)
- {
-+#ifdef USE_PKCS11_ENGINE
- 	if (engine)
- 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
-+#endif
- 	return rsa_pem_get_pub_key(keydir, name, evpp);
- }
- 
-@@ -207,6 +251,38 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
- 		return -ENOENT;
- 	}
- 
-+#ifdef USE_PKCS11_PROVIDER
-+	EVP_PKEY *private_key = NULL;
-+	OSSL_STORE_CTX *store;
-+
-+	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
-+		ERR(1, "OSSL_PROVIDER_try_load(default)");
-+	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
-+	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
-+		ERR_clear_error();
-+
-+	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
-+	ERR(!store, "OSSL_STORE_open");
-+
-+	while (!OSSL_STORE_eof(store)) {
-+		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
-+
-+		if (!info) {
-+			drain_openssl_errors(__LINE__, 0);
-+			continue;
-+		}
-+		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
-+			private_key = OSSL_STORE_INFO_get1_PKEY(info);
-+			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
-+		}
-+		OSSL_STORE_INFO_free(info);
-+		if (private_key)
-+			break;
-+	}
-+	OSSL_STORE_close(store);
-+
-+	*evpp = private_key;
-+#else
- 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
- 		rsa_err("Failure reading private key");
- 		fclose(f);
-@@ -214,6 +290,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
- 	}
- 	fclose(f);
- 
-+#endif
- 	return 0;
- }
- 
-@@ -226,6 +303,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
-  * @evpp	Returns EVP_PKEY object, or NULL on failure
-  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
-  */
-+#ifdef USE_PKCS11_ENGINE
- static int rsa_engine_get_priv_key(const char *keydir, const char *name,
- 				   const char *keyfile,
- 				   ENGINE *engine, EVP_PKEY **evpp)
-@@ -293,6 +371,7 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
- 
- 	return 0;
- }
-+#endif
- 
- /**
-  * rsa_get_priv_key() - read a private key
-@@ -306,9 +385,11 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
- static int rsa_get_priv_key(const char *keydir, const char *name,
- 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
- {
-+#ifdef USE_PKCS11_ENGINE
- 	if (engine)
- 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
- 					       evpp);
-+#endif
- 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
- }
- 
-@@ -325,6 +406,7 @@ static int rsa_init(void)
- 	return 0;
- }
- 
-+#ifdef USE_PKCS11_ENGINE
- static int rsa_engine_init(const char *engine_id, ENGINE **pe)
- {
- 	const char *key_pass;
-@@ -372,6 +454,7 @@ err_engine_init:
- 	ENGINE_free(e);
- 	return ret;
- }
-+#endif
- 
- static void rsa_engine_remove(ENGINE *e)
- {
-@@ -480,11 +563,13 @@ int rsa_sign(struct image_sign_info *info,
- 	if (ret)
- 		return ret;
- 
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id) {
- 		ret = rsa_engine_init(info->engine_id, &e);
- 		if (ret)
- 			return ret;
- 	}
-+#endif
- 
- 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
- 			       e, &pkey);
-@@ -496,16 +581,20 @@ int rsa_sign(struct image_sign_info *info,
- 		goto err_sign;
- 
- 	EVP_PKEY_free(pkey);
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id)
- 		rsa_engine_remove(e);
-+#endif
- 
- 	return ret;
- 
- err_sign:
- 	EVP_PKEY_free(pkey);
- err_priv:
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id)
- 		rsa_engine_remove(e);
-+#endif
- 	return ret;
- }
- 
-@@ -645,11 +734,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
- 	ENGINE *e = NULL;
- 
- 	debug("%s: Getting verification data\n", __func__);
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id) {
- 		ret = rsa_engine_init(info->engine_id, &e);
- 		if (ret)
- 			return ret;
- 	}
-+#endif
- 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
- 	if (ret)
- 		goto err_get_pub_key;
-@@ -726,8 +817,10 @@ done:
- err_get_params:
- 	EVP_PKEY_free(pkey);
- err_get_pub_key:
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id)
- 		rsa_engine_remove(e);
-+#endif
- 
- 	if (ret)
- 		return ret;
--- 
-2.43.0
-
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
deleted file mode 100644
index 346d0584..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
+++ /dev/null
@@ -1,340 +0,0 @@
-From a81cb0932dce109af44d7245d47489fe54ae390f Mon Sep 17 00:00:00 2001
-From: Eddie Kovsky <ewk@edkovsky.org>
-Date: Mon, 23 Feb 2026 09:43:22 -0700
-Subject: [PATCH] Add support for OpenSSL Provider API
-
-The Engine API has been deprecated since the release of OpenSSL 3.0. End
-users have been advised to migrate to the new Provider interface.
-Several distributions have already removed support for engines, which is
-preventing U-Boot from being compiled in those environments.
-
-Add support for the Provider API while continuing to support the existing
-Engine API on distros shipping older releases of OpenSSL.
-
-This is based on similar work contributed by Jan Stancek updating Linux
-to use the Provider interface.
-
-    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
-    Author: Jan Stancek <jstancek@redhat.com>
-    Date:   Fri Sep 20 19:52:48 2024 +0300
-
-        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
-
-The changes have been tested with the FIT signature verification vboot
-tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
-Engine library installed and with the Provider API.
-
-Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
-
-Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
-
-Note: Modified to make pkcs11 provider loading optional. The upstream
-patch unconditionally requires the pkcs11 provider, which is not
-available in the OE build environment. File-based key signing only needs
-the default provider; pkcs11 is only required for pkcs11: URI keys.
-Changes from upstream:
- - Load default provider first (was pkcs11 first)
- - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
-   of ERR(1, ...) which calls errx/abort)
-
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- doc/build/gcc.rst      |   4 +-
- lib/aes/aes-encrypt.c |   4 +-
- lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
- tools/docker/Dockerfile |  1 +
- 4 files changed, 103 insertions(+), 8 deletions(-)
-
-diff --git a/doc/build/gcc.rst b/doc/build/gcc.rst
-index 1fef718ceecb..29a6a632e7e3 100644
---- a/doc/build/gcc.rst
-+++ b/doc/build/gcc.rst
-@@ -25,8 +25,8 @@ Depending on the build targets further packages maybe needed
- 
-     sudo apt-get install bc bison build-essential coccinelle \
-       device-tree-compiler dfu-util efitools flex gdisk graphviz imagemagick \
--      libgnutls28-dev libguestfs-tools libncurses-dev \
--      libpython3-dev libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl \
-+      libgnutls28-dev libguestfs-tools libncurses-dev libpython3-dev \
-+      libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl pkcs11-provider \
-       pkg-config python3 python3-asteval python3-coverage python3-filelock \
-       python3-pkg-resources python3-pycryptodome python3-pyelftools \
-       python3-pytest python3-pytest-xdist python3-sphinxcontrib.apidoc \
-diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
-index 90e1407b4f09..4fc4ce232478 100644
---- a/lib/aes/aes-encrypt.c
-+++ b/lib/aes/aes-encrypt.c
-@@ -16,7 +16,9 @@
- #include <openssl/err.h>
- #include <openssl/ssl.h>
- #include <openssl/evp.h>
--#include <openssl/engine.h>
-+#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
-+# include <openssl/engine.h>
-+#endif
- #include <uboot_aes.h>
- 
- #if OPENSSL_VERSION_NUMBER >= 0x10000000L
-diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
-index 0e38c9e802fd..f456f3c58e65 100644
---- a/lib/rsa/rsa-sign.c
-+++ b/lib/rsa/rsa-sign.c
-@@ -19,7 +19,47 @@
- #include <openssl/err.h>
- #include <openssl/ssl.h>
- #include <openssl/evp.h>
--#include <openssl/engine.h>
-+#if OPENSSL_VERSION_MAJOR >= 3
-+# define USE_PKCS11_PROVIDER
-+# include <err.h>
-+# include <openssl/provider.h>
-+# include <openssl/store.h>
-+#else
-+# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
-+#  define USE_PKCS11_ENGINE
-+#  include <openssl/engine.h>
-+# endif
-+#endif
-+
-+#ifdef USE_PKCS11_PROVIDER
-+#define ERR(cond, fmt, ...)				\
-+	do {						\
-+		bool __cond = (cond);			\
-+		drain_openssl_errors(__LINE__, 0);	\
-+		if (__cond) {				\
-+			errx(1, fmt, ## __VA_ARGS__);	\
-+		}					\
-+	} while (0)
-+
-+static void drain_openssl_errors(int l, int silent)
-+{
-+	const char *file;
-+	char buf[120];
-+	int e, line;
-+
-+	if (ERR_peek_error() == 0)
-+		return;
-+	if (!silent)
-+		fprintf(stderr, "At main.c:%d:\n", l);
-+
-+	while ((e = ERR_peek_error_line(&file, &line))) {
-+		ERR_error_string(e, buf);
-+		if (!silent)
-+			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
-+		ERR_get_error();
-+	}
-+}
-+#endif
- 
- static int rsa_err(const char *msg)
- {
-@@ -94,10 +134,11 @@ static int rsa_pem_get_pub_key(const char *keydir, const char *name, EVP_PKEY **
-  *
-  * @keydir:	Key prefix
-  * @name	Name of key
-- * @engine	Engine to use
-+ * @engine	Engine to use or NULL when using pkcs11 provider
-  * @evpp	Returns EVP_PKEY object, or NULL on failure
-  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
-  */
-+#ifdef USE_PKCS11_ENGINE
- static int rsa_engine_get_pub_key(const char *keydir, const char *name,
- 				  ENGINE *engine, EVP_PKEY **evpp)
- {
-@@ -157,21 +198,24 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
- 
- 	return 0;
- }
-+#endif
- 
- /**
-  * rsa_get_pub_key() - read a public key
-  *
-  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
-  * @name	Name of key file (will have a .crt extension)
-- * @engine	Engine to use
-+ * @engine	Engine to use or NULL when using pkcs11 provider
-  * @evpp	Returns EVP_PKEY object, or NULL on failure
-  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
-  */
- static int rsa_get_pub_key(const char *keydir, const char *name,
- 			   ENGINE *engine, EVP_PKEY **evpp)
- {
-+#ifdef USE_PKCS11_ENGINE
- 	if (engine)
- 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
-+#endif
- 	return rsa_pem_get_pub_key(keydir, name, evpp);
- }
- 
-@@ -207,13 +251,45 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
- 		return -ENOENT;
- 	}
- 
-+#ifdef USE_PKCS11_PROVIDER
-+	EVP_PKEY *private_key = NULL;
-+	OSSL_STORE_CTX *store;
-+
-+	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
-+		ERR(1, "OSSL_PROVIDER_try_load(default)");
-+	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
-+	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
-+		ERR_clear_error();
-+
-+	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
-+	ERR(!store, "OSSL_STORE_open");
-+
-+	while (!OSSL_STORE_eof(store)) {
-+		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
-+
-+		if (!info) {
-+			drain_openssl_errors(__LINE__, 0);
-+			continue;
-+		}
-+		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
-+			private_key = OSSL_STORE_INFO_get1_PKEY(info);
-+			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
-+		}
-+		OSSL_STORE_INFO_free(info);
-+		if (private_key)
-+			break;
-+	}
-+	OSSL_STORE_close(store);
-+
-+	*evpp = private_key;
-+#else
- 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
- 		rsa_err("Failure reading private key");
- 		fclose(f);
- 		return -EPROTO;
- 	}
- 	fclose(f);
--
-+#endif
- 	return 0;
- }
- 
-@@ -226,6 +301,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
-  * @evpp	Returns EVP_PKEY object, or NULL on failure
-  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
-  */
-+#ifdef USE_PKCS11_ENGINE
- static int rsa_engine_get_priv_key(const char *keydir, const char *name,
- 				   const char *keyfile,
- 				   ENGINE *engine, EVP_PKEY **evpp)
-@@ -293,22 +369,25 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
- 
- 	return 0;
- }
-+#endif
- 
- /**
-  * rsa_get_priv_key() - read a private key
-  *
-  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
-  * @name	Name of key
-- * @engine	Engine to use for signing
-+ * @engine	Engine to use or NULL when using pkcs11 provider
-  * @evpp	Returns EVP_PKEY object, or NULL on failure
-  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
-  */
- static int rsa_get_priv_key(const char *keydir, const char *name,
- 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
- {
-+#ifdef USE_PKCS11_ENGINE
- 	if (engine)
- 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
- 					       evpp);
-+#endif
- 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
- }
- 
-@@ -325,6 +404,7 @@ static int rsa_init(void)
- 	return 0;
- }
- 
-+#ifdef USE_PKCS11_ENGINE
- static int rsa_engine_init(const char *engine_id, ENGINE **pe)
- {
- 	const char *key_pass;
-@@ -380,6 +460,7 @@ static void rsa_engine_remove(ENGINE *e)
- 		ENGINE_free(e);
- 	}
- }
-+#endif
- 
- static int rsa_sign_with_key(EVP_PKEY *pkey, struct padding_algo *padding_algo,
- 			     struct checksum_algo *checksum_algo,
-@@ -480,11 +561,13 @@ int rsa_sign(struct image_sign_info *info,
- 	if (ret)
- 		return ret;
- 
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id) {
- 		ret = rsa_engine_init(info->engine_id, &e);
- 		if (ret)
- 			return ret;
- 	}
-+#endif
- 
- 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
- 			       e, &pkey);
-@@ -496,16 +579,21 @@ int rsa_sign(struct image_sign_info *info,
- 		goto err_sign;
- 
- 	EVP_PKEY_free(pkey);
-+
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id)
- 		rsa_engine_remove(e);
-+#endif
- 
- 	return ret;
- 
- err_sign:
- 	EVP_PKEY_free(pkey);
- err_priv:
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id)
- 		rsa_engine_remove(e);
-+#endif
- 	return ret;
- }
- 
-@@ -645,11 +733,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
- 	ENGINE *e = NULL;
- 
- 	debug("%s: Getting verification data\n", __func__);
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id) {
- 		ret = rsa_engine_init(info->engine_id, &e);
- 		if (ret)
- 			return ret;
- 	}
-+#endif
- 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
- 	if (ret)
- 		goto err_get_pub_key;
-@@ -726,8 +816,10 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
- err_get_params:
- 	EVP_PKEY_free(pkey);
- err_get_pub_key:
-+#ifdef USE_PKCS11_ENGINE
- 	if (info->engine_id)
- 		rsa_engine_remove(e);
-+#endif
- 
- 	if (ret)
- 		return ret;
-diff --git a/tools/docker/Dockerfile b/tools/docker/Dockerfile
-index 73bf6cdd2c52..50e98e83dc20 100644
---- a/tools/docker/Dockerfile
-+++ b/tools/docker/Dockerfile
-@@ -122,6 +122,7 @@ RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
- 	openssl \
- 	picocom \
- 	parted \
-+	pkcs11-provider \
- 	pkg-config \
- 	python-is-python3 \
- 	python3 \
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index 5812b914..d3a78d8b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -4,8 +4,6 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRCREV_uboot = "29d0c23d67ee7b88e46fe1753cd020e2b04c2ef6"
-
 SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
-SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
-SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch"
+
+SRCREV_uboot = "29d0c23d67ee7b88e46fe1753cd020e2b04c2ef6"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index af4b1b77..f7475c2b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -7,4 +7,3 @@ BRANCH = "ti-u-boot-2025.01"
 SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
-SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index d1ef241d..7637cfaf 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -5,5 +5,3 @@ PR = "r0"
 BRANCH = "ti-u-boot-2026.01"
 
 SRCREV_uboot = "2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200"
-
-SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 8213ac60..3d6769bf 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -25,7 +25,6 @@ UBOOT_GIT_PROTOCOL ?= "https"
 UBOOT_GIT_BRANCH ?= "branch=${BRANCH}"
 SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};${UBOOT_GIT_BRANCH};name=uboot"
 
-SRC_URI:append:bsp-ti-6_6 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
 SRC_URI:append:bsp-ti-6_12 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
 SRC_URI:append:bsp-ti-6_18 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
 
-- 
2.43.0


