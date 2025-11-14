Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8533CE8D56
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 16:50:45 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2934.1763139038903558765
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 08:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=g0O66Z3M;
 spf=pass (domain: list.ti.com, ip: 52.101.201.27, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFNC0CE0M9D7hvpXa+zKFpr3R1FaO6ai+zMw85jnQ8Dn5Stke0kN3FH7QCJsvmiuZc+Mx7IoWov7ofA4IUms6ChsbBwg5H7U2KsNaHU3EuCVL9EDbuzvgaKoNuZdNKsGMY/y5q+YjCndmJZCIyfi3VKpDD7hiLm2z2wo/nAdpxYQOnoASUJuO/1cHq2G+ptw3z+PuBPq2ACq4LpOsJ44h5EOc1wleVMEvJHLQdf1DgTjYicWsKd7uSzCXPqGbQnUVX6OfBou11rTobLfCrUIoFV1GSvuqYckX2Jny+VHMgEYnrRM7kcFTKTizW2H3aSxmFtGA/HIXf13cJtFFU5oSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ktRgKa7aJyTaEsVvuw0G2ATthxL8Z0XaSxl8x8h+nQ=;
 b=xatuvgVs+8WnJJY8CgoszRzPLpQPed5Z2ENCImaxhDj21/jZ0J2ST0wexDXgwdLiVBbZlsr0m3KEahrGovhPkZPbHd2Pvvp5Z527YzAhDXwylEhQXUamVzBQJpmJBMAx+8p9t9v0b/Ha+hJDCAAhkPuJKTHS21tX7iIzxmOTgge85yhxsX3cAKY7UllZ+XpYos910BxhZ9GoVo2EIGq9XAgsoMqKBmejBdJe7huaSLVmLOp8CcL0wmETinyi42dQEVhMSGdilnWtoGXElqYukV2UgnEEH3C+nRi3nary+wJCq1CzXH8YwomvB0OB1JlgWNEvNXQN5KNot7usytpESA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ktRgKa7aJyTaEsVvuw0G2ATthxL8Z0XaSxl8x8h+nQ=;
 b=g0O66Z3MK7f5y/fxlyL37tFPpvRcHL25QbyW0/V5QlRzonJjGHAwXN8znqNTd8Ttcdaz2HPGyoGEsUOK6odB/OkfKDOSWRM5laHgCaHlGkA6jEGwKJFiqOf1qvaNzQV3YNg4d5OI9QEiTLsFWfePdA72yhcxWyIL8+dLd6X+6q6hVddcUmDWMtUnJkAPmg+9+Tp1gkxI0LLXCcTqQpwraB1FKCfVUUmq0/KwfOCGoXtOnpO53xmG6sa3vuVPiHYsTFRtprdPNqhAtBSjOyvmf1HWdjSMlWenehlRjUy5fH96/MFSvaQp7YYkST+IbxhB0j6yLFvGbWKlQ5OnlMFLig==
Received: from SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15)
 by PH7PR10MB6532.namprd10.prod.outlook.com (2603:10b6:510:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Fri, 14 Nov
 2025 16:50:35 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:d0:cafe::1a) by SA0PR11CA0040.outlook.office365.com
 (2603:10b6:806:d0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:50:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:50:33 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 10:50:29 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 10:50:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 10:50:29 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AEGoTVF2303298;
	Fri, 14 Nov 2025 10:50:29 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 0573D2A6D; Fri, 14 Nov 2025 10:50:29 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511140456
Date: Fri, 14 Nov 2025 10:50:29 -0600
Message-ID: <20251114165029.2048641-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|PH7PR10MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b78272-a72a-4452-ec82-08de239ded7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cfYRbnM1s9Da729ccnr43+F0a7cbD6B8XzHKWIjxqRGsmDxckTeFz0jLXeCd?=
 =?us-ascii?Q?cWQ4PFTy1qR38NuAivIp5sZwhVe0KWS9wucFp70wYq4yUArpKsAKksakcLpC?=
 =?us-ascii?Q?i/s03uA7BPf01F3rA55E8nHeywMYG+i/QRLXrTNGfocoxPUkfjrk3Kxbpc+s?=
 =?us-ascii?Q?S0UsybqTR4vmRHC3oVJE2AC4lg9xaJ0j8Vp3UwuFO807Zda5k87j8WW7yNut?=
 =?us-ascii?Q?U0PTo6SGJF45Lk32D1t2cvFapcr848SHfO2ESSdDmq7ZPoOcqtk1j1HXKs/6?=
 =?us-ascii?Q?Uk4PZ1rdyMI8AwXIHiqYDWgaLKrhLoSvC9nUOKep22nyatdsJXLbrgQY/88C?=
 =?us-ascii?Q?u65m5+rZWfiRmP/dQ0iWB33kKPGFa9L7wH7HPxGBA5n9qFWrzHY2cQHXyh0F?=
 =?us-ascii?Q?SegiB26uSiutTpJbrKeoJLw+0/ahbKVp2N+OraPELwe8VHCMMiKsUJcYSZy7?=
 =?us-ascii?Q?8+oGXKBsPHInaPBUKXKxHxL2fFJRYLUKDBCqNnO7lZQag/3SPsL6Gx71IcTx?=
 =?us-ascii?Q?mmiSmTMpLdHx8mt8/0qiKNYBvX+zblc0+z/+G/s3H/haajxomBEHZz0FJjQl?=
 =?us-ascii?Q?u0oPavLPMUOwdEANNcgwQKbuHhS3lSPuGI3kPPvaTjp/zMa92AnfaCCUkRj3?=
 =?us-ascii?Q?gKw8pITN+ifxYBWFJZfU7tAjMpR3kQcMV33CKCp6Uj0CHTVNaU7td7akh2gT?=
 =?us-ascii?Q?ZCXWjiz+310oA2H7c/16OfWsIoZYw2J3GgAIF8m1nvARSRLdWFFZSDQ9BIKP?=
 =?us-ascii?Q?G//qd19RH2Umc1nVt7evATKwLTr9XyooXWujub2fNUWKwBXTm1P562wf0j6c?=
 =?us-ascii?Q?5kDXDpORe3tQmSCw5yPeLNlf+lv+RM1lXPKYIAJj9kVjNItlIfsaGcNkoU28?=
 =?us-ascii?Q?rtPi4WNYkldHMbPzqn2zQH0FuRKa1NLJ5kAXXotwOdf1Nn7wUs6N5BkP4qpY?=
 =?us-ascii?Q?lrSli90+wYKcHP5fo4QWiSORQLQu49e5gVsdv9tGk7D5sPS1bEBUaqtWfENS?=
 =?us-ascii?Q?sYFGK7t72Ong+DOI+QVBs2znXLSbIwZgbVoI1HUGnG+MwvED1PwuYMItwZc4?=
 =?us-ascii?Q?vPVVtUJ3y8nfQka/0W+px3bNEOnL183l3kUA0+PLA1FB68HptY58/9stNa3m?=
 =?us-ascii?Q?vjv999xrNRfc9ioZSanbjG8N6GopDlkZfDNOFrLjd3n9uOuzmURLsh3Wn/HX?=
 =?us-ascii?Q?zfsiYsbOFxc78Hy8B6gcroyd8AzDm9I6aBdhZsslTa1/b+YFIDqLmWc4vAlv?=
 =?us-ascii?Q?lT7NklyZ4A+LBcpSGMe1tiKS9vb9xQum8X7T9PdkW9wKi3aQBU4c+UzKNpCE?=
 =?us-ascii?Q?cgeBZeiDfi34jrH/PhdPt5LhHq+mE5jEAUCbJ7/h/LS8hoiuwygrEfjIzy8K?=
 =?us-ascii?Q?z0KCAMhdD0kbw6EqzWk/NHWWy77KhmALve8osujwHDWMKt+g0/6D3pVOySzx?=
 =?us-ascii?Q?dsGmUM2wBrHNMryFCE4W/rJ6V0cOygCx4ByFeNJwZ3kevHRMRd52nPzMgFA2?=
 =?us-ascii?Q?mYaJqwlsHgoP3Cv0K4yDiZCfrzTZpXBHh2IFYZEEkWPMucMS+soNPccaUe5r?=
 =?us-ascii?Q?AUYnBJnWH1knyJ8cA30=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:50:33.0314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b78272-a72a-4452-ec82-08de239ded7b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6532
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Nov 2025 16:50:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19276

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
index 8d153b4e..5fb82a46 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -9,20 +9,20 @@ INC_PR =3D "r4"
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
 PCM6240_FW_VERSION =3D "1.0.0.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "faf2980429e83e502d1a2da907f8be14b131c9fc"
+TI_LINUX_FW_SRCREV ?=3D "0a37dc07b1120127eba73c7196a0b532350b9639"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 5367c229..f188f35e 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware.o=
rg/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "58bfb476c908d4c220d8f0bae88536f457452f06"
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
index 8f3915cc..f97df6ff 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "4be12a82ab1650b6313835b4d2fc70848f38dc13"
+SRCREV ?=3D "1a86d36433eac7cef246d41fbd4d2bdd9612253f"
 PV =3D "6.12.49+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
--=20
2.43.5


