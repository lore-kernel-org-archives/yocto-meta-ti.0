Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A196BEEA868
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 22:20:07 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57940.1770934800837485233
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 14:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=J/cLOWcO;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.71, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqFekjYTj/LNc5G7cZakFt6RfVoX5pYw2gpldu9vB6/2LNEoKjsVy1cBf+PYyXdviirjqt9B5xe6xxBSSRGbkJ/CCKjx1fWvmejb4vlWgK9fpK38YiyXigMJ9nCgfRvbgQ8ONVrsIylGP/alONDtPrZ9h9tOmmjB54HvUwq2L5c8Ef0YdQB8vtvSdVFIt2Wntxont1AN5zc20DL1JeN32lYfRm3qM1wg5PP8tUytqLT6DELU42Vsy9mQ/SwkQA1+iiAaJ+sq8pnvF/9F+6Lws4s8SN9A6QxwQJDdQgrqoA1HXh9Fyt4fe134HF57Ar6Oy10EXoRbSNca1QiY/Jd4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wcq9JogJ/YeYQvojervkPfDHAUoy5K0imM900LKksw0=;
 b=gfRvyo09guc75W9UcxncHnv6tuwr11J+FufGbjDRCgYvq5tQYHw+yR6Mar/e0Fvmlrax9bD8Ls5ng9vadXCgdOSBq+BBq2vjcbOUzVNXmDbkeHyaGOg9T5bd01QvJ4VppwraskPBs1WnbZ7s0iYFJZbgW3R/ymJ4f588RKKQ9bE7XomUcUWCc3QwOORBNxUzyoLtIubQxtBnTDhAd4n3HlhE62IPxNMuITBXR9pRITmhT/o5yqJTwBYswfPTzjOOuFOo1QzgwgeyncvjVqCjc0S+waxcGY50RaCyvMefVRhhRQs/3qrhflXpzqgh7ki4kf4uLbwC8WfUoZJosZk1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcq9JogJ/YeYQvojervkPfDHAUoy5K0imM900LKksw0=;
 b=J/cLOWcOQi4am+E+q8BayplmJ38gxKyr3RMlJ73vdkbPaP9EsPf5jXnOjtnnSb6NwBY1uyWK60pa7Csue7LRCAEUY0/VJtb+HSEBGT/dJ2gkypQy1AVBftPO96XNafIW6Tc03zDH6J6MkXYwxWZZ6R+CpOrxaBoCjpscf8W/unw=
Received: from SJ0PR05CA0062.namprd05.prod.outlook.com (2603:10b6:a03:332::7)
 by PH0PR10MB997688.namprd10.prod.outlook.com (2603:10b6:510:384::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 22:19:58 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::d) by SJ0PR05CA0062.outlook.office365.com
 (2603:10b6:a03:332::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 22:19:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 22:19:56 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:19:55 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:19:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 16:19:55 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CMJtaM069394;
	Thu, 12 Feb 2026 16:19:55 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vqf2R-0000000DvVv-0wA6;
	Thu, 12 Feb 2026 16:19:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] optee: Update to 4.9.0 tag
Date: Thu, 12 Feb 2026 16:19:55 -0600
Message-ID: <20260212221955.3319340-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|PH0PR10MB997688:EE_
X-MS-Office365-Filtering-Correlation-Id: abd2aea5-a356-4893-9ea9-08de6a84da34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EpEo7RpQjRGv4CAwWpodzV5C2yEYDYY0ghm/DPwe1HAPSdOZZmiYx7K94gZ2?=
 =?us-ascii?Q?rPYNVBfiflad6Nw92yQQswNk65+LAlLjrNiYDFKW6s6QKTYCS1rdnforNc1R?=
 =?us-ascii?Q?pQuP59X4sbKF7S5kxSSSRgE0so7ALVK7KzbHL2g4kbB/S42RXInkAEV2Q+r6?=
 =?us-ascii?Q?BChIPeli0XfbOtQyDo+LYCYuwVhPlBlSZWe8Z8jM3UGv4tu/1COmOp0Ur12a?=
 =?us-ascii?Q?tSOXXwGnoVoqcqxpQj9Qo81avH+NxMF5w7lbpFodCc/PVKEfX9b3NhviPEFe?=
 =?us-ascii?Q?lOGdXsoKDNiKiF004kuucaM0wnc6iHHG6LmYYcRXjrWu8oHQ4w5Tdbenwwzp?=
 =?us-ascii?Q?7gH1ib/Glpu2tZqKIkpl74TThMzxM+7lDBdLGc/r5518N9Z3QvU570L6CJzr?=
 =?us-ascii?Q?dogD6jgjS8cu4yGoAW5/xZffPHR7LIxndmCgrzFVfR42FVglP5oCBah59yMU?=
 =?us-ascii?Q?C2+Q96SsAyuQGGaiZP48baZvzLNYx3c51KG5Q3yhAFxJZ0gajUHXoPq/0zW7?=
 =?us-ascii?Q?p9C/jp4uyFNF+1pSAASQLC/EQnQ7XaOpSrSHS8F3/0vX3pFw7/ba0Llk4GfE?=
 =?us-ascii?Q?NZHgXw6vqn1n1ImNLVziYHk/jXM7lLfX3Gk/2XIRcsEVoseSeeUKOe2hep6M?=
 =?us-ascii?Q?VAdw0y+RUcdzmOlUvVK5+Rie9gPH/4772RqiJg7wPMgCy4lako6Ycja3KL+U?=
 =?us-ascii?Q?+Fyl7EZSEBm/6Qq5pygDtA3m+1WyiLsxvzPje0swUu9F5oR0oDT1Xy2dkAlx?=
 =?us-ascii?Q?2m01VnIO5ZOauSDlflixYFufLXK6FlrN4D4pn466CJG/8EAMyPjVnwL/cEdm?=
 =?us-ascii?Q?+BhYyKdj58tzKbtNOGT2Uww0OtiwSiaonyvQVrK5kkwOFVCykvar/H1G08yG?=
 =?us-ascii?Q?NfE54aNG0B9Rhy51Eq8ExUOHTVxtoBYAjGQJXO+kwP3/p1WcJJ2jV/0ZWboQ?=
 =?us-ascii?Q?o5zbW7w7WTCqofo+RxestVos7jBYEcEa+IzmO66zLy4EQRzoCdIMzvSYD2QJ?=
 =?us-ascii?Q?8Ld3n7jmcoy1NWErUiGgahQOSjBoXQEoXxa8bnBz3/Z7HSXZXhSdLEENUraj?=
 =?us-ascii?Q?7bAfguCc1ZSUy2v0GK/NTX173iRF3c2UcEaa1COGpm14YzUgsqSPPKLEpYjM?=
 =?us-ascii?Q?J/bn/i79CvUKOI9P60bbCtRg4UEtaKIpMNCVEPYWBVBhXxvu6NPuKkPRUkGa?=
 =?us-ascii?Q?nJ2LAdWeo2J6jWlIjzyjNCR6Urd++kkhcVdZnfMjSIXWo/ot/zvzR2YVfTsf?=
 =?us-ascii?Q?vlWN75YUkEw9ngsmN0nxZxH4XUpylwrK6YOHSU/AfN2t7Ft3By0icelwspbY?=
 =?us-ascii?Q?wR8DaIsGP1AKYum+r0ov1hDdvu00159qkl0c6Bekzo03NGa/gI+I24syJwQu?=
 =?us-ascii?Q?oMmE+iLiUCEtVy2JuHUhHwTGFG/W0hdYTcngCK5cSQrUXaq5Ad6NPhuVHz77?=
 =?us-ascii?Q?QaQO/3asGXz0+3hGk5N8rKY3NxP1JVd0MbJerXQB2IZvtvGQD8igyWvf64zo?=
 =?us-ascii?Q?hINVk3g0XU5MGIK+gE+ZCXVkIAQdLTmQBA7SwMl3xLWT5vn+9dhTh5a7uJgH?=
 =?us-ascii?Q?mhRGMxoBHbTCr06xQ0wcQNwDRpZjTidtqFsEhwkwt08QsbFdYXczPniRbEqq?=
 =?us-ascii?Q?yNIzcX/3PnJAEdr+BR0qyzSqBW/v8SRJianWw2fFlBIup5OD5sKFNt7LPopW?=
 =?us-ascii?Q?kMfp4Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wQP6CfA5II+90TjA3MT9FTLf/pVzQiLQzkS/40yhxQXXTRdn4+HTN5OROSPCHknEtVMW3N1ooz6upi2F3LJxJdDJ2EXniqeWkPG/RsYoqrQ2Vr6/0ui0nPyJ1YHkOIIKmR9gK0whxTztviIn+089Pfq3cYISGfgepHN14mZEFg7Z7HfFFoTQ1Q7TNeI6PzhV/1SJJFUZrlv9Stv47ISuUr+8vsRoGu8NbPmVe1ZI3gn6IiVqnLA2c7f9XZQtlTxGx0ue9CJg4nsq/qGAiKRt/1XRglIGyf0w11rCzhwZeDHRpGObKpN5LnQxKY4GdfZg3grjSbWoL6ZSKZ2xnL6WvmeK+STtun3fkQpy1lV3//WT9NocwFO3scKuSJ4n8QBa7HR0Bau4kaYHgkkTdFR9d0ZfXIjKhifWVzBhzrhKtbIPMpnMFDhZyqhOwCeQlPwQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 22:19:56.0867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abd2aea5-a356-4893-9ea9-08de6a84da34
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997688
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 22:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19508

From: Manorit Chawdhry <m-chawdhry@ti.com>

Update optee_os, optee_client, optee_examples and optee_test to the
newer 4.9.0 tag.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Removed platform specific backported patches that are no longer
    needed.

 .../optee/optee-client-ti-version.inc                 |  8 ++------
 .../optee/optee-examples-ti-version.inc               |  4 ++--
 .../recipes-security/optee/optee-ftpm-ti-version.inc  |  4 ++--
 .../recipes-security/optee/optee-os-ti-overrides.inc  |  9 ---------
 .../recipes-security/optee/optee-os-ti-version.inc    | 11 ++---------
 .../recipes-security/optee/optee-test-ti-version.inc  |  5 ++---
 6 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc=
 b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index ec10cefe..68b6b262 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,6 +1,2 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
-
-SRC_URI:remove =3D " \
-    file://0001-tee-supplicant-add-udev-rule-and-systemd-service-fil.patch=
 \
-"
+PV =3D "4.9.0+git"
+SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.i=
nc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 91dd5e60..6ec2a83d 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "14321a0607db16099d158478b21a2b2e37b3a935"
+PV =3D "4.9.0+git"
+SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b=
/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
index edc9d68e..350eb9c9 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
@@ -1,3 +1,3 @@
-PV =3D "4.7.0+git"
+PV =3D "4.9.0+git"
 OPTEE_TA_GIT_TAG =3D "${@'branch=3Dmaster' if d.getVar('PV') =3D=3D 'git' =
or d.getVar('PV').endswith('+git') else 'tag=3D%s;nobranch=3D1' % d.getVar(=
'PV')}"
-SRCREV_optee-ta =3D "ce33372ab772e879826361a1ca91126260bd9be1"
+SRCREV_optee-ta =3D "a09269b15de635e1816fe832e26adfbfb44c5455"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc b=
/meta-ti-bsp/recipes-security/optee/optee-os-ti-overrides.inc
index 30dbb430..83087030 100644
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
index 9b1db77b..8f75db04 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,9 +1,2 @@
-PV =3D "4.7.0+git"
-SRCREV =3D "a9690ae39995af36a31b7a4f446f27ea0787e3a4"
-
-SRC_URI:remove =3D " \
-    file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
-    file://0001-compile.mk-use-CFLAGS-from-environment.patch \
-    file://0002-link.mk-use-CFLAGS-with-version.o.patch \
-    file://0003-link.mk-generate-version.o-in-link-out-dir.patch \
-"
+PV =3D "4.9.0+git"
+SRCREV =3D "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b=
/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 2d8fd8b2..15b43063 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,5 +1,4 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-test:"
=20
-PV =3D "4.7.0+git"
-SRCREV =3D "a15be9eca1b7e935917d834284726027dffc8cfb"
-
+PV =3D "4.9.0+git"
+SRCREV =3D "b27648ea8472cceceb8dda368a965c709066f7aa"
--=20
2.43.0


