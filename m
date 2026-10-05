Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B4DCA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 12:12:39 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18550.1791202354122943594
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 05:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SIQnrfoI;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=arjRjESI;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695BTDtL3542695;
	Mon, 5 Oct 2026 07:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=lvS2MSUs7mCdB
	yrfRgoX43Y+U8shj0Cjk2bzQy9ttT4=; b=SIQnrfoINUwN4tWI3Ye8BXsjo2isb
	HR6QFktLBr/l0sS/rCnrZ9RS6imcHNf/458R1YljEv+1n5kgk4am5lLS92cQE16c
	WF5n0RPmasWISm5sKxBgtwpTrjPf3BfBcNcKKcCdr0GzcwyjCeqTqnrpaxNtdw/S
	M06DC8eoM2iTVT23pWqo4Pxg35hk2ZHtSkYdkkMqZbr+2JlP6iOTVscRieKK9H3w
	24zRvXftLC0yojRAYNKRcohYIHJSslsXb0D66pQUJpz9T2aT8yxTVlnht0vuFO6O
	vOUPJxOsCW1MgcHxRMmU9yW6B+dvbziac1qEg/AUd3FHwll7K6L9Br6uA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010043.outbound.protection.outlook.com [52.101.85.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h3gup5a66-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 07:12:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXWrszF5QdrGGMZw/42Fab56dNXzHOPS6kuJOZulL8JwP7ynuBJZOJqeuFSu2WLPfdFqJnyBHk4bTVrGNyvpBSEyZcUPB0gDQX090+rRGJcMkoZq067FSYqzsMkeLg+wbvAS59fAXSuHO2d0jA/NhgTdh3pwpHFMNPEPD8vZz/NPCPb9rS7wDy3h5u+7LhcX/s/CO0LAEehhPYsm6IWiInpyde0yxJq6iHTYa9Z9KyoSoPtTP4dAxK6miUrU3u716NRKwBPue3IuelchvcpSFmGvs2kii6t7nbf5Wu0kZK4/v4S8yY//bPiZdA+L7S1AkyCKOdK7v8e017ToHpBBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvS2MSUs7mCdByrfRgoX43Y+U8shj0Cjk2bzQy9ttT4=;
 b=B9ps+t3dc3RuFDX7QmvsuFsPOV+Ur1wNKspq1WheLwY9mRXNqxBZ46VvYCevShW3WDCQjbT6ZKrcj7lnCVV4QMUXjbTY6Ek6HM6ugqAINLUfft5Fm4ydvdJOTvjiqZ60J3Sl/3p5WcPcdoZuxR4IuTNq0mUl91yGu03M48erSz6azbkS+vVrFOkVJlMnXFNaUwTu37cZ3rVn4BiN46n5mPqXMokyTES78ta8A7H8kV+AxWakxmzaTUZNKVG1Cj7shaPFow2IOIQx67rKQ/fZc6vtxnXuAJGmJLJ042p6oYk3TIoiQOTqibndRw5JxKz/8hQHMxmB5lbL7gfQiED8yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvS2MSUs7mCdByrfRgoX43Y+U8shj0Cjk2bzQy9ttT4=;
 b=arjRjESIP7Mb3tqZnlgZR5zT1lTB+YUUJpNH/+Y6yzeQ/3+9qre0rqYM+tPz0jDTmMzmQsFk8dtsvDrGYyY0yiIppWsrwO7avgEmsc0/KYEqN12WIYmTf5V6/8BxzSIBGOaVR0h8zwIsm5Z635adT1X+gtu77fjvoidqeIJD/XQ=
Received: from CH0PR08CA0014.namprd08.prod.outlook.com (2603:10b6:610:33::19)
 by MN6PR10MB7998.namprd10.prod.outlook.com (2603:10b6:208:4fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 12:12:28 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::10) by CH0PR08CA0014.outlook.office365.com
 (2603:10b6:610:33::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 12:12:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 12:12:28 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:12:22 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:12:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 07:12:22 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695CCJ9I1103986;
	Mon, 5 Oct 2026 07:12:20 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@konsulko.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>,
        <m-chawdhry@ti.com>
Subject: [meta-ti][master][PATCH v5 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Mon, 5 Oct 2026 17:42:16 +0530
Message-ID: <20261005121218.844998-1-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|MN6PR10MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: a397c2f3-2ee9-416e-93c6-08df22d9eca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|6133799003|18002099003|10067099003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: 
	uCcp0xYomFVbytv52CsYpLV9fdF5u1UIrAP1U7gfcFJ3DZn27lfwQuCroYs9Xks/WBO1EjetV3DkmzLpnNYGf4UFbuUl3e6T/awKC7Yl4UnvhVRcQNIBpmbhkf6A3r2ZYgDGSrZqL+iryaP5kGbqbeR7Bt6CABTVNy+vWSY0MZXdLfV3M5S1gdgUSZMk8gzR1Mnt7WzY7i7zBCzfxbI7isBqjjcxcAo8kBg+JQaBQj+M3Be7QFQcPLK6McPvjccunrvckjIOaVu1Dla+Irqa9HnOq/8lDGW1R8irwCqIoyZUa/2m8cIz1A/XfNsMwRx6JgJfAnbVvRglPtoAYIjwolSr/XgbD0nrH4hW6rbSYbFgHwQBKGhnjSkAZpfF+c53Akt4ZHAE7K33lZzEpHOqgiPfLBTrLJrLTHjQGhmjf/+6B1pF3XfBccMvGHXXUEPln3EmkmWRffzYtgPhVffZqvLKNumeIOUmQ1Dr4aITVVq/8c4/YrNqchkWvjktjTaISrqB3ELrkpO8/nOVyGPAbpBiHPlwwW8LVVTXbSqwqSCd+Ke1/8XUj7Rfcp7lz1lH02flUBJ9c8lhhW3T4tZbGWxKHpESQF/cBl5XncoIGJn+xqCnzrtX96YJXgWzTXEMcuFJbR56kginQfm8HXElfgOwVzh3KRGE047GkFbbgQUZPYS8L8PrAUI0n8BwQGqr9HLCwbZKqWXk4zHMfg0Acg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(6133799003)(18002099003)(10067099003)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YOjmhMeFAQ/X803Cp66QgQHioACqoprFf2XcVu3EqqUD2/8Trn60cEj5ZQzJw/la0vwluQwG7btULXDyzFd4UO47OLnloOtpYH4Xlox4c4y11iHzEu39u7kazQOGZneRK1Gn/MvaUGS2z/rG0r/MvvRK4Vf8tkwnOqfWOz7Q7TmYu7ERZMig7oDtojtGpXhiDTzQO0REYx5UtO96SgYi3sdZEvjho4C8/qETpPTVssBNLQLYdQT1OIZXc2KDNzIIwe1OL+wfy9PcWWIXEfKRXdAM+bDOumlRX8QQBx+CaUsoV0aGx0FKCOhLgiz8t7ZyIE5o9WAGDTDlamWaFvZa8fczdPy1dMiU7WwJUViP6wgoqif5MRpMxZEQlIea+ecIiSTZWEw0Xh1d0rEsntWHOfboid8vitX47LBzOjB5Wc5GaE8WJr7tdi2114N8aWfq
X-Exchange-RoutingPolicyChecked: 
	AprVbwROBG+SQR6T/wvmw8IujUW6f5QmgZXlmLwg5TS8NCW8egTwkn60mK8C/5m/DqBlUD/EZDLpYchaFo9ZRAWBCKMgJbugLAJhaop0ktNxQT/TYaojIILIJ1QWX5GVvTmLi10BVJGRzQRGjK6faMRX6BEgtfE+6lLCmUwbhU65HK0BwUV50zWtOHI7TJfzj4tTmjt2fl/pqxU/DfeJjsO7sD6p8HbMwW+u589hNjnzawif5EPeMN2GLF6PXn1GnWq8AWiB0eNkv7/ClCkdsQOmm3B4vcbY1SdQNg7m8G3p37O/KJrA2sxl7AZw3ZigAuk8bazNVDEgIYig5BYxzQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:12:28.2550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a397c2f3-2ee9-416e-93c6-08df22d9eca6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7998
X-Authority-Analysis: v=2.4 cv=KqjYSmWN c=1 sm=1 tr=0 ts=6ac3942f cx=c_pps
 a=630MGKGvePsHimlcG8SYgw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=cW7-tuCRIaqJVRneuyUA:9
X-Proofpoint-ORIG-GUID: 3mDRNpPZxgyEHB2hwRUINaNuHftyWhqc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0NyBTYWx0ZWRfX3kyhcscACmho
 9iRIqIqOQjUieE2R7AO9/kTf32IG6EderowIhN+3VrbD7kNQIGAXcDT8qzlnaOqTP/EL2jNdxOE
 lxzVbQTrh87Xx9Uo+Lb0Vg+JhPCFszI=
X-Proofpoint-GUID: 3mDRNpPZxgyEHB2hwRUINaNuHftyWhqc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0NyBTYWx0ZWRfX1z+Crb6FKAiQ
 WpoVBONZyeoG7dbR6cgi0uWincut+SlcrxV9MjOAkS0SrypArS4fgm2LbHmOSnoMzIZb/35oIYl
 J8C1ydqrLiBL3NWXv754R6zOphSRP1M12fbXAI04toJ7QwCTLlLDQJxpe3zyJogaypm7udiQvx+
 kFD2G3MpGiy+dRAVkdn03sOGJngxySROGdnWojqQkbW6RQIHwWo5TLZiKMYjYLLMz7J9Xljqrue
 lwhgkO7kLc5Wen7FcoIXbNVM8CF67/5mH5Z2XyN4X8FNW+QNn0Mh8Vp+3bywdt1gl46ImxaPnjJ
 3Zc+0fmvw7IXWBT2Zp3cRd2xhFqzHkKA9UvsxWPo0mJv2L6uSvyJsHDFCOUuR+2UD+BAMRudjYz
 k/galMbr6SYrNxX3rOWzW84RGfxs2kj1ubEMRkvnyDLUHUTfEy4Dr0NuEhu/hqP5d7omeQq4lLm
 gwCURIEW+17pLhz921Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050047
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Oct 2026 12:12:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20432

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
v5:
 - unify the python functions
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
 meta-ti-bsp/conf/machine/include/k3.inc       |  7 +++++++
 .../conf/include/dm-verity-upstream.inc       | 21 +++++++++++++++++++
 .../udev/udev-aragoconf_%.bbappend            |  5 +++++
 .../udev/udev-extraconf_%.bbappend            |  6 ++++++
 meta-ti-bsp/files/wic/k3-verity.wks.in        |  5 +++++
 6 files changed, 47 insertions(+)
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
index 00000000..e9353fcc
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
@@ -0,0 +1,21 @@
+# Enables dm-verity to check the rootfs for tampering on TI K3 boards.
+DM_VERITY_IMAGE_TYPE = "ext4"
+IMAGE_CLASSES += "dm-verity-img"
+
+# ti-core-initramfs.bbappend already wires the initramfs into the boot partition once dm-verity is enabled, so we don't need to do it here.
+
+python () {
+    import uuid
+
+    if d.getVar('PN') != d.getVar('DM_VERITY_IMAGE'):
+        return
+
+    # Derive the root partition's UUID from MACHINE so everyone computes the same one.
+    if not d.getVar('DM_VERITY_ROOT_PARTUUID'):
+        d.setVar('DM_VERITY_ROOT_PARTUUID',
+                 str(uuid.uuid5(uuid.NAMESPACE_DNS, 'dm-verity-root-%s' % d.getVar('MACHINE'))))
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


