Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C371BD46C1C
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 06:27:27 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5186.1769754441439486118
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 22:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=SjFlvlDC;
 spf=pass (domain: list.ti.com, ip: 52.101.43.24, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYTh4VryN5bJqofxNXxloHpF+KC1qvXOWuOnGqn03sFQj9ql1Pc9B2ioNrv1JYNEhbl2pxyuanpqJLNIHuOV19Lr02roYcLm7xJ0iTOOQmULoH0ZOj+HxCregZaoKxxq/qqsprYIpBhtXGB57/3Bno9StXSGQhmaylcTILQIEO+PTN5GRDbFuaqH94cmKtmEYau60v8/x8eKypkyujM/e/DZMz4QVTExW7v2BrbBxLYcqtbhn+Y2cIeNk0dAf6wzslFrGDLr14wFkWRU1U14vx4qUMHiFrweIpAU4AdWZlvuHJJOzTa7aSXwif8hT5ueO5l6JwSK0y/jkiJhlg7SzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whG4OJh+aVNB/bl7Gt/K5gSBT4phJxIsRhMIK3wTGC8=;
 b=xubJfWtYQCz2Y8Hz3CXvieXxRLG9PJbeZAY8Sqpevkz2cFmly6tqXXBTFY+0TNP7XdHDT7/0/3YMuI4oBTShk4yte3sHIWPMhNNEAxKm/VyZOckP+f8U3dz9hN7UDqWLScYKMN5AJnhpy4lgTnoheuyRq1GDLcM7QHJsuZSdNTwI615AmTqEUkUTLyijmpyGyvLMwmH/EUaIzf3ZYHGFJ36r/YP1WyZFcB4pfITLGWVM+qAtbQ6AGxXQYYXk/GUOIjcD3dp4Vz5HuImD+vNlcOxqgK48Uvg7QeuDQYgTs4fRDmBqlrrGAz4dG7qSH5enMMpWaO2WQN4eNEgMxxJp+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whG4OJh+aVNB/bl7Gt/K5gSBT4phJxIsRhMIK3wTGC8=;
 b=SjFlvlDCMNw/dFWMEVpzlp7FM/C7ITVu7VgiELl9SM/+OCMX3+yYPZxr9PrIqNh8V9oGWSrXzhF8Iqn/xk1U+80G+K7v7Hbkv/W2b4VCxG30g6FZTXuuXxw/dE7T7Y6ZsbSJgv2S+Y+DYEFL4KIKMbJ9lGUcHzTATccSCTLymKlC33VvsAh0DbnM4Tmv00hV6qxQbISxdcxA8bwyUO5OrE2s9R+0NJMvobTwIKBFVEtAinlQ3+GwiizWQJaUBKxjhRLtqmA8O59ql9CAWi3tSbBD3PeCyjNWx/x6e7uMFfGRgETWvoJcF5j3TqS56JCwE8LLWR7N9sKcpiE2Jk8v3g==
Received: from PH8P221CA0061.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::17)
 by SA1PR10MB997787.namprd10.prod.outlook.com (2603:10b6:806:4c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 06:27:18 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:349:cafe::2e) by PH8P221CA0061.outlook.office365.com
 (2603:10b6:510:349::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 06:27:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Fri, 30 Jan 2026 06:27:16 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 00:27:12 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 00:27:12 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 00:27:12 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U6RCL42408273;
	Fri, 30 Jan 2026 00:27:12 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 780EC2A68; Fri, 30 Jan 2026 00:27:12 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202601292132
Date: Fri, 30 Jan 2026 00:27:12 -0600
Message-ID: <20260130062712.1460938-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|SA1PR10MB997787:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d1e8178-0e7d-4426-b332-08de5fc89d39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I1bgwX3VAYAqOHDz5O5SorAKYQM+SiDIgazUNx31VmpovQ2omw5eoLf3W44Z?=
 =?us-ascii?Q?wRIVAiey5W9ef9ntcXrZM+O8eVSv6dZkq53GtSoz5cs9jyfR7Mtd+zRc+zQq?=
 =?us-ascii?Q?uoAPq/SRvIyWHpmOLcYsi3X58jDry9G8pZp04nOVmoH3/cg+yhO4Qsv/7sgL?=
 =?us-ascii?Q?VWrehRi1377rPgZnYGTlapawwMhxUgB1MaGc+qGMQyX4lXF5OCUGlsla5NSA?=
 =?us-ascii?Q?Kk0wv+BllfC7YeoGsk2fnKmGgzlW70AQEwV8kXlsslodOyYCJVCSf3hTHVRH?=
 =?us-ascii?Q?6W+Fh6NnViB6RQLIz+cW4QJPIAPHKKtcgjmqL/Z9L6FBoDcPCPXAsqkUpWWX?=
 =?us-ascii?Q?PNZfR3zoi5ialZMCQ/6gVP1725XOW8tNfyNqZwgWzhgYnNd03pJw2GQINeNA?=
 =?us-ascii?Q?6uzHtI4nq+RYqr1kVzH6VBbzQklbPUwuNVMLOyAd5tu7f5nLVfDLzjz8ZKnr?=
 =?us-ascii?Q?sX870ByG5RsiTC15xPpkVdYHJvXvGXGsJFQ0CC56bHGF6sp719qvU1FyHCPN?=
 =?us-ascii?Q?8P/Orngo9ihyWTO4puTWlciqNQJ81q94ry6Kqtcjo/suFkgMxMZAL12e8P8x?=
 =?us-ascii?Q?ZWXShilHFhTBMTJSz5gMbKOqdJ8flZlTFm9KIXtpLITjaFjUU07NLXCFX45G?=
 =?us-ascii?Q?Blumd1QtDmtG0ZtA1mX/u9ruYEe5Ywrdo0cp8f9xFaI60Xd/vbv1EQ7uq72C?=
 =?us-ascii?Q?pJeqD4kdD952Gp4EalLbE5GJfZkGWvzyPWVRSaAkuVXt1jO2tFvk+0vqXAKt?=
 =?us-ascii?Q?ea7DJ9M70hnHF6wEGibpWGPX9BO5SPlgL9nnuKdRnTeXl5daYOrIf/5xc+eW?=
 =?us-ascii?Q?XWwrhKg2o5U73EMTwORYAjuiT823Nfo0+ahnodZQg61qsVzjYRxDklSjTdnY?=
 =?us-ascii?Q?5+En1vcjjZEcM0RIE4vG92Sbu4iWG8A+HJ3LZ7kthlZPWZVPbDAY1bQGPCIL?=
 =?us-ascii?Q?keqxhAYBZrIvhJVIWjVcOp4gURZV+Sht12zOeZ8JSVlAFj3nhaCSJgAYJy3t?=
 =?us-ascii?Q?QgNQ5b1Py8Cq9MMHIyDUiFXn+1A8ag6Yjc6BF0ZIu2uadliZiJpFNyF240G8?=
 =?us-ascii?Q?MuV7uE7Oy11SlagC1Y/Nqhf4PPyehbEY2U/a+6Bif8dLq1Cp6U0cB93A/EV0?=
 =?us-ascii?Q?WsU+I0YOTAjWPZ/5c/EunQoVUSk2mDZaaF7Tz3AuZjTtmzSfKfGszitYngXN?=
 =?us-ascii?Q?ud48MIJmjtwnMOa18vmeLz/bHkQ5nwnynUNwsv/jdQBDHT8X8FLSuPleMRY/?=
 =?us-ascii?Q?9PuPamem1oo7JRI25eu+9b0egcM26xTlFRWIsxgwL36VQvOa/g1J407lv0BH?=
 =?us-ascii?Q?i//xGb1VhayGHvkfNEVdkjeZ3gvpbl2vW02JAx9lwS+A4nDPBlp4occ5ASFR?=
 =?us-ascii?Q?6AMMRkyg8Ly/vP1ibBPhDeEMS0EzU7q/7qEbKTHS0wRl3wL/p4eAfd2QvxJi?=
 =?us-ascii?Q?EK0Y3zO1D9CpYOKCnQ59eO6ZSsY4DgtcGvngByDfZnleNN3W2eqxZgzx1wyH?=
 =?us-ascii?Q?XDX0msCu6oWeVEsFL60CvfloAYQVK+sohEsafR+kQ1GPddua5lGHDduAi5rz?=
 =?us-ascii?Q?6Fta226JmQ76rLKvzzqNxzDEwbcnCTAqknA/pYhnBkiEmu4IRSpe+0tSq4zR?=
 =?us-ascii?Q?ikF9LD1/FJfXMBkWDgF6Ob4oQMCavKX0tOUgkV3ElsMMraXqUu095+0gDE0b?=
 =?us-ascii?Q?PxbJsg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	YCZxghHxey7IcnRiSCn1IRcd/lMxrPx8m1evnX5tuwvCZP+Bc8tk/2xA/aDKsX0JJ1cVeB5RK1ghYX1vBoBaCAUKc2Pt1rmlA8YJ2j0a76ClLML1rUWEDs95Gb+84YdqL/YD+KbrxDlH1sax3/hKWPSnKTN/fKOSZGoc+UfThw9/UNDUPkSnLI9WE4LZPNPiIL/LSQEyEW8x/AqHWL+397rFr3to7kB2E/x68QPdhQ4xEMYpoUxX75O1o0gru94ueKYmUurhcT8bcoiZ3WjBDXuYhYvyBvipIwatg1CpwVGBqTXL0s/srETTtIiQGUgpcAZIXR3jGAdqB11ZECFtUGsbUkUWEcIqmHIYrLOQdmTktAY8Ggczl2cPAeVI3O93DRNUHk0w8CUtfVmxUWm6eXIKuOA0PtrzBraAkNTu0V5JouL+7wWeLErfkktjfF1Z
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 06:27:16.8295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1e8178-0e7d-4426-b332-08de5fc89d39
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997787
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 30 Jan 2026 06:27:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19447

Updated the value(s) for:
  u-boot-ti-staging_2026.01: SRCREV_uboot

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/lo=
g/?qt=3Drange&q=3Dc5e6d2ab7eba68cbfb600cdc131c0c375ced2ec9..127a42c7257a6ff=
bbd1575ed1cbaa8f5408a44b3

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/=
meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 41adcb2b..296a5238 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,6 +4,6 @@ PR =3D "r0"
=20
 BRANCH =3D "ti-u-boot-2026.01"
=20
-SRCREV_uboot =3D "c5e6d2ab7eba68cbfb600cdc131c0c375ced2ec9"
+SRCREV_uboot =3D "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
=20
 DEFAULT_PREFERENCE =3D "-1"
--=20
2.43.5


