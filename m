Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DA6FB5EA4
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 01:52:46 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67147.1773712357604704303
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 18:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=B8ng5HHj;
 spf=pass (domain: list.ti.com, ip: 40.93.198.12, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOE837dbWlnIL9FWwL5UdCux4S6kX2f3/CPIUSOTwkJDlBk8xgsLRIr94Bb2sDoY+UkmT0VZ1tQIeX2lzCTGP8fkr4mB97bl14xcOpdYBhnqceSwzYXjhfqqDhrWPHuCq2m7eRqYSebCFccpzGMtRrgytlHp/VfDojEraUnnr0Z7tGu64DPRC2l7UDHQcVfkdkHrNIvHnc2enRwJJ52s4g2XrtmwlkTT6f+S1m0GuclF5/9mxFnZ3hr8/zJZH+bBE32se+K0/5CvkRRfe/yi0WGK8YHiJphfMHor+QWFG1fdUcfxIw/RYHAm5YCF+jDU+l8p/dJVxvsZ1otliWEubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErMM3RtWkQiS4+YdkUOWb/HMgJJlL16wDfKHSSQY/+A=;
 b=KyIO5YhUASA4W0sVTL7TZvQXWu9uSw2xCmQ7CCqdC70lsVTAMQDINb1MjecqtCWbtCwR5YiPX2FjRcL9p06OBZegYXKZtdQShyZAzYM2a3tJey0a079jQHEbFQJ8wrxXNq6urMNbmZNXyDs+UKcJu2aXCMYQ9C9QLPWX03j5KEyAn6WP0U8YoV3D0inLtz5J6T/yCJHErvPZksbZRbg5NAyiJ9MrhQ5duljFIhxgRCorsAtFG3S7NPnYLVXA6krlFy4P+LH/npFhy0BjBoXginmv2Do8r60s+v38hKZCvZNv8T0Pu5Ks34bXmJzjTbL965tyMwvQ1hMpPp6oYhCP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErMM3RtWkQiS4+YdkUOWb/HMgJJlL16wDfKHSSQY/+A=;
 b=B8ng5HHjJMKbKTv9ja3XB0dNNsOogopbjzxW0uDyFur5bbtP/ejQt4qUvOkHgW3emz3oJy/bJlbgwV5L4E85S3NMxMicXm57FDnFgcCPoAHTwNWas1wNmE/RJWGGVJKhm3InAJzHTgQdgzX111UrQCUG6jxmrxbmk9zIXPTsM3cTFxD25QcWKB4gBEIS16LG1bpfzQt8ZS5E3AJ2z3QUBTnaD33OGWYGy/ry62N5P833DOTXhhMAwwZUVeT60jyXvJSOxHVGta/rAY5TwSSwZ2TbELhrzw55YeNHYJXEBsA79Yn9EnRfS1xyJo0DgYKUtN9D9EpeG4MuVsbK/1cfKw==
Received: from CH5PR02CA0012.namprd02.prod.outlook.com (2603:10b6:610:1ed::11)
 by PH7PR10MB6156.namprd10.prod.outlook.com (2603:10b6:510:1f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 01:52:34 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::e3) by CH5PR02CA0012.outlook.office365.com
 (2603:10b6:610:1ed::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend
 Transport; Tue, 17 Mar 2026 01:52:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 01:52:34 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 20:52:32 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 20:52:31 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 20:52:31 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62H1qVR32008556;
	Mon, 16 Mar 2026 20:52:31 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id B16EF2A61; Mon, 16 Mar 2026 20:52:31 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603161800
Date: Mon, 16 Mar 2026 20:52:31 -0500
Message-ID: <20260317015231.85449-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|PH7PR10MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: b84f7b52-adf2-452f-c996-08de83c7dbe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	tTmGueg3KnBBg1z5+pwjwKqFPjQlMy1mN9g94aOhvZbANXQRYwH2wOy+xfaG6nJ7SXEtYMLtz53DYTog8HW9ZGA6VDSq7TV8krnHXT1Z+GNZHuIxV43fNGCmF+Sbs/kvgCj6J3nS3AZ9HdxLZavTbfXO/eUaH9EfrR7RFNdXCkA0HlFQJ/qfryniRwwHVoMfkdRrX2Z3bDzn5O38PswHALrJDJgA+W/LEztS8Z1XVYOFxdv0tSx+cnQnMPJ3o1oYXMEmVVyMAlDKwt9f37LHeAz0uhpCmL5fo9veGpS3k1d/zZPBzCapyJpUnJrfNwO+EpGGBEKMkTSzcbBq8BHiVbi6wvmH+hexMw3YuYNFU6AOBQQUJHg8inO6dCQKXfCrHN4NUt/lHPhqfLhtnghGt3MT8f905mtv7SutdBkygRnuL2fW2Gb+HEC4nbdDdB8TabDLMW9db3P34zX+1KJUpnoNgymRrVQrsLQm5/Vv92HEOHaTh/owqhVMFjHj4dQ9q5kQl5ZdxuBf/CW9GAb/XlRsp6cdGLBDJYRPA48Pz4V+OuoXZjMD60E5IWXIXWWvfTO6NwhXNs8nRE6umb8O7NxbChDj7UMNYalqBhLfuLkzvRJI/qokIMyxGpbylats1HVahT26QZGbl59MEshj/cbx41PmkWpV/77XF4Pg8HHnxaxRfireGtzT0pje85QLeqEy1hHiwIkDWN6y9QBvsmL9+jWjhQtRv7l0sGYVeu3++UPNwJn9TdyyVNQ2jT6YIx83mD8bnqaSwDzqbuSBYQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	89OO4sFgPQ/6q/x/KePKb4+XtrkFsxjAU/cDAwoFYE3zDR74aajeAqOnd4HiVa4ZyGbRN5WURLZv586UhAN+yAoea0hbcuje7CxK+f1jjHMqkRI7aCsO8XvW6Nr6D8RlfL0iyU92/x+3C1H/bDtlP7NMyP7wnTnuWym0KdWKYaoyawav4y1Y/gmJHrhQ/eaH97bcbW+suSdLHobu0ySSsfwObqytq+Yy2ZO/WsyLzm8zIG0Up7uO9J3xhEHfZgAqCwkVSBbC1vNPaaNH70D56anstX6qo+r5KICpymKN/IyyTbjH39KWUcs4WdMxy/7rt2zPXimuAzh16BMPRMGJg9Rn25k3Lo+800UrLMm9Pwp9JRLAV2e76u9ZXroDpIjwvWfnKVZuneLTSg5chTqKuf4BE0eUPKV6mNGpURvIg85g64BPnH4jOr+4B4fOgndh
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 01:52:34.3140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b84f7b52-adf2-452f-c996-08de83c7dbe4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6156
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 01:52:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19727

Updated the value(s) for:
  ti-linux-fw: PRUETH_FW_AM65X_SR2_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERS=
ION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D58a8a47f9063cfcd9eebcfb2825b99a34ef19b80..a85ebd5c5b21=
6646779b3d34efa09f0a7d818d62
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3De585d2fccbb4c11389ecd9afb00ec5e707267afc..81a97a3303f8c78=
6014d8644d185a368fba902c5
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Df13c6190c45bc24cc6640e39c36304bbc4ff22e7..d6380d7=
40b3af3be9a9ebbd347b5b0c34cd82e81

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 6 +++---
 .../trusted-firmware-a/trusted-firmware-a-ti.inc            | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 2a1aba95..23b3eaa1 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -9,19 +9,19 @@ INC_PR =3D "r4"
 # Firmware versions
 CORESDK_RTOS_VERSION =3D "08.02.00.04"
 PRUETH_FW_AM65X_VERSION =3D "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION =3D "02.02.15.10"
+PRUETH_FW_AM65X_SR2_VERSION =3D "02.02.16.00"
 GOODIX_FW_VERSION =3D "1.0.0.0"
 CADENCE_MHDP_FW_VERSION =3D "2.1.0"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.8"
 TI_DM_FW_VERSION =3D "11.02.07"
-TI_SYSFW_VERSION =3D "11.02.09"
+TI_SYSFW_VERSION =3D "12.00.02"
 TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "58a8a47f9063cfcd9eebcfb2825b99a34ef19b80"
+TI_LINUX_FW_SRCREV ?=3D "a85ebd5c5b216646779b3d34efa09f0a7d818d62"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 82a4bc9d..535c75d8 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "50dc9697b977bf8491aee7a591195dac0b027f35"
+SRCREV_tfa:am62lxx =3D "8e4153d49c98ce5309b41b33e1d3da709d17afa4"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index a843d246..323e42e8 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "e585d2fccbb4c11389ecd9afb00ec5e707267afc"
+SRCREV_uboot =3D "81a97a3303f8c786014d8644d185a368fba902c5"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 60995e09..05a85d58 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "f13c6190c45bc24cc6640e39c36304bbc4ff22e7"
+SRCREV ?=3D "d6380d740b3af3be9a9ebbd347b5b0c34cd82e81"
 PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


