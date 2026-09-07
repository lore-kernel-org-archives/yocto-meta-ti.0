Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6BEC79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:11:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29694.1788768651874790085
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=e3k72PT5;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=AKAErImG;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687767VM2795835
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Sep 2026 03:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6UZs27hSvU/c7Yjt1jVh1mSAiYsa2PEU44wK/XtVu
	G4=; b=e3k72PT5yQaMAgzY6eBPA61nbxzOVdJ/Lc2okNqR2ApJgMR9zcUJtqNCu
	7WiFOevUeueeknDXsHTB183UdC4HIJw4m0r8ZcfC3E1gkaQ3T6UsYgEKE26Jxpz+
	bXgYAtNy3CuswInARrqtjTKX1E+fsQkIMdEISp1XQi0tGCqDKPgoTExc74Kg1rlE
	uly+6DEdTjC2uGrF2ZxKeFHZ3TqogCMmWPGzTNnvmYlaL5DGirpFADrrBrZ2vP5H
	T5R7nANpnLbv/HyDKN2DHXoWf/I98R24O+Co7lpJZcrxoNneuxJjnComgE7G9Jau
	7pz+Q6kMIFhdcBRgin84cUssleI8g==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh2f6crnb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 03:10:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYstzQYGyKacE/09Kft2eCSJzQ3AHSfSU7MgsZul/MXnYz5yAges8kJ3om2060FVndcpKm/JsaPUTfvzbIfM7oSdoyPdh6Q9aSlWGM2lwTgI2/0FwXBofyxC0mMk0wQ4V1gRiJYIKH5Kn49NuM5wVJ7c/LiV0MAyQbbEdOOUD7eImoIOmMVQee0b7DMSZSraWdA0o5qgGyb69Td7nbeydmd3in/ALDJDdII5B8pNR2yxGscsRJqggnZWjKg/qrt0Kc2nCZ7HHk0i8KPRdZlz30WBTUpvT41wA7hXlLR0qa0lL6GxJyCS6wVMdNfG3JuyqWHawS33PGErnZ/mmU2Agw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UZs27hSvU/c7Yjt1jVh1mSAiYsa2PEU44wK/XtVuG4=;
 b=qDfxszKe2/c9s0W7h+YRW36jsGx/SITNcZ3lseMoD5CjrFCuO+US6qFzhQtlfqqUAUja2nPGQYV/HKwNLuiHIE8L9YyIZPwya4jFG1zOzZVOW8XyCOBkwhtmcYrkY9uLUIlmr1hzWueYVh4VqWLEs1WQp5A2EJH377eWzYyG0GWCCpqAjfUuLfijLs1UT51HH6zs2wQ4lt+CwFVCnrFWCzJ116tnnhiaXso8QCaOJHp6mwFB79EG76p7wM+XrHNXpCSYBvNl8WjSPgMN2hUDdbTq9ApYNATYq3NcUXcILlZ3udrCkoo3TBROSx8XM7hkij0+PT0ZJxC7KDPE5c2vpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UZs27hSvU/c7Yjt1jVh1mSAiYsa2PEU44wK/XtVuG4=;
 b=AKAErImGkJwgReXV9drb7LU6LENkPLjZDM2Ap+w6hdb7P8PxSRZ5S1IdV2A9ePlP0ReVa8Sz/hJZnHjVDqgTqkSmfRUkpmfcF2WDk09EnpgomdY8BRg2pd1JyF0OmyLvqwhoPPZa1SCElp/UyjtKzJRXcYY9DV2uxBc83dfRdCs=
Received: from BN9PR03CA0583.namprd03.prod.outlook.com (2603:10b6:408:10d::18)
 by DS0PR10MB6127.namprd10.prod.outlook.com (2603:10b6:8:c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 08:10:47 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::6e) by BN9PR03CA0583.outlook.office365.com
 (2603:10b6:408:10d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 08:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:10:46 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:31 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 03:10:30 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6878ALMP132583;
	Mon, 7 Sep 2026 03:10:29 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][RFC PATCH 4/9] conf: machine: am69-sk: Enable ECDSA multiconfig build
Date: Mon, 7 Sep 2026 13:40:16 +0530
Message-ID: <20260907081021.3876876-4-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907081021.3876876-1-a-dubey@ti.com>
References: <20260907081021.3876876-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|DS0PR10MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ccd6594-56c0-484b-6c6d-08df0cb7859c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	p9VKaZ/UQG6RrHWQXJOWxJBCkUo+AsaZPCtoA8QtcQ2Bflj3ZYnPKGXv5OmkFSMBeM0DoZqysCZLFHqnTYOwOrnnijBSrWViUg4qrbcugLrpsF0mg8dgQDVK3dyTyQ8K962hvm3+GTaG/qgUjEDSy9JMAEaGUYu6517kBnr+hGX1nKNRm9mPrHagqAF/hQGBeG4tqSrMVn9r/HMLl+GlURuKUqK85msuqqyZIcDFhudA73Wi09cSI4e4MMhgFFaX/2vUo+S5UCRE5v9F1m5vxJszokmLYJv64UbMKXgaVFoucEnAewPer82ht8TJajdh8/NRm3x+4BdOl0OD/50+IkLKXq4kkTo1Y5rrpxA5SxiDHAXqJwuANFpzOdXnlin0Is77qZ4WhdenxVnyS3nkte8Lgadgfv4qg10XVi6bQ/33hVfg29cAUE94rtZlKn1f2dED+4GRdaz727JKh7IP4s/dmU46njiTiwSK13MH4/JEecSmKT6TZ2d57c9NAlEblsmuEckueb1uMz9wCOgWDQXSYRXxgswO70VWLQ08J7u7tuR1g6eU1Jjk+9rCl4UcLAj8jXOWpsphVT0Vzn2HwEvSBb/w4Cww4SdQ+JQ7cdV6yfYssDwHBwgY/L7pNI3pss2+u3o4GsQlIVOn3g03vu4BZT19t+9AfkWe1fCHQ7MrC3m4f9BQhquMPANASs9O8IG9MPBZ0sw2BPMWloeGHQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZKsoTTxBEYVBmAwixpkVcMmU7Kqiv5q0ICwMFCCcsZH/2UTQ5BdXbL6JzAdPQ/8brjYE2YlbLadSnYFXeOWUBBAr+SamM/Hr/IjJNQClG0f5AQjiSIqyiNUqUzegcT7wA1utFTys/w5WlNDsJBjExU7iY9thS8MYj1k7dLxQmkIiYAzKLHmq/EZZ/btdNd8sYerFBv809by7LYx6MWVUiCaBtORK3Cj68023ws/8T7zNBKJaFKfavoCrlDfo5vL1pAFe/mDd70E9R3f9OKsQRQc6Ov9A3igBHMVJhpMEQHCIswAKR6A+EHy/yp9dYBXkC/kanbkl3VaNtTt3yGo2JpT15r3XsSbqx4C1Pc0f3X0IYGAZqc+TFCI0FAqUU+7ZRCrmn67fKdgoABhV9rYChtZnmfDz7Cmo9QIBpIzV+qU9Z1fAWKrkA7PUTarjUlBc
X-Exchange-RoutingPolicyChecked: 
	ZhvTULoA5wolt36rnWbWn/OVk3wtQw4CBRGFtn6z3JkHDNV4uQmd6FfEIWBpGWPEFcJvuRGIUTytLIerC6wFmNtm0LYgdCo1v8pEfioPy5p3/1CKGaO8aNM7Iltlcm1QKgw6SM0GIA65AhOYjUXmx7y7obN1emv1h3B3gJDbZpP9eATG5O42o+l++VDqhsJklZ42KhqxKBYrkCKQCsl1dAfFTC899RVUMr6qyIB7cMh20p0a1JG7ukmXg3FxLyQXzLkWZzDtPikxnxnMBKgwOQiM3nETKNjY0jph3rnpO/UqPD+MmK47fHk5CyP2XeD1ftF+f7zyjIJR+V/7RkqGAg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:10:46.8941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccd6594-56c0-484b-6c6d-08df0cb7859c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6127
X-Proofpoint-GUID: pAtavHHZj63Nc21d2-T9u-o87y-C0pWp
X-Authority-Analysis: v=2.4 cv=Wqkb99fv c=1 sm=1 tr=0 ts=6a9e718a cx=c_pps
 a=zWRuVz0++A3eh/KBGeICZg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=Bg54gWqFbirftECzTmsA:9
X-Proofpoint-ORIG-GUID: pAtavHHZj63Nc21d2-T9u-o87y-C0pWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfXxVI+Ve0xHO9V
 4zXbgvpfRJBJPuOwUsrKTDyAq9xpK5VDTDYhiUuFF8uF4u9BEVF8GDKAJt1eH5s13hhWUhbY+XY
 fnqL+17qlZURInWrKa0YzJuX/R1ntUgA2P2i8V4CWTr7pbPKp4aISdKBFLONvwO3A7m7tKAZlKr
 GWe1HQ3dEsRIUmLEd6jsZNm47MCIeTZHE8YSVSfgOha98sWDpFgNS/iKJSLtmO1tmKOrhxaJm9F
 ISGjrV86vq4uDGIxLnCCEGY8zRE242icbmd+Gbcl3tw+2xaBxIbNTXT7byusPXkPO7v83ntd/uB
 DOBzMDEJSQB6amUlIIoXq6/9ENcmX4mDHr9DbYb8Micf1f5IhCQjJF7TZMbxIP5qSQ5Pt5Rk3ZR
 rhzzsPa864E+bDpyj3NS1Hq+fdb3Tz1MlhTIWnEmJM5Tg1hdKhlMmuYLeC/k5P5hvnSF50f7Za/
 Bm9OUOSbF5sAnmxqa3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX+3dhD1wdfTUi
 XnT2ZKrJXnpw5uHBLpJHV7RkFxfDpF2ijb0YwyBUAbmAew7a3JUcReDJSUkmNYIwutQvUPioI17
 2b2xcv7MJKOqCLgeS1SDGYHXKF6zj78=
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
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:11:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20333

Add an "ecdsa" pass alongside "main" for am69-sk and am69-sk-k3r5,
so both RSA and ECDSA signed boot images come out of the same build.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 14 +++++++++++++-
 meta-ti-bsp/conf/machine/am69-sk.conf      | 19 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
index b989cf98..d2f7e909 100644
--- a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
@@ -4,4 +4,16 @@
 
 require conf/machine/include/k3r5.inc
 
-UBOOT_MACHINE = "am69_sk_r5_defconfig"
+UBOOT_MACHINE = ""
+
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+
+UBOOT_CONFIG[main] = "am69_sk_r5_defconfig"
+UBOOT_CONFIG[ecdsa] = "am69_sk_r5_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/machine/am69-sk.conf
index 3785dca6..3db5e61c 100644
--- a/meta-ti-bsp/conf/machine/am69-sk.conf
+++ b/meta-ti-bsp/conf/machine/am69-sk.conf
@@ -21,6 +21,23 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
 "
 
-UBOOT_MACHINE = "am69_sk_a72_defconfig"
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
+UBOOT_CONFIG[main] = "am69_sk_a72_defconfig"
+UBOOT_CONFIG[ecdsa] = "am69_sk_a72_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-eth-fw-j784s4"
-- 
2.34.1


