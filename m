Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A72EFCE58
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 02:33:24 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35529.1772678000166591053
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 18:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=s/x1PKym;
 spf=pass (domain: list.ti.com, ip: 52.101.43.48, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nj4gAJYXX7YSriyJGBKS4ET5dEZB59NubaegeNJ3JGYgZ5p4+VzUDo9J7tEinBidNhBQ0Ur8fkBJ7P/lAZmYf8GDCDt6Y4js13R9SkYF1V2tcWHhrKW4MKN77UkK/ggMQmzW4QXQHHG1zbqZ8FkFTFIaSTn311G0DoqxTHl+Qq3cwvKZm/c+1HDxoQnB6wjxYgI3wT1UqC9r/FH97u8EvckNL5qpQ9VCkPZRoUF/5UwSXGNqpD3qQGwyfhoEw19PG0UN6R0FbIo5lWsY6K+R9tnkI/IXRIc06jHJOjdXzw15Z5O5WaHQvVbkhNTjlbcI04g3dq3EyxO+jS+fvTra4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUxtD9VDHhTx2JGygSJwoXBR9ak7lBj//6mo0ZeB+8U=;
 b=Ud9n3ITkIAu4cW9UPWrjbQ8fu1npgQsv3dQJQQVY3aT8d8TWZbQgptu4nnNSyenzINUcBPTteJtLdjqPW9nSbhcsJ1Td9ZI71NnYSJpXls5JJdq+BZQGhXlmOrZN39KsTseSUXU46nVm3bUWgKxorKnqsZjMEfoMtImZDDoTph6c37K1MKnVLokWv1DQtpDfn5sFAwwZrZaL4P1b/llN+IXP68AZ9V4zOxA+OowbZuDIf+P0Z/YgFAAwjqUMT/3P3IFRBK5eq0BztAo2vMN34JMA8VBgKnTmxBng17DwfhJ4+h6EinIjX1YZQIt+n5mwJtEOgxvtip57SbTYuoCO8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUxtD9VDHhTx2JGygSJwoXBR9ak7lBj//6mo0ZeB+8U=;
 b=s/x1PKymB+bqM1KY0keKpVFJh9IPQ7+nv87+RVU9lEKi9dqGXS7WL7C9MF7MyPhybnf3zCX2oxH+JL0Pr6ygn8PyT6JXJvBqOXctsJtX361jwzbyTF8Moxw9kYLyUIFl/PvBf5C8PCb74sj7LM1MulR3MjuMravk5WHPg4gsBPaE2G66qX0vIrmqF88hCdUZ4KDx2y2KA7pJceh/MdhT5FVW7nCSiVT97EiOfoK7upGnKCh2EynEa62rK9io6FUxEvj+Z/Cnn/m5pzxjhyZosJlsiYi0YId4L2LQ5i/DBG0xX8/HBhEft7+cKDQ54DEmqdE703DPB9yhZVQ48TXt8w==
Received: from SA9PR13CA0092.namprd13.prod.outlook.com (2603:10b6:806:24::7)
 by MW4PR10MB6679.namprd10.prod.outlook.com (2603:10b6:303:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 02:33:18 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::f9) by SA9PR13CA0092.outlook.office365.com
 (2603:10b6:806:24::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 02:33:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 02:33:16 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 20:33:16 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 20:33:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 20:33:16 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6252XGrI1515699;
	Wed, 4 Mar 2026 20:33:16 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 32D142A61; Wed,  4 Mar 2026 20:33:16 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603041808
Date: Wed, 4 Mar 2026 20:33:16 -0600
Message-ID: <20260305023316.1352831-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|MW4PR10MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf6a086-b76e-47f2-c8b0-08de7a5f8ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	VJxc6xc/kimLTzfzaKAHBxXfrRixmfIxeuo2HFoHrTSOlv6van0avf/k9IaSl2rA89YY+DJzFW/fX6XkKVfnMw1DYmauO50jo9gA5S7qL+8ZBTBVsdCgU38N4kkKE+GjFpDmFpHkfl5RW+FJtDOSIasIJVLop+FqPM6A9IAFdAdsQA0BROrA5eFKOLA7BVD6dotv15sE290uguQCInPFUtnLrIVde4XvXG3ht49elwlHsgOm5cAfmuahbC8BV1c9vJF+bvwNOUS5cAdLxNx659cJFyptI4pNvegGnjzSpEKNCkwfVa4LPmzFUOI1UTF++bUoExbkr8S0P6Cgy0Wz+TjCn7ll1QMVfWvpDS81tbMVYppy84VmFPOZb+3Q+HPhVUNzdOzd2IHS2kyDTHArvs9i4maevWFIx2JEoMm9kxl9KKxNAMTQzo0R8SM0lMo7u7IUH25V9Vnd8NYqxfVmc2tMcglj25J2Ew1Rml9Y0b1iC2WO27mh4mIl32afNO1AzyY15exx24x1IQsq8UEgXx3BztOWxZZZAKiU05pZXNZHBZzqkHMjRkNfbFAGuVztcaTZ8VizNZv7rL84XsCoD2ehSYBYM/M8ZtU5/gMtgU8WpMKbNFo8zAgdY00rNZvPLvdETyMWpxlLFI62rhmUNlyDEJGGXvgGF7WZwsJEUhyIPIPhum6UKE8EwjVamKtK5IfuXYzR/fjgBiZ0YxUFPCLI2kxmneeev3R53MTcN26jeK61rytgy+FdMg3NTAAlMhO5WTX1XO81l2WgzcP6xA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	liBDAKc/LeFgH9mdYO7wrWj4t1ScyDy5G8yKPpgk0nwMtwEFBW3KHkxzDkdGjZyW5H9aDrA4vjQlb+Zl8Kb/eU637wkcSXjAXLcz3eE1k0xTu4GlFtagbINCotZF97BIxmR0fc2d+CWtI7VD+sCHYbQQL+J9nKskkN56T7a9kiw2Tytlnqb9EvgS3J/iNRxt4llbZ5wrLNpGD+w3PwjiwwkRfFItjGoAxUxko4+bLjVcINyEsejiiEgiDFtxlgDqq6HoLWXv2tLHHq54+sS8zllyT0o/DNzNmXw6tWjq5IANgsDrqWZxZf96kk0sDM4Tb98d2aTW9OHsQ3xalH0YM1KUUV4rS5q2wYPNS4XH2tW8f9g4NcQ0gFMPMC57OCCqBxRpM5pObGRDJ6zM2xlXdhxbECVXDEGai6t3+hZ0LHE7+RhJ5AzxDqb764+Pf396
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 02:33:16.7821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf6a086-b76e-47f2-c8b0-08de7a5f8ebd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6679
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 02:33:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19648

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware=
/log/?qt=3Drange&q=3Dc5eea0af8225334b1babfa750b329200dcee3d2b..cf4a45b89829=
4c96af02a62b7321c35651b3fa67
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Dc42989009c209834eb512c065e283c492ec3dd50..90e682a353fe494=
e4058068a02bd8ee9f7a1bbf2
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3De9ebc825175636714e0ffa113133ef03879748df..8f75331=
2db559c2f1f0867030e5fb36b89f2ea05

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc             | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb     | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index e963acb7..5ae90637 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,7 @@ TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "c5eea0af8225334b1babfa750b329200dcee3d2b"
+TI_LINUX_FW_SRCREV ?=3D "cf4a45b898294c96af02a62b7321c35651b3fa67"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 6f00bf40..900604bf 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "77f19d893b8cd78c50092bc797a1de52f99c428d"
+SRCREV_tfa:am62lxx =3D "8fbd7df901ccfdb3ffcd2d38a54ababf94b4281f"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 199e4411..7c466486 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "c42989009c209834eb512c065e283c492ec3dd50"
+SRCREV_uboot =3D "90e682a353fe494e4058068a02bd8ee9f7a1bbf2"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 8e4ccd7d..31391383 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "e9ebc825175636714e0ffa113133ef03879748df"
+SRCREV ?=3D "8f753312db559c2f1f0867030e5fb36b89f2ea05"
 PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


