Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1D7FEC0FC
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 19:29:17 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5560.1774380551809485607
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 12:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Cm8Hj/p3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.67, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSOD4DXuqQZ7kxY0yrae+HD2rvJDjSDbApP+VLPrbKwSAtlOUf7/Kued67d0wKF98KkS5hd/09VH9Q9qoc8QvpwREN7TIGW4hvabOBnt5IXpN6LSSeG26ga3B16/N2W/u7JsJhJeVGdIpzhwwgykvJWRKEDZwIEU3wT3uTf5eGCQ/fJeKQQrzQp8qfsM+etozVBQhODfDXdBROUx9H/wcYa0ChpfVBb3pxiOhHHOm779uMIHtX/gdFl5au+bd3chNVw2tKlAP5vQzE4Ba1qyyWZu2AKryDZsgua8yi65paHm+ae7l107yaaxno+OfRwr2wfeQXFDaiTwqucIPv36fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oM4vDiE4Roadh3stJqOoq2GyGkU4ggHGhAhYCj9mg7Y=;
 b=Bdj/7dgEEPGajFwLU0Mn/2DIjDNFS7S5Psre6JL3MLkw4hOcbgjxoI900bR2VOmJFOCO7cxolgOJ4Lv3Jyhq/OLrKh1UB9nlN8y7xHaF1JvSNNaP8g0neREvUodZs4UMem3wImhln5y9Jjq6BmjFnuTcHZTWEt7EoT9iIDnCZrE452vSxAAviy0VJaTsCW0F4ecv7wzFU8Pvn2WM3M+wug/CiyTmUBgNr3hj64If1pehbtDgLbiP5pTq+4bi/WJpEKq+AODC5My2xuqLA5uxoH7dngNwIO3x9tmwZJTb6gV+HWtWhcfwYBLX8yro6cAy6at6roxBrarNbZUV7FrJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oM4vDiE4Roadh3stJqOoq2GyGkU4ggHGhAhYCj9mg7Y=;
 b=Cm8Hj/p31JbrqgyH34RpVMXsIcTZ5XBVaiEO65RQ3pe40Epmh/7Vhsq79WGor2Ekyb3wP+oAYNLkkYvOmmR1/LGt3xdtMBmT+85ASQ9v4H5UIXuzZIp2MmSIaAoLMEStuBtBIBrwiW0t6oUte1Z7lgrjvkM0f8xcrsbXIPBivgQ=
Received: from SJ0PR03CA0334.namprd03.prod.outlook.com (2603:10b6:a03:39c::9)
 by SA1PR10MB997605.namprd10.prod.outlook.com (2603:10b6:806:4b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 19:29:09 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::b2) by SJ0PR03CA0334.outlook.office365.com
 (2603:10b6:a03:39c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 19:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 19:29:08 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 14:29:03 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 14:29:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 14:29:03 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OJT1402707203;
	Tue, 24 Mar 2026 14:29:02 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Prudhvi Veeramachaneni <prudhvi@ti.com>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti] [master] [PATCH] ti-extras: update srcrev for jailhouse
Date: Wed, 25 Mar 2026 00:58:49 +0530
Message-ID: <20260324192849.615116-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|SA1PR10MB997605:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d552852-95b1-4b7c-a50a-08de89db9e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	qrXbn/nsIoZkhRLNT0HuyIpYJVOJs8ej4GDbFQPvIFdAcfY7KyvIywZjArvh7hVFwYbLNUkYBeRQmS1X7/F6l1fUOmpVNyLU7iqgta1XQ5aT6O3bmFiE6JlLzVPBNfwb4sry32i9uQ2X8BuvBrMeRAAtpi34Qc+nU7csov4Ipp7FME7wq4WFsJ5wtl6I4HO/6R9Z2/bbPXJ5hiejriN34y6I7Sy0zNiGQizeVizlpol900KQEGWoyhru08IkjuygjDjqzXEja6fnSNSL4qokNV68P5U2/hKucaDkgx53BnksPpVFuirXqiBYJCcwaLrzFd2joU0O+YdBMDIFg2ioeczgm/pUmUxIkHMZzE3XLVAw2CB1ygVlchx3PfU096cbiNpKyHUu7zfYeCGK16FGT4Ff+TQwlGAtpD/W2w1s+D5nbW+jSUT/v1BtymDMg1KSe1wWIBZQVryJMOz513I7gFxZQkQMt0lfEH0GDhAt18M+pAj+tTowRrgeXDx/Q9k+WL/ACRowWVveDn4A0lgybv2Z8Zx/77CWbu6LzaD/gjH24D53hYYZzzUjfkXotxHP0xmSse1A6EP2AjW26+PFXQemcFVrgEOHjU/JyD4cpicMqnD6wjuN/EXvvnw5SD8/hIk7Z4fEWMDVgcmgcq5m9PQpa1VienYOy3Y/b9qyfBEZo79KRdh1kJG3n6i13QlRapYQrnmM402nhkY1rjlj3tGGIyflRe52PIInowJ1xnoJH0MI0iYqyexYCUEu6qUhWXqQmi2NMeZi7fmFdyStGA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WheUJASSMp2y1HPr1nvQXTuex6BIllIvFXqQCSudgZeNWo8uAK3iDofqSSnoe4eXieI3Ge/RtoZ5BL13cShF6AvLwyv/sDjBSH3m1U9rKY2GyZS/v1DBRSVuH9DZPPxbQpXAGvJiXogVZxm6UpYHKEjQIIY5tqrQtyvQ0EgqC0vg+ut53mgkXYvNGL9LKwCO0Ty8U2C/w2PaEZu10xwRtu5m2pvMwNmXepV5T590b1tKSa6W5YTuaXlOaCbmykC7+ku+bPp/HqwjNtUyx1WIcDaEo2931bOPa4Xvjuj0REA+xjAbNzP+kuZdxMDi3FJ2jd8Y4jPG0JECeDSleTY1Ug/O2I3ROa+wKpNCvNVd8dsaoWlCHZWdBHs9lcKZfxkylvz/SRPAmONXf19PigYf56JgxagMowbsmLXyBoxWKoOmRzsdhJ7x4N+FB5uTJ7JU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 19:29:08.0321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d552852-95b1-4b7c-a50a-08de89db9e67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997605
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 24 Mar 2026 19:29:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19809

update jailhouse linux and uboot to latest

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc      | 2 +-
 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc | 2 +-
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/ti-extras.inc
index 2160e1ec..7d784ac8 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -7,6 +7,6 @@ BRANCH:tie-jailhouse:bsp-ti-6_12 =3D "ti-u-boot-2025.01-jai=
lhouse"
 BRANCH:tie-jailhouse:bsp-ti-6_18 =3D "ti-u-boot-2026.01-jailhouse"
=20
 SRCREV_uboot:tie-jailhouse:bsp-ti-6_12 =3D "e718bbcec3ebf663c021839753034a=
224be4cc53"
-SRCREV_uboot:tie-jailhouse:bsp-ti-6_18 =3D "cfac87057b6fed15c4be4f1d35bf0c=
4001807484"
+SRCREV_uboot:tie-jailhouse:bsp-ti-6_18 =3D "53a287d24610f0747ae4e35cff2afa=
3af23a48e3"
=20
 UBOOT_GIT_URI:tie-jailhouse =3D "git://git.ti.com/git/processor-sdk/u-boot=
.git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-bs=
p/recipes-kernel/linux/ti-extras-rt.inc
index 10e5988c..63de122e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
@@ -5,4 +5,4 @@ BRANCH:tie-jailhouse:bsp-ti-6_12 =3D "ti-linux-6.12.y-jailh=
ouse"
 BRANCH:tie-jailhouse:bsp-ti-6_18 =3D "ti-linux-6.18.y-jailhouse"
=20
 SRCREV:tie-jailhouse:bsp-ti-6_12 =3D "229a48602ad1557612a4ffabec6a3cbcdd74=
5f87"
-SRCREV:tie-jailhouse:bsp-ti-6_18 =3D "e80c3501e727c8c01454594ca5b10555377d=
fd60"
+SRCREV:tie-jailhouse:bsp-ti-6_18 =3D "b27ed9ea7bdad936265fe38c6e112d86743f=
d379"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/r=
ecipes-kernel/linux/ti-extras.inc
index 515db47d..ff8b6f6b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
@@ -9,6 +9,6 @@ BRANCH:tie-jailhouse:bsp-ti-6_12 =3D "ti-linux-6.12.y-jailh=
ouse"
 BRANCH:tie-jailhouse:bsp-ti-6_18 =3D "ti-linux-6.18.y-jailhouse"
=20
 SRCREV:tie-jailhouse:bsp-ti-6_12 =3D "229a48602ad1557612a4ffabec6a3cbcdd74=
5f87"
-SRCREV:tie-jailhouse:bsp-ti-6_18 =3D "e80c3501e727c8c01454594ca5b10555377d=
fd60"
+SRCREV:tie-jailhouse:bsp-ti-6_18 =3D "b27ed9ea7bdad936265fe38c6e112d86743f=
d379"
=20
 KERNEL_GIT_URI:tie-jailhouse =3D "git://git.ti.com/git/processor-sdk/linux=
.git"
--=20
2.34.1


