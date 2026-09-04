Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC172C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:47:10 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10301.1788515224101992408
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Sep 2026 02:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SGcUwyIN;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Z8qdNY2T;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6849Fhtt3118211
	for <meta-ti@lists.yoctoproject.org>; Fri, 4 Sep 2026 04:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=sJZQWf9UyMZL4
	sSUIqbnMxry/wLmFnFMBgJhVrOcYao=; b=SGcUwyINWEDwJgrWM2G2kqaXaLG9l
	ONoESDzM0MLPgIBMJoi2oNhVuWzSIREqammENnf2AkDAXklBqQnTuzeOoykJN60z
	y60L5Q1NlOiuwhKpzIKPYcpe5WnYmtpdr69y14GxA7Bf+7U7HJW14NQ8lmpEeBTE
	axP/1OmBen8pCHHSKhqvVFRVP3Ep64Om26cdDUewT99H21ZxM8g8X8eKXeYhSAvo
	ixpr2JTqExYGdDiEDJGW4Aj1POLZxutyttudoJQoTVmG0gGHeWyub+UdMO9thh6q
	3BzU5lOrXDjxTAQWrBnNcfB6Yd37RQnIWVkQL3uk3jMT09M0WFqubV6PQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfu6w84xh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Fri, 04 Sep 2026 04:47:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/bIlEBrwiVkrBOoXQBhg66QAUmHjuvLxAPQBbboNPx+wIhLbyb7WlvE1z7AaIe6srXyuJA81SnNKLJZX8vokSaGu+60KUDMd9Z35QOyvx5kAekXbE1ugNgVvpkqeRXdru235eAiTqlTlFRhcysl0o0gBCkpP8OLxTfpobPX0WQrlATSJ8uuD/YLjfm8zur5CIytYgzuL1kc8Z26CrC15syDumjqXJRTXnEhGCU/FfrIHHD02nv/7r7oGG062hgwUgeNyZrMjpr1/BRNyLwOzsc5KkNvvX8DIUJPgaVvinkPtDMUTk1++1OdOzCURdHgCQx0hO2EJ7B76NAlfkTExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJZQWf9UyMZL4sSUIqbnMxry/wLmFnFMBgJhVrOcYao=;
 b=JAZhIJwm6WvwLqLZRFIwkn4kIIN9PSCCS8l5v9pv6wc76qyBQdyewZ2OFQX3pHr/orlmZasLWRtVuZ3fnDx/Qo13ANOjpwBCYMp4K2iiq1E0b+2K1OasISZBHWUzCqjN0Rp1xe1ifDR4v1sfxckA2WGsPE/rZEqh5Gd6Wj4Ip3k9SYgOH8YgQzazigJ+geE5MjS5/KoCq85f/wksI42UfXyEaWYXGtJdd6pTGrw2NPdEewoLkBxc/X/aQMNHfgAMwNQVyPQpW9UP/3gZHQOTI6m7Tusb8HI+0gP4Jp6etIIobkxYLEyMByWcNVvLzpzj0qDgFcopCfHbKELMyzkUrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJZQWf9UyMZL4sSUIqbnMxry/wLmFnFMBgJhVrOcYao=;
 b=Z8qdNY2T1eLzJKH6p5fiuPzRB/ZEpqmuh3fq4Xy9qVRQdrzsqsL4JlSiX2WjJBRnnDfVOiDkDJEpukoYrfprNeI+cWLA4l4i78YyIgHcv458M7bILT44sK7n3mHSttkd/CeR8zUf4m/fblEeWFaimAZO0S9oMyh+fqRPGW2Fgzg=
Received: from BN9PR03CA0093.namprd03.prod.outlook.com (2603:10b6:408:fd::8)
 by SJ2PR10MB7759.namprd10.prod.outlook.com (2603:10b6:a03:578::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 09:46:59 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::13) by BN9PR03CA0093.outlook.office365.com
 (2603:10b6:408:fd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Fri, 4
 Sep 2026 09:46:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 09:46:56 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 04:46:09 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 04:46:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 04:46:09 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6849k6m53272627;
	Fri, 4 Sep 2026 04:46:07 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>,
        <u-kumar1@ti.com>
Subject: [meta-ti][master][PATCH v2 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Fri, 4 Sep 2026 15:16:04 +0530
Message-ID: <20260904094606.3233160-1-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|SJ2PR10MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: fac91a40-db79-4902-df59-08df0a697592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	yn01Vrqs6d3olzJbrj5iZalPFpkubSnnR/ZwOu4tRXl5+U8zgZKoA2Mt8Wi223WbivCStgOHVckPm6KrLDP5sEJHMdqjIB0X33GforrPB5plDaGaT9in4OZAUKmiCxW4Xh5JOqQ1hRdmoYLqnVjgsQ9w0Rxn0G5gT6y+mllhd/epbdGnKq4EnQ+LZ59xHa2OLu4NlXZbSQohCJ0wHJYDueucTbgT4EznmS+5LUfJ+DBvJ1ge8bJAnGRteucQ7dwI9HAHFlBXCQDJsiz3a/U8YYJtT4PSjtbFc+9Bqcjzvm1IvrOCCrja3byQdQ2TWue8glzLP9mLzjN6hM+FEmb6G5ww9eUVcRAkFYfLELhau7zYhKAMBfN9RL/dtKUQUszBOIu5+bgLldgzB6HHKhAPgygctYazdJPT4v4KFF7L33jM6ocnE1aCZoOg8UhlQiA//8pVb1BUex1FAW20yo78PZvz3ZIXBaieCWLz1uZUeLqH40qVuzYXJt7t9lvJRnVRsfMAUdSt81u+Oik2BSvmN9GZ4JqwKNEoAxcJHSCsUy55eHnxNXnrsejaU+SwVjn0l3tm26MP4NIyXcQEN3pcfcpbEFMOOTpcA3okWvUQSF3KjaVV8Mnhjd5yKULFxPBjVwS0xxbdSPAqjUZOOI7r4034MXMS4AYT/NDS/SOJlf6ks4zFtehQxjffTIfDrSx9ydtLHM+4IrCi7vprlj7KOA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wBMQrv2neX17EZCIgmmnW15/6ujH4LBozKmd7rXkCi4AOm8ZNNd1/Hbk2lDrZF96oHlV7DyVwD6ypHtPPIFSvIORXlzFWSUOn7VXs4DuoQUHLmjKh3VF5W1DV3JhfbabJmndQwc+eVjfh8O7NJeDfY+hSIp1f+BXUIcDLMvERUVsxGN+Yxjsx/rOnjq+rFztYjGATam8Q4HxDRiad8NWd0qpkEMqSy8npDIzWHKslW6aeJZFvGR5nhyd6U/39Kr+ratW4bRXx7UWQ89CglE5xhSaa5n7Jo48sEP1QQbXqQ828mqOdMqfiormgZomkSAE9waviNlxjsIyHHIy78T78xPoRKUs4ghPmSUBPOEnw8EvGSXhpy3l1hEU47TQED06OJ+glzxY8YfXFnu9s+mZxWmw8ifE5O9gr19Yf4hIBnr4CMP/cy6T6djt7mf8BHts
X-Exchange-RoutingPolicyChecked: 
	WrSBCZQ3PgkYMHa3i1oyWXCfxzr32ab4R07pNHkt+R/C0hOljdBHIJOrI/NXP9cKVP8cF1FHnoFQSKq+s41UViKt/nh+kqSLPwcw2E7vLi7Alh/sXNLFSzhueMwn4AWTbJ+6hyAMRY1TJ1N5NJOLxeU80B/fAz5ECwnYbpqaZyJxwcf1z8XjTMEfcMLk7emxcLVYpAQwOJG/4g1V6sjdZX/znUnC9Ie9JAfbKQFbmO5AqQPKScxNBDMgvCHQPAacuPuKS6XS8coA7atH8aNIfcLlNIeo8453pt/t+fymNmqIKpB/KctAdWGSbp0kB67O85uNvw/DqopoU3LvZgEOZA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:46:56.9147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fac91a40-db79-4902-df59-08df0a697592
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7759
X-Authority-Analysis: v=2.4 cv=XLoAjwhE c=1 sm=1 tr=0 ts=6a9a9396 cx=c_pps
 a=MmwiYf2CWIeG5bfvH5NISQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=c4mgLw7UoIgH1LjkLBIA:9
X-Proofpoint-ORIG-GUID: ne6HumNEpNI8GcoxTpb_YkzOyyHeShYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX9LOp1JNEreZ5
 Gk5wvxMqOYMOCmk6aZE2ImJjUJPgaipGYLKBbJDbIFo6uBwIKiGbU1ppqVjDiS/y8QQxvNacjvR
 ZxufS/dz06uuZM3FJ7zj5pEXbYhNj224x8pU2r7KhWpyTDzUawEWGhxs8+lt78Ivr/EZoiD8UG5
 GcBDiEAQLCHiMJ4acsluTf7UE+b9PEljUYSdvsgj50x3q4eHJJ1yEtTbqDAnwXMGUtlWSZD8JQT
 LriTjXDtdlMrHBUuFPycXbFPQpHHwDgTRbpaplZuLpYJ25CAcm1glo7ekGZs4/SzHSoZNxzQMsQ
 xB2xpjc73V44fJ2sVbzJ6gMf+G1CBBBEIHG3mNdaxGPfi9cLSrqQmju54cJSw4H+Cvr09xa2hq0
 7P5bIbi5IZYAXB7BTJO9nf4pPYjapyAgsAng0Qf0GMilSwa7zPfZtFWQ5E1WaJFP0jUJVVD5xbB
 lzqRbKWRGaPIZBQZUuQ==
X-Proofpoint-GUID: ne6HumNEpNI8GcoxTpb_YkzOyyHeShYN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfXyxAdoD5H+CW/
 Plgan6PtdVEN75RiCDbB3FdvZuFAouKAjFHKNINkVZqxQAiGaz0wNRf8TDGe+P4uSlrO3B79tsE
 dD7Dqu23w/Zq3dKedSv+onizMJPwWEY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Sep 2026 09:47:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20328

Add an optional dynamic layer enabling dm-verity block-level integrity
verification of the root filesystem for TI K3 platforms, using
meta-security's stock dm-verity mechanism as-is.

dm-verity hashes the rootfs at build time; at boot, a dedicated
initramfs loads the root hash and the kernel checks every block read
against it. Wires DM_VERITY_IMAGE/WKS_FILE for the K3 boot chain,
hooking do_image_wic instead of INITRAMFS_IMAGE to avoid a 3-way
circular dependency through kernel-fit-image.bbclass.

DM_VERITY_IMAGE selects which image recipe gets verity-enabled
(default arago-base-image, overridable in local.conf); all effects are
scoped to PN == DM_VERITY_IMAGE, so building any other image type is
unaffected. Only active when the "security" layer and dm-verity-upstream
feature are enabled.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>

---
v2:
 - Replaced hardcoded /dev/mmcblk1p2 with UUID
 - Added install -d before installing the udev ignorelist file
 - Changed the FILES automount to specify the exact file
---
 meta-ti-bsp/conf/layer.conf                     |  3 +++
 meta-ti-bsp/conf/machine/include/k3.inc         | 10 ++++++++++
 .../conf/include/dm-verity-upstream.inc         | 17 +++++++++++++++++
 .../udev/files/dm-verity.ignorelist             |  1 +
 .../recipes-core/udev/udev-extraconf_%.bbappend | 15 +++++++++++++++
 meta-ti-bsp/files/wic/k3-verity.wks.in          |  5 +++++
 6 files changed, 51 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
 create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 3cc54aa4..aca35cd3 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -20,12 +20,15 @@ LAYERDEPENDS_meta-ti-bsp = " \
 LAYERRECOMMENDS_meta-ti-bsp = " \
     openembedded-layer \
     tpm-layer \
+    security \
 "
 
 BBFILES_DYNAMIC += " \
     openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
     tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
     tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbappend \
+    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bb \
+    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bbappend \
 "
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 2ebbfb9e..e23e0ead 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -64,3 +64,13 @@ FALCON_INCLUDE = ""
 FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"
 
 require ${FALCON_INCLUDE}
+
+# Upstream dm-verity path: meta-security's own dm-verity-img.bbclass +
+# dm-verity-image-initramfs, used as-is (build-time hashing). Only active
+# when the security layer is present and this feature is explicitly
+# requested -- see dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
+DISTRO_FEATURES[validitems] += "dm-verity-upstream"
+
+DM_VERITY_UPSTREAM_INCLUDE = "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc', '', d)}"
+
+require ${DM_VERITY_UPSTREAM_INCLUDE}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
new file mode 100644
index 00000000..4de9e2fb
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
@@ -0,0 +1,17 @@
+# Enables dm-verity to check the rootfs for tampering on TI K3 boards.
+DM_VERITY_IMAGE ?= "arago-base-image"
+DM_VERITY_IMAGE_TYPE = "ext4"
+IMAGE_CLASSES += "dm-verity-img"
+
+DM_VERITY_INITRAMFS_IMAGE = "dm-verity-image-initramfs"
+
+python () {
+    if d.getVar('PN') != d.getVar('DM_VERITY_IMAGE'):
+        return
+
+    d.setVar('WKS_FILE', 'k3-verity.wks.in')
+    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
+    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE IMAGE_NAME_SUFFIX IMGDEPLOYDIR')
+    d.appendVarFlag('do_image_wic', 'depends', ' %s:do_image_complete' % d.getVar('DM_VERITY_INITRAMFS_IMAGE'))
+    d.appendVar('IMAGE_BOOT_FILES', ' %s-%s.cpio.gz' % (d.getVar('DM_VERITY_INITRAMFS_IMAGE'), d.getVar('MACHINE')))
+}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
new file mode 100644
index 00000000..5af878c9
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
@@ -0,0 +1 @@
+/dev/mmcblk1p2
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
new file mode 100644
index 00000000..dc6b37f9
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
@@ -0,0 +1,15 @@
+# Under dm-verity, the raw root partition looks unmounted to udev's
+# auto-mount check, so it tries to mount it a second time on its own,
+# outside of dm-verity's protection. This tells it to skip that partition.
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'file://dm-verity.ignorelist', '', d)}"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/udev/mount.ignorelist.d
+        install -m 0644 ${UNPACKDIR}/dm-verity.ignorelist ${D}${sysconfdir}/udev/mount.ignorelist.d/dm-verity
+    fi
+}
+
+FILES:${PN}-automount += "${sysconfdir}/udev/mount.ignorelist.d/dm-verity"
diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/wic/k3-verity.wks.in
new file mode 100644
index 00000000..2ad0609f
--- /dev/null
+++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
@@ -0,0 +1,5 @@
+# Disk layout for a board that boots with dm-verity enabled.
+
+bootloader --timeout=3 --append="rootfstype=ext4 root=PARTUUID=${UUID_2} ${TI_WKS_BOOTLOADER_APPEND}"
+part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER},initrd=${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+part / --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" --align 1024 --use-uuid
-- 
2.34.1


