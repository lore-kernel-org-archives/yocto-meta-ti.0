Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246E9E909D6
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 16:18:28 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15813.1771345102212602695
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 08:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=f/9WtyKl;
 spf=pass (domain: list.ti.com, ip: 52.101.52.41, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWwvb4lOHAzBBc1wvWG5oQGVUsiy4I3ZSUdEGAQSl3sr2y4KWqM1sOz36p0Mii+NEeHo5R4Skf8Ahd997BJmTlz3oG9zcvRfwwFQaDouwnPuWnDU1lCkoUwLrDYKAKNY3rL2HPzY6YBae44tNp8Lc9DDCWeVdScNjji2J58wWB0q9nova0x7Xk7cP8I0rm9a0GZqreBfA7Vuw3Za57RMrSpQtbQ8RBJe1ydCV23v0esRcPTmoyJiVo1mfxR+vZtgIHW6q4n6p6Mgd1p5tIlQNOhX4G8ZbH4fHgtbrlbTMXtGMea+mRsVB8akuguvllXqpxjgueEt0qcPFGRaUmK9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+D79vUruQM9iEvz449hWQydk04XzJz+mA0FIGBDth4=;
 b=Yo5JepIhF2JOw7ePhaviIfrXg6MUE5vawgGukvfNpYuOdwPsFFXXXYAeczmd+yTiwM1S5mImKRJx8jD/+hA1J6an4wqJJM9owHkoDQRGudVN8EZ6dAJgorbmRhsiS+PO5xICPIFgYyCHwLTrrEvIKCR4zR6K8DPpzyo+yPC3a5BmiitRz07SZz8UaLtzkEIGL8Q9m2CcylM7BHLG3FS/iF4gT9PWcvIltNQorftsq/7vm3qfhfvzAz8UaRNEUZ2Jvk8WJU/kZyYiwyUZM6aWKZWa7u8mNIfWyh79L3HG/o49PHsXmCM9bxxaw1EUQqtw+g10x7p6jY284T6ge4F9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+D79vUruQM9iEvz449hWQydk04XzJz+mA0FIGBDth4=;
 b=f/9WtyKliA6rhvT6y7et4jTHcPq+GXZpmfaSysv9X400MszPsJ14c9iZ+Osfd9nxEw57XPuGg/LHsr4SqcyN+fKH73QDl3j9/MuuQAXRkNt/qLmNW2d9BooFSb0FC6DYLAfJntgadZJCBtmYplnYmoVCf6qI1Tgd2U8opmivBdDREDqfxyaD2RaRyx59KUKyGfdKgljp9fD+ehY+wyldvrPvUmxaW9Kma5AxcaEPGy/PORdSjR0H/LpP2XgiH5PyIOQTcQY/din6yIGiBq5epo5MVoSC7+2FfT8Ralyq8isaeS5c1YsOe7s62zgNBdgC6LYAk+0sE8Vg0AfGkeJoRg==
Received: from SJ0PR05CA0052.namprd05.prod.outlook.com (2603:10b6:a03:33f::27)
 by SA1PR10MB6470.namprd10.prod.outlook.com (2603:10b6:806:29f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:18:16 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::29) by SJ0PR05CA0052.outlook.office365.com
 (2603:10b6:a03:33f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 16:18:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 16:18:14 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:17:54 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 10:17:53 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 10:17:53 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HGHrws986069;
	Tue, 17 Feb 2026 10:17:53 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C1CEB9ACF4; Tue, 17 Feb 2026 10:17:53 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Change assignment of IMAGE_BOOT_FILES
Date: Tue, 17 Feb 2026 10:17:53 -0600
Message-ID: <20260217161753.2582232-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260217160806.785575-1-reatmon@ti.com>
References: <20260217160806.785575-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|SA1PR10MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e175e1-1d08-4b8c-f73e-08de6e40270b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LjPls7J6SeCbapDrvhC+6QvSoj3MBMdjtA/XvSztmaWmGpmGt/caxdwOuwRa?=
 =?us-ascii?Q?gyz8ScGguM/Lj76GLimx9uIEWhG6RD9g4mCwHaqqTyMGccGQmmsb5q5MjhO/?=
 =?us-ascii?Q?QmbPN5Mfed8/6bDvFK5zwwoeNIJH0plvtDXlMiF4BvzpJCDo2BUD99WyRI1y?=
 =?us-ascii?Q?IpZOoYoWpGixyF3oet9qMAgA6+4pWjqOekXRvBqmBg6CfwU/yEmhJNHjjirb?=
 =?us-ascii?Q?2eWCq0sh8iBDMapSwIGoZz6MMgN/R/tUllBQJhpbv90dRmLRvmAO9eZj85wx?=
 =?us-ascii?Q?dgQZYBjjm1AJhHtRHgF04Rte9eUrowvdO2RW4RM6a/vsiBZdU4A0I9uClS58?=
 =?us-ascii?Q?92JSPwqhh/h3s5gJFWvmPub1R08btKXhJs54A3fJcVaGrmdbs0cw+hcATTIj?=
 =?us-ascii?Q?uP3XlqGLXPYfBV+CHqIAM8Lkbl6ExeOkCJcJ4JsO+iAVEsugmJCDgYAJ0H6K?=
 =?us-ascii?Q?Zc+nWklxBizvMQ6oL/TM+CkqFMSj7ybXhlJmpky1D0103fqaV6uT4fjblCjt?=
 =?us-ascii?Q?0MfyIkwGFMQbWmKjRCIk1y2yrW58PZYx8X6NHEL8MQlqPdBV9O9uvIWxowcS?=
 =?us-ascii?Q?SX4x74IB7sZkPusisB5tili3OEyYTUOZBGOkAZAbg2HHSDSV9F3eRJ4DVOpJ?=
 =?us-ascii?Q?EahJyGCQiATocLrh1GJPCUG5hYTSnKrW2E93Ze6A+bkRTpbHHFAhxOquEiBn?=
 =?us-ascii?Q?uCt7z1zzV7Qq4DMvd6HDSQiuOOW8nDriTOWyS/gIfTNdXv4lMC98GX0nu3R3?=
 =?us-ascii?Q?p8qHltezvr4t+ENMhPyHmImQPRJRc2QB2T9LpcBRiMD69Xupm3VV6suhADfi?=
 =?us-ascii?Q?yfvjywRtrCL+LT0Qkr6suIOYg5RYPuSyqX0FCQxJU3gJb2tJetEBYLSSBQeE?=
 =?us-ascii?Q?y46a5kJh47MOMD4A96oRSUio0lt3SEj6tkzuKFdkiIM07cw6U0Pw22QWdsyE?=
 =?us-ascii?Q?IYWIt//Ze9uf2uHqjkbdT7V+UPT3sraqNd9YkhsnrXy39eZhzPMcyIYC+J0y?=
 =?us-ascii?Q?eROTg/cSsKskKsA9gom6I8nal5UXz7HkJ5kvfCk8p0LPN/UQIJQMuOOujl1z?=
 =?us-ascii?Q?QLvVldBEl3H7oXtjuRmOZ10dPWjYvHqOjSXHVNAVa5ujInxlLUaeSB3SjaYf?=
 =?us-ascii?Q?JJieZjDFG6rLdhpJwYoRb/tmKxMa98C4qnrA2zi+ZiSxFVdwNRE1z7iyYGba?=
 =?us-ascii?Q?37qaeaOxgKEty+pN/9nAF6q+eCpIy362aqBCHWkAIDhKGSjReEBtw/4IqnAd?=
 =?us-ascii?Q?LwEazn1hdFml2IbPW1FEQT4EyBoLKX8EhRQ9OJ+vVtqEaQ4u4I851AeZESH7?=
 =?us-ascii?Q?FsWOQzSfYq58XJtEugXV1Rh4ZPuHRAy0ICRCx9vGIv9UVJKle+dpTDkw8XdU?=
 =?us-ascii?Q?rHVV1zDNkbtDNI4S52q5MODoQKniddhP8DjYHyTB/gfrC2gpsLHmvJE8s1K+?=
 =?us-ascii?Q?55oZz4OPQp+nWO5gOwvbQS2Wct9pa7XnSp6LbCcJGtjWMXl7R/Juh/wN7Y9X?=
 =?us-ascii?Q?KhAtWacA+c8yK3Y/4MSfe6Cy49wmH860qxwXw4TYtU4cUggnBrEorJJQT5sr?=
 =?us-ascii?Q?Q0DszeTYyN++GnxmpGgjhaY/l0cOx0gYmGG2oR5xEc/VE3WI9djzXDF0sXth?=
 =?us-ascii?Q?rZM5oLQMNo1FsXP8QMNj0N6SQlGoru/8o64ywd1djAeeinMEn1up13dhREIR?=
 =?us-ascii?Q?YI0ntg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WsK/iwxSs4N/kfuYOCI9xCmxVRj6a8ZA63o9Tb/az9H/AavR+fLNKS/+so56rn6oBCI98cduDaghl7FNuvUgkQF4dcXRlhzCbJ1Rm5F6+ETheWJM1bu0m5E7382HqizZG0foUdk6kukCnOG53TwLc/COQ3VB1U6qLjL5J2qlMUQUVtek5v72BRkKbiFnLAKCxgLZjXxj3LogqiRdkWZiSPuBczF8EXA0bsb6ZR6207+Hf9RzUFYe9w9IdGoTX5X914EPt68kBIRghm+PCkTnfjgmCaiMALZD1AKnQ1p0YzeaVsX78q3aZI/zrroX4P57jRq+zaAGL0ljxaCBSOHohpiZuD21xayrWFEOMBdc1FLosthXL6KBgZijhhZk8CN/hPBQc9pmBS9IqB6eDCN91sD7kpQ1bIuqsMrOiwzPurTUegl+h24MwpsvXEi51VE/
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:18:14.3956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e175e1-1d08-4b8c-f73e-08de6e40270b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6470
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 16:18:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19526

meta-ti / na / 20260217160806.785575-1-reatmon

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] ti-core-initramfs: Change assignme=
nt of IMAGE_BOOT_FILES
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Feb 2026 10:08:06 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: df5653e86fe87929a7e6c045a882b3cd2=
75d2444

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
- Commit SHA: 1c2398c320609f8f473a30f15de592549c461fbb

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




