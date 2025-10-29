Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D72CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 06:05:15 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.39])
 by mx.groups.io with SMTP id smtpd.web01.1513.1761717906124898590
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 23:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=YKrUO2T6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.39, mailfrom: v-singh1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xl6dW6gWRU1x8Y1SZWF99FGeDByr+izeCqp3SgpLOV7xBxs2DgLJpX9VQ7qXaAv3BfiG3HmDBmiM2x7qj53FiGeFZgJCDaHVVMcy/MyzPzL0C6AMjBVaY+zwAh1VoQBgP6oY+mh74CWSlhfft6+jqUM/EmwhQiz7gKRWWbviMG5M6GBFRX6g2bOT2H+kcPMQpbN5v/2ojdMUZezwv/Ee8YcEYrRe6IOWseyvIUtHWQNlfIPn3N3FrWwGpG6gfOYtfjvVmlz6kFNT47SbtqP0im7Tl+1eda8jE6YKeQjzfrJNxuCN6IUfaefd+76MuT3/xvdei035bfh/02q2IpMIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBfYC0jYohDVTcMVD1AaicOSer+swI04dXPBz0D3TFM=;
 b=UtVhhKXKX9wvTBfelqVSqyg+TE4qI4Oo5Y3MZaYT94jHnNuR1xKe3uvN2/FzustXzSWGn7ivpiQOx4EQZYc5vtqd7q2bIF6q1IhUGo9kGJ9oDgWntmeI0K5PZTFbaBTK3VLAQc4xBAg7zc+19jvR1AcVS+pKZ7OeM97tT1ZpXUcqbw1NSCkXrhUQIFidaBqcmRvIk7qw3cOoCawpq8KB9Vris+aXtkN+eGOZtb/EXlsBXBa6qXnwooF2yeNBQ5MARng0Z7FZF3Pg5VBKi6TyovpuHr6FA6D4rqW/QpD/SgW/PKBNXiD6wNaeBmInVVwJt82ErDZfevA4be2x11A5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBfYC0jYohDVTcMVD1AaicOSer+swI04dXPBz0D3TFM=;
 b=YKrUO2T6DorIXyZZ6IYl/kSnUuir8CnGX/0fUMLLIV+E9MBL1cwer5Pifwlaf4lvrTtgn+9UueHSyZiEfW9FwfhQ3E/DzQXSit6E86GJmH13di9JtMAE0lzVqbdORXH2K0jXJ+v71aXcOSds/oAxpam3iXPn6DtOeM5iR3k3GME=
Received: from MN2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:208:1a0::22)
 by DM4PR10MB6885.namprd10.prod.outlook.com (2603:10b6:8:103::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Wed, 29 Oct
 2025 06:05:03 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:1a0:cafe::5) by MN2PR07CA0012.outlook.office365.com
 (2603:10b6:208:1a0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Wed,
 29 Oct 2025 06:05:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 06:05:01 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 01:04:59 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 01:04:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 01:04:59 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T64vm03519622;
	Wed, 29 Oct 2025 01:04:57 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [meta-ti][master][PATCH v4] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 11:34:56 +0530
Message-ID: <20251029060456.857646-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|DM4PR10MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 49da2e4a-bc5c-4a24-7b0d-08de16b11931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|34020700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FPmFRJWn1MusC2lM8aKIdL+lOjbRBvEYWc177zqr4Ke5iJqomIDXYP9gWIxb?=
 =?us-ascii?Q?/thgjOl+qmJ371scRXXpiRs90N2n9VX3+smrXbnRFowEiZJQrY9lhk6duhzA?=
 =?us-ascii?Q?KcNPjCHS87595ZRsOOQ67LrOYeHa9OSBDNccoOgoqivCiLbM4VxBGNkB5Kjv?=
 =?us-ascii?Q?e6/eTNvkqlzUOQSu3Hdt9NGVrfMyabdX/2jqSsLq+QKJLsqnjXYrN+QhgvFU?=
 =?us-ascii?Q?IYh9KLkj9TH/EtrmWptSvUlvXDMoj7pIE5y010dR25PpmOU7tKFYdcPgt/Yi?=
 =?us-ascii?Q?oVPiaE1wTanvUa0k6vfxRg8on7lqi0/km32586SXamOQWp8Gqi+iUn6YRAOx?=
 =?us-ascii?Q?UVy0k7k6gl+RokkMa3DNREvB6RIIKQzVHhFL2v5GFoTQ3NgVdUHx+7IZhFAP?=
 =?us-ascii?Q?6+saDGWIktZ38WbPw1gF0y1TedXtpQDfomf1wkRUhBidvI+5v6q7k7fDoD8d?=
 =?us-ascii?Q?5HSkf7ogCnlTpBed6g1Ty6omFK7euMFigBgtvPppp/ZaiN1g7ZRCo04BLBYX?=
 =?us-ascii?Q?o4Oc9nT6Tua7sMHmsQK0w7dq7dLSyq6pJV8jJpwYDX8VRD/dkijoGlWm4wBj?=
 =?us-ascii?Q?xGUIGNzjN/x1HIqUzBYIebwdBU0qKZW9q/OnSJ0nfsJYRD7nB9/7hNBLWxCH?=
 =?us-ascii?Q?cV5b0hj94EvlF2L0NAcXySJP51toPnTvpk0p6f86QMSst8knFpSdW+Q9aW11?=
 =?us-ascii?Q?v5LLXQ7FAe6jS2WQI+hqEB5jHGoTi3mi+G8OFTAaYrmBscT1vzOzR1U6Vf3s?=
 =?us-ascii?Q?Ib68a/29y5z6GNO3sj/YPpvG1sZ6U8e8HAyvlGPDP+DN8uhQxTXMEc5z7hY1?=
 =?us-ascii?Q?V+u7/6RsankFEk8XG6jFpiSgiXIxZzFc+QmbyDEyN1GGutbmQFO5FyJF4BUx?=
 =?us-ascii?Q?NmRrRLjUcSn4E5AuNGzycIRqdFE+5WEgelUhxWYdoXdMf92uR7m1K4Zw9Dvo?=
 =?us-ascii?Q?JlKANpHW6PUs6euulbgFWvvzXb9tpuKNwvvM7DmpI8a0Y7drnvQNw5EeA5qb?=
 =?us-ascii?Q?BZp4Ykxg1y7om10hK91yqsDdhs0tg69r01xwMO5z4aPp8B30L+3YLQfL+Pk+?=
 =?us-ascii?Q?l5wvLHjgbno8IpzSDlNIRVPZ+FbD2SWzmNT5jGcTDER7nP82T0TQUQHsMN+f?=
 =?us-ascii?Q?GDtM9pR20/wOyOIk1MudN/UUEczW3+IqdPIDgCiVUF8N/Bb3N7cVX/8E95Ev?=
 =?us-ascii?Q?bG0RR5KVxysoIdu0ZplWnsKj7dR6XSCiJv8u8YXdDg+KHzJ9ZT+2Sg2nHqHk?=
 =?us-ascii?Q?ssJvkjsrK8VKkoSw3Lu8l8GESTc1l3yI7fIz4vtzzNDUeJerkUVVh3hwa4kB?=
 =?us-ascii?Q?vDUvWOFROpOi4qlMUZzEM9URsSzDHwXHw0269XxJnsfTmXnGyRGUzUfX520a?=
 =?us-ascii?Q?JjxYzhq/ytXvGJtbH0VK9JSPNt/1mMwTCuolqEsbcfyAkM3kj0PA+i4/xPKh?=
 =?us-ascii?Q?NUQwNlhonaMnvWX7LmnHiFl6BpxD1s2tlSJcLQmv0nNt/tSq55sHSXUsrA03?=
 =?us-ascii?Q?Ez6S/nW2K9YjuqKfjWJuFYIBPV5Zhdr17ZqPtaQC1ipFJ639lmBoWQBPGI5J?=
 =?us-ascii?Q?5dwBtoqav71B4BGInJ8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(34020700016)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 06:05:01.9766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49da2e4a-bc5c-4a24-7b0d-08de16b11931
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6885
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 06:05:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19202

From: Vishnu Singh <v-singh1@ti.com>

Replace MIT license with TI-TFL to align with TI release policy
and product requirements. Legal approval: SRAS00013045
Update scarthgap srcrev and disable 2dfft example from lib build.

License-Update: Replace MIT to TI-TFL license

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
       v1->v2:
              - Update commit message with license-update
       v2->v3:
              - Add branch name in patch subject
       v3->v4:
              - Update SRCREV (license updated in README)=20

 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bs=
p/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
index 165ce8fb..2299435f 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -1,14 +1,14 @@
 SUMMARY =3D "RPMsg DMA shared library"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D744e63d2bb8c6151dcdd97f49aa02c5=
3"
+LICENSE =3D "TI-TFL"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D91dc4ee6d125d0aaba4e5bd2fcc50ed=
3"
=20
-SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dht=
tps;branch=3Dmain"
-SRCREV =3D "609fd72f458ba56f80d06810509ef88d010d2c03"
+SRC_URI =3D "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=3Dht=
tps;branch=3Dscarthgap"
+SRCREV =3D "153951932925a72346b76d98b2774952c48a82fc"
=20
 inherit cmake
=20
 DEPENDS =3D "ti-rpmsg-char"
=20
-EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_EXAMPLE=3DOFF"
+EXTRA_OECMAKE +=3D "-DBUILD_LIB=3DON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=3DOFF -=
DBUILD_2DFFT_OFFLOAD_EXAMPLE=3DOFF"
=20
 COMPATIBLE_MACHINE =3D "^(k3)$"
--=20
2.50.1


