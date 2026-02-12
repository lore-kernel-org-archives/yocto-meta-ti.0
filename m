Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF13EB2719
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 02:25:51 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35830.1770863145801277150
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 18:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=aJ8O04RV;
 spf=pass (domain: list.ti.com, ip: 52.101.62.21, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BBAMrG/9Hk831F0q2dixityPxfUGxai1AFP19/1yJuCJnZzKzVsnMGzfvPxw4q3RzitmuQq8DDxa4ue/c5JhQl+hbBkBqF+aLCugmimIPUwJu7+Gneo2ty683wBQjsr3XsK4TJlEoHRPx+hJ/40ShW3+6vnp7e5WcnXm7iJSOKtIDY2nvQ1YL/CLL7PAv8SO0ZJoa5zNq7bs/tvFe0DqJ01DEBWj4v2ai+ZK1MEsCkx+Vt+FKWo1C7bgZaXkb5F1JRduWKfCGlEzakrrNS5jWXO8y2dj2b3Y313SV0iqbxeqR8p1yqCC+N0DFgiiTLnC+CSIq6HGcYZJyOI2HPFvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/y18LdAWZR05aXDNiKeqngOz7OeIh25W+Gd1rZRYCc=;
 b=RAJR8p0Req59YGH8thZ2Kjni3ii4/YjwApXndmvlWAzOdfTUWGyDVfSpNUn9ONAODTNaeECuzaKOZbz3LzpQ0YeWe2Vb4OJP5kDvJzFqwx3s3nIfK/iT7uTL8B+EzuIBYroh5G2TcCYPJbjWbFJt1KoctZCljhuzMJ+C6/4Eyo9Lvz6jMZO8Fmmio7MEOeKKUnDFF7z1oE/AlcujAH2TU2GOquD5oxtp7BebjQ5h+6Y4JDUJEGsc0/p91vLS27/RstdhKsxtZi87jc5uMxgdk7eAHGTYxg5pzHqnkSq1IZjH42AOwIiis0dAS2yU69xW7WjqnOKyaFuDuj8Z4RZZgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/y18LdAWZR05aXDNiKeqngOz7OeIh25W+Gd1rZRYCc=;
 b=aJ8O04RVsG55s3OjoGA96xEKf75GQWIncN32HID0n7rWXceEMmgtg84fTtSXU8Qpu4w+foVbD9LnDKAsjv4SrBE2aklYh7jvYT6QLJAzQ2A9NaazBYON1AhLb6MMafFfny+5TmsjP3tcMUPI4d6V8v8boe1UNCGIT194WAMEKvXSTlkBjBGJCvxjzIM1IDCBw5HwWceBK2FmRLStkOm0leN6KjWbNA4DGpWNRBeWuUG68Pmbg4RRfBsMbI/rMgepsc3NZmqlpyarZyvWbEZB0mIx+DT2imwkyZMUv9uS1Uz6l5l2DIx5E+yJTbMIzC/+fzM4UIiOgBlTPVr78OMV8w==
Received: from BN9PR03CA0595.namprd03.prod.outlook.com (2603:10b6:408:10d::30)
 by SA1PR10MB7697.namprd10.prod.outlook.com (2603:10b6:806:38f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Thu, 12 Feb
 2026 02:25:43 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::a2) by BN9PR03CA0595.outlook.office365.com
 (2603:10b6:408:10d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 02:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 02:25:41 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 20:25:40 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 20:25:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 20:25:40 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61C2PeO42267655;
	Wed, 11 Feb 2026 20:25:40 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3DB349ACF4; Wed, 11 Feb 2026 20:25:40 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602111800
Date: Wed, 11 Feb 2026 20:25:40 -0600
Message-ID: <20260212022540.1742008-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260212022355.2572913-1-lcpdbld@list.ti.com>
References: <20260212022355.2572913-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SA1PR10MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: e2bcf10b-ac2f-4b27-f3ca-08de69de04eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Vkoqbgiu71PUj2gtMRIVVEb0I+Tunv2yenIidO1z0GJTXQZpSzv6u+cCtB5U?=
 =?us-ascii?Q?Ype/e+EsMgMi52/ak+3lGkSP9I1axV+FllSAVcZfI6H36KS5evU115S8GrOS?=
 =?us-ascii?Q?z8OEsr2iJoyRnJdGOgIGhzAtlsGtCKql5LUxeaeU3SgUWFILzqBT5ic7De6O?=
 =?us-ascii?Q?1lNjmzbyPv/7Gz0lcEp5AQoSf2EUVONyJ8LBWeh2H3qd7O7559tsNg+Sb8BL?=
 =?us-ascii?Q?UcH2TX4vajuZU3V4z4RykLZi/bnW2dhfl3qZsUWPSaQCUyHPCKT5n3FgHA2N?=
 =?us-ascii?Q?bQw8YBRGSjodGX4LRUmFHxa8BVHtn0G2cl1D9JbIdrzKRu03rEU0RIG3x5Rs?=
 =?us-ascii?Q?NjLcoRbRxA+5C5lWrLG+m4d2XT8qmGMr8wkp3WpjVqVdto9hV7EZhuQocGwG?=
 =?us-ascii?Q?Ik7HpF9/RMs27zmFlbyYZuL86rPazeJhDOejCmkYO61lWPQbKq2l4aIavQjy?=
 =?us-ascii?Q?Wu7ulfiJBRMLsKT+bScwqUSaNN+tKd6sh0HS0zn1l3aVDP5rj/tMGfX1q6Ba?=
 =?us-ascii?Q?7hG5I+W9qJOlVnJ+sycIqYRkO7TEtYtVID6H6SxaALlycfKyUmb9IkeuqA9A?=
 =?us-ascii?Q?kDh+gHzBJZtfMJC5bityg6dw0o7WG8aO8nJVlNxNikQUjAYh2NCcVvFpts04?=
 =?us-ascii?Q?bk4Qg+yq9UOsKZwtPCyRcU5ZLVmIlLCP5taRIIzHzGZCYUWarBHYhxNt2UTa?=
 =?us-ascii?Q?GPBpZE6lskxTjbUUod+zcyXDBaNz0ZCwS4JExUialGuKgImf/QlCWa8XV4i2?=
 =?us-ascii?Q?pnKbJZ+xBQ9LMQugYPlJ7H3z2b7S4mAkxq4fklScaAOgV5GiM93pwavRfsGj?=
 =?us-ascii?Q?wN8+59YXXXRpnPJR4NEtQqyWqRDIS1s8jfQrPhzfbNSPSnom0QsK/rDZUE8k?=
 =?us-ascii?Q?8Tqs3YVczQ/mW9DAbsEJcMYFwKHDdRgTjjXrJih2gd+sT3GHvRgtS8G7p4Yw?=
 =?us-ascii?Q?89MQmRRdm2mYc6h070lHaOXrtlweZytCNSiVStBW4dU60MRvGffKTEzGYARF?=
 =?us-ascii?Q?DWL/aRxVt6ByUPasuj62NVXbds/KFr2Oi86ntLcqdmAMCGzR+erTwc07ryvX?=
 =?us-ascii?Q?qHCOZ4MqiHO78+3FVVrCftVH3g9cMCfV16OLgFa2skKGlarFNzzHrPooQ7FM?=
 =?us-ascii?Q?/oimYfrLEBPuqX9UVTz1gyCxKho5jLkbtIKNs6+bfBoGJNFPI3MX/d8KCpOk?=
 =?us-ascii?Q?KhKEvu+FZDY5eNrjURsbgEa3L8O3wDN+6JeV90O1FUySH2VXEFDWFiRPiMPw?=
 =?us-ascii?Q?rI7gFqaV72k6yKfskX+oTjg9Oir2JprWoxGb8XQ1HKe3F4X0EsW6E7Z0GZiw?=
 =?us-ascii?Q?VRKKbmVrzn30g+R+kmR5HFqvj6rGJHVpXb1f1ztS8hmheM9py0PdIFH+Jpk7?=
 =?us-ascii?Q?UouO0dmfO/RJHf8niOND0mq6EkjaykGUvO7qZmG2HHwq/ZPSC8HtyUM6J1oI?=
 =?us-ascii?Q?wkL8I8OlNvaJeqGQMtUScpOt16SOR7vYzWbGkmRnGKj2TkYK0j0CCuu7kP++?=
 =?us-ascii?Q?mGkzHQF9+CBVnP/BsGgB8Hb/qOyEnrbYXTWgwqsNIJq7sQ0tNGqvHRfLRiof?=
 =?us-ascii?Q?fLbMc/n14ITRYdPun3HUyPWfJKtn+SSXsRe4L+odf93s6BZin+FG53tRdEto?=
 =?us-ascii?Q?Xcf9AwmMt5s1yLoE2T7Sa+DgB6L0SXPOQWUQng+M3xxjNpGB7MbcHydGOA/U?=
 =?us-ascii?Q?XCT0kQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jx+fnvQDf1GH1UHiAFk2Z1Rtjxgtl0BsCNflf8TIcRMPIw5Uk+LC7l3+eUa1mq8hk+rGwVw/VYjgFEOKhQxlNMUQMvsRzEWRcQD+AE1DIuFZ16PsD7x0cGszIU+lUDZVIzwmZ33QyfnvAK1dFh/bZ9SS+w3LbOD4odF3zsi78rN9CCc2Bp+PUeCm8UKdPt5mZmnRHKfW2kVhTXpg1doyOXEzsRliHwYYUT+onDTYVgj9SdzH//PJe2eZK2qQOphcOJLI7nYay/GJmAQP7QEYdQTHUGyp8Dw2wX1FBt4hHtxbRa6XSye6CGbSZETfSneuAihksU4D9qfaKWUOwxGGaS1OMZFzfLdH1CBoM+0GBwJYQoyzb8YUhIQuffo9RKv1gQs85nlhShJCvZHlmYxMHkhxD+tq9yV4/HvgzpWrouxOEjUfZHXNQh1pZWy0GRv2
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 02:25:41.8214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bcf10b-ac2f-4b27-f3ca-08de69de04eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7697
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 02:25:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19497

meta-ti / na / 20260212022355.2572913-1-lcpdbld

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-lts=
prep.202602111800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 11 Feb 2026 20:23:55 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9c7037bb78814f93b4d45f41f93d4d4aa=
3ef0305

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602111800
- Commit SHA: a6bf8a8f6ecbd6c7f8305690a9a0dbd0f67b576c

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.2026=
02111800
    error: patch failed: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.in=
c:15
    error: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc: patch does =
not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2=
026.01.bb:4
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb: pat=
ch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_=
6.18.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb: patch=
 does not apply
    Applying: CI/CD Auto-Merger: cicd.master-ltsprep.202602111800
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master-ltsprep.20260211180=
0




