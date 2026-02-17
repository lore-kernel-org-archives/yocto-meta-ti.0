Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EB4E9A02F
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 18:03:58 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18588.1771351432076006050
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 10:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=H3FotBjZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.49, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWf3RalFOkejYwWxrWcAebZJ6I678ANN3rPDfyA3VmaPQ/J6BvhaVYXSltCl7glzWQu3EVNtB4DyMUU6HzzemtIap3IwrkRxvoHSGaA5NpDxGiAOkkWMALnhq1ReAqzRg02ynfPiRMtLA1KS/ksdBmJtNpjz4GvKyrRcDN422KzxLfVy5Q7DHHApiVjH3K3idngLjHACohoxXN+pd8DNR5sp1VrmZTHeg0y+jFYsbOihcNmSWZKtz1xMWjz8iJtgp08qLJN6aTEOfxvjhL+w8SbDzGHMYubhu1wdNOY7FcNB5ESoNW5aIN0rgSF5EWDuwqqhP6YCBwR7gIfIGbbebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bGbpscG4qCe2BKUBfaueuA87DXvpMIvOUIyA0wnw8k=;
 b=ZYVIQnxqlkJVKwOLjRf0pzu8B0brg2ejRhQ0XX1ej+Tn/TNHnWyCEy+GcWjgW+3Bsz067CO0UCEgPSQYjbsw0JXYgoZimfboEdSUZKcbgBrR69QNn4N68ErRfT7kGz9y0rDzbCoFLyMF0Qxhije0QNvM959F4ZpBkegohWH6FZhDsnZv0OUS3YKP8W5ub3bwbZvdP/eJgbDBgVDshhw3rtVKbJ6764RWJ9IDdr0wEaM0nuJcY2+xsP925cBF5ySs5/yoESTzrzJkU5Zyna/URPn8ssDBCJdnC+3wFoG62PzExvVMr6++fkVQLiOD0usdcbnUgAAxewh02omCErPo1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bGbpscG4qCe2BKUBfaueuA87DXvpMIvOUIyA0wnw8k=;
 b=H3FotBjZB4qGUg25ZSJlc5ZDSqFiEZOtkWOADnpfCYp/1rMlu9vnByOJhivJaHBT84XykokFeX1maZFhSZ2NbQfrs/qltt3b0pSEFPGbLSu+UY2S2rndJLm9zP73d69qqanOis170y2jxelPr//u4SYbUJrk/OZD9cdxkGE4Ic4=
Received: from CH2PR11CA0017.namprd11.prod.outlook.com (2603:10b6:610:54::27)
 by PH0PR10MB997666.namprd10.prod.outlook.com (2603:10b6:510:382::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 18:03:49 +0000
Received: from CH2PEPF000000A0.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::8c) by CH2PR11CA0017.outlook.office365.com
 (2603:10b6:610:54::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 18:03:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF000000A0.mail.protection.outlook.com (10.167.244.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 18:03:48 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:03:43 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:03:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 12:03:43 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HI3hmW3273142;
	Tue, 17 Feb 2026 12:03:43 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 1/3] libdce: Runtime depend on IPU firmware not the other way around
Date: Tue, 17 Feb 2026 12:03:37 -0600
Message-ID: <20260217180339.128793-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000000A0:EE_|PH0PR10MB997666:EE_
X-MS-Office365-Filtering-Correlation-Id: 444130ef-d09d-4d7e-5734-08de6e4ee627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rRR11Bw5PEUe0ot9XCs1/K6txDVqo4n5yiqowvqDF7uN51XKr1z7Fx5WbueM?=
 =?us-ascii?Q?pUE08QWeqegQgLZh2JXfYQI2CO7ri+7qeMFRcpqb1gPl64RancGNGPMx9XsZ?=
 =?us-ascii?Q?BTFiC8dcYbKPNG/admELbUmvMhgEfls/AQXvSOsFm2I4FcOXCRiezfDc4op6?=
 =?us-ascii?Q?WG4BzRlakeL6H1drdzKjCoKLTEGBRjKj+DvUZNyi44EpB3KAzUt69DlvFZr4?=
 =?us-ascii?Q?QByYD9TnY+cqBNZiuHoD88oNOtimi3JkV6GIAcNJFECxeSdHU+AN8IJzisFe?=
 =?us-ascii?Q?IxrvDuvZrwUYLP7fyuceqSe34RFRSagrIgXvA/azZxEugO/f151jOXRH97Rs?=
 =?us-ascii?Q?wuwh3h/FPkXtqI6YnDW7TGM5WvCQmgLAsApF5WDoBqWVhNFD+m/t3GeHtRf7?=
 =?us-ascii?Q?P2ZPQJDaF/kHvNQBF3gbCBrCFYcRdM977rnKzDG5AEHBjPmGBajiA5dqFJBh?=
 =?us-ascii?Q?ST5+FZ1ezOVg9KogdoFx3x8GRkRpoaSpvhfCauARaO4UJw9RKtSzdJgI2oJO?=
 =?us-ascii?Q?uA43SqDqG8eWc6ByXMKi+GqzllYAuy2Li6fZNl1Y7TqPcUTNkQ/H9rfbeBz5?=
 =?us-ascii?Q?QxK7dJjBLOboIpI1Bzswh6370Ex6I5iGdmhZ6HEKf8tN8hQYUbwCHmZEiYFQ?=
 =?us-ascii?Q?OSkjqyMGsta2kbE/KSG8xhQd1aQBsMLeln08gosyB7owl4JCKDpGZJ2VQJgh?=
 =?us-ascii?Q?bS1zHLowRfrodBzmI3RxqlDhkBtELbsPBLAzQAkb9l/yF6l+0OnPmrwQS6IA?=
 =?us-ascii?Q?8rlowUymFzsJnK5uMQHSE8uyqK0Ib19rJLZ/8OeAh4pG+ReUahCyjoJ/EL5Q?=
 =?us-ascii?Q?VixFhU55tlwqv3Y2tWPP+sQl500Mb9UDHdBIyR4e5vWUoj83teExQiKFDQdm?=
 =?us-ascii?Q?KeFyqb3sP13/zIuPQJeKV9e71TAsQkVknoxeznFSUB4FudFc/NiRVhaSsCnR?=
 =?us-ascii?Q?HP1PMTdVqcFMLncSXBJmnOz3UzalkZfNxCd6w84lXhaefWPSgj0MaiCa9ZO3?=
 =?us-ascii?Q?ePylMb4U9I5a6iM+Zvm8pbKBMceQDU1Y/lU6UdiT3nc4PS8NHXatAUzelnEt?=
 =?us-ascii?Q?yje+8cI4hBd0nS70MbhdFN2Jtoi+8rnpLiW96Zq8SmIgGq/TkT7uHI/6n/4S?=
 =?us-ascii?Q?+SoMSbLzaVownv5rRgPYtxwKRd8MI9/vl2UHvz4gE/lz0Ti5NW4MVHijUO7t?=
 =?us-ascii?Q?YJZvVrlbORH+1KGj7yW0FZtFZVrHzOyfZUkoIWtsNlVpeQPkuAiXzTlA4xjh?=
 =?us-ascii?Q?pnMsGEcFO2OzvLzqQOmMdiXfYUoGDj2ZZx0EzjDCq8T2x5JhDhDS7Zej4cCd?=
 =?us-ascii?Q?uQrZyaffmVM70ajAbVfgTCTKmMYwQsD6O5t6F4W6ERob2JRFyTXOT2loS8ov?=
 =?us-ascii?Q?o5ndDpVcpFubfSObXjkqCHwJ31ivQCuzvzPVwkUf8NPzY6lYtuT1CMkyEIOr?=
 =?us-ascii?Q?smHbQmRUypDw+yQysxZaV7LcMmMVnnDZ+AwqWogi7f85DwIyRvZNLTLa4vIs?=
 =?us-ascii?Q?pGwNX5lNjMMWu/g/fl1TB+jc3lcEkICKfNdXGnLqoqaMSrzQYMg86uI3FJiu?=
 =?us-ascii?Q?0we1PdbTE6Ffm4aqLNKmhnxR63rxKr/7IQk5dYe31uNZSKr/bLWGfLLjTfvV?=
 =?us-ascii?Q?WCT9DjbaiaJ8ZeEvR/G2JXUjADnEl3ADyZlqDOwBNvki/O9RjGcSrRngrNlb?=
 =?us-ascii?Q?2L0Ibg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+W9lUeWJ3h8fqbEPwrk6aiDNUI4LKlQVNGcYIcztHn3sRE7Q50Llrd6t2C393kj1zDF5KXu+S9MssmOAiFXVxzusJ9ZvABVVdCNzP6DRKYPN9DuxJ/kNZ5ScNJZ7KevYs7QTHxVVOZyGdXU/8OTKfIBygkJdIkRwwg4SZhPzMzFPu4no7oU7e6qMUrxEuY+NsL91bSi44tR8TKzu9MhKb2UJ1f+r7ILPUU/JyreIn2g6lqMAlHckiMfjsQo/nKz+tuefnjWZuC698ebyWgLdm1rDUK9GZcpJeky0VYb+dUfEvJSMjTrbWKcLJiW4nQxDb6o9TL0nEcOyvNnQSvFMt/BaMq05rjE8F7zQQ8PkHuVC/z9pRIIoSgMugxjm8irRHTJQo1uL0EjLnQcBJYgi29JQPHVI3pM4BOT8zF2dnoxS8mCNUWZFyfebUyGNGEjl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:03:48.0038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 444130ef-d09d-4d7e-5734-08de6e4ee627
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF000000A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997666
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 18:03:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19531

The DCE library depends on the firmware to function, the firmware has
no dependency on any one userspace library. Switch the runtime dependency
around here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb           | 2 --
 meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/meta-ti-=
extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index bca91df8..246255e3 100644
--- a/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -9,8 +9,6 @@ inherit features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "mmip"
=20
-RDEPENDS:${PN} =3D "libdce"
-
 SRC_URI =3D "git://git.ti.com/git/ivimm/ipumm.git;protocol=3Dhttps;branch=
=3Dmaster"
=20
 SRCREV =3D "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb =
b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
index 2ae44086..26b384e2 100644
--- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
+++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://libdce.h;beginline=3D1;endline=
=3D31;md5=3D0a398cf815b8b5f31
 inherit autotools pkgconfig
=20
 DEPENDS =3D "libdrm ti-ipc"
+RDEPENDS:${PN} =3D "ipumm-fw"
=20
 SRC_URI =3D "git://git.ti.com/git/omapzoom/libdce.git;protocol=3Dhttps;bra=
nch=3Dmaster"
=20
--=20
2.39.2


