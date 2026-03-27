Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DBA10AB839
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 00:49:28 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63359.1774572567325083742
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 17:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=FGbFq+zy;
 spf=pass (domain: list.ti.com, ip: 40.107.200.9, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ38YAu8PaMyNSx/ttaSoY63LAlKZPS3lTk4rIHDxic8WcvpBTsrH78nnySHtUDBZU+kp++74n+bsAksFeL9dJnALSFHUc1zSz1fBNiIsDm7rJ8a0XsSU0WiIvbq2tvF9qUGPZjQ0wxrXjUv+CaRnTogyRVYc2svDEIrEPcRnqhKunnQE+XlLvpVyJxFQn8kk+IHqmCrNi65nC4n27rf1IwsxOyteMJ4PPTi+MHsbQclUzHtWkfbK6W8ODg0jLm7Oz9QX0Yb/bCp2zXohMkSlko0s+hsjaa2VqelBsnUs39MlqT1CS81m8Mm1Z1lVrwT/o3VEFQROK2TViOLgcJigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17NG6MP6wjkOOer8bqQzeu0GiCJBcCdBdYaKNmIgmEk=;
 b=DGCJ0J//SJcHchBpgUqRHkA82mneppeRdfQaonK37PaDBPeFNuzTaUDk4EPjZG8J4y/odauc8hz9sey31iv4/gemhydLvNgBP6JFURsZ1UIDIaCyCuoKblTDWZxNm8mdeADaa46grwpksgx0hGLZkrTXxG2XVFHeA1/qD5g0uWRxHPhqD9+3jZR9Bs1KixypP0nHHjXCA0BdckFb3Y5SjfZkxxq8NWBu3aoMbfc+PDqgpC2wpP/dkJKgVby4IvDG6re218LUNzfgFWAMvkwo/y4UKoBGFTFJJQnfNsjSzQV/Oqw40m7RdJIHxL8Cr+YZQn7/NXQfYyhGpXvrrk1gsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17NG6MP6wjkOOer8bqQzeu0GiCJBcCdBdYaKNmIgmEk=;
 b=FGbFq+zyy4E5/AuQl6y9oyofeu9B0521VW+VFOISRpeGhkt8kxqMek2bfOvAO0CK6rqoqvI84yCc0ec6/P0otc0ZbEtcQFZrMlTO+875ge+Um2lS4Ayj0Va4sSyhVW/2lpfy2eEzDsccQ9l1OIpZOamqiNW7K51ojsRmcCn2lgA+G2zVxBu+gmN2wBSl12jSthNq/0FD/XYrXb9ARBvTVjMqbvCPRKJxaIlp8eajzNW/EL9OcNhFRXAlu2/oqZtU5JGebzM9KZWCJtxKA2D7G0AOItyEBgnSYL35zxrfsnj6AxHloVsE4cHgg76nhoOva2xjfBF9ilORO3uO+xkw7Q==
Received: from BL1PR13CA0295.namprd13.prod.outlook.com (2603:10b6:208:2bc::30)
 by SJ2PR10MB7558.namprd10.prod.outlook.com (2603:10b6:a03:549::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Fri, 27 Mar
 2026 00:49:12 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::35) by BL1PR13CA0295.outlook.office365.com
 (2603:10b6:208:2bc::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Fri,
 27 Mar 2026 00:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 00:49:10 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 19:49:05 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 19:49:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 19:49:05 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R0n5Ji3056861;
	Thu, 26 Mar 2026 19:49:05 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 1D31F2A61; Thu, 26 Mar 2026 19:49:05 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603261656
Date: Thu, 26 Mar 2026 19:49:05 -0500
Message-ID: <20260327004905.3892540-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|SJ2PR10MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: be760c5f-402e-4fbc-134b-08de8b9aa883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	tsmKn3lqgXbvI3LAuTrxa4vBdpvwngXNKnh24GxO0Vuj5pCAgdaB30Qhgr+pO6ZL7aL/qzaSi5kib9+5GLBEf0olhvS8hNQC1EbhPoAPhcj5Odw8N0T/XBMU4mN9aiCyxH+7+7iAji1pKQZW/zASKhOC93MODTl/LoefVPoDu6FnvLqwb9w8e5sqtqrjwcF/6Zzb4N8BGX4ocSK9yor1aUdXxAxSKDaNmrq8OtHazG+FAFmgiArtfq2iJ9WUiOlDnvTv/chgFs+W7KdhbosFdPdiIwoauMrsZFJWkWe9F+8tqGR6xmMa63lPDsmx6HQD4BZe7sHGwBu8F6sUrp6YuvJhON6/1GLlp7M+bIPN0ix470kFPgMZ1+5cl/uK3jTjds6GvusAGw8M9Jnwmiqxo+mYfq1UZnYBMuK4iBIUyGNKyAgq1uNoJOiF16lEZ+IRLR1+CUjo1KhQoAsKXobpNdVlZ8yicZPK/M5EfS6pR5sx3TYLzS5TOp3nqJzASeLmWVeMoLbThYfVkYL3wUiB3/wb+RAbG3WSJTIcbOyYRLag0Otv1Fp4GMVL1PdEshLEf9Z46tu4+jynOLN4QAcRBXVsdIGwROpPGxB+MRns3FwFSYr0pKmxf1U7hlSnyv9eXAUHBrylh8U1qlL2oUIEiyJBzJ4BtMZ9yA6ieGWTGH9XmmC4t0Hs/7YQx5nvtyoqyBHYygQQSak/InYthEkTa5I8+C/l8YgOeAeP6RIk8kEtzjP1aBbQlMGP/6CJDJ98SrqpGm/IO2OYLy9rXPGh4A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UDsCQVYkd1tMY2SoRcdp8y3nFR6zS8sPVUdyqQHbHoqWirFk4s3zMl67EK4qNjJaCZ5EgHdMn4kGjG2c+BXyygewbTsH+eDXsy64XyspykRXYprshVAngIx/4tMtJijGt4shtu/ZpmmgjiYJpp/FKrtuJKB7VhX2TAX2kpkKTffKGG/lugYwLmULegaC53tzgFRgpuh2zqpZrEkW4HGAL3hj04Nh5u5r6J2eBJwLA62Yhm2cNlX2QN+YFeaQI7bxEwDqAtWSMZ7gFF8mN2uC7O3VEQ7ujBoD/kxFEcl8qOf/mExIA5k8Xz4U/CIna5Ed405CGDLW5fBpYZ8ubm7vQsxKck/GVHJLQQUWgFBGn/l94NM0yi9jhJ6HHfKu2D1M07ocNawl/lWzlxvJ0c0JWZ+jvbSkdUNM7BtWDXw/AG1RpF+JFbuhtlcr5pZZqCYn
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 00:49:10.0358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be760c5f-402e-4fbc-134b-08de8b9aa883
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7558
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Mar 2026 00:49:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19830

Updated the value(s) for:
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Da46241db71e383bb6dda103ecad12b13e7af3c38..2549829cc194ffd=
9e38b755d2e10c7fc4cd971eb
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dc164e381f6bc1a72b527f0bf3a6b1fc9af06517f..c214492=
085504176b9c252a7175e4e60b4b442af

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 7ad50c78..6b2353d8 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "a46241db71e383bb6dda103ecad12b13e7af3c38"
+SRCREV_uboot =3D "2549829cc194ffd9e38b755d2e10c7fc4cd971eb"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 0db4c596..126af476 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "c164e381f6bc1a72b527f0bf3a6b1fc9af06517f"
+SRCREV ?=3D "c214492085504176b9c252a7175e4e60b4b442af"
 PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


