Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E15C61CE3
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:38:25 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15891.1787639901704559059
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 23:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HX3e0ymj;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Yf5BNsF5;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2Q0Ua291424
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 01:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=mZqZWPzWjR1j6
	UKiJR4vUg1YJfsyi+n7+IRTs8TkV5Q=; b=HX3e0ymjOr/SAl6VR/1uTcCbXRgvn
	TPOXjpb1mOVrRKwQWzBJlGavUyLarrHKzZI4DpE63ByT/FoWhf07oLNh3Bfe7cgi
	/QiWzKFpxav0pApRubcB2urbYMoxkcbOAxt1dDOdQlG9dYvmIeLSJ98jTsE0FlQq
	TzL9avTEtNfKEmiMt3czlcix63o1q0hTV/IWs2xrOYRygBiaO1dwetVR67km6eBV
	K4Gb8aVkLTreBzhVwRwHdpX8ZOsDbEEwWztH4Je48mS4vcFVPtK9pgd1ljbi58YU
	/g/eIt45qO1Kv/eY+S++zCmoKUPcaCkAZQTSJZGKmozMre62Hu0kCcf9w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013060.outbound.protection.outlook.com [40.107.201.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g8xf0a332-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 01:38:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veCVadpec7iPNSjJhuXp5mr9Lia5n9HkoMxmzIxqmzb5KiDJTDRqO+JTP1a2zFjd7QLPHol7BTWT+VKEV3XKvFmYHYpv0JluukZRJV+z1e3WE6XT2JQMS0DQWnNDqnJiPv3Ikz75rNJgjYv6Y8hxi0yVIr3o7M9WuboAMGdSQFIQV3VaVAMAm3+eNlpQiWJjstqG8S9fESC2/j8TP1A1hCRkGcDsimlsmE3y99jrMqsAuhH7izH/q+IszpMhTgH3x8luLIR3/8ZiggpE+fGMGwgos7txuDQmaFqkvwB+qgKw4OTR/jsz8CNYNZJVaHwbtrN0yZ4cdVkXZTO8aBNW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZqZWPzWjR1j6UKiJR4vUg1YJfsyi+n7+IRTs8TkV5Q=;
 b=IUIosHDou4mX4Ql3ZevgBjD0CZel5P2k0BKI1kagIOSOGR3cilIiElPQ6PEBmAZMvIu3TPqyTHwONJvpvCQixnvAratDiWniYTfbaxB+0QxBLV8398NR/oaCEqkxWnOQTZTcnQdiigezM1ijIe23VAaIjPciIAzP6++jpP3aB7Myw+Jiw5pfr5eyJs8ZbKx4TP7KSj+U2UwD1KzEZZUVU6S6KW4Uru65chVlo1FMY27uDYqiuV+r/8wlZ58E+FWNdmYAOA9RGm+DoAQiVqoAf5eB9U6Du3b4SNbz6+Ck+1oZb7VMw4vn489c3R9AY3K6wvW7n2MJI31ar26vC9WJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZqZWPzWjR1j6UKiJR4vUg1YJfsyi+n7+IRTs8TkV5Q=;
 b=Yf5BNsF5dKVugyMWmCfIkm+WUTb135pqoEkl2+QJ2xcDYdqiRkhdy1pYXZwIHe3tgfqYgSVUYqVTqYqBbyXhBPioaBH7YvrS+Mizt1bl9/pOxWjY+2V0fRH67g8YJ2l6LxcrrhmAjIFVDb2B3S6InJ0x+Mk5164Vtdnm7oRM1K4=
Received: from PH7P220CA0089.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::14)
 by MN6PR10MB8022.namprd10.prod.outlook.com (2603:10b6:208:4f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 06:38:15 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::72) by PH7P220CA0089.outlook.office365.com
 (2603:10b6:510:32c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 06:38:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 06:38:14 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:37:16 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:37:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 01:37:16 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67P6bDV21504567;
	Tue, 25 Aug 2026 01:37:14 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>,
        <a-dubey@ti.com>
Subject: [master][PATCH 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Tue, 25 Aug 2026 12:07:11 +0530
Message-ID: <20260825063713.51497-1-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|MN6PR10MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: ba20c416-535e-439d-04c3-08df027370e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cf+mMDaITA2XglCIbjcD+4mwFlSn+Eo4TMn1gIlpT/9xY0MIcF32EutMqSpvwxJa9abKZ8KvG6r0xnAKnaTBgYj8d3bYi+BVtTvCHgFcJhJ1rLxF646LWK8JmU707RsKh7bjK9iV8IOt0vMjaVhkDtzcEUlTGcSn9IyK/np9eNPbIVqt07qMzgyx+UnbrtTjmJOxEdPpW9Vrii0Bckj7QqbRF2q9HNlkmtvNnIkFbvjXf9t+yn3a9px9Skjicy9YQd34fFj4+BsRRr6lNNGEMmmazqKgleBLZXZOhEHTD+i7Yswg7GOQfMFrK1dh16kBbglt+mmD6hS9zB3W530t7z+w2PSG0N9qUFMXjsmQ/XHw5uKwBpqR38FPZAqh28Saes2uEjpnjV0CUncViYZLKUahAC2ilBtl3Ld/EeIueCSWX4vp1uFZ7FAh0t7uzW2hf00SFv7Nplw5M8sJiYqW1dUcYohbML11JqxsfJS53+Yzw4BWFlKr1XXCJ42HvwE2C7+nOKVVdm304tB5zUSiCx+pcJiC7UCljkyxzvX3UGtRSNRGnZfNfv87Ux1eqQOKLW+SPv274v+9bcOyGhwse1ei99B4HIjAChKJd+B4lFKhIPniDD9YbczEU9B1pHIU0cZPHO4GCZaHtgnVVsrO/QOfPUpTi1OgCu/KOpxJMW3o5hc9K8tEdfEhzE44THO1MzPCFV1lzmr6qzrnWHyKOQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	n/HhqU2ohj5589g/GoEPRbdBia9M/RJp1MnKSoWRbFpTqAdNbSxu1eJsc5uoR6Jt3z/I8ThlY+uafTdya6jXFWtRqN9lvFdEstfwNZAatYJSEZIAhLQya82jU6X0dPQ1iG13GKB4z/EmZMRZQ1LrU7CjCC9OTqmgCmrS0tEzGxhrY5p1e0IrLFh0Xm4xfkqbPTfkBYdGBdsvu56JVNqMV3lwcB92L4SQ4R/b4oA481JkG0hk2YbAkSLCBG/3eIkOum4sZohyJOvmX8886cERVPTtMLZQ4qP/JrQop6DaFbNj/GOM1QBnsXkjeGQWz1eWJuKul1moNpByFMmS79/7uXcfFZvQtWkOCgHH6ZA3DiCIJpPKz0k2bfTlzFKiiJmFtlyOmhX10RUtbl2O39YaMkBsFA/vIQ2qIOBiLUYdQEx3dAYwnHLTirp4rAffPu8a
X-Exchange-RoutingPolicyChecked: 
	fboNmawNB+5c8QOJ68eqZrmL/CZw2CFTOfFsvgNOBDYyTgRvrwjg1sljqNslRxI/jZ+xeqcJ7GWlYP+vg84gyMOe6NeiDt0KaOOf4qtalYUYeV3z5rqRQLWr5mWPVpN623HzwCHwrLQx6+Jl4FcoWGTTwMRdnAj9gYNjScQmNtOYt45TM43x8OZ/NIG4Kcx55CVNnjHvPBHW85NaXa7NbQEQEn2xOsM0h77X2N4YtuXUcb9Bp7gGi+ogmhlwZl7GP7JrlcdxYRklrfFbJFzMWnArhqOnGUwbtriSu2fpl64WqraYKfaB0pbr+N7Vy2tLAPK9gx9J0vKMKNDfV60SVA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:38:14.7822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba20c416-535e-439d-04c3-08df027370e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8022
X-Proofpoint-ORIG-GUID: ZjBAi2OBRMG34LGKGSZJyw1PQAePty9p
X-Authority-Analysis: v=2.4 cv=Fow1OWrq c=1 sm=1 tr=0 ts=6a8d385c cx=c_pps
 a=qSo88s0AsKk38onbse8luQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=c4mgLw7UoIgH1LjkLBIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1NCBTYWx0ZWRfX9lCMggn+i+Pv
 xn5Mz808sRym0f4T2e37uej53cNfpxl1VXIUjU+QmjJYkUP/DA2hu/BWTeU4WV1uhyaVlE2lBgP
 hP/XZCwETKiOZabP5+FB3iYUcIvMkkw=
X-Proofpoint-GUID: ZjBAi2OBRMG34LGKGSZJyw1PQAePty9p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1NCBTYWx0ZWRfX4YnRykh9HnE/
 EIp7KLRNi1bIlNn94krWqT84xfuNyOV9w6tDEjnsK7En7w/OL0fgWOf2i5IBVyLyVOOH4go0DeV
 J6m4vCW+ZHmkC454vfpy9xQpselYhXXUS44b5bqouGcRrK8oYY3d4VOSBzOKQPREbLAJZdTNhp1
 XQvqYdu0u4RDzDO3L5RrMrFGYnLWnPxRwp9zLmKK/0yGXGgnvqPuvbcEPo8YphmLNWbLqtmT4lQ
 scnJUP6HcZ+uJPB5PUCdYyLcq9lL2W73Qti4dXq5Tt2jH69B45/u8uQIia8qdcLLtC+LZFENCNj
 yzwb8ZNcZkyYD7fH6BM+laNnmY4RjzKoalbPgTJkzGgDoa1JvsfsJyf7yf/g3FhJZcIJnukW487
 2NaNgxQhgYoqRu6fPra4RxbAdMvi89+8MRoJc+HvJMS/3Cu4dl1pKWML48mLYSpCKcaXPrSRPG7
 oRFlkUGcSGQp0Lob+SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250054
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 06:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20284

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
 meta-ti-bsp/conf/layer.conf                     |  3 +++
 meta-ti-bsp/conf/machine/include/k3.inc         | 10 ++++++++++
 .../conf/include/dm-verity-upstream.inc         | 17 +++++++++++++++++
 .../udev/files/dm-verity.ignorelist             |  1 +
 .../recipes-core/udev/udev-extraconf_%.bbappend | 14 ++++++++++++++
 meta-ti-bsp/files/wic/k3-verity.wks.in          |  5 +++++
 6 files changed, 50 insertions(+)
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
index 00000000..3940a24d
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
@@ -0,0 +1,14 @@
+# Under dm-verity, the raw root partition looks unmounted to udev's
+# auto-mount check, so it tries to mount it a second time on its own,
+# outside of dm-verity's protection. This tells it to skip that partition.
+FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
+
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'file://dm-verity.ignorelist', '', d)}"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'true', 'false', d)}; then
+        install -m 0644 ${UNPACKDIR}/dm-verity.ignorelist ${D}${sysconfdir}/udev/mount.ignorelist.d/dm-verity
+    fi
+}
+
+FILES:${PN}-automount += "${sysconfdir}/udev/mount.ignorelist.d"
diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/wic/k3-verity.wks.in
new file mode 100644
index 00000000..6ef2c57f
--- /dev/null
+++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
@@ -0,0 +1,5 @@
+# Disk layout for a board that boots with dm-verity enabled.
+
+bootloader --timeout=3 --append="rootfstype=ext4 root=/dev/mmcblk1p2 ${TI_WKS_BOOTLOADER_APPEND}"
+part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER},initrd=${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+part / --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" --align 1024
-- 
2.34.1


