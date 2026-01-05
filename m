Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E40C2A07A
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 09:13:19 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60524.1767604395498174595
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 01:13:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=qoPlhz/l;
 spf=pass (domain: list.ti.com, ip: 40.93.196.57, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSJ852T51HjmQ0oSGKESDB/LXmqv67+2+7mIsY47Pv0vJRi5H6JeDWrQugnO2ZlzNN2iN9t8kYspPBJAgBjXRlW6Q/RdIFnP+mO8OjFWnxS8aG4v+eYbni33J0y5PT3PUeUVv7tUqN9ZR4MVPShjzf3Q8ANKpsv03rUY18y4dxL3stDvPe7bghRydBKQVCKX+r0bjig9kjHKHbdh5G6rr450H1VoHJLKc+VtVRQa80U/+oGRnpSwHitwgFmYM06fGFbOlg3udsPCDH9jryqYBtaPCRZggdXP5/ZfmXg3KyUani1N2RKBbHHELe0N0tBR0tpVYd2feEBBfXy8oTXpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiNWIXogtXMZ3Rl/wMIEKYGyLnkIVE3HVZY0CV6W1hc=;
 b=cOVc7jM2P+im+gvxyFR9B3y+5NhM9qGQFweDfh4R8KNWHd7g2fg7MoNkkoKtnWFQsUWgjh+7GZMXLRbqOyt/dvXmqRzYbOFxZJLHwJo+JiqnhgCZrsCZDIURpRJ+QCq8+W7p02IVUVJ7Qip8O5F/OaI4+OHGyT9iXbrEyTxKcI79UT8cysDz5x303LYFpWMur5hGVKv5oXfC1l7JRJkIcseS5aB++v2J5Ut3BceeDeZeKS9S5/Ut9uiHr030+h7WDp3WiZ5tYwMZcBhUFfy9SHJBjKUO+EPgw4Frm3KXUZS0AbBE/b9OnuJIrfhkNMkVzSGX6IZXxpi40nwt/YAFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiNWIXogtXMZ3Rl/wMIEKYGyLnkIVE3HVZY0CV6W1hc=;
 b=qoPlhz/ljzr+MHXt1rmkSCxz3gotwBa3oBcb+NShVcILRWOr0fZnfBdXcKHDvLtL88c+456tUKJRC+cs1fJoAWAo1ZSQ2R21vEHlT8xDw4uZvZ2m23JhTpfF29p5uh51B0IrMWSW/BZybgnFgb+R18L+NflGN6hmmLhU8W+c16JADSFIKfwqq6uBV02a7T9goHZ5+t/UQLkGw1uJxYRipTTOC1NU8JDUCip7JFzYq9WV1QyOmYJptc7HnCigmHoccv+Zv6F27V8sQ8JLWcX0c/Jun3ohj5rvX8hKO0doKmHS33IA5hVV6fGagWOVgONQjEqxs0D99nKq7zwaTTYRbw==
Received: from SA0PR11CA0154.namprd11.prod.outlook.com (2603:10b6:806:1bb::9)
 by PH7PR10MB7781.namprd10.prod.outlook.com (2603:10b6:510:304::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:13:13 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::26) by SA0PR11CA0154.outlook.office365.com
 (2603:10b6:806:1bb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 09:13:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 09:13:12 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 03:13:10 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 03:13:10 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 03:13:10 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6059DAX31768665;
	Mon, 5 Jan 2026 03:13:10 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 2FF162A6A; Mon,  5 Jan 2026 03:13:10 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202601050100
Date: Mon, 5 Jan 2026 03:13:10 -0600
Message-ID: <20260105091310.1068862-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|PH7PR10MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: b5291f05-6b60-4a22-cd3e-08de4c3aa6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w7ksbRmWZOt+BemDdkPU/WKuvh/Cw/CXio9xgVZNhjbnzy/02tSgUNwJpQrX?=
 =?us-ascii?Q?JJwDyHE4H5JI1kueMd41lurv50vGuBIRNj6TI/Ubsp/v6txkSi1apBbXiX4j?=
 =?us-ascii?Q?Sm8I2ktEZzH6nMvgXhVS1tqdGw5GmqOsLgozkTS9C5QzTRJbVTUbLvEas4qj?=
 =?us-ascii?Q?EjfloUejSGeHdmL23QZDFHexIvKMSJwSpabAbXzp5kPt7kvhUQ6gCZWY8oT3?=
 =?us-ascii?Q?npnNS8pIA0x9BvCXUP/WEWiMN3/v00M0vpS/on9KPHvyF5CS6TYEAVPUMP+R?=
 =?us-ascii?Q?5IY/oyGfnrM1T6IH74oJGsbDhe/hC0wg/aQEL6A6NnJ5DMPSdBnPqzQfMv6U?=
 =?us-ascii?Q?pHzglLK0HQSvkvqQl41SuOm+M3+Pn/aih5hOyQeO5KChQWDkahWTFPr2ms4t?=
 =?us-ascii?Q?PViKwMfUJAN4KUoO+FAgtOx0WFM03SB1rX7BA1bYf/ZERWVnknuJlkKsqE3E?=
 =?us-ascii?Q?iTL+PNr3G9vHDqN+s2zIxnS/11xMVmAniRgFrZLQISH+XIx8txjlpiyPnTts?=
 =?us-ascii?Q?/5PDF/pF/oCp/R7yoA1mlfzuCPeQSCfrkvkj9qenclHaORl2glKEJ8Jiz3N6?=
 =?us-ascii?Q?0UzHXFTWsJovc0GO1mdIei0ZLq3O0H6HvzY0Nqw21xpHELEAy88vlzqrNAS6?=
 =?us-ascii?Q?NeaCvpETHNpJQ9q1TAwobflocQhcUpWHxoq0sc1LALqJey+koNs369HIZ1Gd?=
 =?us-ascii?Q?PWGlvWQAJ0nZWybDl0KJvWj3tXF30YJS2SRtLloYFM37axnFvMW+JdKa26/U?=
 =?us-ascii?Q?yahQl5y6XyhvcQGbtmGlzBoKmfaMU9LN2gvJ3bsSmySA0mDPL/lREwg/QQnr?=
 =?us-ascii?Q?e5nugWQgAguO4HgbGK+qqeLLPswkx5ydttRnZez+qmtCTWyPtjZZrGXaoMn7?=
 =?us-ascii?Q?msaJHmBxXmnNra5WA5v1Mw1GnpPRAckABCxzbyIckwJ5syOgEckbjtIsMV1y?=
 =?us-ascii?Q?L5n9e2MRR55po4e3BzNZXweeXGjYQM7BuqHA9VrAi5y9VTQ2K2oB+zzIQII1?=
 =?us-ascii?Q?ZAsiQEWUgwmIYmChCEbI0kYNQFpTsV7DW4kAt8CyK0KFshqVEuZYaktYPeSv?=
 =?us-ascii?Q?Bb7/KXWnYtz5uTKHUGInhn/hV/2UEEJeqKd9z6LwO2kQtlc6HRavs1ibZYW4?=
 =?us-ascii?Q?bhtZECdMoCGYvUcO6kXbtN8tWxU5WMFdovufe5OIs5DvZKQNswX/TgnDZoN2?=
 =?us-ascii?Q?CHz5JvVpl2ciXhGjU0Z+/b7k418Nzibb+Lgqsj4XOidFbDV4hHlT+iYomG/7?=
 =?us-ascii?Q?7VRdeD7OLSJgIxkpeMBl4B3x9Ye7xW4FdVZEcMyYgbfK32DVCnoEZVxEdtYs?=
 =?us-ascii?Q?jx02g7FGbq9sLgomUV8cST6h8jfl71ikynjyl/cY8pxGKB+e6+riMArehcom?=
 =?us-ascii?Q?LXB5E9d1ZlifwIr44EPxLoiKcQZr8BRShMJqac2R1QUn+Iqme4UoRLp/uEDk?=
 =?us-ascii?Q?giuUmnQhTmxA9O+QqUwmTZZqRd94xvfYut3hcXG9kOpCMlhuhPAFfJ7rhnT2?=
 =?us-ascii?Q?7Iu5wHaEhNAiWlYCeVQ1pNvr+/RuvVdmWElSI660445U34yt1HAM6iEtgY96?=
 =?us-ascii?Q?o9Tyy8dBpuUO8ZPVgLM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 09:13:12.3216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5291f05-6b60-4a22-cd3e-08de4c3aa6d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7781
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jan 2026 09:13:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19392

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Dafb6e41006ca88067397873e015a21adaf31fd06..df1fe238230433b=
a3e5b731356156e145aa90917
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linu=
x-kernel/log/?qt=3Drange&q=3D2a440e3d83789c8220b722e077255a89d826e48a..1379=
a8eb9786e78509f67ff8eac658bde5ddc66d
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dee0a0f44964f12d6668a14b4b0b3594ce2ab8871..15b58b1=
dcd0e0a79d83740b81da1a1367f6f3f68

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 926f27d7..0abf62cd 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,4 +6,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2025.01"
=20
-SRCREV_uboot =3D "afb6e41006ca88067397873e015a21adaf31fd06"
+SRCREV_uboot =3D "df1fe238230433ba3e5b731356156e145aa90917"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b=
/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 6155e0b4..7d0763dd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 =3D "ti-linux-6.12.y"
 BRANCH =3D "${BRANCH_ARM64}"
=20
 BRANCH_ARM32 =3D "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 =3D "2a440e3d83789c8220b722e077255a89d826e48a"
+SRCREV_ARM32 =3D "1379a8eb9786e78509f67ff8eac658bde5ddc66d"
 PV_ARM32 =3D "6.12.57+git"
=20
 BRANCH:ti33x =3D "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 9eb3780e..b5089a05 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.12.y"
=20
-SRCREV ?=3D "ee0a0f44964f12d6668a14b4b0b3594ce2ab8871"
+SRCREV ?=3D "15b58b1dcd0e0a79d83740b81da1a1367f6f3f68"
 PV =3D "6.12.57+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


