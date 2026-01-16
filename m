Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C69C982E3
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 17:43:16 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3057.1768585395273235027
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 09:43:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=trnt8lJx;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.48, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQhsrxOMw2YB8r4vdaT3eFkJkNMoNvLL/Uc3xabdlj3oug8+vpSgJucXeRjqbB+3F2d6fxN7LHLvjy8wSvmFY3p//3QBWQIzjCKgXie8fjPz4SEkVSt8WkSnaTUkq6Imuaw/v0YGXH6jQLinPzgHuZcb7jEMjDE/2ZziHNWxpmAaaZwuNHjn8akRcTzUoxX6mwRvJVPcQHCKBB2pBPeacvlwFFU49FL7OE5APBmvxoksu+YtiQ6t5XUp0UwXxNZDZz9PbXe1VshTcxQCLw1IfJMq+agMgvhHUrwOqqCJxd2hwHjb5wxT0UwgnIDD8YRT5Ci2Cfdq4saZfhGRGMSYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3txYd7J6hW8SsjnRp4W47RfinpMl3MayNzJSWNiL9c=;
 b=MVP/xRvyEau8qjefmHF0SRnRWqI1nHJkitaLh/AIR/jlfYzo2lNd9/Bkqo3M9HDFVejJ6SxZeoNsGOz/W5NKD8FUxC9pvK1g5U/ot3HERlxtZS0fW/nVhLIp4VbWLVh2W4dCx38MRLsXotaA1WMgIHzvozR3bPFaJ6rrqnr/cRHp3WN5j3JImygN3gkROImFCGLglbYxy9DVNc62aC9JLStbSBiIr6SjjtCTX7lQo8ewf1Qol1AfZRwGCe9hhxfWL03w/OtGNvjWQBQ6syyHoxVK/duJW0yAr85L9Z5G0l6bMiOZUpAZBpZQ069dF4Ca4J0S/ntK8QywXqCxVFyHVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3txYd7J6hW8SsjnRp4W47RfinpMl3MayNzJSWNiL9c=;
 b=trnt8lJxqsn+7ZKcYDBXlp7f60udSW4l6g1q5s/rBEoY3giH6TehJHdoQspMkEJtdLBtg8ViPqOp/6VRShSFhzAMttuwZ0zNspcyfYKZwlgVaGdPGuAQVJbi+G2mi8VtwA1f0MwT2LqNOw8Icej1JBg4YNUm13pcc/eOKjdp0Ks=
Received: from MW4PR04CA0084.namprd04.prod.outlook.com (2603:10b6:303:6b::29)
 by CH3PR10MB7233.namprd10.prod.outlook.com (2603:10b6:610:121::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 17:43:11 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::55) by MW4PR04CA0084.outlook.office365.com
 (2603:10b6:303:6b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 17:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 17:43:10 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 11:43:10 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 11:43:10 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 11:43:10 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GHhALP3512383;
	Fri, 16 Jan 2026 11:43:10 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vgnqo-00000006cx5-04bj;
	Fri, 16 Jan 2026 11:43:10 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] j721e: Disable ti-vxe-vde-driver for 6.18
Date: Fri, 16 Jan 2026 11:43:09 -0600
Message-ID: <20260116174309.1579692-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|CH3PR10MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3527bf-a81c-411c-a73c-08de5526b780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hlM5gSCCWx1iJbXTxwsYQ8UWh7KPSXDl9YZulG+yfFqXYjg5S1VffWaRnLYO?=
 =?us-ascii?Q?mFRJveFZlMk6h2NpYPJF3NZVBwewyj4McDsDvvfdjOSbBYg65UfhVWdKlhMK?=
 =?us-ascii?Q?1wKhMOL85zDTKLpG0kbvf3Aj5kqk2Zq7nKpX9cuqBH/2fZu26ZQIM+7Oljxj?=
 =?us-ascii?Q?zqUfeCF8tz6QrhnoESLcHL3fAg6slX9NHaAHgqRG/OZkviPBiSPQv3DsaH0d?=
 =?us-ascii?Q?9o2LVP9IJpXxIhu6A3JB1U2Z7IULWt3qZi+u8Zo8Fsfo6Dy9gY6Yuq1foIS6?=
 =?us-ascii?Q?Zw+ZL3clR2Vy1tq9MEm5GE3VqdlIfpiMivbRhujKN9W1X83XZ+wlAM5ahZ4u?=
 =?us-ascii?Q?nCp2RmshNGowmbtFXKjUK2+KaC/BseKqn+mYWuyDMjvDnshKAOJ0/7zJT57U?=
 =?us-ascii?Q?FwRAFz+qCX9b9eCggqtSskerxFwtR7XiTi7w4je3ZQgtQSdMiIHsYvzftHqZ?=
 =?us-ascii?Q?dVWIVqdlDAvvuR885Pe249h8CNWZLDhYex56ph4sneYEDSa1wAp65vgbI4tJ?=
 =?us-ascii?Q?Ukvv5LgkVaHm0sHs+Wv48BwrO9dJZ3UzC6hA/fUzPLGEwAycpwGjOS/khcza?=
 =?us-ascii?Q?6v6hQmnZM5IjI0pcGZIoelAac7o6AFzMo6X696OFOQ7vKx+qnTiF+7KbMnWL?=
 =?us-ascii?Q?OnLdgPltxKMoz5je8Ks9izzHAO9w/jZDDF24LiKjn5I0JxcQISqvNeOueNHK?=
 =?us-ascii?Q?jj/7NnJhqLcPqxTMJGUE/lIbXGi8zZRR07IXDJXQ3nc2eZCKeyzp/vojFjrx?=
 =?us-ascii?Q?UNFaGJaJ/L6T3NDHDO/lnRcJtlXjotgozd/5+tyT7iyVFEc8rWNb/Yv3zq98?=
 =?us-ascii?Q?dJ6SdhwLteybUUW/220A+B9Yi/Mellp+pRGuGb9PrqO1B+WvJSOAA79zp8Xd?=
 =?us-ascii?Q?WtvDAr1eKOTFEF5uHVHZVH4aKPRsSPJEvG6WbCyeJuFlJK67nkEYKfuC90Z+?=
 =?us-ascii?Q?gwYsEU2aZdsaJE0+bDuRWTHVKLh2WF9X3gwH9C88DtLpcJqCFWM/i5tsyMog?=
 =?us-ascii?Q?SG3+1pwWG9C0aBKKJ0yTJw98LQ8Jj5h5P7LAXUSs7K7eTpM+sWF8KAEdBifd?=
 =?us-ascii?Q?xF1G6M9SuSJSvGKlbaxtUeaqjZWMRTg6vPekHZO+yxncvpJdrtudgqeknDJn?=
 =?us-ascii?Q?62bBaZbCSISR5PiJFaGZxadNPfaD3x9LFRDH4O3z1qYBprP+51hwP0rQmd6a?=
 =?us-ascii?Q?fjrjflzdI86CAT+1EI7CVQkiShGoGOVG6PFHLvNRkYASpAmm0UCpOuWj0LQU?=
 =?us-ascii?Q?wabr9TnhmSidI/5QIzZml5Q1ZOqTCymJsTveaOsAXjedAhWHhTV4o4nM66gA?=
 =?us-ascii?Q?uuV2Iw2SWiAEPgGA8yRZGPexDX/DoLAk8od0u86/FKf2d36dmDMoYpI19xYe?=
 =?us-ascii?Q?RB+APCyl1wU5b+FYC9TESTfgKLb7cSoAhtT5GFx4UuscN8s+zCUyS3HYXSX0?=
 =?us-ascii?Q?QOeNcqo5O18Mc2yOPPL0bO6QnDO8hFXbWQQfmQyhADdHlA32EnV5ar0Qif2i?=
 =?us-ascii?Q?ZassST4DwvsZVxGu8K1LE0dm9cQ24OzlCPOu/FFSLzIb8MopIEOci+SvtlxV?=
 =?us-ascii?Q?yP7VognWg5cugvjINfj9w01PBeZ4QFAYht07Uvl5/emyIJS1j6NUGOLg1DQ1?=
 =?us-ascii?Q?9XNpBoZiz4nhqGYiM7mA4c8oP05c0EHDk1T5GKrcrstJLtRWOkdvcNjsYW+r?=
 =?us-ascii?Q?3kNAwQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 17:43:10.7687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3527bf-a81c-411c-a73c-08de5526b780
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7233
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Jan 2026 17:43:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19426

The ti-vxe-vxd-driver recipe is not building with the 6.18 kernel.
Once a new version that addresses this is available we can turn this
back on.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/j721e.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/=
machine/include/j721e.inc
index 29566dac..f329e269 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -17,6 +17,7 @@ OPTEEMACHINE =3D "k3-j721e"
=20
 TI_VXE_VXD_DRIVER =3D "ti-vxe-vxd-driver"
 TI_VXE_VXD_DRIVER:bsp-ti-6_6 =3D ""
+TI_VXE_VXD_DRIVER:bsp-ti-6_18 =3D ""
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw ti-et=
h-fw-j721e ${TI_VXE_VXD_DRIVER}"
=20
--=20
2.43.0


