Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4CCCA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 13:00:09 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12872.1790773202542531863
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 06:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aU8JiMQ2;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=bkP/IAjX;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB5w5h3214062;
	Wed, 30 Sep 2026 08:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=bFUDBLqlcISUf
	mMr2ZcEGNeYDOfMw6J/e4NVbwCbwWo=; b=aU8JiMQ2a+rsvTrVy22o/9w8YUa9v
	8Mu9Sus6xyARUqQvMgI0pp+KGoRi2E95evOOU4cvLhuhUTmFnhvjvyJdUGhhpwAk
	YJIHJRi02Jhb9TaPlRHo1ksg6i5sWbabwxyKP9vMzg0/LgnnBnaE8jLct+H3ZQTX
	88zpTm+3zsW9KgmSkMmQW0TJeDw3KGrChg0hFo32vJ+3sC+9B63KJSGop9ND/Q+c
	mx9FHB/fU+EnOtfaQVVvBVZZV/v3/R/BMpuSEtBEuc/YZA1s906gSmra+M4wMcBg
	HoO+IlrwfxbbH2GnBFIaYuB73P3a+C4e5tly4OAxyaTN+9GRcYHkZ43wQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydv95s8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 08:00:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxWRmM4aSn8EjX4aeS0BhyAcWuzBEtSAkt/uaLCHOt9qtB2NKX9SGrvTga52KzBaWUpxUNjckESxwOCgiSeKGp1uorYuDEaXQGhDP5S0PJpzRIWTWQ0dW5K+GPiVhy9+tF4jYhEncLHNLYfmiSMhYVKsmSu6yWYwLiY8eG6NccR+NpPNrFVFP7fUAmm8QBBh2415OVtx9FxGdixvIi3eOv+ep3B9IAyrSDSzxzcilzVCQKsY+i1Heo24i9WHMXAYFbnWsHaUk/mttigyW4g96nQbeohSSjW94OEcTMf0lOFcsp8iYNkcGvXSMXU/6KWiJAR6FeDnEnZ5S7WP0h347g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFUDBLqlcISUfmMr2ZcEGNeYDOfMw6J/e4NVbwCbwWo=;
 b=Tfmho15EPbs2K4XhSsgkCJeyY3XqPmnize6kj4OgSTseTMgBqRB7jmrOSa6+PJnD2TVxDv5BRtSQ1drGET8496x4IvDtNIHgdnK0R63mfxFFm6zIxHpJmt28XEXvxR8jlSJt/B0bPFVhhBgpujoGPfAh2pVyPkvMFYjtnOadsQaKcZxvOzx3wNr5BbhXYDpaGXZJOmpgBIbKjN02NO0tfFatTBrWuv9oX/GIReq3DBVuBFbAjWJjtqLB3twHaapdCdARoJP1VgDf6ZK/CRk0iM2dndiPI64wVWA2QF10ZcLgLm64NN129A/MXsKLDaPgEiKFozSMUUK6MHfJwEej9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFUDBLqlcISUfmMr2ZcEGNeYDOfMw6J/e4NVbwCbwWo=;
 b=bkP/IAjXFMyews0uDqxNTFQVtPZeXSyeWMylr3WzyJTZlgRg9j7nJ1liWww20y2Fgsjz/iJWds/nKED2lzejHakwmWGSdHIUjiI7qbygLGZm9fkTDPf2xN/sXtV2TClUDMbdfTBZsJBZ+e7r1n1VVR/4wNjqz8fx78CP6sG3f9E=
Received: from MN0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:208:530::14)
 by CH0PR10MB5017.namprd10.prod.outlook.com (2603:10b6:610:c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 12:59:57 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:530:cafe::77) by MN0PR02CA0016.outlook.office365.com
 (2603:10b6:208:530::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 12:59:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Wed, 30 Sep 2026 12:59:56 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 07:59:42 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 07:59:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 07:59:41 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UCxdxI4098429;
	Wed, 30 Sep 2026 07:59:40 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@konsulko.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>,
        <m-chawdhry@ti.com>
Subject: [meta-ti][master][PATCH v4 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Wed, 30 Sep 2026 18:29:36 +0530
Message-ID: <20260930125938.95629-1-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|CH0PR10MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ef4b17-8515-4282-a004-08df1ef2ba77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|10067099003|56012099006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info: 
	uaFLHm1/38/GfFfFxDb8he+c2Jy0FhuzAqONWrb4M7oNdTV+iD0MeeVdXiADPwebsTAGzewvuUSaMJ2lpPxCdVOpOSdNCVSpj2iyXh4HKJwTNfKLvxeyOFBx8OFEiUTOJCF1Mb1ih2H2SGoK/Ich1orZyLxnUV1jhSzRwXAGBy3NMJ8T+VhWoP0gHaNtx535bzTapMvIleqx8obuElUF8XP/Arir+Iotst7t3aDhs7Cpt4txVUKij9DiBzIzGiy1sP2OX128cE9Y5DYhZHZivjJ7190LwCd3ukZQ7+5gH5LPXsnE8DTlEtQwMhYsF/M88YZvoXBSLzW2cjp1G9U4qtWsvI1KvkW4LLm74XLDMH8ONG/BSlE+9dvJ6+UyBYF03wVaYdWSYhqJ6uo7iVyk0lvC22hkjScsgTJsc/kNw7v9VkCuyF369+KAnD13hNZ76ufbLoLjlykeh6xtcBaTvJeTzdZk6SqDG7PwrDMdupvL3rIebFkyoSWvZ+3XCfJEIenBIyfJI1XqEhGYW28z+9lVQs7MXOV42KnkfnLB7ETEoohNkfJoOkiGcN0cZvYkFLaz78kiVnNH4Uf16tdf22PlmKlzFMHTJuEnYhzxqfp9H02JwJqim0OLzw0Lu4WUeN7O+nds99mLOaRIDVcSdqg+iVcG+I0Mb3ktx8j7fGjmSsJarJT8meXg/KfgAkwoetBBMVBhxEGYaBuPB2OvRA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(10067099003)(56012099006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	92oV1xuVt8cnXgXQ4Bh8vPJ1Th6tBjDKfvxDefUsko9ewsbNygSlns6F/b4pct7GkACz0NEW2dGIPpapJtKzyBa7Nw4e5i3teXmrxjetIgQQql8XJ1ezaODywEIxhmczx6YocF1CyOibk7cml3gO55QPXoTnV0qEEzCkTAnDiLvmjcwqbQ02a7tIm76EUdhisPHus6zAWviFbh2qz62mYrZriChAfdH714aWeptNIodqm3K7oAE1IfBLOiD+g1ALnoypFypTVFufLRG8f7ege5KUmrOzj+Wtepxyz5n8ARG2c09DEpCfUOr8BTh1eG7fbWcjDQdK//q+RxZpW4VvSH2ZQ2KETzDSC8crHJm+fSiqlHRMIjcZ6HJ1sUTSi3dW4YAR86eqU4ujOZjMykm8wJYWtb24uiEUw7Ob4NIUZGzYzP4u79Q64nbKIZT+Vd9N
X-Exchange-RoutingPolicyChecked: 
	5mLJV6uIAtngpr3BGX1L7uxVHj9KmVBAM2RJfkxUIauL5Ap2/nOJnavg/RjccHA/eN1cYGr1h8kwTUYk1ineFa0+9b2FjSIoPXN9V6uvC9mVT82ot1HA8gNZ8ZBTzPiRMGZPxEd25mbwHjiikmfxDUUky1e4DyjDAk9yWym8VOKVevbEWPeHuxXn07QE18GIVjLvuYxdj0YJDG5r+zq5b+gIFe5N9+8AUkYzj0VHnCSraHlOnLRF7m4FYjOTHtj+AcBJXFAH2kSomQi8vq0ct9MddN6IkJ+VWUtvbfsXBLPwTbhIZvKxAr+A77eKixtbbuC6KjV2UIIufoPknzkHwA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 12:59:56.8059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ef4b17-8515-4282-a004-08df1ef2ba77
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5017
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfXwOPCIa9mQXSz
 RBnw06ceTDRcyIQcXkL4P0AODOdcrpRSi8bOsFGAdkWVeq2CW6tYMJCBjFf/QUdIpoJNdSIH7FV
 s1c/4g3c4AwdWr1zgr1ec/ugcczrcDU=
X-Proofpoint-GUID: o3qbWb035Q0ZmP28VqiBBL9iq5KzMGsw
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd07d0 cx=c_pps
 a=91GdPAjHHMbPGBWG17ie4w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=cW7-tuCRIaqJVRneuyUA:9
X-Proofpoint-ORIG-GUID: o3qbWb035Q0ZmP28VqiBBL9iq5KzMGsw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MSBTYWx0ZWRfXzO4pJ8I2UoWR
 +dkLr9j9bhyL2Gv++IOhlFVfpHqfnvl89E3kphYzsLS5Hn+T3mh+r+61Q69lAbRATHCSbRDgX2q
 fK/q7TA2d6hWpCKLf7e7wyNz/1Z6r6+yHxEtbSXW7d2yTCgAjdVRrn3WhiJD6nSRMwlpqyjuoNt
 yKv5yzTze5/BcI6Z0gelV4cBUIXfCdN9Vg4NPL0jSxjq7MB5thSUmBrp22AShom94FB0d3Ma1Mr
 ttDb7kc6dMEdGVpMjGBtvzdy3j1j7YCbViWuxUXdBhmMWWUKNIyb6qP2xhHh7HRJ9X+LwAjp2ZB
 YzGNc3b/I/7pWqNAfWycPTJkmFr6CYB7cwWl9A6r0+nBqqpv2bhD6IMBi56/Ikvb2xNUb1xAv18
 sxWy7Ai3vtSCcaH2m4kyhnqOuFphbhSNJRHnLGQk47BJ6BskAwCwBJIUhtlCTyljBAyeZmYbUco
 TJBEU8BBBdithyzkQZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300051
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Sep 2026 13:00:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20422

Add an optional dynamic layer enabling dm-verity block-level integrity
verification of the root filesystem for TI K3 platforms, using
meta-security's stock dm-verity mechanism as-is. Requires meta-security
to be present in bblayers.conf.

dm-verity hashes the rootfs at build time; at boot, a dedicated
initramfs loads the root hash and the kernel checks every block read
against it. Set DM_VERITY_IMAGE to enable all the verity-related
recipes for that image; other images build as usual.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>

---
v4:
 - Use ti-core-initramfs instead of a separate dm-verity initramfs
 - Instead of a DISTRO_FEATURE, just check if DM_VERITY_IMAGE is set
v3:
 - Disabled the automount rules from udev-aragoconf, so don't need the
   ignorelist for dm-verity
v2:
 - Replaced hardcoded /dev/mmcblk1p2 with a PARTUUID
---
 meta-ti-bsp/conf/layer.conf                   |  3 +++
 meta-ti-bsp/conf/machine/include/k3.inc       |  7 ++++++
 .../conf/include/dm-verity-upstream.inc       | 23 +++++++++++++++++++
 .../udev/udev-aragoconf_%.bbappend            |  5 ++++
 .../udev/udev-extraconf_%.bbappend            |  6 +++++
 meta-ti-bsp/files/wic/k3-verity.wks.in        |  5 ++++
 6 files changed, 49 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend
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
index 2ebbfb9e..f19db45f 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -64,3 +64,10 @@ FALCON_INCLUDE = ""
 FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"
 
 require ${FALCON_INCLUDE}
+
+# dm-verity protects the rootfs listed in DM_VERITY_IMAGE; see dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc for what that turns on.
+DM_VERITY_IMAGE ??= ""
+
+DM_VERITY_UPSTREAM_INCLUDE = "${@'dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc' if d.getVar('DM_VERITY_IMAGE') else ''}"
+
+require ${DM_VERITY_UPSTREAM_INCLUDE}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
new file mode 100644
index 00000000..3ff2b7d6
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
@@ -0,0 +1,23 @@
+# Enables dm-verity to check the rootfs for tampering on TI K3 boards.
+DM_VERITY_IMAGE_TYPE = "ext4"
+IMAGE_CLASSES += "dm-verity-img"
+
+# ti-core-initramfs.bbappend already wires the initramfs into the boot partition once dm-verity is enabled, so we don't need to do it here.
+
+# Derive the root partition's UUID from MACHINE so everyone computes the same one.
+python () {
+    import uuid
+
+    if not d.getVar('DM_VERITY_ROOT_PARTUUID'):
+        d.setVar('DM_VERITY_ROOT_PARTUUID',
+                 str(uuid.uuid5(uuid.NAMESPACE_DNS, 'dm-verity-root-%s' % d.getVar('MACHINE'))))
+}
+
+python () {
+    if d.getVar('PN') != d.getVar('DM_VERITY_IMAGE'):
+        return
+
+    d.setVar('WKS_FILE', 'k3-verity.wks.in')
+    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
+    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE IMAGE_NAME_SUFFIX IMGDEPLOYDIR DM_VERITY_ROOT_PARTUUID')
+}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend
new file mode 100644
index 00000000..e5f6c1b2
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend
@@ -0,0 +1,5 @@
+do_install:append() {
+    if ${@'true' if d.getVar('DM_VERITY_IMAGE') else 'false'}; then
+        : > ${D}${libdir}/udev/rules.d/50-arago.rules
+    fi
+}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
new file mode 100644
index 00000000..a14e21ea
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
@@ -0,0 +1,6 @@
+# Nothing should ever get auto-mounted under dm-verity, so just kill the automounter.
+do_install:append() {
+    if ${@'true' if d.getVar('DM_VERITY_IMAGE') else 'false'}; then
+        : > ${D}${sysconfdir}/udev/rules.d/automount.rules
+    fi
+}
diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/wic/k3-verity.wks.in
new file mode 100644
index 00000000..62ae0ec1
--- /dev/null
+++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
@@ -0,0 +1,5 @@
+# Disk layout for a board that boots with dm-verity enabled.
+
+bootloader --timeout=3 --append="rootfstype=ext4 root=PARTUUID=${DM_VERITY_ROOT_PARTUUID} ${TI_WKS_BOOTLOADER_APPEND}"
+part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}${TI_WKS_INITRAMFS}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+part / --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" --align 1024 --uuid ${DM_VERITY_ROOT_PARTUUID}
-- 
2.34.1


