Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCE3F55443
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:49:18 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37522.1771987755654867286
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Km5cbzTl;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.35, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbHaBG4u9GLrK7EByNTDKxeDug3j7sZIx23qftfpOavThq+e7UHw7gaUjbRxeYQdacee5qdKtZOIM+Ij61KGejRGLJr8n/DqUgOc1dhGXAnor3kfgUOVjb/YCSDHjgt3eH+8D7NntSSoal1it5vkNZiCz3jerSO0Q7D0ZmfbGtI/N5+z4y/iCKpEo+IMd8Yyko7kOUVVVFoxXF0whZqLXSZPu30OIsjTC8/fmB+Y7klHIj+3mAaUhA0qkiupWNjTRzNKrK2B95pNnuG4K5zQBQCdpj2MKWuFKdFO/o3cqejD1UXKdnR9g9Mtydx5sQZ2E6QsILZ0TCHxIkwuN0nPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zp6gBgQnO8yoKzShx3thW7wcTFC3GFN/mtI3KDjho14=;
 b=kPFVhLr/cDtrzC4Ijuk3LIPfgh8ckgp8JXxMZe2KBC8yr8qF4AcvOWQYa1HcUMYlrUYFB9ajeJH6JRtbIT/FFZTLdHE+7zLFr/J51cIVEgaMRk5vePuSUYSfitLNkFAX0LzkFUNjTKaQrkoCxI51s5CFkWvRyt9x1sWwYxKEYttXB7S+IFQn0dDufFkdx+iYSuvs1BWNEd+mgD9UV1/Jb6dcMFxXAH/lwXWC+SZeqxGycMYPyJEVcePsy/D1juw49axnkoKPV1MBkxoj+UPMgeq5S1xSh/KitA1LKRUBuIn8JdYz5HGrlG5QFbZmJIFONovbDlai38S6l2/PKSLs9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zp6gBgQnO8yoKzShx3thW7wcTFC3GFN/mtI3KDjho14=;
 b=Km5cbzTl35HDgM7cmGo2GvKpjz8WY+w0hNk0Mx64AkKDCdllB9CVr7qf9pMJh9rRomJmmdwLmDVLBjB+YMvvBeSdLpg+uPt+O0RLtdzKIgJWpGLTDW/jf6Aiz2mkKKlYyJIRL/aoskJjZVEMO0kTczkS53iG29p0br0rvNUYNM4=
Received: from SJ0PR03CA0204.namprd03.prod.outlook.com (2603:10b6:a03:2ef::29)
 by IA3PR10MB8758.namprd10.prod.outlook.com (2603:10b6:208:579::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 02:49:13 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::f2) by SJ0PR03CA0204.outlook.office365.com
 (2603:10b6:a03:2ef::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 02:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:49:11 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:49:07 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:49:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:49:07 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2n70Y3837108;
	Tue, 24 Feb 2026 20:49:07 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv4xX-0000000CCdJ-3CRW;
	Tue, 24 Feb 2026 20:49:07 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 3/4] dsptop: Tweak SECURITY_STRINGFORMAT
Date: Tue, 24 Feb 2026 20:49:06 -0600
Message-ID: <20260225024907.2908365-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225024907.2908365-1-reatmon@ti.com>
References: <20260225024907.2908365-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|IA3PR10MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e67f56-b952-4040-6f0f-08de74187453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34070700014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aXV5fimd5BeXMYT8Mw/FRBvHCsADcWy5IPveI5CBwcqOergAgt+4Z/K6ipA0?=
 =?us-ascii?Q?A9lLUoCUYBystf06vhF/jv+0cI1kwXSPb5hie8ZM5dUz2vyFmFf+H1bRKZ0d?=
 =?us-ascii?Q?U6eabwc2PV1JEPuiI26zi60nNgTf70YPy33/x7IX5BR3G4IPYQicy6VUvKlb?=
 =?us-ascii?Q?gxe8fb/iTnE8AOdkO3u5337Wwm7Brmck9FEDCgpxb+VkYw/CaU/F/xLQdErZ?=
 =?us-ascii?Q?dHVAPR/guvMbhOhy/msfvgg0nMmQCJs7krR9tBHMVSDoKUGOW1cgPv7w8xqh?=
 =?us-ascii?Q?WsEYZRCcdqO+4GgWyembYvrVpvNjTHfA8bHV+tKzs3dNMHf1Q+cI0coe8O5s?=
 =?us-ascii?Q?Izn/ZnP1IQDB6+ZyiwMas9TwBrM7e3ma+Zi/4N8Z6/YQjn735BnswYiw3wRI?=
 =?us-ascii?Q?ybfudHVBH1PileRJEyuRZmLzOIahvZdbXPf+JJqWibCr5XzmVmBtviop6JlU?=
 =?us-ascii?Q?RChlXq4g4+UY3vuAk9luPPtxwaffzCdGhHc6YUoEO6qeRRO9rqX67xRAaieg?=
 =?us-ascii?Q?ITsle8gtlxddtLFHXgq327o28tjME8e0VmPHkZpTxXvFqxeyxvCKHgHFWnZU?=
 =?us-ascii?Q?2FjcyuHZlNuOJ2oF0MmAHsUygWPrbi8qva/Qvs2D+CyJ5CYDXwY3hDkzS+Ww?=
 =?us-ascii?Q?KIudFnjJCjZMdewIyuzTw3iqgXkklbD+/gQnHbFx05xXQySIxPnR9obL1OgZ?=
 =?us-ascii?Q?JnIeXXrLixC9tLu+t0/8PCN2PyHIpvR+3v7Nc62DIJMLcj+wsv7qshbSWl27?=
 =?us-ascii?Q?EEcEZb1ThfTlO/0w1HzigKf3KYBDKzwbRAiTHulABced7RNEQhxHZX9jy+vC?=
 =?us-ascii?Q?2OmjDFt9/xmbHFs5iVaS2a3n5t3T5Q8CgvsJxLrdUwvO3GN2okZrZJa8dOaN?=
 =?us-ascii?Q?UJvcljnGT9Xf+Jb4luFZyHFSF6HBhh8JvgLECYcTKgq9hTL5AYsIj/tikfoT?=
 =?us-ascii?Q?Q8cx+HW8y+SMSJgkpZYqwVSi/P0VnGKfV/5GjKYkewwzI0k9nULcyTPfzyfE?=
 =?us-ascii?Q?X6/bjTQEf0/OPDf9MJ+fb8rpGcIy/JYLIRX0akqNk5OCxv/0SJFMkpmE0Ezz?=
 =?us-ascii?Q?aEzJbyzNw+ljglO3qt1Mqbklt20pSsvCyuhNVA+MriyHPSkwWRi5P6PseaoP?=
 =?us-ascii?Q?q+bTSfvWdwBfqiC8Ynonz8/PlN6aG5AoMX39YZrgeaJrrhTORYlIaoiB2KvP?=
 =?us-ascii?Q?VNvPZJLWwNQrdtiVmjf3D5vg+mvN7eqjQ0rDttoZiI3cxmY9UwdjSpx7EQfD?=
 =?us-ascii?Q?GI7DsQ6+mVpMSnzp9wyHobVtAM6kkkDoKQo0GnlDuiSNONQL3q+egkWS/ejk?=
 =?us-ascii?Q?eSagCxr4M4IqkUDX+CH14M0czb1/p5bPRFSzV4dBzdtCZu7OS7uL32f3Ud+O?=
 =?us-ascii?Q?kU86fan1snjLQ37+efKdOgXvVLCkk2kHSoUWawnQBXxKTHaj879he3M6q5aa?=
 =?us-ascii?Q?nYBIUbzZMp7ijoHnhV/jR40l5tGmIjPxiimj2Jk6nUzcMhByPJky6vjwqP4q?=
 =?us-ascii?Q?q1nuYWWkbj1nONFY/oPypgmTNLTZEAtlU6NkB9dLQ9SSzaOwPpUZyYs0FII3?=
 =?us-ascii?Q?wwi9O1DGWnutEkTlO3jFaroRepy7nRTizZ1CaJtWOGrIuOIpg9qO9JqrK6Ym?=
 =?us-ascii?Q?T6Noqb2iD7ovPJcxc13Pe8P8Iq7h3NJKkRQwBa6/HXTi7LwG/iBwRZb8gf+6?=
 =?us-ascii?Q?+41wpg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34070700014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BVypneQYYdBzFmX6l/5NTxEbSjBLe1NCuwPT7BFuaeooD9c+5a2h7fZ4sxq/l0vf4pII3zgGzLZ4xaPS4o0wvbt6PpT1p3RMo6ns6Pr1HvaU7SiPfWdnRCgR/sPr3Ot0WenVbSBoC+eW+AAtbpSI0mxeveZkzkU99DgCeEZffP0Db2JJW9fRrW0uAvMFcnv8uT47rLxUezBn6XFsl0BBSKu0oZmZ3LuTINs3MqFI+xFRdFRt9qxmm1TKNiombqzoG+JMtsnVguge3UAtdYbiFw9fI6xampSfk1xN7I98xtQC/z3+qjMdvPh0DDw8FCAqZjL4ca/ERkRCruo5jovI5nuWhpv2djsJKhH3XXozvajAnIJZmgR0v36ynyI1MDM0eqpSy3MVu3Dn2AgyxdHMX4EuPUBrsAZSqH499+N19zFEF/KwseIa6xJ3Eg8RCZPC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:49:11.1603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e67f56-b952-4040-6f0f-08de74187453
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8758
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:49:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19599

A change in oe-core [1] has turned on higher security checks, but dsptop
will not build with all of them turned on.  Remove a single setting to
get it building again.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D4c2d64c10a5=
b0437ab1ea04df22386f0f95124d1

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb b/meta-ti-extr=
as/recipes-bsp/dsptop/dsptop_git.bb
index c5242d5e..85fc191d 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/dsptop_git.bb
@@ -22,3 +22,5 @@ RDEPENDS:${PN} =3D "debugss-module-drv bash"
 include dsptop.inc
=20
 PARALLEL_MAKE =3D ""
+
+SECURITY_STRINGFORMAT:remove =3D "-Werror=3Dformat-security"
--=20
2.43.0


