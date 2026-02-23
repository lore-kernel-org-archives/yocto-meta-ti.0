Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52458EEC2B8
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 23:58:06 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9087.1771891082036460231
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 15:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=g+c1JMLw;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.36, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srUPOaLTQwXFoY77xYa/6W/2VYjkLhAPSjL9qAj/BguXZqOBUQ5Zs9LAkgG61ytiaROl5CsVUBoqre6LrFgAm+wLqclJzjpM4nDY7pPAvEMKMfQIfR4DaoqdUyy4wEjzr3y79n5Y8QYri/k3K0/71pyw+hxE9pYloxHmepVtAraaiHOhX3+PbKhHgS4Dq7yu0L220M26bev7Bi39/0xNnoTA1tj8sBv30Q7MGy3ksPMtWEGGMURXsNPus5i4T6SmOhyKY1HUSxmJY4ubNb8y/nhbcU+WplW21vk8k7+eYrQLGTNkiCoSMgTNzEOAgI8HFtWAoCMWE+9uU7crwTjYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7JbaY8rtSyyvNpJP6dT5XvPHUKxkg3u16y17Y/Vv0M=;
 b=nTRBPfYDQVdTwTPcf3ki7tHQBY2tK9eqGM3Ck3W+YUE94lwVxSoY0N08MAGFExVvHrcl3lusyHiOmtZqpWHEyb8CFXbuO/E8lWzMTqmbPAOLAFAp8Zg68r53xVKOcdIaukXkSnjePyzkMer1vSwErPNKG1B9cMWoXJDWU12dpyI5fmCl0etLyOW/Kyqxyiupi33qvpo8r2cHzDDmuYSh19YuEwpeTSDaxSIa7O4ILPrTXuChYocXU7/OW2OTKO0nYih5Zzm6RghkRhfEmulvHCux/qsgjbuljmzlHL5dfY+HzJ/PVz3N3GuTZ3SUGw+aealkV/LDBRLp5eNwXyMRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7JbaY8rtSyyvNpJP6dT5XvPHUKxkg3u16y17Y/Vv0M=;
 b=g+c1JMLwQpDo5YgkXE7o6wdSBvn1cJo//xMeufTH11Y5n6asipmpK/Sq48Nl38J3CaE7YiqQbOW+nWestQsXXxwv/qr4wf5fUmW3DrUY/LZ0f4K670mLq0axVhp5wcoK6v0Hxo+YdcXi/fhd1+JQY4Ax22b3k6XYzU0IIvZ+JAs=
Received: from MN2PR22CA0026.namprd22.prod.outlook.com (2603:10b6:208:238::31)
 by MW4PR10MB6582.namprd10.prod.outlook.com (2603:10b6:303:229::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:57:59 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::42) by MN2PR22CA0026.outlook.office365.com
 (2603:10b6:208:238::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 23:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 23:57:53 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:57:52 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 17:57:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 17:57:52 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NNvqwc1698885;
	Mon, 23 Feb 2026 17:57:52 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <afd@ti.com>, <denys@konsulko.com>, <praneeth@ti.com>,
	<robertcnelson@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/3] meta-beagle: move all beagle board configurations
Date: Mon, 23 Feb 2026 17:57:42 -0600
Message-ID: <20260223235744.3928753-2-rs@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223235744.3928753-1-rs@ti.com>
References: <20260223235744.3928753-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|MW4PR10MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be38cee-3ddc-4ba7-86e9-08de73375c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yws4sa7D9UO6qDk+Vns34NZlZzwcDp6Xw8/1qvqQHqw7W6NM8tFHMp6ddqha?=
 =?us-ascii?Q?7YwljdiUa+KLE5y1tUM78XtBza8v/n1R/SLyejIZ9mRWHtE/OIeeav5ts/ol?=
 =?us-ascii?Q?KV1hb86qcG+5iRg0CtdknXxFGeNRp1Eg/Vkb/8bcqlG+jrEm7J9e/VeoW3fD?=
 =?us-ascii?Q?H8rXh/h/flkbNPqwGkePAQmCWFN5QtOgVVPDrhDJ+BlywrqDLoUwBNo78tNE?=
 =?us-ascii?Q?niBrogK8G4b5VoKfiqXEDHeHbLxSp4QsNr9GYUwwoDGApI+fJ+Q56tfDYs4j?=
 =?us-ascii?Q?eBMqPwLQMyzGTvPZUN3Skd0rguZg8HRuHWM3x7ereh0M9XiK2WeDs77HJtjM?=
 =?us-ascii?Q?Wq2uu8Eszf3t1EJnp67QQpAyUnoSE5X45cW0EqDbRMfJnM7tnoIYVL/ySOZQ?=
 =?us-ascii?Q?dDsy0xVwcjflr9w/2VRDLgYoCuaN69Qe749pLLxHUVL2rzPlddtmSLkN85qf?=
 =?us-ascii?Q?GbcysO+4nKkC5yWqhaS7C+hQfXPK91hoKQWxNFiU8WPRd+NwmuYoIKFI+W32?=
 =?us-ascii?Q?MhbEM3vnRFIVXBxn7dtQAoyPs1cuATwNRtq+2CMBqBYhX+hR8NjxoOgliUfD?=
 =?us-ascii?Q?vyCr95K/7Q1MoN9nzJY2t76uOOyVh6SpkFC0MLTpIbzCJzH8+bwfUodolNnO?=
 =?us-ascii?Q?2vONJ9v7CPLwP3EdxWVp25ikJZ5iRIr7KkKv77XAVt69nfpZST+N3WXprcnX?=
 =?us-ascii?Q?0PA8FtSv6C8OhNMwlqeCGf5KQ8yNLVY5jcJmHi7Fc9111t2EaI72loLtBlbH?=
 =?us-ascii?Q?TJCO//8sU19WIYQvwbNWxr1fTKjyxrt4MJPw4qQPMZU4NemQ3X16ay/PY+4b?=
 =?us-ascii?Q?pPLUTalkQWK0ALItoEfDSDsCPUwsAOap4UuOro7BzUg2WgMALWrjf1F0hh/U?=
 =?us-ascii?Q?rc0yQhZcaPMJrjeTb4fGsXlcbAf0aDrUbKDQEyPMo5ykyc/aLZrksenxaaNY?=
 =?us-ascii?Q?RJKC5EFGEX352lMVvbbAazL5zcR7Ua0CDuV9T2EqHxAnAW6pnxxOM6dkXoye?=
 =?us-ascii?Q?wDKm7z4yes565wLbNpLrKV8GmWZDuk/KFJc6KoEnyjEl6fZLqtpw8dbkzKNH?=
 =?us-ascii?Q?5agcDRb/4EYLjOadYVA899JXYd70ANf86h4dyS1QY8DwFf/CVKpb6A7393Pa?=
 =?us-ascii?Q?YFbftsStiCU9eSytYtsD+Bz2X7cYsjDURFc3L/Kum1bxAwgFm5ItdGDUmIcv?=
 =?us-ascii?Q?YJGsbY8KnkOZUaIapW/S/0HBKYc9SuGICd56TlRK0vByyI6SoSBsbs3S/D7M?=
 =?us-ascii?Q?k8xrZW8O/eLNmlWwbt3Bk/KcuZkeoIsjDv9xTo3a/nX4R7qeJN9YVhvFRYkf?=
 =?us-ascii?Q?XXeahLK4jEE0ZcDO0YDMey9u7+OMQaW4qWNKla4+ZFH0llzdU6n5hCWxWYI/?=
 =?us-ascii?Q?1ujgtHuOuIyVkQKqAhjvpMNXJzWjqpMLluYnuxYVMYFKn0i2ZbtH++5hM492?=
 =?us-ascii?Q?Rrzqkqn8kwKLft6Ckx1M9/bJtgCjijS2qLx8TihTCmEEyqacDDORyyVSphDH?=
 =?us-ascii?Q?tLKtm7oaKk9OD4kxSslB7p/RQqbU65eElbtpJHygF8UFABZhN2AMR9kz9zBI?=
 =?us-ascii?Q?0b9n10Xoo+JEypCBzL/NYHnemy5u0g9XAAVaEgEdJy/SWkf6kk0KoN9zQZGU?=
 =?us-ascii?Q?BqNBlwbsro3d+YA2TDgUnrDrMeyABL/qdCme63V+nd34YsCgoz+ImaTO+ltf?=
 =?us-ascii?Q?glA4JA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7G31KarX44pB0Enu8zm2gMv6+hlIhrfJeoicdOu8z7VLtsLica+Ph8xGoNDkV+/2hZwezldMxoFzXDmLl3iti76E8El1UbWAGp3rasHkgwuyFr/hRroai1tF2RymVi1gbERxlhkmTmXJWXuby+ViicjpVs1x6urVDBUYfX2F6JoTQLwCwkindIcjtW7idjyTtXG+kQiWWbO+8NnihnBgtKZ5u14P7KV6mWxhue5czQ4dAu9ie6blwNSI19UoTvfZNffwTj9rCeANnAHySfK6GBUdGbl4AdZGgnSaYQe54Btoe09bxqbHsPgIolHCkxiHQSEd3ri0BvjVG/d4+j4Xk9JNSRRqAP9QJMyWtNyONVBxoL88ZNQBjKIAohT8CN/UEdSlwvFV71Dq5nh5Kgh1n7abz+MIKBpYcU8UwpsQv0+PbccEfyFcmoMCK1NTsO6o
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 23:57:53.7814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be38cee-3ddc-4ba7-86e9-08de73375c1e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6582
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 23:58:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19580

From: Randolph Sapp <rs@ti.com>

Move all beagle board configurations to meta-beagle. There are 2 skews
currently:

1. A base TI configuration setting all the default variables required to
   use the device with meta-ti-bsp provided packages.

2. An override that uses meta-beagle BSP components. This includes all
   the values defined in the TI skew as well as any meta-beagle specific
   configuration.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebadge-ti.conf     | 0
 {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti-k3r5.conf | 0
 {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti.conf      | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beaglebadge-ti.conf (10=
0%)
 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti-k3r5.conf=
 (100%)
 rename {meta-ti-bsp =3D> meta-beagle}/conf/machine/beagleplay-ti.conf (100=
%)

diff --git a/meta-ti-bsp/conf/machine/beaglebadge-ti.conf b/meta-beagle/con=
f/machine/beaglebadge-ti.conf
similarity index 100%
rename from meta-ti-bsp/conf/machine/beaglebadge-ti.conf
rename to meta-beagle/conf/machine/beaglebadge-ti.conf
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf b/meta-beagle=
/conf/machine/beagleplay-ti-k3r5.conf
similarity index 100%
rename from meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
rename to meta-beagle/conf/machine/beagleplay-ti-k3r5.conf
diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-beagle/conf=
/machine/beagleplay-ti.conf
similarity index 100%
rename from meta-ti-bsp/conf/machine/beagleplay-ti.conf
rename to meta-beagle/conf/machine/beagleplay-ti.conf
--=20
2.53.0


