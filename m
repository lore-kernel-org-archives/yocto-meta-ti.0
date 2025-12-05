Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4AAD2CE17
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 03:17:52 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62232.1764904663050434332
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 19:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=e+EfjOPg;
 spf=pass (domain: list.ti.com, ip: 40.107.208.4, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJyCV2PqAZeDpvK26+bI5NGDQlPtzO7FCBMeYMy3B9PmyxTAfYgI+cQqidL9TqKbym45vJqYrUGackrUIqX5mY0j2xXkLWTtPmbic+xzQxiI6QLPPio2OL0d03DCr1LMX/OSdPGmFrZT0pr3YA1paHdoZgh4/qNuOw3epnifjdXJ4TJUMpFrl5A1bMp7Lm1Gpg7O3mDKW7OCYrwJTDIc0Y0WqHF9FSvToDLheW7l0kXJ2+6R6ldxf4n9VdijZqWwDl0w1Mhl2LojYPhSTQ8P9jrXmT03T9r3BhVC5BeVQfUuAWfcDlV5OGdjp0ef8ls3rNj3tECixwBYBrssTyTnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5GdPeyLj0P3kTV0mgoca+jM9Z7CaCnEvazyAAfGQe8=;
 b=yA+w2dAX8Hrr7zpINYym5wv42+g/7yizkZ7PKXXvHFoGEV2/D5kZboGHUaYEJ7dHpZPAgKVE7VRgH61Ex9BNWSuTsFpMwD1jSOQsCx7Do1Oxw2rNPxAsRVs7g8P1MVw1lha6GAIFWD0wk2eGrrMWsMPnxzlbtmH4uVu2/VmeicjrGeOLAzFg3Yslxc6PRFpOLlugOBZbjgmO19SoXhjLvnr6i6nESA5xM4e+qx4yXasYJhYMOiJ9yvZlp++ucTeUTUWcktQtcXZ5wrv9pRv2ckzPHOQafalId36+Fwe12bTCW9SYe+jD5gxT6KKiEHp+YPgPaJ/t6liZ6igZdk5Tlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5GdPeyLj0P3kTV0mgoca+jM9Z7CaCnEvazyAAfGQe8=;
 b=e+EfjOPg7rKjpxeztJ9VcZnDEQZiu/iFme3nQZelrguP8cr/RqITq01snZuE4swFPPMqsyqAz0BY21qF37RHZXEbFjtzFgX/oLRmdlJr7ttcVQpxTfjVS7eofeyz7nsr6kyk1uIi/nb2pOGL2FuVt0PI3P2q1l1woggP64Y4AvGkM4FV+++y1RM9dpbwWkWgkAzkTK4MpiNqAJLxda/icWEFKc3nfw9fuWTOfy6N99N1CQYtFOdMwd+3jcUNJ2r3yLybnzmQGwcA5jUuCfeUsfjcQ89PJ0uuxL+vZDxHVcjJ3vlV4sO1cP9wJhydx1rqzj5yPd9oxxtBxHvwXepXZw==
Received: from MN2PR20CA0050.namprd20.prod.outlook.com (2603:10b6:208:235::19)
 by SN4PR10MB5654.namprd10.prod.outlook.com (2603:10b6:806:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 03:17:40 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::b4) by MN2PR20CA0050.outlook.office365.com
 (2603:10b6:208:235::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Fri, 5
 Dec 2025 03:17:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 03:17:38 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 21:17:33 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 21:17:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 21:17:33 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B53HXJ12616176;
	Thu, 4 Dec 2025 21:17:33 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 08C6A13F51E; Thu,  4 Dec 2025 21:17:33 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512041635
Date: Thu, 4 Dec 2025 21:17:32 -0600
Message-ID: <20251205031733.2399282-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251205030511.1803904-1-lcpdbld@list.ti.com>
References: <20251205030511.1803904-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|SN4PR10MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: 2051749b-575c-450b-ee52-08de33acd819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?seXbcBZSCN7dS4UI65+aA+Ps1LCh4BwAb96DE7fI3TxLhxs3K4mx/leda37G?=
 =?us-ascii?Q?4DAnaRE0Z5L0ps4Qt6Yao7uPOb2tOwIY0rpUjo0P/Bn5XqT2cbGXOwFNOCT+?=
 =?us-ascii?Q?YHGIWQ1WwLjxYhg6Bfni90TowhFVue3YEUGRpPaDxwzVd1SJHBDy6eyC2udR?=
 =?us-ascii?Q?o9Cd5twxwL3f8qUqxFZbRBgmPBatFnkDtQeg2vt5f6nlqxroVCubmEVLc3oJ?=
 =?us-ascii?Q?agepFsUZbtY9CISMPc5ZuAjkIS8iinhDlbd3qwHLzgNz8kn6/RbDkppolcHz?=
 =?us-ascii?Q?MLv7PCnv6eAKeOHo0XTVmjly7IRwGwfr1yCOejtah5VDDLEn6R2KhVnrfZHz?=
 =?us-ascii?Q?LnKIol3J/SDLVQj00XzDIo3FaG9Ci75Caj6TFrAM+J7GwamjRL5YuhEDVZ5X?=
 =?us-ascii?Q?aIms258piiKVVGU4Be1OYcI3eUdKRBZkeo7rU7Jm1YY+AFE2KP3RMQcdiEYd?=
 =?us-ascii?Q?k+cMHb5G4n5tc+11AHlUXmSWyRGh+ZSmrGTXwsOOoEk6M8UEGmEwfmqY63ul?=
 =?us-ascii?Q?DtP/VQDqdO3yMiQ+joIoUZY1KQUhZpnjprc0F+xvVz2qmQMXAxkxo3+Cg+Uu?=
 =?us-ascii?Q?2/0bATE1ghwxkWpC7/LRxLjUyYxrNGsPg0wA9yXcaP2J9qLJ97epEXov3JA3?=
 =?us-ascii?Q?N/Ikz1m4x1tGvM3HEqMW902gECwhMzHo8giYYWWuJBS3Zozr+NOlwNDgdT84?=
 =?us-ascii?Q?vsyiZbAUzNVa+D2aIBKn9vaOHETTvDwIzlPniZgntXgYiivG4ZfhHnT+H0Hu?=
 =?us-ascii?Q?e5R/R7DgHtwl9zpwjC4dHfPc1Mx2oVEduRWmjir6KZtXBUJFdVYPpWnfs9cT?=
 =?us-ascii?Q?T8YCpaE3g+Q9sMlAwJhJRrPVTEflfWjjJV0MT+jpAp/pfb9b58W8Maxhytyr?=
 =?us-ascii?Q?4LXS7W3TzceAk1S96vpoOx0VXpIaV3zQe4IkcON2tLWO0TUxbHGdoCzHwQSA?=
 =?us-ascii?Q?uzWxzDMmS/LdmZ2vA06E97zjQedHlkjQTTplLdXu8oVHWtcxRrlVjrfhP0Yy?=
 =?us-ascii?Q?qRT8CmhqNkFCluJmYzXeVLtJ1XIjTa6t3MnDwcz6YYJW9EpQxtf70x9qzywA?=
 =?us-ascii?Q?fEOcCpf6pS2ZfcO3/vDBxeXqvg2orQL86/8HbTvjNmaibn6o0WNFTPnMaUFx?=
 =?us-ascii?Q?4BOQykhu1l8Gmw4XtXkxa8sNqJ8BpVjmWFxVmdN83i1ZlOXDcc3adiqbige+?=
 =?us-ascii?Q?EAUJu56HGrvYPcKVQY9aKK/sfL8wAhoTDyjSpcceKCzY0vVBGp5KDi0VsJw6?=
 =?us-ascii?Q?hVr155+1E1AI2GgdPYQchybjy1Vm39kOCZ4G5EZbgblr8hJ/1RQTS5/vR6sY?=
 =?us-ascii?Q?xN4CidCleGrzkfVLyyu2KXd2qYEwDx4NBxhk55pJZ2vHiRabg8v2rNsU3/xw?=
 =?us-ascii?Q?iHCKzkqnC6PleUw2Tdos67UfqJ5TC4Cse7xJgq5DpMYeQqB3fhXErc0gohQx?=
 =?us-ascii?Q?hpGUbVosHglOx9rJaDUm84bZh7r5OVICAF2QsM+FzVnOGJpZktorsuuA1IiS?=
 =?us-ascii?Q?egv2ygfSHD0RgiJTTdeLfszXqvRPO+WH/AVpM6Zd1v9ErKIOv/d8cj/dz21o?=
 =?us-ascii?Q?WeZagqPNPU/Wjd2q+QM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 03:17:38.5052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2051749b-575c-450b-ee52-08de33acd819
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5654
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Dec 2025 03:17:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19333

meta-ti / na / 20251205030511.1803904-1-lcpdbld

PRC Results: PASS

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
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202512041635
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 4 Dec 2025 21:05:11 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 51974c6759b99838f2d1c6b25cd441fc5=
9491061

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202512011246
- Commit SHA: ee5c64043811d1469c11ea14e760d5124dc46eb7

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




