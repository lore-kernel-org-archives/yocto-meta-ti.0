Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22AFEB28CA
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 05:42:59 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5272.1770356577842192288
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 21:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=p1dkrzRa;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.0, mailfrom: m-chawdhry@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqLfZq9gAtpetXjp7CXQtzkxoxdLiHvwpemh1g2Zp6BnBMLFmUHF1iFULcw46LniYYN2gV6EFGLiTi5yApAKyl7Tmlgedb40GacJD/uM3CA+xChitjPo0G700PbXKZ2SnUrgiBZ+weTS0LU77Av+Ft8Bc8/rwFtblLQmRJOiGEZi972kRdpwinDYBSyjfvdvZn7ezyON1WQrWshGuBWxzFRgR0SJf2yNG9yQ+j6txn2I3yXUzoiV1ugNmyxewx0sXqVLeR8tlPCucxKgfSA12Htucre2PYJCj1aHFL0bhp1OJ4mksx68PHFmGgK5NzBMNVcyTdLhqSih32Y5Lc1YQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=538osGKswKa0rv3fKbeI9mpkejkB/riun66qLHpu4Ho=;
 b=No+wOidmK2Gb4/RQMrMLR6B/bj0ZM+IL25dbj3GQJbtwvXmdqx2KW+jFPvnYVUu5xnZ90lYyfntE/FsDP01vVUaudWrb6KGh63uWj3iUe7sVC+AAJRrUknPIUAqsks+WOlOtmft9T5DnU5cq+w7vCIfKWqy+wNqAN5Si0MxFGV+wX64ICnSX9bKM1d/nLAJoXG3n82XbBsvEqcDspV2YV4obPNRwlLpSTiz65/6LsOf62Fj9PyIEfx29q42dsIJrIDKP8LZnawCVlQqQl6qlJJ6RcHuhi7s5XLTejFCjZsZIns4gEF+upYVud/F4T80DuXaIg+EEF5o4CcjlxFfZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=538osGKswKa0rv3fKbeI9mpkejkB/riun66qLHpu4Ho=;
 b=p1dkrzRaXAJosCEJAL2Tvq2oVdVUMcfJ/a1Ag7RUbmeTNg6rjSIxj1q6T7mjv1Cy0z46e77UVDwCtA4qRdj+mcyduTRvDbnmv8UnxzF4NgxuvbsXARFf9W0pbnaFNz1iDsQUN0fsYsqC+8AJmwRpu2EnMx9n0YHDes9AGQAb8r4=
Received: from BYAPR03CA0033.namprd03.prod.outlook.com (2603:10b6:a02:a8::46)
 by BLAPR10MB4947.namprd10.prod.outlook.com (2603:10b6:208:326::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 05:42:55 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a02:a8:cafe::8) by BYAPR03CA0033.outlook.office365.com
 (2603:10b6:a02:a8::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 05:42:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 05:42:52 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:42:21 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:42:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 23:42:21 -0600
Received: from uda0497581-HP.dhcp.ti.com (uda0497581-hp.dhcp.ti.com [172.24.234.240])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6165gIub613946;
	Thu, 5 Feb 2026 23:42:18 -0600
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	"Denys Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, Manorit
 Chawdhry <m-chawdhry@ti.com>, Shiva Tripathi <s-tripathi1@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] optee: Update to 4.9.0 tag
Date: Fri, 6 Feb 2026 11:11:57 +0530
Message-ID: <20260206054157.1848713-1-m-chawdhry@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|BLAPR10MB4947:EE_
X-MS-Office365-Filtering-Correlation-Id: 7833e87c-4160-4393-4da5-08de6542921a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZBHG5E16FsGeQ8n4FOyptrWUtvpiZdYfWOs1acop3n2E4K5R0miDV+AGEKri?=
 =?us-ascii?Q?FiyVGg0wCfrYrrEL/qk+x6eJQbtkKynO+mzhPjhVk2qOZlJW9+ehrKoGUA4a?=
 =?us-ascii?Q?ugM/Fv3jxpUqnRsADzHUIPzQglsgheOq2c5GonYR3E0xeSXIgyjttrgMvMl8?=
 =?us-ascii?Q?lLh/B96/dqohzGsk01ohsogXKu5r4J8UgJmYY85qGV0TvEGBkIYliPFE9fup?=
 =?us-ascii?Q?35vr5aOQneoixx5dn5NH3+QLsrJhkYnt1u961zp1sVMEKcYEtvqQF5iMlRXC?=
 =?us-ascii?Q?jfsJsz+clQPOkSb6t+HZzoJxyZnrSoTr4EP100ezrhHwMgDNMjd6i/AzWZDN?=
 =?us-ascii?Q?hFi6dP/NvcQXg5+Dv+1z3etHdNfIcbj/3OJ4adlfw9Z9Fq5aZNkJKU/GsIXx?=
 =?us-ascii?Q?N4GzJnxJmF+P4UqnaUodFm3vVn6vVyoRLd+GcOZD7hqPfEDGFnbxZbkTmbTy?=
 =?us-ascii?Q?XUHP85eCiYPcs4A1fAuDXqXCbAsqvE5cM5PpoUDrKX5TDlNqRsii1sDbVO7S?=
 =?us-ascii?Q?Vwoa4He2WThR006btWVecjg6DryMzIvAD18hxJrER6mne/0weJCUNScUVLgo?=
 =?us-ascii?Q?t0xLWjuw/9RTPQCv01XGmiu/avruOsJxy4+bf3YAEKD9QTfZn9dpZzRn5/ve?=
 =?us-ascii?Q?RXTqwlwUIoMzYmKV/SJl3baNDOb0mf/QO1EQCmrz0wAObhCscYyMmw3hxMzB?=
 =?us-ascii?Q?hNnYgjcCGFOpnRMbKDHN0ALDCVNzJlVnLYILZzbcgKJKKZ19cCnZJZFJPP1P?=
 =?us-ascii?Q?+T63YAxBGqqiJK7ZSV1QzEJIS848xjOlhBp/RQCJJMKqBnSykymGKM+MOeFr?=
 =?us-ascii?Q?gHsw34caJjmrGIRep6TaujQkrs67p8OpDOBXQ23InatdvkO9FxktZuishkIt?=
 =?us-ascii?Q?HAtaw2bBvBfG7i8CRN0eGzVzsEyS6y80LvzFj7amQd9MlcqDXbuFcAJyQlZa?=
 =?us-ascii?Q?fOFH4CqjpI6z19puDG2UR/NXWp8+4WXI9GcrkiWi2NLSn+gpr9fFCRnjuRpU?=
 =?us-ascii?Q?eTQBJ6BvlZgCXTBF5G5ZlOhRGq2WSa2Xoply/c6ndCLo8FqQyytluKzzXfjT?=
 =?us-ascii?Q?fkimxV1FhZvF/Jj8j8apXxLGZ3n8c1qbHiXpekvP4yQkkaVeEoSJN5Dcvj3l?=
 =?us-ascii?Q?r0gSEvBHsrlvz2YgydMAPASc5jNoNcRXhJzKgMHEWPDX6QA1BeLdgFySto5Q?=
 =?us-ascii?Q?BFOMb+X/Af7i7p3n5zNbF7JDD9Mc4zIV/Q1fTIuIURVzX91to8O2A6Qi1gcr?=
 =?us-ascii?Q?c9TbaE0lPjgSMClvYL9WESsRZM3VyW8W7pbe46n8niLdyivW9xNib2kHzru/?=
 =?us-ascii?Q?/Tp3HP3uOyCcRFuBN3LNvAVEQ6+t1y19cHFiXid7ola9ZuYuFVkled+icTBr?=
 =?us-ascii?Q?uvTyg0eVPvHysS/Ay573/PM0pKhm5PWCUdlkzpITQoi3/9kFzabcMf3WSZss?=
 =?us-ascii?Q?fOtWc2fuanHq4vUQefgckcaYmAhaPznbz/gInMFlt8MzTDd73L5l/7qwNaOk?=
 =?us-ascii?Q?jFahHey1XzzceQNyS/Kcn0nUiZHWr7gw5Z+YVLOYhNo1mvz1UMvOMWGzDPlK?=
 =?us-ascii?Q?EBBgJCX+Ef85Wh9wkQRT36xgtUaUyjkmpOj4pjvXowWd/mfg1K7gwc3dwi6g?=
 =?us-ascii?Q?DwWdQ8xzZxcgkGDDykY45G3zQFh+RzCBHlfAqQy9sL26Gw6wY+2Llivl6RHj?=
 =?us-ascii?Q?iRvM5w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZxnqvH8FUI1wQ//goLH4sTJn69lcowi4Lqdj6btjDJ5g+V7A4LkaQkmDq8t7CIQP9foDxFivRAi/b5VrY1fNxQykIJ1QM9BTrbSUGKDkWvgRbaHgOMAV/98/AIolrQQxwIiO9tv+e2H8vM029j/c8gPo9U80QIQtXPmBTuA3rA6NjJd/jwvUIEzQI4dyjcSumNv4n6sXn/4pbUAbt6fJdUF7F89bkLQ3k94q0YJQ5sHfOUFhaHlq/MPGqeMjzbYb8esG9VR/haTY/9CZy6QvksNkcyvec2HfWw9HNFVH+93t2bemX36+tGv09cBxv/ogiMDMM5L97fdC5xVUTtzJ4Rx3SGpsapf3/NvCNPJRuxnYDVOGm4oJdZ2LfPT3sd719xI0pA+uVn7uGIo3i57pE55ec0fhN1Fqnxyn2vcJp+Xw+TWGFlQL1sEll0eFn+sS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:42:52.5261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7833e87c-4160-4393-4da5-08de6542921a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4947
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Feb 2026 05:42:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19468

Update optee_os, optee_client, optee_examples and optee_test to the
newer 4.9.0 tag.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
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
index d2593cb8de94..b8afbd3ef22b 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,7 +1,7 @@
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea4b=
e560"
=20
-PV =3D "4.7.0+git"
-SRCREV =3D "a15be9eca1b7e935917d834284726027dffc8cfb"
+PV =3D "4.9.0+git"
+SRCREV =3D "b27648ea8472cceceb8dfa368a965c709066f7aa"
=20
 SRC_URI:remove =3D " \
     file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \
--=20
2.52.0


