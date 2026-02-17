Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B93E909D1
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 16:08:18 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15551.1771344490953466648
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 08:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=NmkISIj1;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.4, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krZOfstrHgQhxtR6TgLaH9+nZH5KJcf6qDkgwbTR0lha5GIlWD5r4GA4X8WuEV/bWWQHjQkVhjwv5eWQ1+8C1CCNfQFdYME/Fin8Ljb14GBvppRNqPb7tXH5SANlKjxip2MuEOq2gqbByTlUSoWXzrxjQcIy4vCUX4Wrckv869VENmc/4rRf2hJJf9KcqF/f3rk2xWUIu23b/HHP/xAYvucATHXsWoRjPUYKnHwdHWG2rDKa52M36VStNwwYa1W1r/N6uvvg6Wie48efqM/uXHiErYBJHYsQV4LDc/TX0ownDHXqTdfAuKnBBHNuapsqGJ6VEiu/olW8Dg6YrDt4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWW5ppyvgv/UcLYdj4/AIlO5XY8JUlqPShoIQR3zeIE=;
 b=DquF+9S8HJqflzE/ZoRknAIedRU/7vR36IVdTvIkUKUK/rf/fJPyco/a+d8IyvurF64goubfUQJxVPFwJE8ZTr28VSeWZ2RnVWlTo5eEbyhPiae4rUqF3eZAuNRmlUsxSBaW6kA4pIj7E9ObgSvjB8LXvlmHNg4apqKLH5AnMPi4xvDDxL1IVHO6ETn3USgVs6wq0L4bC3czJX4rrz3IUgXwlqNxTVfqTZxxS2FNCuvz6km3VYCzh88rolHzQuP2F7DsDJQuX/9Cr4+yJL9xp6LicOyCSRUNJR6b/2ExZrWwJhg5ryDfwAGl6q057Bt6tJ28h5Elv/GyEb37FYT37Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWW5ppyvgv/UcLYdj4/AIlO5XY8JUlqPShoIQR3zeIE=;
 b=NmkISIj1nMZjyvNRrEPL9SCqNHB10xt4A+oYcSVFDjgpoQ7kgTqmtc+cdnq148aMS/RFFz2q5pJF8HF+Swyf4ukU2cBata0slL6zMGOKB0N+/TUg+iaBX8m1589dBEsmfhBKQIMJn4EIv3sF4ZqipRkGceNXmItUMcdNovqUwNU=
Received: from IA1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::11)
 by PH5PR10MB997759.namprd10.prod.outlook.com (2603:10b6:510:39e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:08:08 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::9f) by IA1P220CA0022.outlook.office365.com
 (2603:10b6:208:464::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 16:08:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 16:08:07 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:08:06 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:08:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 10:08:06 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HG863h3125856;
	Tue, 17 Feb 2026 10:08:06 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vsNcM-00000003IMl-1dSj;
	Tue, 17 Feb 2026 10:08:06 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-core-initramfs: Change assignment of IMAGE_BOOT_FILES
Date: Tue, 17 Feb 2026 10:08:06 -0600
Message-ID: <20260217160806.785575-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|PH5PR10MB997759:EE_
X-MS-Office365-Filtering-Correlation-Id: da8c4820-0128-4707-910e-08de6e3ebd91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?32lwOh63pdvyLC9dattkJTjGoqsx74gB3e6S3RJaAOlxErjfAfY6IsJaSA9X?=
 =?us-ascii?Q?d1hhx6/8V805BAw8k4mwdMWDbqlgLxJYCxXLv03+NIBWrnMejuOcwfgmo70F?=
 =?us-ascii?Q?deB27dnsU9W53Pj1lzRbp0UYeIw3cAWBvjpROxxoQujLnY691+EWzlYnsGN5?=
 =?us-ascii?Q?s0LkRD73MWHnqVjnh8T7AMM6prAQXZ8BjnMf4Kw1TwdPc8syjMWOW/vr0Vy1?=
 =?us-ascii?Q?y27V/c26RBXjmTwq4nATckGR/LqrjQf87t8AJLe6ifmimY5WZuInFZZW6DDz?=
 =?us-ascii?Q?13O4C7Z023/vgKRGoeei1841Fha9/Zcum6YE7Mz7wOpzk10GCdcf1GoPv/Eq?=
 =?us-ascii?Q?HZvYpISK6BOFL24qbC211DjT5YaqyS1g2dJULzoKnqxvHpPW4dIyQ3vrKAa1?=
 =?us-ascii?Q?q6XY7YyIjNTGNBwl7wkX85HzSOkMSvtLdMteyEfX/15xUjv87fI2wZn1fNdg?=
 =?us-ascii?Q?CDFC0RIcX32YXcRw3DQxHIYFAQg0yH4eja7a7QojmQ1LNKcQc8Xxryrf1uG/?=
 =?us-ascii?Q?qQh6ouvCJ25BCyxuOhNYjv0ZpQkGyo7aTSCYa971C8yDGt0+OjYuQju0H5M/?=
 =?us-ascii?Q?3b/ilaOiVBYtNG+PVIo7lqbW4Ug/kskazLK7HtcvP+c2y+djG7GtKoAr4/II?=
 =?us-ascii?Q?grsYJtNv0q6ACHIjqGW9HXWJx6Gt1GUz/gtIZqNfVZvvgMItXtDY5k5fVKzw?=
 =?us-ascii?Q?v2x6BKQbazttjMXfsKhLXnVHJR+jLi3xVAG5ppgdtQCF37JYaPaXOpIioVYv?=
 =?us-ascii?Q?GUfWIgsqcb65r/om8BKhYAR5rGHijQ+bWkDnP9R0pMOjq/xQNdX6/sP9ES9j?=
 =?us-ascii?Q?CdB90jxnsag/lMZjk/wew6KRmwRFfUQfPDoVbm2VuzGrYIVXkpAFFAHdsnIw?=
 =?us-ascii?Q?WXr35HgTVdpz43YBUDJI4dzYorUYHFCoKipP6//927C0Y91PMFQ1oQ/8G7IJ?=
 =?us-ascii?Q?vv85qSO9zdY8B2N2ID4KHnm6Lkbw+8MiCn7RHwR4r7+eqMwPpjoa54jMLeKE?=
 =?us-ascii?Q?94AZ1i0CklB25HOZjZ3XFvwMLD9AQ2ZK/P+3l8XyiiC9EQtTnZiCuynej06C?=
 =?us-ascii?Q?AbXZqFk/CNgsWtveoTi3yLOzSQbz4itrZ4H6GRbzNm8uBlFwIa8WRZoIo/mo?=
 =?us-ascii?Q?WofP/pkA8wjx1hMNAP6A3m+1VG0DFkrMD0fJkOZ29s0Sj8E9cMQzL1/Ckt6L?=
 =?us-ascii?Q?msQEm9N0drFT43fmNikk/sWHZf7yalbDyZYInE8p0vQ6UNlO8uWuZFPCVawB?=
 =?us-ascii?Q?uqhIoWfSzIZj26t6V2hSI9N0j9zRA0DwR0aOXD0OF+48kdK1K9GGTho3mi3e?=
 =?us-ascii?Q?TRGXKF1lbY1XNT7zF19wi4NPMjWxtvRktucxLeOCXrgp6SQzdK1DcFsdDl35?=
 =?us-ascii?Q?9raogEC6vHXosdk+IBZ3LMSB/4odLifoyxfnTSFQhqcweUAsi24Ha2FE9Kwd?=
 =?us-ascii?Q?eofuejctFZF359Wv0A8g9lm8HwGciDBqKO4Ev3+6QsToRVyQh7jcT6k2fZ2p?=
 =?us-ascii?Q?J6KdoWGhzfAfiz4oUEe9jEQC4EpGdx4N1RVc0xolcD87CLutUy+mjgwvn/o9?=
 =?us-ascii?Q?vb0VuZjTUqRK6omOTu4rOXnwmNh2xL6rCxaw6SKDF8O0sfnKLEExf1AgJaeH?=
 =?us-ascii?Q?vE+4QbB8RAU2w6ziBa9ozd5T1YmVN7L31Ulh4so7rhfq+4+ecTqQJAhBAKW/?=
 =?us-ascii?Q?wErcIA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7l+reDYginOwQsE2cAO+/Ve+Cy2cEWTKqgK4rve504fSPnGfx2W6e3d5cBf53KY30Vv8Qk/S8ZhNh5qCTO0ccGhf00se1m79EbSnaQsiKS7SHtAI5iJvXbRYsJZjD6g/oU0b5XUOkVJPrYyYZSz6ZKpFCEaeiZhfoA6I2Qr8pTw8j4Xp+KTrWq2YnRatPDohv/3slZY3NpRVy5J/SNLmDiXZASk3zYV7sVEVHtWUCjZX3Z3ces3E7fjG8ILBp1+wpuZ6it2A1xGlZ6Ax+1cHbWuwbQTNTDb9P5mFDjiZfjqwm1Iiwlu2DJALMiFnvDup52721aoEVIFiJOyuaeD6WrZ7juRn5vMdqnqzIZC9R2a8euKzPpu1hLBLWI/1DPIpLxLiIavJKuj5MhDQ9dwN0grPIKwdSUi5JddO+VLZiW1Ry+eS83t/kOy7UKB86+jP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:08:07.9480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da8c4820-0128-4707-910e-08de6e3ebd91
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997759
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 16:08:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19523

The +=3D setting was overriding the weak ?=3D assignment of IMAGE_BOOT_FILE=
S
in k3.inc.  This resulted in nothing going into the boot partition of the
wic image.  Change to :append to force this to occur after all other
settings of IMAGE_BOOT_FILES in the cof files have processed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-=
ti-bsp/conf/machine/include/ti-core-initramfs.inc
index 9d3cc612..475234a1 100644
--- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
@@ -20,4 +20,4 @@ do_image_wic[depends] +=3D "${@ '${TI_CORE_INITRAMFS_IMAG=
E}:do_image_complete' if
=20
 TI_WKS_INITRAMFS ?=3D "${@ ',initrd=3D${TI_CORE_INITRAMFS_IMAGE_FILE}' if =
d.getVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
=20
-IMAGE_BOOT_FILES +=3D "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('=
TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
+IMAGE_BOOT_FILES:append =3D " ${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.g=
etVar('TI_CORE_INITRAMFS_ENABLED') =3D=3D "1" else ''}"
--=20
2.43.0


