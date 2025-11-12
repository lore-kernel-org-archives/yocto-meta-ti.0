Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C807CCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 08:48:55 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8935.1762937329790001744
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 00:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=e3m0+37y;
 spf=pass (domain: list.ti.com, ip: 40.107.201.60, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPUriqDUGDAqVsl0YKLw5CBWYuH9snDANGGYqCtUgITtQZt0FPqcRfnT3m66qcSgBn45hKOEGWteDAyqhGpdIOb87nmNq0pcIMysTBG+izwGSbqCtjTst/UryYwEKeV1Cc1VeuFlAYCu+JewnGXfJDopyO/zh5oATxQBxRTDQtKwxcQHrHnZrjaoWolTmjV/hl4mVVzLUy5g0w/8rGxs8jJm60FZYxs34gj1NhxXJjZdMzs/iJRHT3Oy7XJTYuAua7+fhoLq2AZB5sBj7b/pkqy8TBNvz+C9cDnz3DLpfgc9BfDroDc1BCW7pcMLkJ00YwBQoY0SIlsz/ZpJt0pNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLRN5HMCCM/vOvIRNS6BYOdH2ZMZLm8xqAplCG5Oa2k=;
 b=TbgU1j/4sNmP5F241kS6XMAsQOAFEOqTeWUPgcVaayQHWGMyvXgP3vU/88ilFlnuT+Z1SOopH/TV5Lq+vuuLhV96RPXVuMTjXTXogaqWhodVHwn7RrXQOkOSr17PpVqpEFfYHJF/Rm9Olcg5IXKReUSACg2DNtEn+e0mhGkSZaU4gXxu8ZSQLUZqw/mH6NH7w074jyJhZArlBMQ+pdVPdwBC+hJzdcBsd7miNv3qmJblJeZk4H5QaYjH25NET1AsqQu4crxZLtCKAG0ep5h5hvuOFL3gL5QHH4VFGOG1roZt9PdJBukplfH+WBlVw2UlUVoAvQnsI09lZAu9H7KpJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLRN5HMCCM/vOvIRNS6BYOdH2ZMZLm8xqAplCG5Oa2k=;
 b=e3m0+37yn9IWQH4Ad/Tb3C8BjSTEMX1rH4wA+Sk2yP8DuCBaiYzWBS2feB9PFdn2yfGY39pLQdYV21pGh0YDVll2JzkEbzkN+nvdOVQ7ziTCQPhecNWubX7M/CMe4bsI1QqOqArsPGv/hf6V524+4sFnFZ/iwWvalopc9zv80eU/rqCi0F7pnTcxOdt4Wmr3caKPt3VjFKeMooVU/4pdtiIRe1HS8d+rCCjnalUeE7mdkdaD4e8LODorP/rei4pxXA3EVHFOek0IXovCWMBaHLBh+10asPt0y35YrqPSWwFkdi9yFOlyvsbcaLpoZ5jr9mmzGWT4mua1s6LLjnnXqQ==
Received: from CH0PR07CA0027.namprd07.prod.outlook.com (2603:10b6:610:32::32)
 by CH4PR10MB8122.namprd10.prod.outlook.com (2603:10b6:610:246::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 08:48:46 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::73) by CH0PR07CA0027.outlook.office365.com
 (2603:10b6:610:32::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 08:48:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 08:48:44 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 02:48:41 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 02:48:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 02:48:40 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AC8meT32410438;
	Wed, 12 Nov 2025 02:48:40 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id CA9722A61; Wed, 12 Nov 2025 02:48:40 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202511120100
Date: Wed, 12 Nov 2025 02:48:40 -0600
Message-ID: <20251112084840.536298-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|CH4PR10MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf585b4-4b41-406f-b81d-08de21c849d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KPxY3oLJQnIXwQczbZDZ+sq+v3vhrfhVgSX2p4lI8Mu8Tm5XmVdh4grm5pOI?=
 =?us-ascii?Q?et5dVX20FSZKL9IQ27OrEfTR7Z/wQUBwMPxzZe4TBifoBMqC3k2JWkm+hrUS?=
 =?us-ascii?Q?XVJ5XvT7OljJKLZLJYmuSeY2jh+Ps5SfCfmLTsMOVeYIpKpDh9ef/YVsv1wx?=
 =?us-ascii?Q?mjMAYT8LgR43s099Bqshu+tSr5gIbNOfRnIM9lJdcUuk4TXh/M5wsmCVIdEP?=
 =?us-ascii?Q?7CyK0b6yhCN6Q13TFzh/N+ci88OeDcySDlcxguQmPL5jK3DgLovdVxU6XKKc?=
 =?us-ascii?Q?TM6iXxY9Lg4UUU6KWY30+BXtLdlglGHcnMFzbIYX5G+l6ugN/25vmfmQWokH?=
 =?us-ascii?Q?f+Prymm6PpGuafRmwvIbU1Oi7RHuLvG6aG9/N3u+kUOOmSNRQuM/tc2FedpV?=
 =?us-ascii?Q?u6TBe1sggbIKcoBXYn4/XQjRr/x3Kk9ChbucLxdfJrBIoI2aHYDUF7dXNMar?=
 =?us-ascii?Q?k6HhzxHmLwEugNhy67qdehPPXFdVMRisQRUm+XGri3KCWySsQOdnwEP5srA9?=
 =?us-ascii?Q?s1EwLTd9SMsnDpeoHFrn4Qx2J/HsZXa68HLzV5nv6c5paDQuq+FDjEy1HUY/?=
 =?us-ascii?Q?OH61s4l//Ezdo9cPLKcc9LYXJxg7iegQDIIiJ5LCaAIwmUjiodHMzpfHo3C2?=
 =?us-ascii?Q?fAuwMPjIfVhoqV9LUDwveq2EF8W//DSDCMEbq/eYF9mPy8Vllc/9x2uT4UyP?=
 =?us-ascii?Q?MAxgEx4YqX8uqp+RTkLrjSrayf7b6jCVlp9VgWWQKadONCh6sYaasIJLgSFV?=
 =?us-ascii?Q?LOgbySJyKea2v2no5KIVXRGGuACUD5NpHadYfJycsEMWcMBl5s+WPhrALrEp?=
 =?us-ascii?Q?ONTJ3gOyJC2fsFpV1dCAd3i9aQi98hZZ9sWsmOfa/a6DwGfgUDauWlLaNOfg?=
 =?us-ascii?Q?O2nh268f8mJF8tPTlNb1V3s1/k2fi1f/ZERZdXhlHhRJbtos/mRX1M3yhihM?=
 =?us-ascii?Q?EKwmOrxVBEInkf5PgusHieCDj7iSJqE5T3FfKT+Wx26/3/sSoXgPeTL0d0xL?=
 =?us-ascii?Q?guOqBadr++10w+YxIP5mpDCQm1iiZuxbrIJcImvrx+ZloxmdUnpc6FHxH8re?=
 =?us-ascii?Q?2s43NrjjWCxUtvSJHMM3GXOflDmMiCd+I/gfn0lD1GTmPMTdcInXdrObsC2v?=
 =?us-ascii?Q?Ady7hM/Yz/UsC/C6Wm6X9xrGmmjw6lSVSekOrTalFIlm9CnTe1jX6MInXdJ8?=
 =?us-ascii?Q?Q5ASVfQ9pfMxSCCb/1ktTLKK3oY9F6b/bywfy7m6ASklK6zrD12ESGeE2yo9?=
 =?us-ascii?Q?avTTKQfUpOh5J4mHqebw5j6T3XH7cvw6VYaAcdYVnlYVVa2tUgYFGZj8CIP7?=
 =?us-ascii?Q?2barIG8HLRUOUwY4ORribeHbYRb6RX2w1iNW1tKcL2nSvAhOyBpnspuhF7st?=
 =?us-ascii?Q?z7tnrdEKoQy6mUTL9ttrwrZII7Mbpc2pm5O25WqM1N1AU8f+TXXAlB+YcthD?=
 =?us-ascii?Q?qUWBCJEvyPbXwTFwv5eX5nIvf18Zd54eYPxi85ikoddmURcpCcvDKxfpVX04?=
 =?us-ascii?Q?VLEe0ypAyFUPGW0PwWy9eJ8u9Xncso6mVZzjWLmi73+NSzVZcWF52OvyDGQN?=
 =?us-ascii?Q?Gcaq++cXuTDvTjjAo/4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:48:44.7967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf585b4-4b41-406f-b81d-08de21c849d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8122
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 08:48:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19247

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index 5367c229..3fe40487 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -8,7 +8,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware.o=
rg/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D1118e32884721c=
0be33267bd7ae11130"
-SRCREV_tfa:am62lxx =3D "58bfb476c908d4c220d8f0bae88536f457452f06"
+SRCREV_tfa:am62lxx =3D "3d6736d95acc231eefd62db995e7ec719ccefd37"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-master"
=20
--=20
2.43.5


