Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2A31099B38
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 19:13:07 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20797.1774033983685406410
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 12:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=ZwQrSENV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.10, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGM8MwD6AZmYpj/B8c3NSDWn10+IqcIzX0VDd2ZIPUMJ/CHQ4aqJe/q6SA3kkVyUfjQR7Mc/ksGVZrkmXwp0Ek2TLnErrmMsfQZxCBPIG5hMFRUC1I9dM61Pt+cVjfs3obtQzGBHYqE67O1kh3d2vxtXQZPSrWGKANuMqzjtTyavzHsvHGoOv5o27OlKuFZFHIR8QUtFHb+pLpZfLZSvlJx1BdYUfi4KHloExIEMQftjcVnMsfrrjGnWFd3jS2Eul9S9iHvijswsU/oiN+5FUkpr6mIF6diK8INDbhwKhAyRRedwys6+/oL5d6tC9Gz0YK+LYoYoBeUNY3ORqu+I/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhH3dwKAwJOHB0cbrOPOMWCLR2FjlQwLUZKXkiNkGNk=;
 b=QcX/HCrZmeQ0giL97yXV9sOckD1E8S8ImnkHuzn3HF2At+vJCgkk+42onTBq64lGFYFUyIQfv6KLe3uFSM1qo9okXgexZ7+BMvEWyuUwwCd6CatFS3ysNp0yeG6a1lnCbo3x1bfUOi2vAy+WpkAYwATXlktyzFoDfc1yJWtWlqQ0pdgH9d5gNTmRr9OtHGPBPKHSocb+3UI9/2OOEa7hdBmq2E46RmjLhOfVzvtNHZkAcjxOh9WiEEgMOrNiYyT5Ov/YZY1v2MdpCnQobM1VXl2JocWnddvnGT7DK4uB8a6Ub078GXOrRc+nDzQGj9OjBDVt15L+pX7nt6TVH7ncrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhH3dwKAwJOHB0cbrOPOMWCLR2FjlQwLUZKXkiNkGNk=;
 b=ZwQrSENVVDR1iL696vRok14nsmADaNmldB+X+RgFfkLLh1FBM7ZFCgag3MXLENemF+G7tlOGMFcZOr3hys8kvZ214S0pEnSs8pPSk0rV3V/DEELgLcZ8S3vD1jFnkZHmALENMhbl16hstM7ykbxD1VbQyq4Odp9RjWsxqdUfXwc=
Received: from PH8PR02CA0027.namprd02.prod.outlook.com (2603:10b6:510:2da::18)
 by SA2PR10MB4457.namprd10.prod.outlook.com (2603:10b6:806:115::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 20 Mar
 2026 19:13:01 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::61) by PH8PR02CA0027.outlook.office365.com
 (2603:10b6:510:2da::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.24 via Frontend Transport; Fri,
 20 Mar 2026 19:13:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 19:13:00 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 14:13:00 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 14:12:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 14:12:59 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KJCxAU105740;
	Fri, 20 Mar 2026 14:12:59 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3fHH-0000000AWrK-38dH;
	Fri, 20 Mar 2026 14:12:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] am65xx-evm-k3r5.conf: Fix defconfig for the main build
Date: Fri, 20 Mar 2026 14:12:59 -0500
Message-ID: <20260320191259.2509582-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|SA2PR10MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a84b61f-b7c5-4e75-a102-08de86b4b43a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+epCF4X4oLM+ERDbZp/N/zy+XgllUIsNUxxy0jgmTtUfhSzAzManT8UfqYuhNAQu7gxVlNq6lDJd+B22SbxbGhe8FQySnGn0b5fdmaxoX8vI8L9QWKYFdZB6d15MrG3OMjEOmI9iWtXZ3R0gt9Xnjru+iSi/a58j8YLEWS0k7H6CVZDX0Bcbq5d74+aFfo/s4qxj5rp96BdDYV3aigD0malUK/M4A6jlvSbR0IA3iE4e/WBr+2cLteLQtSGYjy6n6oPGVuIsg6LOBKqC6c/8YrkMs0/Ql4q2pWltKLlr3hthrEokwELPT5shnJP9otYkfGTVBcgPkG8D14HSuEvL8OEzQd4MFDfm6+/rQSGriVG+weMHutZlZFdVJauHgq8G72l7daKEWxU4t0OHK817YsqdgD/mDz7vAuh7KmijW+BEMxEWfqfTmUxfx3O6YbfRmJGQJcF9wjn5gD4Gxpj7+RsY8spxQNhX9Ig3Eo5/uEdeFGE44rIwMWAwTPA7Y/SD0nrrLLU5riXdIUdr/SrE6ekSs3eXvZo6qzakCVJcKXSRHxMvUuVaJFSSLhmGnEBXp1l9o6k5UpSI7/kR+71b1UkgpB+6JTeGg0RkTkXK3xEfHmpgrH0VOezCFKRGzZxf6DsOL3vOTBWDEFCMXdmf2Gp5pQ8Yeu9qciX4krglyGlXPhGlqzly6jdrB+2lK3aBzaaHpSt4U0gTFplR8JCLd3qRSa8+COaMnZDOG/cB3l+JJQI6xigLhPd+C4CbqE39SJ8zNrr4ifr48C46dnpx0A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QaaR3or5455wEQbyNBTbKRqCnP1GmBIa4VT+m8isqMx4wcw7Mx/zanApGqG8gdnLxNck+XOYrGhBnWnDiGTjQoJl6SUvpG8zOXe+rERGhJaDnQZkptSB6dGTXnJNxprUu9caIqLdJ7fEtaBA55Denoqc4L3AIY6FLQqYRL6+q0q4D6WRQ6TG3mGnlaiNfJv3EB7e4iZy7XVdr4ewEsADX3u6RhqXx75XTFfej2pKPphVmlSzjgSkTaD4zBZ/Xvy9rEwfIvm5onb9ZO8syE1HD2+7Ju+7w/rYgRBliNf/CIFpelPhrzX+JOFA0ZVa985DFSkrktu+pxT6ZQOXDpTWyUshPQLfJ+ws3S+u4q1LSEB0za1k/jzZZGLMOQ/qntDfHq036XmEQDuHjpxgXZj3Xnj/gVxrmQGZBFWCWoKgNDeaVyAPbNMrkdFu7f3cjwFA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 19:13:00.8507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a84b61f-b7c5-4e75-a102-08de86b4b43a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4457
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Mar 2026 19:13:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19798

A copy/paste error set the wrong defconfig for the main build when
setting up the test build flow.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/co=
nf/machine/am65xx-evm-k3r5.conf
index 4450ef57..4ceb81af 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
@@ -9,5 +9,5 @@ UBOOT_MACHINE:tie-test-builds =3D ""
=20
 UBOOT_CONFIG =3D ""
 UBOOT_CONFIG:prepend:tie-test-builds =3D "usbdfu main"
-UBOOT_CONFIG[main] =3D "am62x_evm_r5_defconfig"
+UBOOT_CONFIG[main] =3D "am65x_evm_r5_defconfig"
 UBOOT_CONFIG[usbdfu] =3D "am65x_evm_r5_usbdfu_defconfig"
--=20
2.43.0


