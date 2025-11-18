Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBAECEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:13:39 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8464.1763457217692072244
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 01:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=j9HeglwP;
 spf=pass (domain: list.ti.com, ip: 52.101.48.13, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auvEc9pNem3g+a59iFgstx8rw07NkFpvzYYelLXaz3wkRDLWJMArzVyeqn4JPUlYp9Sem3SEHGrWKrM+vrEvhfPQw10YXQbVHs5e4RKhx7K3fOwWwpCi51EQm/MQcHswkNjhPq2a+8bnQun1mtlUn/p712ail3jlnz2B28TLotT5bZuEBcJZ1uGcSaPAngEGWLuct59NCQdJbTTbr+PxFRFSu5E4DBRD7iXOhMZSU+yCc5y/zAiU1uX6Q3YJN6Rht5yTaQGC1d1IjfADMpwrUn4n4voboEGJ5cOhEqVIgA/rMRwiQsU0MFfLboWeleT4uKQV3wEgaxPDxZfYvhZYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3e1ZxWAHusS2CAMYsBBlwZzlM8Ow8XCr5miwR4yLZcA=;
 b=SscFyaqvsW9mmLKkWiM63GT8JoK39Ey3ID2K7vKsAyJFB9O8iA71Y2KVjcGRgamKOD1WJrkU9Z5pOwcawTMBwRRTp2rqSITvl7EYEED8tWRZsTWGTj/NE0SSYsaXMPnyRggjskbtxyBfyqsKqBxn0/D/XWpueWvZbZGFzebb+4HKaJrNZKcjR+VETXCG4byIdVQTDVdG9UQqo+ALRW9GS6QhjTrzOfnSnQZLqKoFvLgM4yRmOP++ehQxBtNfyf2AJfWXPqRjnV9ulkoyKA2CTA+nqj8mL1MS/tTtB3kLjvGNYIFsil0heXRjvflHc9dOsAiQ/vHPzFfDfS0bNr9osA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3e1ZxWAHusS2CAMYsBBlwZzlM8Ow8XCr5miwR4yLZcA=;
 b=j9HeglwPub6A1pzkL3b1gRBEIls+6tf6Q9SKNtm+OOVhfCYpJYUudr3rh/Q17zMt7NEJ5CnMqeKbR54qK0XDqWamQ5YSVCdAERPV34krmMQddAzt3QntP1LVwZW7ORzcBh4k9Hq+XKgeMbSDVPWgwVVu2NqFDyEq93yUJ2SM1qSKR+2xx3T4F6Vm43wzfeD6snOwJWfkYyGuIuw3ex+ELIlvKKyN8MIlmgYuMWS6MZJL0L//Vk/eBVA5WnxEftfrMoyQAwwwbqoGeSu2oDZIzdlUlPRtrK6QmTfjDwwb38PJP0oQe3gvH/9DIUdq3qKQqTVRg2pt2qCJ5Ke0QI1cjg==
Received: from MN0P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::10)
 by DM4PR10MB6206.namprd10.prod.outlook.com (2603:10b6:8:89::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.20; Tue, 18 Nov 2025 09:13:34 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::45) by MN0P221CA0007.outlook.office365.com
 (2603:10b6:208:52a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 09:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 09:13:33 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 03:13:28 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 03:13:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 03:13:28 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AI9DSJm4044901;
	Tue, 18 Nov 2025 03:13:28 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 9B8792A6D; Tue, 18 Nov 2025 03:13:28 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202511180100
Date: Tue, 18 Nov 2025 03:13:28 -0600
Message-ID: <20251118091328.3260970-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|DM4PR10MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac2347e-86d2-4480-17e8-08de2682bf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kfokOMRt/GE7+QRHvORVW8Y+On/Oo9/0bMPFqvG1bUqzaSmrvoLHmJElTR5k?=
 =?us-ascii?Q?8nVUKzP3KV4anna994Ou31l84ERsb2P8IhZZ0IkSqPePUIlE0Zuy3e9g0elQ?=
 =?us-ascii?Q?wIdreL6RExzcgjZyFOUQv7qarwK1LQ9qb4yC27tW8a9de/CdmuGNikGKZ87I?=
 =?us-ascii?Q?PCgjJpZ7UYTDjFyo3F5meoHXTH92RkhTMgOx+lT94srB6rAtFaXWU3eTS4/S?=
 =?us-ascii?Q?QX7XG7MiENDtu5q4NYTn+pNxJ4rV/8TODutI49iXwQ/K1rq5MZLpuvVZXQEP?=
 =?us-ascii?Q?BFDaJVwYqQvEStmLI5piS9cM6fTRqJihdvceAspDkN7OwL9VAvFKrQ/TpMVV?=
 =?us-ascii?Q?ZKjJm0onWCTVdqkPuVEDt+KrpiQQfzAbEMOJBSoRepUp0uW3WZRzbGwziSTO?=
 =?us-ascii?Q?Bac8KjGYS8A2uE9yEfZEpjjg+KcKZhv3WWAjCP1m/L8CFGd4Tc6gCy4SypzQ?=
 =?us-ascii?Q?ndGbtq249LxE8I5B4PjT9WRA8O4S8XpDaWMGwFYc8Kxr9bjNCf7vrekeMHjm?=
 =?us-ascii?Q?DJMC1/ihJtp27RcXRcVALXB7qzE5HRC+jHY44OndOSh3bjVKgZZdm25npI0o?=
 =?us-ascii?Q?Bk8JVWEBZRRcNWEpIEVoSdX8Ho3J+tQtZ8vFWeIdjbNCqzms2HxhxrxpyvZa?=
 =?us-ascii?Q?qGtotmMCiSSa2mMUi6zr+faAe3f8k2fbJOibV2qfAMYnIR/bciTVQS4rnxTA?=
 =?us-ascii?Q?EBaOq/DI1qBQ27CpJmwYhHVtKzfLJ9ChIY3zsApH2aee4GLw9wuP84nmp5q/?=
 =?us-ascii?Q?GvHvBWb0w8RcskIO8d4o+bL0/IzT5+L4x1VEi+taWBOAKdBElO+ShIuSaJC/?=
 =?us-ascii?Q?zSo0MtI2aPNIukMZ3jCAA2BcKXqwD6//3qotyPW1hKvMWQYE64heCw364djQ?=
 =?us-ascii?Q?8QVqc0B9JNpl07eSIm3aC1DjCFv+2X5JN5+lkNC34oavRM49zLeXgNN4LYxn?=
 =?us-ascii?Q?SIf8gWikjIs4F9iQzdT8lmhiFsjjW1oQK09hxZ7ZU/+IvgrzPz0ZWRcihukC?=
 =?us-ascii?Q?w7pAZvR1Ttfquf4O8M2RmXMXg2E3XcvsVkOk4xGqXHgMRsr5JgF0BWSbtENa?=
 =?us-ascii?Q?PAe6GXtl2pMhk/y994smT6ZhX1JWmAc/m5lt5bmptKRoXOAJpyt33l/+UrOb?=
 =?us-ascii?Q?XMdcEvP/PfZwyMRwZ13gn+xCNRIm6IuU2IpSOhqBxo01uvC8IJuRIvei9yCA?=
 =?us-ascii?Q?AsmBHlYGSy49w21uxbSF8ai4FMZwDL2sF/AHESy4J+Dts8F4YM7D7d8CtRZn?=
 =?us-ascii?Q?/G2GHleKUSCuSkLjI9ZFrzNVcLmrY5xKQZ+bbC8W0/ZmmhOJmQEC2ui4nMIs?=
 =?us-ascii?Q?YIIyaPqYR2TIW5z8RrayKH6UYkWcTfR9/cmo9dE0hj34n/aMpp9rFPjTBErx?=
 =?us-ascii?Q?HOdF1puyVlkxXrlKtd2mfihQrNDrZPbfeqKxUsjH92IUI3+s06LEcYQCqVgs?=
 =?us-ascii?Q?xXSjxOKgm5JVpPlO6ZOiQeh2ABuepDBlV26bom10oJGAjqTisqwfAwbawTb5?=
 =?us-ascii?Q?TeHYB1JM6H4Ecs9QNf0VFsCIedtifJcfcUS9w9DpSK/+F6S5gV3J6n09DrjZ?=
 =?us-ascii?Q?1OHM7DFK9SxqyZo+HBM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 09:13:33.4934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac2347e-86d2-4480-17e8-08de2682bf9c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6206
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Nov 2025 09:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19286

Updated the value(s) for:
  ti-linux-fw: PRUETH_FW_AM65X_SR2_VERSION,TI_LINUX_FW_SRCREV,TI_SYSFW_VERS=
ION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Dfaf2980429e83e502d1a2da907f8be14b131c9fc..0a37dc07b112=
0127eba73c7196a0b532350b9639
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D934cf94788c505068308069903d42f6cdf30c0ae..a44465cad8a30cb=
ad5e8b22baef59aa7f5151494
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D998927d273b149e4e03abc087965dbfafdec66a2..6ebb=
538029fdce262760611915225be608c31257
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D4be12a82ab1650b6313835b4d2fc70848f38dc13..1a86d36=
433eac7cef246d41fbd4d2bdd9612253f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc         | 6 +++---
 .../trusted-firmware-a/trusted-firmware-a-ti.inc            | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb | 2 +-
 .../recipes-kernel/linux/linux-ti-staging-rt_6.12.bb        | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index a986faa4..870707ba 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -9,19 +9,19 @@ INC_PR =3D "r4"
 # Firmware versions
 CORESDK_RTOS_VERSION =3D "08.02.00.04"
 PRUETH_FW_AM65X_VERSION =3D "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION =3D "02.02.15.04"
+PRUETH_FW_AM65X_SR2_VERSION =3D "02.02.15.10"
 GOODIX_FW_VERSION =3D "1.0.0.0"
 CADENCE_MHDP_FW_VERSION =3D "2.1.0"
 IMG_DEC_FW_VERSION =3D "1.0"
 CNM_WAVE521_FW_VERSION =3D "1.0.8"
 TI_DM_FW_VERSION =3D "11.01.09"
-TI_SYSFW_VERSION =3D "11.02.03"
+TI_SYSFW_VERSION =3D "11.02.05"
 TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TAD5212_FW_VERSION =3D "1.0.0.0"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
=20
-TI_LINUX_FW_SRCREV ?=3D "faf2980429e83e502d1a2da907f8be14b131c9fc"
+TI_LINUX_FW_SRCREV ?=3D "0a37dc07b1120127eba73c7196a0b532350b9639"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 3fe40487..f188f35e 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware.o=
rg/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "3d6736d95acc231eefd62db995e7ec719ccefd37"
+SRCREV_tfa:am62lxx =3D "960816d244c39ac1cfa24c4ea028c4404f9cbb20"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 2815cde2..e2b42beb 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "934cf94788c505068308069903d42f6cdf30c0ae"
+SRCREV_uboot =3D "a44465cad8a30cbad5e8b22baef59aa7f5151494"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 2c3ebf8d..0ab214d3 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "998927d273b149e4e03abc087965dbfafdec66a2"
+SRCREV_ARM32 =3D "6ebb538029fdce262760611915225be608c31257"
 PV_ARM32 =3D "6.12.49+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 5d789dae..ba1e6ed6 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "4be12a82ab1650b6313835b4d2fc70848f38dc13"
+SRCREV ?=3D "1a86d36433eac7cef246d41fbd4d2bdd9612253f"
 PV =3D "6.12.49+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


