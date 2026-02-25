Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD9FFD45ED
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 20:13:35 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54329.1772050410082367497
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 12:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nk5wE2TJ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.34, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnZzHrtItbLWw6OdPOGGzdzYML7gcP+mmyrqGaippYr8B5Rw4fldTeeShDwvhTuDzDxaYsGrVHMZDmsvZwiKDxNYZBHwctuUxIOR3xVz7XsoS42W2f9MxsyfyJn6Z7sQWlafWcQ5l+kxrQQ2wtjJoGTIcDdC01Dd3SVyYZ4nDj0KgNLjDeE6GD7akdFb+j5FgiJqbcp93c+T5jzjvkwV7JI2foFiORbqdQwYZyRQDA/1SV4PqbEFnHqoa2BcLUuRb9yQipPfaEPsQ/WlMGo2bvx4aUaanyfYC7XWMv+s6t3eqJ1WT4Fin7RbDD0T/wofEKN5hpzAYhfbYmXM16QHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uj1meB9VTm0th/B+0nqbqDvkEM7DjeO083fMQw+8PZU=;
 b=H7btkzKgq/9RcjKsA/rAyXUZWyJ0gIvI7OChIvjdqp7kc7sbNOscTGlRduZGFpEFY4bnlcCRF/4lztzj64UsLkOaRH0n4QjQGEmFroeEdfNfjFLb2jNPjGakspUEuDB9iBi62lGBISpWEcSyUwWtxTpJ8PjVsZ0gwR6UVWcdbVyx6iiozqDdHeQ7w8ebyr7Fl2B4rm/Y8IBLjTdtG87xFY5NHGE+Z1n2ROwyAoq//FlLoTccLB0VRcHjLWhfX4arvgaBruOVOv7x0VZN8cpFfQQro/JYKQyo2yS2UJa/RNjJJzVWUVilw/75whyK57AbKZKs40chfSPpIx1M2xUwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj1meB9VTm0th/B+0nqbqDvkEM7DjeO083fMQw+8PZU=;
 b=nk5wE2TJCIF5N4eYxS1+bjLZ1os3qN0+GGYW+hEU5V0lbWo3mTcQCpNOm63TNNqwyrjJ7CALjpxpbxZpSoTU3Kj59dv9jzgk8ptj8ZZdOj2aeA9nMyBkXmpCObfp/qukxS8g9D/7ocEpyjppnF4lbl5uLIw9zeQxRAvpApSCMts=
Received: from MN0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:52f::7)
 by BY5PR10MB4257.namprd10.prod.outlook.com (2603:10b6:a03:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 20:13:19 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::e4) by MN0PR03CA0010.outlook.office365.com
 (2603:10b6:208:52f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 20:13:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 20:13:17 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:13:16 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 14:13:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 14:13:15 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PKDFjj1061399;
	Wed, 25 Feb 2026 14:13:15 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vvLFz-0000000GMT5-3J9h;
	Wed, 25 Feb 2026 14:13:15 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-bsp: Make ti-6_18 the default BSP
Date: Wed, 25 Feb 2026 14:13:15 -0600
Message-ID: <20260225201315.3899608-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|BY5PR10MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: ddaf734d-12ad-4897-ee38-08de74aa5035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34070700014|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	ZTg6ougi2elTV9htASqhOglnSw8OBHD45/xodekWPpH51QvvaLLvCPZJaY/QHSG/tSGc/6M1b9pTX05dpVvx1p96qU3PJdeVRUHDg53sAGQCVOVGo9LilloynVdIRjJfh/7CeNDnnNlxxJfQg7IfFlF7K5AAnXin0BB72kwlZolQWAoWcfknl6eGu3AGxxFWdcLL1hpnfciIXRG24oQ1qvwyawNTafUBCjJ+vqOKxZy4JgoJRBV9gYILsYiLnvJhAtanR/TjYJT2t/OLgut0Al7pLCGg7EmRuProgpmzE3pvrfGTBcmyDKSoFetXp7cXMg57rXqcGtgvP3sNC0Xf448M5qyIpbnhwFHusxNQLS2+kMcqnhkudC2gunIlJmTwjLm/SWxFXah8LUYHNUv0V+5GnRiVVnMq89SUksxexzK7e0pFVaRZ5rFUtGD8twPDjOlgz8D6fOmDB4Nhn3KfLntGK75xaTJ0DIm7dhT9LxbWQ4WXWkWKEfMICxU7oTnXhn7jI3Uc+BduDOHEFbJIi5UfiGtMYESPToYU+TLJKNt2iw9uVQX3dx3BRHhHlioTttFu3pB2tm4LywcTjNhlD+Ov0mTCxNcAzSF+pRJ8losS0JBmDufVsvuwACf+R0m5RKDrpilzIIbKoXvPJ14uSgzF3NvXMWiyxijhvPSPeDkAIJOngJR9Z+YZTYFCQfsg9o88p0DWOaCuUSq1lsJ9ZC8j+3Pldf6NoOwaERWE1KXaBkOSyve8b+IDnUyrUhzpAGSuaJ8POT2RXvn9oKEwewdYS4AsLakfaSGFJTbkny9f9wpMzXS/1v41ZjZK9pP33JhV2Ct6C/hkSptUi7P5vg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34070700014)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	22UQ2dBGuTwYtNdKEubrWn/AIia2QVWrFzW/pBh3eg3GLUUQ84+Do+X2FtouehvzNkzoQhAOdGkA3Vxkig2jal6wZMzWuy7NbE/5NGplLGovYFtSGrJgTb8aft3wb0FdEg+Rk14AziMxQj9Kup4HEQFOAM8Wrv4NdRuk36jxDEayyx8mY2k2/N7hcN9nmReJI9SgePvZnwe9QpCq2G9oDdoBpx+Rmn1ohgIglLz1GDq8dFLiWdLdA2xNO+DtX+TDKnr5BuX/qihLgHMOAeYwomTr0OhK8PHtwdlADzb+1h5cPP3BSjEkUA7PQyRnA56tlq7uyAbtwkHCyYZtKUI7+C3hdoytHFHP+paH7GQhGDy1MRDOfbNQ5Xm3mdhYhr3Gew7s+TKZuMgDC3W671WhQgr866QPEmi9b8OUsn4w9Bwj0elP+/zzCx1uVaGpNHDS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:13:17.0972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddaf734d-12ad-4897-ee38-08de74aa5035
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4257
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 20:13:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19607

Our initial testing is nearing completion and 6.18 is ready to be our
default kernel along with 2026.01 uboot.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc                 | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 2 --
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb   | 2 --
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf=
/machine/include/ti-bsp.inc
index 2c0acf83..f7e2710c 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -4,7 +4,7 @@
 # well as a dedicated machine override.
=20
 # Supported options are: mainline, next, ti-6_18, ti-6_12, ti-6_6
-TI_PREFERRED_BSP ??=3D "ti-6_12"
+TI_PREFERRED_BSP ??=3D "ti-6_18"
=20
 # Use bsp-* namespace for overrides
 MACHINEOVERRIDES =3D. "bsp-${TI_PREFERRED_BSP}:"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 7ee10d11..0a925846 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -5,5 +5,3 @@ PR =3D "r0"
 BRANCH =3D "ti-u-boot-2026.01"
=20
 SRCREV_uboot =3D "cb63a11faef453412da23e72c5e9b6782cf62274"
-
-DEFAULT_PREFERENCE =3D "-1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 3cbfde60..235ed9d5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -35,5 +35,3 @@ module_conf_rpmsg_client_sample =3D "blacklist rpmsg_clie=
nt_sample"
 module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: virt=
io_rpmsg_bus"
 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: vi=
rtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti_k=
3_dsp_remoteproc"
-
-DEFAULT_PREFERENCE =3D "-1"
--=20
2.43.0


