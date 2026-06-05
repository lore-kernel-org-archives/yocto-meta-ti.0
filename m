Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A301BCD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 05:11:49 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1786.1780636293960822255
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 22:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=hjWrYPay;
 spf=pass (domain: list.ti.com, ip: 52.101.57.34, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuJA9py6MBPNFtl7hBf3Bvd1YqVcKaGiIimtCSSTo/h2SANKaIDYH955h74Jn6hgsEb1ImJiVF6oegnnGrDzl4h4XNder6ItWKu1NLqQIRFYhaOzhbJXoPFWxBmqQ1Yr1mgP687GUkBxwhMFL3Sdv2p4FgaogxoXmlMLtLT7g9QuZlip+wGhtFUZf9U/7wvPLkdtHwgldec+YJ+mjYC8Vrzpipnk5/sOXs39RCg0/BEMTznkOSM0s1JetaXcX2Qgr8K3GABE2n884MY2BbrZzqvzLq9MohMTwVXXAa7Z2ePjyDuscqlXgkU5hFY3KVPUfSak/cK9ZH0zWXnTPW68+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McQV92jNFedcHm4nOgs2xAlPnhWwfjJLTumuzlWwuv4=;
 b=QdHozePsTANiihYj0ET8gIDj1EL99OZFuujFQu8L68SgCDWTWZgfxmSUKs/DWdJQJXlPzy4QW5lfniLTcV7Uxm6dJM1NA5qXVCUnMAEmXOaL2eCwCGNjzAXUnQm07y6Xrp021kf6ypJcd45lB/WaVxZ3Ri5HX8djPu6OTBafK/drdBIW0apgQC6HUI2B7PtJl7fZXR+AlwAW2YTtgj0Hkp/crnQwMyVIifpzVSg/UhzmkXV3ZYmGVFIE/1TzuJinJc3T3CpFFtYbcx6mtAJ92RrqfKeFqTTt9MMqKe/hf6X0lbLoA6jxNsfS2QfdLzzUlginR4Kvxl76VBwiceCcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McQV92jNFedcHm4nOgs2xAlPnhWwfjJLTumuzlWwuv4=;
 b=hjWrYPayKSTUL0NBoJkEITN3jzH3CZGXOPGTNd8NnZXHu+/7paoGSX2IgXAioCV88w68W4kXXqvo4B6OJtOqjXWSscMSDO42/KPLWloD8/KwLDjnnoQEmh7gUhE4kXthizGgVIOD5Stdpnd9HRI1vgU3NDjvUnfjfqbETL/FdJly0FUFlbBqgPHZBodarF7iGZYqGPDVrAE3kCyaSFaTUzyWx+6ROE7jPRP9vS1jjCYqvMni9u7q2jdPveF16GL85Q/YzhIIaiHVPaaskDlEJ+RnnvJHvAfvH0KSMjn9vS2Rk3St0d7BxIs2HyU/CR06c0msDfan+5P26l2PwGNoEA==
Received: from PH7P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::33)
 by MW4PR10MB5864.namprd10.prod.outlook.com (2603:10b6:303:18f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 05:11:30 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::5b) by PH7P221CA0003.outlook.office365.com
 (2603:10b6:510:32a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 05:11:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 05:11:28 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 00:11:22 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 00:11:22 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 5 Jun 2026 00:11:22 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6555BMbH2650807;
	Fri, 5 Jun 2026 00:11:22 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 4D5A02A6D; Fri,  5 Jun 2026 00:11:22 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202606042200
Date: Fri, 5 Jun 2026 00:11:22 -0500
Message-ID: <20260605051122.1422094-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|MW4PR10MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: b53872d4-f396-40b4-cb9c-08dec2c0e637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FLREfPct4sylIal3LLa32dZDqSVg5FKX32JuOKcZc20Gny1lSPsBJJpG0KlD73Wp9+kdh5+tOZIEHT510rBQslX/f7Vm652yEJl2C+xBYAfXjup6u8Sh4ayuRLslux132LLEAtKbU3zLanLimO/sM1awKdZXAdxDQAOBRODJ4r/NFPMZy8H044W6LWx+s3L6fkyXVzRsv5pFq9fK9v7ZPltlcv/VqL+7EyrgW4i5ddqQDpsWYPC6JEFmz6O76azUBCaeo8zPOJ/gj2vVDNv0paLCAIWIz+UJRkBa/J/KpzHwgRAycnwKXfChGpnzUUWQJRw+yvTVSXklczCAh+Q9+K5615IGMXY5b0XFIge5mg2E9wcTLAfSPmhTh429uHjXSBIxhP+0PW7ndytJ5kVPIU/o2bj4CZGZJYoHV1Rd1BS/rlcyHtHtQCBfaKxgJ+yBf41NmJKkK+t9Beyt7+sIkY5yR9/D9SvwN1TVgb1GZrWFwQRzewt5HpQQW6Wj24lqUYqqSrLgJAg3ZFyX41VwWseDURXZG3pAq3yxOBOE9yePfpLQbzSTVxd80TRs/mWZyE2pht8PenwGgHfLlJn/Asa1H3b60Ob1OcNoPV7ENHGykgBNKkiwVZkRrscufrbaUkzgVrku9bJ+VnA0AYCju5dBdd+xiGtKycbB20LTlbgHxTfJnMoukRTJ2csqsjTwdr/yfyS3nITuSs+UXY3asbYeQrKrlnssM74pFxJP6as=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sDLY0wYmdDnls+LEPcioks7Fz6L+nRQHxGZwIchfmSBmA9/s4oOk4p/q0tY+r0go4J/BNpNPREUYEyW/gN/CFglVA1aH9q/a3ptF9jTagjd2JnCI3QQBcgULXSPLhuoqvjAtDSixOx7I4Pupz5eKUjp8UkPox6JeUMXFXv4xD+vJkAUN7VEguHBinBRO/epYN14EAfxwghJ9i3/FrFqi99zZukfmhtaJE7gvriBsifwk64j10hd96unOoWynENjpHhh97l59cH5t1U5bUJyT0aGgIDh5GhAo7hhXNRPy7rry8fY5RJYTrxBQAEzMbuo4u6Of9UXV0Yftr28BlDmM4nkuAV8N19g3/X7FZLhyOvPa4HYYT9m+aCNW/G7tq44FWZOoXrqaXFOiaaHbgUJNAoNKNahWNY/cENT1EE8NGFSG/Bzy+mNylH2lB60g9Hkt
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 05:11:28.4648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b53872d4-f396-40b4-cb9c-08dec2c0e637
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5864
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Jun 2026 05:11:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19977

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3D9e9d50ff563f83db86d36b72cd7fb4f487d6b414..ec029baad8b4=
b147af8331a5e099ef891e5ae1f4
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3D19795f63be7ee27e38b6e800ff6c88a2feaae13f..f6338e22d2ac077=
7a68fb0f295f4cf1e3e63f659
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D62fdc7890cde3197051743120ff44162b7356cc5..d7f2=
b5b19f14fb51ad279f76fbeedd0dfd40b69c
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dc52c5589aab8c376f975b1feb7b8746b7b6624bd..4e3bcc1=
0a5d1e9822e0ed2dad5cdd16f7cf30fe6

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 85b73854..126c46df 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "9e9d50ff563f83db86d36b72cd7fb4f487d6b414"
+TI_LINUX_FW_SRCREV ?=3D "ec029baad8b4b147af8331a5e099ef891e5ae1f4"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index d03cae2b..31fd341a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "19795f63be7ee27e38b6e800ff6c88a2feaae13f"
+SRCREV_uboot =3D "f6338e22d2ac0777a68fb0f295f4cf1e3e63f659"
=20
 SRC_URI +=3D "file://0001-binman-migrate-form-pkg_resources-to-importlib.p=
atch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 0d974c0b..21baed23 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "62fdc7890cde3197051743120ff44162b7356cc5"
+SRCREV_ARM32 =3D "d7f2b5b19f14fb51ad279f76fbeedd0dfd40b69c"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 8a86e1d8..33972782 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "c52c5589aab8c376f975b1feb7b8746b7b6624bd"
+SRCREV ?=3D "4e3bcc10a5d1e9822e0ed2dad5cdd16f7cf30fe6"
 PV =3D "6.12.57+git"
=20
 SRC_URI +=3D "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch=
"
--=20
2.43.5


