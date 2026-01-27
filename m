Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E82FD2FEF5
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 22:05:11 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1563.1769551503744843433
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 14:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CJ02rZ/+;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.18, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUScMRCmsaLlCGwa3U/9QMG3k+CG5Eg8pkKNxImLm++bsJ65SylS0gAaXOX12JGfa/WH6Nb9Ph5J7PtbrR3es3dD0TWA/9TDAoZZK0stkXs9cOhfAoqMhdc1VSoQHj5rxZgCr4F+WbthVJHCLrvQsCIcs3+v+0lDi0elIom92DNVf/VI8C0l3q2eT5JWtukffqjVF97mX1sjLgjwRFPJby+0G/I3qBAa2OYu2za6lENmzjEJpCjzP9OtpuovGAhaTTh96peZ8U28EmTfw7dsAmtoecio7wQhwbk+8jDNDkAW+o2xadQuKZSHQm7EIl7lIVGJ7pjVEF00vg3CqXnV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iGb2ouZvrjcMdzzmdVrGK41z5DPq8OQu+dZJCQuxF0=;
 b=X5XVxBe23kuQJYeC1OXe3c7EYWO7ImEOuKJQj2D3w5VkKQgQYFgxez+V40/UoqwrR3RVQ/h5B5xNHWGdoD8rWYZSd/Bc/1QJbjnt1+SY6gbJBPTdY+cI/uD0m5hk0CPSW1+jxMpJDc29JG8EJ9pcWIT1tDfIrky31JTWcQi3leEQfWZS+QOp9kdqahwTAqrqEv4CtSJWnEH5L7jojWOYtARH9udwsn9jL1T+tdN8vpwrobVXV9g3ZuSTRp6d9PkCvH9YmYfxOEl2K+JCRVk5jSSfK4OEhujJycVq6u6n6rTm3lHl000uIWPDnvm0h+dmoaw3MRde+0M9L9PyNwLPoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iGb2ouZvrjcMdzzmdVrGK41z5DPq8OQu+dZJCQuxF0=;
 b=CJ02rZ/+L/01cFRicqr1vzGwTOlXRbBliI8zNGRajRbKLUz1e7OA2H6qVngo73bfZpSnYxuiAoZ+vOZ5YqIjJCLmYLltAZznlUWd4kZX3BafZNGHZkVfwD9MiLA6wmz1tFsNmWkwBujtyqlaPwTfWoexpO3S70RnQkOy6b/8tIA=
Received: from CH2PR11CA0013.namprd11.prod.outlook.com (2603:10b6:610:54::23)
 by MW5PR10MB5876.namprd10.prod.outlook.com (2603:10b6:303:190::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 22:04:57 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::bc) by CH2PR11CA0013.outlook.office365.com
 (2603:10b6:610:54::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 22:04:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 22:04:56 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:04:45 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 16:04:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 16:04:44 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RM4ie71225168;
	Tue, 27 Jan 2026 16:04:44 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vkrAy-000000005Yv-2zHF;
	Tue, 27 Jan 2026 16:04:44 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-ti-staging: Update 6.18 SRCREV
Date: Tue, 27 Jan 2026 16:04:44 -0600
Message-ID: <20260127220444.21374-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|MW5PR10MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: a772986e-2e31-4945-8db2-08de5df01b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O5F9WhMHQheosAboY2BGInFJ0BNjPrw+c44bmnWfOehwtD3yNgPjKdOKcVc/?=
 =?us-ascii?Q?/7k5VUDkILbT7DtZ92BOZdmOJHDk5hUSEGil3IG1aBFHUP2Qs+vgwQE+u3kM?=
 =?us-ascii?Q?PGM4cxuf0+AcSA/Iy9XSYrkM3EgTrmPnhatMRx3yOmUJFIqK+BMcb1XSYlAu?=
 =?us-ascii?Q?sFg6+6exzTovhVDqgpcsIa+exFydwQENFQcuuTq8IO/TLGPzAwN29XFNjLJz?=
 =?us-ascii?Q?qkOQI9imbx3d13Plwb84k2MUaeCai9r2of1B8LOOLPiHJTkxC5e7lYjy2OlS?=
 =?us-ascii?Q?gBGyorAmiEsjVlsoC/nPp1RecKLmUVPf6ZmSfLYuZlWdcABifkIS83TpWK+C?=
 =?us-ascii?Q?BvrbbiPftlQzbKCcNwn/ezgh14dQSVcNM019S8QSSRp1DEjT8N50R/MekwUD?=
 =?us-ascii?Q?c2Zmm255z8PfQnfOJ8SIYbX8Naz3mXabJC4mAIxmZGasB98xSNmDfPYKWOuM?=
 =?us-ascii?Q?wc//EBTCArbwY8uhN+lRS5XF67+3Msn/z1qr6bz3dRSzNCzfEYHEErQKzZX9?=
 =?us-ascii?Q?OILzAXmENZlJEHFgEUJG62Uk67x/RTtMTr5NIfM5Um4uH1kiGFGR52VP61xV?=
 =?us-ascii?Q?lq/DoWPgyL9LiwYsv8G6UenW7buKcqiMUoFIRy63DPB5w5qNTwyia7ZxP5ku?=
 =?us-ascii?Q?wwoZvbol2LsKL3BF/I0VBuGSnoWEyD/tGmP1Ez+Hce88BsdTqsxqR7DWQ/G1?=
 =?us-ascii?Q?wU3FGd5NX2zfUyVxgHBLQDSq7XLHMvvqirkOTDHQYj52reiGjbW+TnV0159A?=
 =?us-ascii?Q?79QEjui7Rceay1Sx8zh1Q2inAI75j0EILBkbsH6eOsN66g9SGF7RgXMVD/Jz?=
 =?us-ascii?Q?UyRP8fvzhFTzwJwnt19QpUyUQfp2owmVCuKm7COTCy+M+M7q+vKzngB0QvSe?=
 =?us-ascii?Q?vZeiTh2MTkPpgxelZLSwxg0SSBGnZBRMg8IB775yvrTQW3UDoCHiKpPod6wh?=
 =?us-ascii?Q?GGZLnBlYlWh23PYTW2ASoOTva+FzGIibrPz5caFjqUyswkBUIJS7FACE6HxH?=
 =?us-ascii?Q?2INlq8+eHzCucHJNKX2n9gtVSH/5xNUhCuCDYtMyXNL0Tu/zzz29wNG9UBAl?=
 =?us-ascii?Q?nORB8OHqMMzVU/TAnQ0zTh5FOaMa3B+Ol7cvg6sBR9Nef2vLNZH2oOaQYsP0?=
 =?us-ascii?Q?UagSMC1oKLfQk2qjRy+vuS0FOxWoLrlXpLb5hsxJGHFgUxID/9CAnPEBvOv7?=
 =?us-ascii?Q?F7oEgFH4GJTl9J7iu+CcDU2sSA/TkNwD9S++XyTxvZfeO1rHJ1zP+ttbWVX6?=
 =?us-ascii?Q?fexXgHFkBAftQDe4UZ81gocIrcviVKpVsjZbnXopMopbISEoVvlVX9C0hN16?=
 =?us-ascii?Q?LXFDlySx35q8EBxAQWj1aVPR7PYBWpSHd8R0mAd0RAqpKbkNFLqYqkCTUc7u?=
 =?us-ascii?Q?KSBZ+6euv2Fyo8NHIceDTHl5KeNcpZdZGqS7sQ+t1Nm5Mfl9M3bQpWuHUXFc?=
 =?us-ascii?Q?UbewumnHeCEvQ1wgAm2QDYVgtOAaKBCvmeGPQ4byKoqcWJTqqQek/V5EEnr4?=
 =?us-ascii?Q?xWiO3NPsIkmoyiI806YJtUL9WM/rnzWERP1quSOpLEe8XnpecRAsxryw7wWC?=
 =?us-ascii?Q?LQN6icSrGkLSS8BbEzXaGCkMA4ZvFfs1cERVxFSyhvjkZ3XhjzZ10vkDH8ip?=
 =?us-ascii?Q?Kq6Jp5FEx5aHvD2f++YOQsHtSBleyk7R6ORNsJ/gxN6G+eBOq4Bs1uSWm0kE?=
 =?us-ascii?Q?psAo9w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 22:04:56.8860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a772986e-2e31-4945-8db2-08de5df01b9b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5876
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Jan 2026 22:05:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19443

It looks like the ti-linux-6.18.y was force pushed.  As we are still in
the process of getting the LTA up and running, we need to update the
SHA.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index c2e2a3b5..ac71bee6 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "75433f843c99d1ab544808749a46a6e2f0151a56"
-PV =3D "6.18.0+git"
+SRCREV ?=3D "2d64b9f10d1d9e7cbd041d613b40222c11291f14"
+PV =3D "6.18.4+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
--=20
2.43.0


