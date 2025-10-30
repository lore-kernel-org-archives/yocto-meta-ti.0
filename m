Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA14CCF9EB
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 00:31:42 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.60])
 by mx.groups.io with SMTP id smtpd.web11.17369.1761784294001999735
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 17:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=X/6tJTDo;
 spf=pass (domain: list.ti.com, ip: 52.101.56.60, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+W+9T8AlKCHypQ8jZpknmjjlaPqhrSV1VyudC4gWn9XI7dPUVf+MQ6vlbi6m7k6HE0HAtLd2QJ/45/E380Yw+QgzoXKlyqhVbyu67J3JlJD8N17wDvLnwRYURJlT32MAAAXE3ZK9FB2nNQS2pEn4Y44C5kHxr8/E0aL5nVlfyyjB5erbApJrFi0rkGPcHLd8Ua/uf4lWsnE0Fu9fTugh384zlAt6z5jlE8bLwufkQjJKxYq2eYQRHDYdG7UIWtQsQ1tmISFsaNMabA2oBeoFBEv7sDxH4H5Q0aJ1O36kAgZ6KmFt1bWZzzeyknavwUsppw82ASL/olY0TfftIbWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxnml/Hq2zZUFv4JlbPmyEBnFS+he5Nz2lL2T3frNj4=;
 b=O/dzq84oTHEwgr/3jrfBaMHEegdi5Vh1JTME3QHq8vodIK4dMTmr6vVs8DmyrS/QnQ30libvmkO1WOcOLO0mT8vS9UsEQWbQE8XZYd+LRSTBUGbzir0Vju1AwAWtf9EEIGytX+IxzBk2juw3UzmUJB7TyrGj1x/pLySW/LvoHNeQUsEqptRy5f1qz9atyxvbE/HktOntTxKogDBYrGL1mUFFHdBkxH0T4qNjOq9rmtbdNEiKExvIaMkgt5/Ea4FeqyIdX7F3ehGRQShKBx8EvtR4DGiy//wXFCjY1s0VfzRQ6Ur3o9+zWrrvaMcjIdJane0bnT1jzQH98ndcMdQJsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxnml/Hq2zZUFv4JlbPmyEBnFS+he5Nz2lL2T3frNj4=;
 b=X/6tJTDoL6dtLcIOP/SXKAsI168omZdo1ALBvvwBa+nnem7GmPAQDyUhKk4UvnmaeWP/qAjivA/yf955CQ/OV/fNAmbCRakg1/uBznIg2L3F8y7YPF5bzv6EP+Tt+uc2UimLrhdBe3PZDYKyrLdoUq17FcKEIQbD1X+KhRyMdk3RXvARx1wLBjeJ624ws8nkrwS94tUJo7Q3hUMzY8zOoTBPS0YOTx9mls5YiPrF7+W5S3ULkYGT7IkmWXfV6UEMtuaLjMIQ9fyUpcv4fF88IJyIRQIwHJ7oXt67WQFxaUCkwJoju2e28KGao2HuIRu+47NgPIVELsfAGXhawr7izA==
Received: from CH2PR14CA0029.namprd14.prod.outlook.com (2603:10b6:610:60::39)
 by PH0PR10MB4711.namprd10.prod.outlook.com (2603:10b6:510:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Thu, 30 Oct
 2025 00:31:31 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::e) by CH2PR14CA0029.outlook.office365.com
 (2603:10b6:610:60::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 00:31:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 00:31:29 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 19:31:21 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 19:31:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 19:31:21 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59U0VL0D944992;
	Wed, 29 Oct 2025 19:31:21 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 498D82A61; Wed, 29 Oct 2025 19:31:21 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510291355
Date: Wed, 29 Oct 2025 19:31:21 -0500
Message-ID: <20251030003121.2151419-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|PH0PR10MB4711:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ca1fbd-e39f-4557-e416-08de174bab05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?e5IVCGMA7L71OpVF7U+J4LUkxgFofStZzcz0cOsr8Os22IPUT2h724shp5o8?=
 =?us-ascii?Q?VJkwSyr9McFwcKJGHirNdOzMGfLsRw3x10QA2UiM9vBgFf8Ow59IqGgdlGcM?=
 =?us-ascii?Q?0vkk6Uj/MDJ7YlWc42wrrvlUBbnRDk1BdWxknMfDr6FJwdtrL9wvxNuL1HAn?=
 =?us-ascii?Q?1MRlhEzP3Ft45EfrHbS8gYZPVjZctuZ8WWf/rD+SOrchncN+EyzC5rg87w0Y?=
 =?us-ascii?Q?8pDHEoSaSxW87sRZQnJfOVPEsDd0PJLaDiI05Btj/RJbftk/MCzRoc2W5Ols?=
 =?us-ascii?Q?NTXVEBRd4zmFcRm5pAJwDezu0l32dc1hSh21y6G2J903dhBsjNsBYuPX7/1r?=
 =?us-ascii?Q?o5hpjBgugS503nTRWXaUrOGr5rFSMj9Ho9ht+qXDPPfiL3jHY6dWbiNBbNdb?=
 =?us-ascii?Q?C2qFYsEq4ZuhoXjHBz90W2WoyjDXdzNvrdNGFKVMpE6N0CKLSEMt8aOSZOHx?=
 =?us-ascii?Q?1m9YmRxutzpqufX1eLMqlNZ33+1XVKaQ/VeI/nPSLvBAdyYC7atGtquICN3Q?=
 =?us-ascii?Q?j9I5LV680nIdqQ+WtHLaFhKNt9kv83wUXs42kn9nua9XDR5xqb/8JaM3IaaH?=
 =?us-ascii?Q?SmOsCw0r9WVu7r/wwGrmoLO5srEjuIs31lEYlDlkZwQYNz0DcU2nkAGCiGSu?=
 =?us-ascii?Q?1TNJNiL/wlFv/HxAvh2YQUy7lv3FRcVmx+oerA9iP6ITAfGWLU76T4+1z/lB?=
 =?us-ascii?Q?Wfu8np21WOGMkVGnKZy23PgU/Ui/85iXCggEUG1bK+YNMPRbzR0LZqn8Qlgc?=
 =?us-ascii?Q?qbONPI03rV1R9LjCkUEGFa1dYB0WEV1ILf5h9/Qgai4LkMfVVogHUew81+ml?=
 =?us-ascii?Q?yERz6K5IzH5jNPm+4SdGusoPzuZSWmLSW4RT46mXLwK81s1bLGK80iC6fwFI?=
 =?us-ascii?Q?LNltC8kCJnMBziKkq4uUKB9mGi7jEG38JQxgkG2CnEKWM0Th7vnmADTFTI2/?=
 =?us-ascii?Q?cRgzDyg4HdIgSlh1waxIw4VWB+ZTLUJIUIJdYQZ7eB8hGOngfSux30DoyG0O?=
 =?us-ascii?Q?FmiIJ9NHZ+0SPzuyEN6cMpRZArdaw1eGsim2qyGniQvAp0Zm/rZlMvJrL8MG?=
 =?us-ascii?Q?oFV486doW+dQ/xflhuLL4d+3No5c9Ax3mvxC9qwwNWSxaXm7bYkBOwUmPUrX?=
 =?us-ascii?Q?w1S+14Xfkn45W6EQzfd4ww2l+u/PaUhUzAjaLwjpqtrBSRypGdXPsueGCUvQ?=
 =?us-ascii?Q?ymxvXQzY6XLBbrACKqN26KI7oM4/dNAk9Fy8dEZgvPTyQy0LmUj4/7E8+Pmw?=
 =?us-ascii?Q?B14FxRLpzJjS8SsAchT4PKEDr318MTvXgm9vvi++mnlx7C7fUf7S/b0VFFz2?=
 =?us-ascii?Q?Ch9y+mU/wmoiMIYSS8XJNqzyA1oQFPYZs9ro2SGmkCFT0BAkHkXp4tImjyN7?=
 =?us-ascii?Q?eksLBYY4AgTh0Mgy0Rh+KD+Nvwp83dPj5fFbkoKeC8i7HvBSh/WYxReg7yFG?=
 =?us-ascii?Q?bMJqG143x0nQfHV4NM0D4/xzMm3BDswTxKEAoFrywT9UxK+1a5TjlwS92Y1K?=
 =?us-ascii?Q?9Bkp9nN/B1NTXAFpsKSULbThtSh1AVV5y9JN49UD5hpMhkJ1OqTOBeyYoZ2A?=
 =?us-ascii?Q?xkj/gpyqmMiSk7GEjEI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 00:31:29.1891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ca1fbd-e39f-4557-e416-08de174bab05
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4711
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Oct 2025 00:31:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19209

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D87519a151561393ce1244ba53401196b011b7a39..aa613c2e8329990=
6b121fcf0d6a5824f1d1c3ff9
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3Df4bae38e160972f3dbfee640421bad168443cc0a..a55e=
fe5b7adbb88ee55b67f4f044c2882978d1b5
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D2edd47b56fbddaa47a5b85fe3440bb3516bca8ea..9b2678b=
e3a92ebdbf376000f06636eab8f7c1dd8

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 43450560..526732b1 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware.o=
rg/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "8a4829a62a4c6b04de5055f78b9481da40c76ce3"
+SRCREV_tfa:am62lxx =3D "9be79f82555404fc89455fe10d7c1bafc182e833"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 3eb7a168..17359591 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "87519a151561393ce1244ba53401196b011b7a39"
+SRCREV_uboot =3D "aa613c2e83299906b121fcf0d6a5824f1d1c3ff9"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index db9f9e6c..88c34431 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "f4bae38e160972f3dbfee640421bad168443cc0a"
+SRCREV_ARM32 =3D "a55efe5b7adbb88ee55b67f4f044c2882978d1b5"
 PV_ARM32 =3D "6.12.49+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index f8b69bed..3b099221 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "2edd47b56fbddaa47a5b85fe3440bb3516bca8ea"
+SRCREV ?=3D "9b2678be3a92ebdbf376000f06636eab8f7c1dd8"
 PV =3D "6.12.49+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


