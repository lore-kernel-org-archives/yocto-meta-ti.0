Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D14CD4F5E
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 06:12:48 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6042.1779257562439125592
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 May 2026 23:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=iH0dTGV8;
 spf=pass (domain: list.ti.com, ip: 52.101.201.8, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXVNm66yEbktSy5ZOJz02sz5VdkTHHup1/vzkWlP8SZ/tpV6pbfGMiH6CZXOtKON7M7oFE15BPsfwNrt63aOYuNfdWqlPNUihuJqFXcYpCrIwDnqOyupphrmCy2r4Q41VpcfmOXncD5zT/sBeP4SFGv4StFTFypoyVIhgtXFfdIvvHPAeO/X8lOGaLawQxZYIx2BMrLO/u695WGq980KWdQmtYZDOTrTBOotNXzOiziYAeZ6MJEe1dMDMyREbre6bFieepg3pVA+MRNBXGwgAWmQ9Vs9ATg3Rg3e5IuXCLNqFTOL1QAl8W4Pl1FqdD6OD5bUlCwJSWiI8TdFJSxHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eip81sl9zQLV6fmin5IWZjZOpAsu69pvMa6E1ea7E4c=;
 b=EhEHAf8lY45cM+F0mgaUhTfQpjDEtOj1LdUcZA8eJoV7y3P2snAhBRZQg7RGiDZhlX2/EdZviEN7pQMzSQt11Z4pPNabGQ152q7ncCNPAyUA/xriaGfotQ8G0arwbljVrZSR3xzjpuVcmwW/WjLRcfh5bfStsXkNLzdnwBSejMY/TcquKtAsXg25Z0of+ee9myxb89wbsth53O4NgraYI/F2I4oxNlYvOSH9Wj0vn67HG/NQwl/oly0S/D/L3w5ate5ekOIDz7GepMHkPm+iq1aOhYQvAupw7CiOBZNmlWrWfN/wDhMyY4O6kZmY7UnxZdlLHJf8lp7JRX8a8f1mHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eip81sl9zQLV6fmin5IWZjZOpAsu69pvMa6E1ea7E4c=;
 b=iH0dTGV8RwxWOltKQ9FU6jJPfZNnUDaXaphjxtVHUs9pY0RuN8LAgmdOzBufz4Je4XkXKvWUJvpQOV25UolsETugU2OFF2CRhqVSYPpR9POiCD8BGxF1PuEzfFEhJRpg8z0xKXoWxyv2JcnTc2TOkhgKFQwa8Tba7e6SXohgUqcy5r7K+Pib47wjjW7/HUrOIP9h5C/jM+nGyJS4WiER3DeUWN5zdh5Et8pYgQLPvLepqy3AvSrD0lFQmWOQEEULzK5eipdWcHwDtMeE3kmnXl4fkzWGyFjL/6FDe1AAQnkU4q2pVW9+zT5K9CnJOdvmX2g3QpnxCIZQtvYBgybZIw==
Received: from SJ0PR03CA0237.namprd03.prod.outlook.com (2603:10b6:a03:39f::32)
 by SJ5PPF7F0BE85A1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ad) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 20 May
 2026 06:12:40 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::d9) by SJ0PR03CA0237.outlook.office365.com
 (2603:10b6:a03:39f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 06:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 06:12:38 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 01:12:25 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 01:12:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 01:12:25 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64K6CPlA1391820;
	Wed, 20 May 2026 01:12:25 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 123182A61; Wed, 20 May 2026 01:12:25 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202605192200
Date: Wed, 20 May 2026 01:12:25 -0500
Message-ID: <20260520061225.3838604-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|SJ5PPF7F0BE85A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bf01fb-9828-498e-becf-08deb636cb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|3023799007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	JnaNpmmhUnY72GvdOgpIftizjL7MAZ54ITs5yclmEynOhukK72GkXpah56PS7pn2mTR5lNQPOBzesu4dDAjqmsg2iYjFsKiZJe2mimFV8NWnhZ7pPeuQh+KbPjikML6aL8oQZ3JwVqWrvQ8MrT0vV0pnWUR6KJzqC47LSwAN3Bgkl5bF+m1Q1zN63nB3+IadCwAEOprCVtm4ycuCmv1/FtK++vaLkle7/VpnIQ0aFZYFmDrQDr7FWgYZkjiAVNWtfnnShX5XB5qIFwCbdENFoVXkAQFSkeHoi4q8uTbZhlXJkwgPP4JSp/s3HhgLVQnkzMpw7AFtYppYnIxifLKPyZlTHhHh6rqVncZaQj/ls1KjrO9QOdbwhdpl85T+w8btaDsXGm0ktalc8xNZ+5i66lsGU+ceo3IDWlrEWlmS2lWsYs22UYQmUCuYXoulg1EINP+MLqTybAQYjhJYznu+87lzbmE/N7KfaXi3yG8X0//ZDXkY+1SRZtjVBw2CXDYvvnog6hfKi9OC+DGGxiqMSqXBjC6vCETQ8LoiV/ZUcNFNsfjJAS1pL/zfXaQOWjAO9hJScG9jgsiNVax3DvQ9vaqcZV47x2pY9fFwLZg009e1ztYsHDEgafbVdE07SUPwpqgLGOTxAF9PwlmYtEfqZzQh0e8X22XbH1KKCMcFpXCVTux+GRYM6nT/QOB2cZXKnAdUU7G0YvUNuQYhElqg7seZPKrXqtfBFO6inGMDfZU=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(3023799007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ke2IMWfvnXccs+M03kmcTXXF3BXMG3cXM+Zo5ZWihdg1zvsW+4FTeIS2uhxNIQi+PACz1mxvhnRggK4Vbe+KPyjwy4AX4SAioodrx0BEDdCRTlrRBeJUBCicEHLJBpyBTtkP/3hAmnrBfTuw6ZCSLIg11pdDq038fuhOrCSRTPPvUWOJsxztcwSogheZva1bdDIOcgvI9+bRnine5OSe6j4AMq04SuZiUHug/gFZ6dPYIPiNveg/Zl3DAvy9a+3IoKntnm0q+HmBNo3TlKt1WTpPZOehP6vg1zMEhsjy+iV6/Zr15wE2RPxNf8DuBw00WwopErG0Mrsb4p1juUUbYR6URORoEoeENeWgiD3OkeHcBqaxBGzSD2W5jIyhyxcJzfyCtAPDunKAPP0oqf6me2URtTJbLICIeJi7KARLaIfq+54TSPSBWUvxRl31HZtL
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:12:38.5541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bf01fb-9828-498e-becf-08deb636cb33
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7F0BE85A1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 May 2026 06:12:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19939

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging_6.18: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Dee3048ee0822c35312379b6e24b5c80e9a845110..1f603935204df4b=
34054fa3bac80158e528e2c36
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=3Drange&q=3Dc50875c=
7c4ad112d5e632bea3301e06a0aa8669f..eaa148f9640a047511be89f7652f8b1e93a4249c
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3D0085e69eaf041684d5806e4d1fde49c325519a9f..0472fba=
fd7277ece9e1bae4189bc6099e33cdbc4

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb               | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index a6478b0c..a66862be 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "a3151da32d3375b8567c05b2298661e73420aff3"
+SRCREV_tfa:am62lxx =3D "27ec63132041f7b9c6b3747731de4f8c6036a430"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index a7225293..56afc908 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "ee3048ee0822c35312379b6e24b5c80e9a845110"
+SRCREV_uboot =3D "1f603935204df4b34054fa3bac80158e528e2c36"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bs=
p/recipes-devtools/k3conf/k3conf_git.bb
index 3e3205ba..e33a1e91 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV =3D "0.3+git"
 COMPATIBLE_MACHINE =3D "k3"
=20
 BRANCH ?=3D "master"
-SRCREV =3D "c50875c7c4ad112d5e632bea3301e06a0aa8669f"
+SRCREV =3D "eaa148f9640a047511be89f7652f8b1e93a4249c"
=20
 SRC_URI =3D "git://git.ti.com/git/k3conf/k3conf.git;protocol=3Dhttps;branc=
h=3D${BRANCH}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 1af23653..ed87d378 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "0085e69eaf041684d5806e4d1fde49c325519a9f"
+SRCREV ?=3D "0472fbafd7277ece9e1bae4189bc6099e33cdbc4"
 PV =3D "6.18.15+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


