Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD39CDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 20:14:06 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30616.1782245639824525933
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 13:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=LvULlWsw;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=RKa8jodx;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NK1I6B2678891;
	Tue, 23 Jun 2026 15:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=J6MNu2puefAkhKDDIuYF9AzBzMd68B9BO+CtZf6Y2
	ro=; b=LvULlWsw1zscM9lIJaaxfaYZ3Lxbqm9ZM9pzSOv2//h0hO5RVVyW9p8oi
	Eeqmq6ivWTd3T9XzqQrct/+Hwndi67UeY0n7Wch3GtnBp3I7JAlL69DHMOGrmkNK
	6NbpajRkl4c1vqQXgfIYMMG0y5X+k9fQbJpHm31Dnn6EeuLGK+AAQ2KBzh9TlhOH
	eHOOOTVLB8pOOeMXKOerHaeex7itymV4PHeAHYEu81gz7rNec8/obinG3mDboRiU
	ZrSX17xFrCIoPleHaVdB8g6moLrVx8okZYJ0YEsSwMSRXWCKHyzoClPpHv+ECxAa
	vKbBpf26J7SpdDx3mr9ia9aDRFY/w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eys143j54-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 15:13:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS3rDVwjGBfMDQXuIJjsEeBJaFeeYdhNGAOzjy1OBlvDHAV/TbdvN7n49zNj03fYp74HHxVJpyeeDQEpLMaLk46mMj6wutGZPMzypCHGjWvFUarFl3gb3ico294i3ge1jhkIGqFDuvtM8brXZzTXkb6S4sIfLR1kOTO92BB00A3qRvEBugTByMWDA1ueo+ACMH1bR/Y4DRVbkydoxZudBkdlNCnjI5cqDcyOkd/eOE3q1KfyZoZWUOo9l7XySRU+ubg7tcg4VF8Ys42YTEO1dH8GA5EWtoCGez3L9s+dPuyDqsTuvQg3k2kXK3wXAT34ql2rBl/nzTe0jdKSC0pJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6MNu2puefAkhKDDIuYF9AzBzMd68B9BO+CtZf6Y2ro=;
 b=OkNvbNKw8dk87gLuuPdq9dmRRsU1LhratnhAOUagHC1+KYUQ1g2CNNs6p96sX+NY6g40zXwATZAANmmFevB2d+PxU/iS2zr8BKfwrpvvxJdwe8IIGjShm7CmiqVEo18TKEpErAQn5oVhx/nvwJ76piSubzKSMj+t3RBZkSqF0Ql26gzuDAKcnV2M5o4MbpFgbzFZ7X+MyY6j3Lzl89W++JSGW7Pk4DB9GiugPneBy4/fec6mXbKYQ1XU6iHjpwwWj3XFXLEMXGfo2jMQwfDosBTufEccQj8D2gMG41a3/j75b/P+hPpnW+eMKu0l7ZeGg3iUtncsvaDb8G+tWBhALw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6MNu2puefAkhKDDIuYF9AzBzMd68B9BO+CtZf6Y2ro=;
 b=RKa8jodxgbUEgnCMhxCJNPPU9KbR7jWJf5fK2pzsZCnb8tqfk/L4ue6wcFol+6s3Y9ZkaMrwEzHO3B+yRNp0SbBg8UwGxPc4E0q/HdSWxfQ/39KOCbDYGfRaSO4rkPuBkpDIYMAecgx6+Qo8yGDgXdhe2CASGXTkIXmCAgMXydU=
Received: from MN0P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::23)
 by SJ5PPF8337777B9.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 20:13:54 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::5c) by MN0P223CA0022.outlook.office365.com
 (2603:10b6:208:52b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 20:13:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 20:13:52 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 15:13:47 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 15:13:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 23 Jun 2026 15:13:47 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65NKDlkT3021799;
	Tue, 23 Jun 2026 15:13:47 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/wrynose][PATCH v4 2/2] mesa-pvr: Migrate mesa from v24.0.1 -> v25.2.8
Date: Tue, 23 Jun 2026 15:13:47 -0500
Message-ID: <20260623201347.1152792-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260623201347.1152792-1-a-christidis@ti.com>
References: <20260623201347.1152792-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|SJ5PPF8337777B9:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e27c0ef-7f84-4915-9495-08ded163f1df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|12006099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Bp6qfXLjdLZUhz4jBQ0M+MnFdAWvD/fib9JUwyXYAzPMt9ZJbq13vYuIvXn4VyXtv7ztP2leIjbl/oarWU9opY1PSCiJU+egVAFg5r7C5/D2s7lAwHhkttb72yn+CAnOr6CtIuTmo8SLtex8z6oECLzv6FXIrJnvqOgi1UIPaoJnUjYDK1ANyPW2u9TW9ZJHj6rbY5MLITy196J9Oer+UV28TePwfaboY5PFT9RiEFCHEjxu8xpBf8kzZXHC/0+5cMUv8ntAxMJBEUspMRvHlrekQnw4SPyZowmAkRmtSvJm1abFuoK5Pv63py7Oc1sCg/9/SvBH1yZ3DNsvn0pxiLoOSiCaZQRFUb9rOOqJfBFLmPB804hMtYkZuk5dmuObxFiIBfkPKaR8/VnRA4j7aILsd2dh55oFkgMyeov5vHWm4k03ehxSBT/CTy7/XLXYRVU+Wi/bebPn//EGqKz73dPcEeE1YRhvWzACKF65mhY4t+/QnT+2RSu9mLjzDzYXxq8Fx6rLNiSbo3LtJxqEjG5NGqxby+BJEYLVRarxJBg88h0yg6X9+DB19O3NeW2vIYWkYfJpHvUtiVms9Lce63GsBE1YXP9ydFrHDS92v+BS54LvEde6xubFtTE+lsTxxaGhHykG13BbaPfFFwemneRDfOGGK0iG1/6yafinFPJ2IrIq+NSk6F2K0tDrFvA+dBIlkHjo/Xtrgh3FAoqyvw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(12006099003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6d4NI6z3O4r+nZwAL2Rug0A/5xME6QdmQGxrarz0NGI1QzWyqqLPlfcKrp9u0wXheppthhXsWIP8Ej+w16E9N3FYMJa6igBuWpAQRjit6Kti6KX8qLDGq2FZ8hzTDyuKjYTuaTxUXCBM7PjB3uXaqrnFHHu49fRvckaP0OP5mjTDK4IpmKOPkZAoAfrT7crlJEhifFeArnJGZddCIrxQWluL9OEJYGI9FnFJTsjDnIReAaKVYj0Tw4tBMUhFdC/zFW8l2W4QxFAHW1yDzSpTn9x13CnHDSDkcMuQ690p8PNUONjnQFbliVBd16MCb6/n1SnvUASPq2AWCM5wWxDZ7lcTy9eaBgmMl92IPJyDAiDsqJtixau6qUmfpl4qVuf30sc0X59e91wBwGdFdscvzFqGPLYZWIPDQdTbdl1lEBeJqb1ZYxM/ihC3JcF3ssGO
X-Exchange-RoutingPolicyChecked: 
	dj2z9eEbtkgiIJAl4ZrfOtLPm1RdbIXL7EfRuvNTeZ2yY92UgxeV+lvbxJUCwoUAqkVRtR7VgY7ZS1tNs/IWvnrmL+k0/jg3IQ38SVFIsMow/ScXcnHHewm8rzUbY+bZuprXyVfJVgTcri9fZhfBjMLy0eixo9FH9twbfu0d79iZ2MqgRKZ6vqu6eNsNGzCPYM27Vj5lDCzTJNXXgB/juZsgPfENI6gpmDPLA+Qp0MQXhXc8D2GKgNmD4ndVPXvA+bQ26Nusrp2DkpluixdnOEurGOMHTUHkRzIX5zfZGsgtvVtYicmlCUGbB/pzuRbQPG9DzUbUqdfrnYPoD0AwPA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 20:13:52.1634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e27c0ef-7f84-4915-9495-08ded163f1df
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8337777B9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE2NiBTYWx0ZWRfX7CQg+MoI293j
 I7n8hm+ofS0I/AvdRQFnEykt3Q3RX4VzjAOSmj/F85jDRMLBXpJW635pB2YE5KcedOzaMgNBTFW
 4VB3sZFzZxCdl2bWw8JFiVLLncVMgSU=
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a3ae906 cx=c_pps
 a=1XVf1DeqYCuQPrRRBBNiYg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=ZpVaWaFtAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8
 a=qZ21t8ptJfGK88ffRDEA:9 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE2NiBTYWx0ZWRfX7AyngfBWJi+K
 MsyhORAUn9fG55wpsLp2TmCM0kFT84JASX1bi/w3Ku7bOjuaUsMhxHDC+KRDkSTiU/63/PZvF95
 YlpvHO+roEqu3Eba99MJEQ6NCrVC2gYmancM0ngSmZOdV28+lU1flWAsQYHJPuoyi4+rGWDUltq
 Xrw5PZkSy5Js1YDAdEmzFA6gGYn1qzac7pFCfIjmq8agWCELI3h4Svpkr3YcMEhXXqbNAGOeWo3
 us8mT18Cf7J0gSM1KQGVeFbRWiSU7nad0NuQdhNcnBRClubAQYA30skitjhOMHBhRrdPnZawx5p
 jQjhW5j/R5mcToYqrOnPGe6Yebdq/Nx2xYHFRG0/KrakMikVRjglmf0AVbdD3WviIwbEbAn0/BA
 R6JhNsvp9f/h9Ph/A4kCRnDM3o9mK5AXTDBSZDEpgg71kPLvAIgx2G6fbbHz7gs1hoI/TsQv60C
 Yk8asvCNxaxNqwX4qyw==
X-Proofpoint-GUID: EyL7DXWz5z9beDAZvwShICM8N3oghcAh
X-Proofpoint-ORIG-GUID: EyL7DXWz5z9beDAZvwShICM8N3oghcAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230166
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 20:14:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20063

From: Antonios Christidis <a-christidis@ti.com>

Migrate mesa from v24.0.1 -> v25.2.8. Edit the ti-bsp logic to
build/package mesa-pvr v25 for both Rogue and SGX cores.

Remove some duplicate variables from mesa-pvr-25.inc in order to work with
the main bitbake recipe mesa-pvr_25.2.8.bb.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
v4:
- Don't remove v24.0.1 mesa related recipes.
v3:
- Split into a 2 patch series. 1st patch copies mesa.inc from oe-core and
  this patch modifies and adds functionality on top of mesa.inc.
- Delete mesa v24.0.1 related recipes and patches
v2:
- Add support for master. 
- Rebase on wrynose-next.

 meta-ti-bsp/conf/machine/include/ti-bsp.inc   |  2 +-
 ...sdetects-64bit-atomics-on-mips-clang.patch | 24 ++++++++
 .../recipes-graphics/mesa/mesa-pvr-25.inc     |  9 ---
 .../recipes-graphics/mesa/mesa-pvr_25.2.8.bb  | 60 +++++++++++++++++++
 4 files changed, 85 insertions(+), 10 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index a48c4f07..bf90d1da 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -44,7 +44,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_18 = "2026.01%"
 
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 = "26%"
-BSP_MESA_PVR_VERSION:bsp-ti-6_18 = "24%"
+BSP_MESA_PVR_VERSION:bsp-ti-6_18 = "25%"
 
 # ==========
 # ti-6_12
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
new file mode 100644
index 00000000..baa98a0d
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -0,0 +1,24 @@
+From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Jan 2020 15:23:47 -0800
+Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/util/u_atomic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/u_atomic.c b/src/util/u_atomic.c
+index 5a5eab4..e499516 100644
+--- a/src/util/u_atomic.c
++++ b/src/util/u_atomic.c
+@@ -21,7 +21,7 @@
+  * IN THE SOFTWARE.
+  */
+ 
+-#if defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
++#if !defined(__clang__) && defined(MISSING_64BIT_ATOMICS) && defined(HAVE_PTHREAD)
+ 
+ #include <stdint.h>
+ #include <pthread.h>
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
index af674c83..0bcf66f1 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
@@ -14,19 +14,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.rst;md5=ffe678546d4337b732cfd12262e6af11"
 
 PE = "2"
-
-SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
-           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
-"
-
-SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
 PV = "25.2.8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-S = "${UNPACKDIR}/mesa-${PV}"
-
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install:append() {
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
new file mode 100644
index 00000000..44becc66
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
@@ -0,0 +1,60 @@
+# PowerVR Graphics require several patches that have not made their way
+# upstream yet. This allows us to build the shims we need without completely
+# clobbering mesa.
+
+require recipes-graphics/mesa/mesa-pvr-25.inc
+
+SUMMARY += " (with PowerVR for TI parts)"
+
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=ffe678546d4337b732cfd12262e6af11"
+
+BRANCH = "powervr/${PV}"
+
+SRC_URI = "git://github.com/TexasInstruments/mesa.git;protocol=https;branch=${BRANCH} \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch"
+
+SRCREV = "0cb5bad52580f156b02125f4c7121ca7198e1489"
+PV = "25.2.8"
+PR = "r1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
+
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
+
+PACKAGECONFIG = " \
+        gallium \
+        video-codecs \
+        ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', 'opencl libclc gallium-llvm', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
+        xmlconfig \
+"
+
+GLPROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+"
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', '', d.getVar('GLPROVIDES'), d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
+    virtual/mesa \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install:append () {
+    # remove pvr custom pkgconfig
+    rm -rf ${D}${datadir}/pkgconfig
+}
+
+FILES:${PN}-dev += "${datadir}/mesa/wayland-drm.xml"
+FILES:mesa-vulkan-drivers += "${libdir}/libpvr_mesa_wsi.so"
+
+RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
+
+INSANE_SKIP = "32bit-time"
-- 
2.34.1


