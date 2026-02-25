Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECB5F55444
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:49:18 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37520.1771987750768405130
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uN2LrSHP;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.4, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOjsMImYteqOBDPbG0dwn93fy/9FnG5UR89BLlERuRS1eJU+dR32Pnu2D98U+5oppJQlTYPZr0IkNdbcxr/95Jbx4NXKelLmPIfkRameS4vA75dyZsjANo+JACXW5HOHGKBqo9Q0kFvXxo1EqhTlIs//zuofOrbrDBjrnqNR3E0bbl90COXMXgrqWQybxAAqqA4bbL6UQSe3eZK5XNLVPcUSbhvR0CA0gTKm0JUrOwzqeQbUrpRKSj5PrZt4zYo9DQJ3pvx8VCQoLaNeXtWTyrKpTjmIXROHRo+IbUGv4b2OPL4tkQUB7oqIUijZhQs+J3J6ajqOYbnHInS5K/lpug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtYwRL00zl45feunDt6zfKY23MQpqtqDB8YPlN9QE/w=;
 b=fuoxHBJtoHFg4pb+bdgPtPiNS0jZMaPBFoENLmkCA3gRKaEMmdTxpuRIh5Hafb8rBFJMAdnQRyFv19YGfa7by7wdTI/J+i2fC5zGSeXagMdp/DAKJDJBYWxuI4qOEIPrvK6RIBEglcJKPUZNW26xNTNNXxQLUl9F936PlqnRwoiR7G6B8gxmwJtESnKc8t7qRofLfyw1vo7MgiF/YPqMegmcjX7VCrX4Hyh04KP3KQzGCMOWt/4lmAEw/JtIk/rd9fQVHvSi3IoyCL/u1l0DFPDrmAcDVCGAelae1YEGs8a+VhTLnSXzzjjYJVZ9vmdwvP+X9HfW4MaoVv35kDbqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtYwRL00zl45feunDt6zfKY23MQpqtqDB8YPlN9QE/w=;
 b=uN2LrSHPUk8+JrCmYw+PIoGAiyZrT7oaI42LGtBYb4lo+ysEwX+jCuz9IQdItrLvxYw/RT77VjqcPklainX5zgs5PrfOMA5ef1fnxxkhuuUcQqeHcOkZYVALJ42omlEI8nHbLIefAqNVu9psSKTA2QgSpnQY4sU1OTipmuCeWmc=
Received: from BN9PR03CA0724.namprd03.prod.outlook.com (2603:10b6:408:110::9)
 by CH0PR10MB4890.namprd10.prod.outlook.com (2603:10b6:610:c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 25 Feb
 2026 02:49:08 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::dc) by BN9PR03CA0724.outlook.office365.com
 (2603:10b6:408:110::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 02:49:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:49:08 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:49:08 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:49:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:49:07 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2n7TW3346508;
	Tue, 24 Feb 2026 20:49:07 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv4xX-0000000CCd5-375l;
	Tue, 24 Feb 2026 20:49:07 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/4] ti-ipc: Set DISABLE_STATIC = ""
Date: Tue, 24 Feb 2026 20:49:05 -0600
Message-ID: <20260225024907.2908365-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225024907.2908365-1-reatmon@ti.com>
References: <20260225024907.2908365-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|CH0PR10MB4890:EE_
X-MS-Office365-Filtering-Correlation-Id: f9009c63-fb2a-417d-1434-08de741872b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34070700014|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BbS+M3foBV8UwS2V4ahl8W1Na1FE89ZI4rm0NYlpEDLThg3ud4xnQNyoPyPn?=
 =?us-ascii?Q?KapccZfIAF4Qo6L8z7V0kYw/pVj9SjEr9Hulcr+E1qvSfiEfEHifvZxoMD/J?=
 =?us-ascii?Q?P6P/Xcw5U4uVdf+PakJ3B1L2dOD2EVvV6V1ogtTkQWkJxHyMGwXfrk9PuByR?=
 =?us-ascii?Q?6QpiLJQOEss+us7cDfOLcc7IQxQeqv9qc27B/WX/nD4qECI+xBjl9a9bgROq?=
 =?us-ascii?Q?EAdW7PQGFGvzxL07Kocm9hAqDg8/szd0qmkd7Nq6TBIKTF042Ryeiilo+sMk?=
 =?us-ascii?Q?bfxGBf45uAhSDfga6k7TTmwEp+ttoYPEVCB35Sy11/B4b5g9yk0hutWqbmk2?=
 =?us-ascii?Q?ywAKVGWj1w2GIefGxHJSXvdfFbDYWc2APfyatE8wUJhflKbzoiExGIJnd0X6?=
 =?us-ascii?Q?L+OFbKg6bCjiTEbd7t5YOtfzyavSj3FdtJbLFqZhBaAwH3EBdYCzDph7mHAa?=
 =?us-ascii?Q?GheoshKGx3Jokr4zNdhnyNRCFSB0eG9ibx2VTTh6+E45ns6LCE1Ekx3LMNhy?=
 =?us-ascii?Q?Gk7Z6Ht2MkBFAC2b94tJy+Rk19oMQo7/8SW8wfCThVKR26dXG9RF2HArGAqN?=
 =?us-ascii?Q?tUjuX8b/TpB8jDcDgHZGpznl8PzmoiSDkUvCerZc+PkKuFgVqjEKDC3mvd1C?=
 =?us-ascii?Q?mv4X9bVEvY0NUATsicEYlPPS09ncVeWf1h5edCA8KhE+SAivC8uTda6j9EBW?=
 =?us-ascii?Q?dm1K10nQ0XI3yRMBByRJgqtz7LK2GyQEo1gA8ZsvW1TfsOpLrOhIbFdTL+0W?=
 =?us-ascii?Q?ov72s3NZkJSWYhvEkGj77vZ62Ztae+5zjjkvCkPp0wze8r6o0stahsqWhQC9?=
 =?us-ascii?Q?18fB8woDq+02ZDlN8c58RN8XUj/dF2CRI9ihY+vZIP/0/W0pj7P+M1W3/n0b?=
 =?us-ascii?Q?etIIHJDnIXNA/c+LpunQjHgz7R6CHMozhLh8hqqo3CnNE1f0lX1IyV4mKBqV?=
 =?us-ascii?Q?qY5n95vZ1U3ArrQ25QQ0x7VLl3Q9RKDTeuuJbbzYvPnSlYmmGSWOmpHNQVX/?=
 =?us-ascii?Q?NOmWbjiFu7NGHl7C4zrbuuLljV5qimxf5rNoL/rrtbBUZuCQo2hw6El0r6oF?=
 =?us-ascii?Q?zTmNB/NOi7PRuP3HP5SNh8rxo6FKk1xOSaJV/dMZ5OGUpCMj58c+eCEPnivY?=
 =?us-ascii?Q?tM9ijxVF5y7XMyN2JlJT4tgPruWh1QDSb9sgmtjjoUnTR2NJc5fgp4Xe+Arj?=
 =?us-ascii?Q?TskUUF6cUrfr1k5b4SAaqkoYI3PQCP9+ZjeB6Gb8qoFGkM+1EvKaLftxdAFb?=
 =?us-ascii?Q?aD4k0UwFB+IqXBKNZpcWOkt6hfcBsuHfdFLEloPYdieUvZC/2GPzbEZObPuU?=
 =?us-ascii?Q?lqm45wfDzHSyCwzx8G3cBjguJeI1gqVwpxoXMDDCUIW3V/2B0sF1GXrhBsoF?=
 =?us-ascii?Q?fLgeEG3cUQrmmPkOXdGal+G4FJYxUhan7aAaQmYeTnuuOcI5QvL7zQzz0siD?=
 =?us-ascii?Q?jbYZVKvlEAJAMpx0ofEjhVwFTWm6TcHhKyW9l8DlYrdqRtBj5w5RkB/55id0?=
 =?us-ascii?Q?tW8gCPYea/kA+E6kEsqKNa9c4SYMwTn1nQwmESFtOG3G+NacH+vqJ2M580Ra?=
 =?us-ascii?Q?OFRlg4rrjNW2EVERQFYdPX+sZOmgRbxa5sNfQHAhhZhzBM6gN7HypJEcDMVa?=
 =?us-ascii?Q?EtisbE7B3CEmON2CkdbGR3IQ9BNtNeBksafTcze7sKQmCPXcujcG6lkYeaQH?=
 =?us-ascii?Q?FUh4lg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34070700014)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	XRjl6a/LWs1Lfxg/EPjnaPxULk+WAujjEJlp+XfcNugtZMHnCEWh2AxkJSOkRcs+EKrDZLDPRh6pHwKGg7W9398FSmhVDq7rD9duuwAJmX21+Hg98u5Na8yIqPGhlhmuodxsuCQU1CQeBKNRNgAErdwopVeXYd+LgXRMA0/Or2/u/+eG+K+u+XKurQFoOLj5MVST4lcJdjllO+thHDcpq5sk/Y1b8MfbXtyMcZEWHTRveM1gklKkfS8k2pbQafZl1ZsoJErazYkPLOFgGnjzw2RcZspcO7s/CTX8oUtql8gkRJFI4czB0ZCCl09NaXmwfnrEr8wiKEtP1CMnCi0inlhKkbyZ9JR3Z+im1kQdVnk42HW9a6LMtPHazWy7l/b4Z8yXo8gS9GXxXLvQykAiPR30XGBvFKLJgkwp2lAX2MSFfCLDNuDwM7TFZhc4Jcm/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:49:08.4419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9009c63-fb2a-417d-1434-08de741872b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4890
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:49:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19596

As of [1], static libs are disabled by default.  But this package relies
on static libs, so we need to allow for building them.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D03fc931bfe9=
ea3fa9f33553e6020cbc067b24291

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes=
-ti/ipc/ti-ipc_git.bb
index 3e4be816..85aec4e1 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
@@ -34,6 +34,8 @@ SYSTEMD_SERVICE:${PN} =3D "tiipclad-daemon.service"
=20
 EXTRA_OECONF +=3D "PLATFORM=3D${PLATFORM} KERNEL_INSTALL_DIR=3D${STAGING_K=
ERNEL_DIR} KERNEL_BUILD_DIR=3D${STAGING_KERNEL_BUILDDIR}"
=20
+DISABLE_STATIC =3D ""
+
 do_compile[depends] +=3D "virtual/kernel:do_shared_workdir"
=20
 do_configure() {
--=20
2.43.0


