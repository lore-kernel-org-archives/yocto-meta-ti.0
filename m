Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321C9C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:10:51 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30023.1788768650161944025
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=P/Koe2i+;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=riPVhPxo;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 687762nO863130
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Sep 2026 03:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5m+eMYUiwy+kAPDOswl89aonyFEIfuBfEW5EGKxjc
	HY=; b=P/Koe2i+JT5xgmsXpGnSJrjSWKRUXua3+fX+VYp1Du7kUCC8zradG/OSE
	CVNDV8JRKPdTJ3i0KUhn2ItKv4/dD/dutjsXcHwkSNMtfuGZWP+vWpVcei7VSxyG
	3QWi7G1Jn9aqGAwfPA2fUH9I17M+ZhaDzVvuZyQsiyeGR4n8O0bVS5rZ13beYsRn
	8SMZolqoMg8ityofKJ7PVGumIMxqbwAXrPtD9ZiIfPGRiRt9DLdchQ3XuG80yhtc
	mI0dflVd8ZTcwQse8ciVD2eqv6hvHDj2OJb1cJ4w9FldfOpclgNBC7Dp38CROcwL
	OU10wfx4schL3UEelVPLJWmFHHM6g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gh51nmbk3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 03:10:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyjZj8JSEkcAdsC89CYdv/tggCZ2hIq5SnVf9HNd6CaKqAhSEnIYeR15vlr8hlSSe1oGs+/rnGp/MC9UkVnDiPFQFSf/lG0OXaxwFrUZDH1AIZ9ECQszlDJ/0sgIr4fEZAXmgRmTgJAdddoMIe2IagXUpaMqeuZHpAV3joVqcLNG2t4hqYu6o9+/Ty29mVaWi5ET9nmoZYSD7XCSp21Tb8SCUkRmfbxo83Bszn2/8c4do9CQV8c4LUxPO7/RvNMgvjQk6TmQwkHYprorb+xsQFqUVB33471q0yQpLYNzL6qKELKudhBQ63EnalJvKKzzZWKTRa20WNbbYUV85lKS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5m+eMYUiwy+kAPDOswl89aonyFEIfuBfEW5EGKxjcHY=;
 b=mnCHf2gRRhoQ99x1n1BCflJ9up99/xQS6GzRSENx9X1B6gkCO9LeCt9D6wZmyQVA+fuDfNbR5fgnMZQ7jfRHEooQ7w28WkbZ+Au3EeqnbfMkgBtG39A2l831qB6QRdM69cRb6GNbOQ2HM4FLaQgx+qa5V+f//B0DF11vi8qIkxjgMr0UpzUfypccbUmDbHoW22IYkyKWmegkXkWomJ7XN2nIN3g5unc2K3NptRDvMGdQuL6eXQP8SyeZUpH/Fz1zxgFJ86NuBasFgYf4ZnjrykCrPzfIWrMQZvl9B1zs1EuDQ1YFGkS2V7TadO6f7QSEDmeLrjHnWX4awfit9aWaPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5m+eMYUiwy+kAPDOswl89aonyFEIfuBfEW5EGKxjcHY=;
 b=riPVhPxoHpqAruNd4rzxph2gPJwjllTG6uM33FOTQoljmFezqLT09zXITt9loMJq9Ly+XNVi6xAme+MoA1KYS166TSTlmg/g6XoP+DlZDToObxXySyUgg3n+ikcHLTubx1dtXlnvN4DN+4NUGMFgvaTdWZPStwNAL+dVcReJCxk=
Received: from BN9PR03CA0430.namprd03.prod.outlook.com (2603:10b6:408:113::15)
 by SJ0PR10MB4733.namprd10.prod.outlook.com (2603:10b6:a03:2ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 7 Sep
 2026 08:10:46 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:408:113:cafe::68) by BN9PR03CA0430.outlook.office365.com
 (2603:10b6:408:113::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 08:10:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 08:10:46 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:28 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 03:10:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 03:10:28 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6878ALMO132583;
	Mon, 7 Sep 2026 03:10:26 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: [meta-ti][master][RFC PATCH 3/9] conf: machine: am68-sk: Enable ECDSA multiconfig build
Date: Mon, 7 Sep 2026 13:40:15 +0530
Message-ID: <20260907081021.3876876-3-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907081021.3876876-1-a-dubey@ti.com>
References: <20260907081021.3876876-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|SJ0PR10MB4733:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec1f199-1b2b-4b83-82cd-08df0cb78523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	DFNg4KCKbL0E8s5EK6DqNSOwtSyDy3LnLHXGWWijkH4lc7AfNygbE1DJ4SGXTxIrT67TomZrLXT2HLQ7YKtO5gEljx91s8Fxeo//Q4dEzqfiXoVXW2iYFOPZPssD5sg5etbdQb3h2kQoIxzkNG9m3z69iF6g8PQcQ5/TJYQZh9Q8eN0IVgVYe41dFElU8o9SiMjqO2DVeVsyLHwszBXW65OBqkuD7I0QRRXBSNVNEDb9lKINEl2UwBNJO2ZwzgTra4s/ADs7zKruKhirUNJ8YhjiJADY5M1HFUDJanlFgjwMNR9oGdDyndW0cNEBpZQWMht9BsDdFyAFNLSqSbz5Rdp/O8ucnvMuAGeaEH1utTDq3FlyaS1AtDpplb4ValBOF/WH0xvnE2sJTJB7FeMTIzrbE95QP9lPbq4yH3z1W+PIX8UZ63MuL7G1csRuK7M8+lh/njnvMmsy+Hi9T7CnqA8JzvTs+3B2u68oa1e/8eExyKp7777K27h15t7BZr1V0sYQmnEtaV9H0QMdOzgAgxEvmcR2g+JJd5tLkfq+Wt2hZbHwpGI3spD1CKiOKIMq75YF/h+SG8nxksn15NCm5w3HbME1LuF+F7PcNHL+tzyVcIjftbC6uky0ofYs7waXNhs/3lPKSXzEHY4sw1L5D/6ukJIgisCgwdvWWs4nyjX3q7AfKKbTH2h+n/Lh2LVnSCdVj9AMc/vX/d3bbab+Sw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Rqjv397pemjMr/3qL5EaQnbBYGPljivPRNAViy1hrXPpvfLwOnZOKFhy5efdu56fsLqxop0CodJ/iEqckGwvSR9iE/pYV5m6nrqlkSUGzim2zMV/GYsY5I1/v/EAFhUxTqKS9+CSqBb7+9kPuq/USSLJennBLvNgNLkDwuu5apFdq3W/cDRpo841eXr0rBcgw5lhVdK5hJ1wT83RtCnZlSsNBnf7AiXQixm7KgscvjTwDdM36MQmJRRIhj6wLJLBHIwrOFHg1aVBbfmBG065nqFe2ybbDQbZpbc2SjXPW0omHkZTxlHxbnWEIMjTJ6T+SpfTTVCWK7AI5LzBKSHQ2ND+ZT/MuuppOGFdWhii2raM/5JdzRezTnh0zBRYIbqldO3uBK311clqqAY8dAxqrQHdKXaL0UahsihbOdBgfKv1Wt2J7y/y7hMoIo8EiQZC
X-Exchange-RoutingPolicyChecked: 
	RnJ8x0KYOqdpuOCZGPU4TBEvRwEQBb51CBfaK2mVwkAgkqOFPgP2FjOF3Ti+bV/I6p2i7NoaZ4rImz0NPHLrAW+tGQHMLhSoAcDKu8F+sbNjkBTvQqMJLn6vyXFlp19oZeogb9eXUWbzprF1Q3sxKr203Zd4jo4Mv6KrmYODsJf/bxrJIjokde7JiT2WVF2dRPt6tMAqmu+bbZ+A/wu4J1S09gNURJGBEEINv/Dcdus+AX2YGlAWumt/1VjXQIUz7zMKutvzok0EQPqRzikgBt/mOpjmdDkWcdq1aWJ/kiR6kmb/A60uQomr82H0eyaJtbilxR0e9wWo+2NKO60QhA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:10:46.1037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec1f199-1b2b-4b83-82cd-08df0cb78523
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4733
X-Authority-Analysis: v=2.4 cv=J8GaKgnS c=1 sm=1 tr=0 ts=6a9e7189 cx=c_pps
 a=AENbiTj01OTyMXuKFo/uig==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=xJ2SkfbVVsHOzsf2qAgA:9
X-Proofpoint-ORIG-GUID: IKQzn8G9BbRZfOfSEAnK7kSgFLIp8FwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX10XZ6dQ1Jmp8
 /w1+FMPGOGINiP5Qq9vpCo59y3tDFJB+lea5AaRAJh6pYsfBpblnfwAl8CRYNe3I7eYRT0gdoqh
 vkMmuMkZ/lc76/cxINAUl/ANtDrJpogAA6LjE5tVjrpFQdzLTNrJ+RCzM0M2LuD/9vvot0ffgnp
 qr/SrKhArBHa5SH36yTVxBQQsqWB87uUqJmS3ayUESob/+o1/IIns28GR8JKYl0uDUd5a2b5C9/
 spLgKn4nAaDoJJQMU+tqiMzT+qyRuAlarsDBfoGaOiBTboAM9SuOA5wnwuuQNigUBVQ8ogxvGFG
 a9njQuV7rJ8dXfCoYO0gnqytR/DkoFPf8pYV/tRm+tNpu2clo1rgsdj9suPlGNzUCckuDHJvjhJ
 mriKYh4++sd5OescE7WOfph4UbCC8RSq9Psq0ojLSCDbAlXhGMC9c5V6RqsoLm+sOPuYOGwIE7l
 NLIirRiKgtujKSWdqlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX6nH9rCzB8r0G
 jhiWUBYlw/QWsv+Ey4h3QRXb+R8dmO1DozbJJzP+ViGDxNr853VCYDVv4Rdvg6gJd4BCAPcEcp5
 swxMe+0OUNrUMwt0KXXb4BTyaZ/c+aE=
X-Proofpoint-GUID: IKQzn8G9BbRZfOfSEAnK7kSgFLIp8FwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:10:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20332

Add an "ecdsa" pass alongside "main" for am68-sk and am68-sk-k3r5,
so both RSA and ECDSA signed boot images come out of the same build.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>
---
 meta-ti-bsp/conf/machine/am68-sk-k3r5.conf | 14 +++++++++++++-
 meta-ti-bsp/conf/machine/am68-sk.conf      | 19 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am68-sk-k3r5.conf b/meta-ti-bsp/conf/machine/am68-sk-k3r5.conf
index 4637f7a5..56627c4c 100644
--- a/meta-ti-bsp/conf/machine/am68-sk-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am68-sk-k3r5.conf
@@ -4,4 +4,16 @@
 
 require conf/machine/include/k3r5.inc
 
-UBOOT_MACHINE = "am68_sk_r5_defconfig"
+UBOOT_MACHINE = ""
+
+UBOOT_ECDSA_SIGN_CONFIG ?= "ecdsa"
+UBOOT_ECDSA_SIGN_CONFIG:bsp-ti-6_6 = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-next = ""
+UBOOT_ECDSA_SIGN_CONFIG:bsp-mainline = ""
+
+UBOOT_CONFIG = "${UBOOT_ECDSA_SIGN_CONFIG} main"
+
+UBOOT_CONFIG[main] = "am68_sk_r5_defconfig"
+UBOOT_CONFIG[ecdsa] = "am68_sk_r5_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
diff --git a/meta-ti-bsp/conf/machine/am68-sk.conf b/meta-ti-bsp/conf/machine/am68-sk.conf
index feabbfd1..c68946cd 100644
--- a/meta-ti-bsp/conf/machine/am68-sk.conf
+++ b/meta-ti-bsp/conf/machine/am68-sk.conf
@@ -20,4 +20,21 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-sk-csi2-dual-imx219.dtbo \
 "
 
-UBOOT_MACHINE = "am68_sk_a72_defconfig"
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
+UBOOT_CONFIG[main] = "am68_sk_a72_defconfig"
+UBOOT_CONFIG[ecdsa] = "am68_sk_a72_defconfig"
+
+UBOOT_CONFIG_MAKE_OPTS[ecdsa] = "${TI_SIGN_WITH_ECDSA_KEY}"
+
+IMAGE_BOOT_FILES += "${ECDSA_BOOT_FILES}"
-- 
2.34.1


