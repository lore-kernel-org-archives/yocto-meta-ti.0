Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640E9EDF041
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 05:37:32 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39283.1770874645585340193
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 21:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Qzw3RdDV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.39, mailfrom: m-chawdhry@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbVj3zyFFOVT9MzTdP3gTyiYLPqw6YsWLoxrOSbACPgLvpvtSdlZSX5YdmHWxZaWkxCcrJJh11AOtl1OyWGS4FusfLyLxmXhRXkPHmvj4CmkR4nwf4FOoyzxxD4JpSfYQd/VzWPGoTR8OGPfkg5H9u97522fZYe0OOb4SVspbjPfkmytawHamO94OPC/Yfc2CBHJ890LRAmIIRT3a0Jlh9Q+t6cr2ShavPbL1cB/J3fD5Da0aZGvRsK3XJNpAqIrIviwN1yEdic+BBz1IS2Ey1CvLuXLeGRGeGvRt3sv4UwYei/UzjEY7DR8IFG+4YKy5C1ckluv/F4oLo87a9EYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgN/tWYbexker0UZ1W0S6uJV0cAEZvoBNS4NykI/SaY=;
 b=VMxgw/vhgHoyxaDkgqdnRmy9cpNrGhSGpudR1PfcA2K+8vzNyBkaDeGyCArMoON2pl5hMD7aVampO9D9rr/DwNjeUC4oSWwl0+McBKBnBhNJPpA/jjEYlQDOuXu2fWmjeBBqOh067/JoA2tNgK0p+Y6rtS6vzwHqSpJrZ/vle0cyzH0qMDmwpkApv2lBH/2t2eyehKAlgwqGlUWu1gr4RbHLYM9DrssRlh5BU+//FbTOLSbm0wNunKyTkN7OXcwF16FqPtaqHow+C4vRe7P3twyb4lQPosFGR7peABYdZXEEzqVhXSNN7znCum9Dv0lJBDitTqttgSP5kiGFLrIPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgN/tWYbexker0UZ1W0S6uJV0cAEZvoBNS4NykI/SaY=;
 b=Qzw3RdDVCkSXaexNU4Sx/3ooNTa8IKod8yCTnnnuux64mhwMNag/aWJuIh0yPWuc9z8yHOQovOEL3f+R57L8wgTgL2Ixcn2qbxnICZs8momj6rlne5iy+U3CyMl/mJ/PWISzo6Wuynf9ByE+Wma6HDPFkMbfadzVyBLfdU76DaA=
Received: from CH2PR17CA0013.namprd17.prod.outlook.com (2603:10b6:610:53::23)
 by BN0PR10MB4870.namprd10.prod.outlook.com (2603:10b6:408:12a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 05:37:23 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::a4) by CH2PR17CA0013.outlook.office365.com
 (2603:10b6:610:53::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend
 Transport; Thu, 12 Feb 2026 05:37:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 05:37:21 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 23:37:16 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 23:37:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 23:37:16 -0600
Received: from uda0497581-HP.dhcp.ti.com (uda0497581-hp.dhcp.ti.com [172.24.234.240])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61C5bDl52505355;
	Wed, 11 Feb 2026 23:37:13 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	"Denys Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, Manorit
 Chawdhry <m-chawdhry@ti.com>, Shiva Tripathi <s-tripathi1@ti.com>
Subject: [meta-ti][scarthgap][PATCH v2] optee: Update to 4.9.0 tag
Date: Thu, 12 Feb 2026 11:07:11 +0530
Message-ID: <20260212053711.4061247-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|BN0PR10MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbc6adb-b339-4520-982c-08de69f8cb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h7rPgBIh97PO9RNOUF2c5rtjPXgZNntY4rtu0dMH1/VR9PK9kIgD0cV0Gge+?=
 =?us-ascii?Q?uatLAEfwohnIF11t0k1Pio1fGtV+HE4z3xVuolAcyn4aF6nM9KnLkUHIhA0K?=
 =?us-ascii?Q?N4kMYoIcxQJbONUiK3QcLd8rZotIu5EaMOOKldlw51ZY2EAkr2Ed4UyOGOTn?=
 =?us-ascii?Q?gjCRbJ68uyoU2xpvovCe8IGqPbk+COkALjA8qLmvNC9WBgrrdNLeE+mNAj7N?=
 =?us-ascii?Q?CvwlIaTaCjLON2OkgJTcn4BWnMaT4lXWggOQZ64hcxZCTNpxT9UD0EuVpnML?=
 =?us-ascii?Q?rti2wUr3mECX0Qpq/aoPg5crxSPdecneKAPaLO8rMR0x/vKjPEWjqQNG3aSS?=
 =?us-ascii?Q?R3dFq4sAgTxCmnA9ylhDhgEd+uL+K9bjxCNHDaPvDBxt8P+RQqWSJgwlsjSB?=
 =?us-ascii?Q?F2fe2IzpU2E3pg9P0JLsNwB6F0celuw4nFCyqaRYb9bu8uXNM1GakJOhT6jO?=
 =?us-ascii?Q?6BBLkLnpe/OiqYYmgJA1qtIPgoPl0bkY92lvNUIBqZHCOXAhSw+pfFR7S0ll?=
 =?us-ascii?Q?/EpLMeAJlc6TOKYR2fiySXIpuIHo48AwRRJfMg5wa/dnBO7tQ8TAcIN/+9E3?=
 =?us-ascii?Q?nCnESxHTS5LQlM6g7Ie/EB7vCcV9k2dVBA0MjQlqKnuQAs7PWnTGdpYJf0w7?=
 =?us-ascii?Q?smXH34gqbZ+rZq6kf8c7+L6UY71cN59WwLq4JjFVp+bOu32Sn0BkKLAytsbi?=
 =?us-ascii?Q?oi6c/9oRyOgDGfHLeYKUGWB8371712clZbo3fEZK5IbBiIffiAAWPt+q2G4V?=
 =?us-ascii?Q?ImNhNDXzTFiTroLoMasabGjdU4TafofeaSShGNAy5fsCpxZyNg2W+8knCWSy?=
 =?us-ascii?Q?ylc5bV+KFYKV62GqwOVY3Q4BJrrK5RQ2uVD3ro5Yk6PM/kQv/PrUr65H6pJt?=
 =?us-ascii?Q?7x+FOBdU6WEtLkSBnbe2KULZbsQ+wyK+cWiuDBri66XmwyYoNrT/MIu4DABw?=
 =?us-ascii?Q?+hi1xO5mAR3qZ/vSMfzo+6a5igzAvfi8wr8dqxByh1NdKaQimYDb/4eBXebi?=
 =?us-ascii?Q?OHlSADrX8wIzL0B5Sw8EP7U9VK8qzw/sZQLNICsz5k7+UMRd72DP1emBmR/o?=
 =?us-ascii?Q?H10T9I9j7DCyV4p7TockDg2DH/4ckdJBAfYBAfcVpKiKIt1BmwAta1sYL8lI?=
 =?us-ascii?Q?5SDqkE+GK9VWA1QOu+O22AWHQFP5o2UfN8lfugPbreovzStr55MRLYGT5+4A?=
 =?us-ascii?Q?rGzI0uSuyDeLrockHk7nEGaprC0IFJxdrM5CEwjaUdzWq+pSW6lHkNrUWNbR?=
 =?us-ascii?Q?VuVf9rLOT44/FrK2ascobrwbym2OW01Rw80gvkXqX/yjetXlW/zvO8BdSwYz?=
 =?us-ascii?Q?JTuY0rRzPsACI5oSzUp4QlfW75/PU6r0UY635V3sLY9DmSv1MHVXsQobVX6n?=
 =?us-ascii?Q?NceJKfY4cmQ9i+S6X/OKXSxNYwOt8yxZne6Bj31G9VgyoA8bz2QDE/EsItD7?=
 =?us-ascii?Q?8w8mo6uRrfEaHfet0ov2Nz1MeBAy0cfHuc8lLiBqUj/jAwqAz3OTl+wAhFD4?=
 =?us-ascii?Q?OHdVsXRcyG3dk+lDH31x980gb46TMTveP6q0b2cYi3/RlOBQv5u4Cm1PNQRY?=
 =?us-ascii?Q?0q5Sp++h9pY3avEOSGNj0lmpK7EIwCdLBCkJbOPrRT3I5Q3mlSUy0vPhC7hI?=
 =?us-ascii?Q?Zg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	z6YDd2DPAvkucO6T3xDd/xZ/ILeu06T/wY9sM/4PL5nYQCYg2LtQouxRKsoQ77cFQAPaCMhzxdFpP4FfAiDurB06n/SSCC+g8ZsvdTZS8CQgktjLDTqjQVgdVcCk39nEeUe373gSbX4kLYWcktVitRdzplmM/uhPVIl/jT5uVjt0sdSxS63o3rVBjI5ZWFdGe559PyQbmCmGD38fXXGm2ePgqtsJLOvzyBN93/RFFMWoRRmMptB3WCUNpnpZ8AzvKTYus+XkIo7VtHrDHOXjm05dE6YYxDUzJ+Ez4ayANlGJLkfBCQbU8Hg87CaCyMSqVMn13KOMeVXF8vzHmMzl+VnhxuxwyqvV79mj2oYw/dR6lfwVtz9hXaVe7BqsoFhQFzzwGxF92EYQMI58R+nfgi9nER9u88t9JtjKwKLFU9a1H6DlYDIFQwOjZr8cc7Br
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 05:37:21.9053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbc6adb-b339-4520-982c-08de69f8cb7d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4870
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 05:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19498

Update optee_os, optee_client, optee_examples and optee_test to the
newer 4.9.0 tag.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
v2:
Fix the commit sha and send only for scarthgap
---
 .../optee/optee-client-ti-version.inc         |  4 +-
 .../optee/optee-examples-ti-version.inc       |  4 +-
 .../optee/optee-os-ti-overrides.inc           |  9 ----
 .../optee/optee-os-ti-version.inc             |  4 +-
 ...Open-TRNG-firewall-for-TIFS-on-all-k.patch | 45 -------------------
 .../optee/optee-test-ti-version.inc           |  4 +-
 6 files changed, 8 insertions(+), 62 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k=
3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc=
 b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 289ca5b500cd..68b6b262a448 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
+PV =3D "4.9.0+git"
+SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.i=
nc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 91dd5e60ca67..6ec2a83db8ce 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "14321a0607db16099d158478b21a2b2e37b3a935"
+PV =3D "4.9.0+git"
+SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b=
/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index d636ae006216..b5cc9ddb7d95 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
@@ -78,12 +78,3 @@ RDEPENDS:${PN} +=3D "${PN}-ta"
=20
 # This is needed for bl32.elf
 INSANE_SKIP:${PN}:append:k3 =3D " textrel"
-
-# LPM support patch for Jacinto platforms (J7200, J742S2, J784S4)
-OPTEE_JACINTO_LPM_PATCHES =3D " \
-    file://0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.patch=
 \
-"
-
-SRC_URI:append:j7200 =3D " ${OPTEE_JACINTO_LPM_PATCHES}"
-SRC_URI:append:j742s2 =3D " ${OPTEE_JACINTO_LPM_PATCHES}"
-SRC_URI:append:j784s4 =3D " ${OPTEE_JACINTO_LPM_PATCHES}"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/m=
eta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 0f040e6e7ae4..7284e49f1057 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,5 +1,5 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
+PV =3D "4.9.0+git"
+SRCREV =3D "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
 SRC_URI:remove =3D " \
     file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch=
 \
     file://0001-arm64.h-fix-compile-error-with-Clang.patch \
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drive=
rs-Open-TRNG-firewall-for-TIFS-on-all-k.patch b/meta-ti-bsp/recipes-securit=
y/optee/optee-os/0001-plat-k3-drivers-Open-TRNG-firewall-for-TIFS-on-all-k.=
patch
deleted file mode 100644
index 59d7a7955d18..000000000000
--- a/meta-ti-bsp/recipes-security/optee/optee-os/0001-plat-k3-drivers-Open=
-TRNG-firewall-for-TIFS-on-all-k.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 00f74ba2ab00088d51e6da3c0eefe50599ef5c82 Mon Sep 17 00:00:00 2001
-From: Prasanth Babu Mantena <p-mantena@ti.com>
-Date: Mon, 3 Nov 2025 12:42:57 +0530
-Subject: [PATCH] plat-k3: drivers: Open TRNG firewall for TIFS on all k3 d=
evs
-
-On k3 devices, TRNG is firewalled to be accessed only by OPTEE.
-
-TIFS needs this for the encryption and decryption services to support
-different low power modes. So, open firewall to TIFS as well.
-
-There is no concurrent usage of TRNG, as TIFS uses TRNG only at suspend
-when OPTEE is down and resume, when firewalls are restored but OPTEE is
-not up yet.
-
-As this is a firewall that required to be shared along with TIFS on all
-devices, making this a common change and open on all devs.
-
-Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/7582]
-
-Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
-Reviewed-by: Manorit Chawdhry <m-chawdhry@ti.com>
-Reviewed-by: Andrew Davis <afd@ti.com>
----
- core/arch/arm/plat-k3/drivers/sa2ul.c | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/core/arch/arm/plat-k3/drivers/sa2ul.c b/core/arch/arm/plat-k3=
/drivers/sa2ul.c
-index c50757b2c..e10bde131 100644
---- a/core/arch/arm/plat-k3/drivers/sa2ul.c
-+++ b/core/arch/arm/plat-k3/drivers/sa2ul.c
-@@ -121,12 +121,7 @@ static TEE_Result sa2ul_init(void)
-	start_address =3D RNG_BASE;
-	end_address =3D RNG_BASE + RNG_REG_SIZE - 1;
-	permissions[num_perm++] =3D (FW_BIG_ARM_PRIVID << 16) | FW_SECURE_ONLY;
--#if defined(PLATFORM_FLAVOR_am62x) || \
--	defined(PLATFORM_FLAVOR_am62ax) || \
--	defined(PLATFORM_FLAVOR_am62px)
--
-	permissions[num_perm++] =3D (FW_TIFS_PRIVID << 16) | FW_NON_SECURE;
--#endif
-	ret =3D ti_sci_set_fwl_region(fwl_id, rng_region, num_perm,
-				    control, permissions,
-				    start_address, end_address);
---
-2.34.1
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b=
/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index d2593cb8de94..f56d40de56f2 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,7 +1,7 @@
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea4b=
e560"
=20
-PV =3D "4.7.0+git"
-SRCREV =3D "a15be9eca1b7e935917d834284726027dffc8cfb"
+PV =3D "4.9.0+git"
+SRCREV =3D "b27648ea8472cceceb8dda368a965c709066f7aa"
=20
 SRC_URI:remove =3D " \
     file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \
--=20
2.52.0


