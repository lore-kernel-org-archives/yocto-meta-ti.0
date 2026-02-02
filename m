Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F8CE7FDCC
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 20:03:31 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62315.1770062601731748139
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 12:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Lyy9kDwg;
 spf=pass (domain: list.ti.com, ip: 52.101.61.70, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttr2fpt/vGzcN/H/i4CYSXEmr2+M2hF+j9TbvqwtLerylLkO/D6Jsssx5J8uLJvpeRz7sWyQghmXttlJuCdO43GoXm6MywQYkI5HBD9iv8eRI43jrZuAX7abblR74IlPCZE3OU+wJamM1YBCJlb7aMCWt7uhTF0aU7bAXuMbHOc9LZ75A5Z4FrMx2aBssVeHquXRc6UJrxsytK/LlhZbFUtqQkjEo6KZ/ZWdOmaPT5yIVH0KgmxAGIEg6OA5FudOx+IvRvBX33XTvjeL7BdOxRo6O9l1pIEzI35/xAkaM/MZX6DBos6Tueb5in/B4yNf6VQyx7drfpRxIe/6yMgp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kfmgiQW8IZFVrZH3OmrYAVeTjE8FPDA/fwPiEy8twM=;
 b=qEYVmydoi8uYZtikFEnMgEG5bwMR5xko/zxe1JqauyBNyAtkFH1hlS1dupnDeCG9AsN/03BuGOuZf1Yblzg+Y2xnjN5ql+Kirnuahp+nkyVYLaSv5bIKpILygqDaQV/R+zuc03hgJFCQU64+raAKIpwij8TqtJhvYxGI+rKNwXsYuQeoFtYl0+1UM8OByfuA3yg0lYtNEB4F9LDRsd0HYt9Eegja8Mwk9ALfabeX6S7jGXAqwusEsPS82zjonDm7J8sgmimO5XgVLUZ0qBCcsAu6R5V/eeRTJa6yPbIP7XvR7k6SLtejUUYilRlJV+k2ysGWDE40EMrXLzSulQRHyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kfmgiQW8IZFVrZH3OmrYAVeTjE8FPDA/fwPiEy8twM=;
 b=Lyy9kDwgOa6LIb4gMZLABvTXvXdwQEPxIHZXAUx+2BCnBPUp8bkF1/p7xHtYJtt5veniBJwHDcCCh4ljq0OkEsE4GmXeUHtQS1Dcpph2yW5jH71CoNaEACLo6mP5HNT8YA96kqt570Ov9q2c97rUwShpzRFBorKgRgC3kWMKquWQq2piPMM9bNH8SLE8Kj08Rp+QwqskEPg0JMta2zJm2WvjivLvL2TU9xYgKy2wzU1ZDXztiXbJMP3SKLSBktIPTrmV70258sZn+la+ssv5MZ9VD11Wec0ETO9Lq6wTJSmxnPVGrZxD8OoEd/O3S5GFaKO18f72b34zIoPSAf2Z3w==
Received: from DS0PR17CA0010.namprd17.prod.outlook.com (2603:10b6:8:191::26)
 by PH7PR10MB6131.namprd10.prod.outlook.com (2603:10b6:510:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 20:03:17 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::9f) by DS0PR17CA0010.outlook.office365.com
 (2603:10b6:8:191::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 20:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 20:03:15 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 14:02:46 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 14:02:45 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 14:02:45 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612K2jDQ1867505;
	Mon, 2 Feb 2026 14:02:45 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B229D9ACF4; Mon,  2 Feb 2026 14:02:45 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/2] u-boot: Add alternative key signing
Date: Mon, 2 Feb 2026 14:02:45 -0600
Message-ID: <20260202200245.4131785-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260202195158.1912610-1-reatmon@ti.com>
References: <20260202195158.1912610-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|PH7PR10MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d6ce58-8407-466f-c2fa-08de62961a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ESoZA37ySAwfn9pyyFnZKV+h2VQP9M0QSwDxRnJkmfQM3AZY+7lF8XsxrcVN?=
 =?us-ascii?Q?IHcACE3cFdmSBrDJpvmrJOWBGLDf7pIhr0So4LSBZCQLGWADgylmEmnY8ymi?=
 =?us-ascii?Q?8+MSZTDi8X+2w4yCsLClclnZ5YmV376fxuG8Y/zh41akkApKdAwiV7Vde3bk?=
 =?us-ascii?Q?G+Kgl0Nc5jre1MBcM7PkWZV/xgIMumz485uQ60EoVbINgg/Oix4pitXAWUqd?=
 =?us-ascii?Q?Rx15Ib1RYuGuo98pyNgWppCjZEPqyshVLAxwW5jEM27XwyCmyLs/LTM3c7bX?=
 =?us-ascii?Q?yl4w1PJly2B4ClaKpokEViVOL8mu37CVD8orZQYCToUDrBnzqu+e/pzTPlmy?=
 =?us-ascii?Q?ZungPwTLZ2UkOhl2p+pc9gYBrBW8eIUt/4HvByv0Rd9BybetMhfmwNicBBzG?=
 =?us-ascii?Q?1SbWOmzV7jfgMt8zdHJUGbY4XuSBXATTJNjvzF4YqeGQ70P0KTUWRcqGgDls?=
 =?us-ascii?Q?tqRs6wizECgYuw5Wnlw8bXE1U8AnbRHplck7guMRAHhRiIn9F6WeV68rUb+w?=
 =?us-ascii?Q?TtxJsCWCfvHR6kLovcgRbVRojYURyk89CT6bUNz+5cR+NUELHWOyS3UdyIm8?=
 =?us-ascii?Q?qYI4NyyRrmq2qQA4ImoOm1gzthsEJzBcHIZ0H91N39ih1omulh5RKfJ8+7dp?=
 =?us-ascii?Q?lZ9T1mEnQztwsevs6w4IkiAUqgJDklcSR/Gz9gKjCoZom0uAb+ZNQsN0ksBr?=
 =?us-ascii?Q?K/Fkp8kjm3wAu5hC5AzAL4DeUz0brxUlFOkCeXv69m2ULuvPGSCDC5zGXl4M?=
 =?us-ascii?Q?iIE/Ueqi2mKMYM6+G7aEVj5ybYIXm0K/mX961fX09EWpfy4WXyu75stRgMKi?=
 =?us-ascii?Q?9Kc5bpP7uwhNg9mkEj1p9XTCU2xkwLxcLsA4tbNp8/uI7Hx+PLDs0RzigNc/?=
 =?us-ascii?Q?W/yrTNsEYQrOfaXMkVCY0yv/BynurNKnOIy8wECLaf3Ve/VPgZSI3iXVsK/u?=
 =?us-ascii?Q?F/hs2/+0x5PHnrafbO4diSw5PwhfC1PrxHzPCIOQstPyAr+P5EUNIi36SivU?=
 =?us-ascii?Q?llttKKksyRlv3T1JgGmcAFkLxgGeroU9i7BJG5KWaZEc+C19Eyc4NC5lIqlo?=
 =?us-ascii?Q?SYxBOjc2g3KMaXrwP9YTOQ4Z621wEP7HHPNg4/1tx+MzDTYzQRIl+pTm9vDC?=
 =?us-ascii?Q?5vqLRQeq2LrEScEvG37xgsV9M0Xx6zD13AK2nUkbTTeSZ6cTKtYZxvSW0adD?=
 =?us-ascii?Q?+cFk5DygGk8mTQF9d0zQp/WCkSqHOri0Oq5S4O6hwcq4C0hGZ5UCsE4dg9X1?=
 =?us-ascii?Q?juDfZXB23bNNM+9HwTTjOzNkypbKaPuG0YiWvvin02u8Zj1myWn+eEuEoGn9?=
 =?us-ascii?Q?8InxmQcvXoIbta0HLAyqgMaCRG+0HETmqyRM7yxai95lnMS6fru1+gfhMYJw?=
 =?us-ascii?Q?8/2WWvqx5v2aFGRv0KVxpPx+lXOco1XpDCNspCvlNoSWHnE+uC7jr7RjrDQJ?=
 =?us-ascii?Q?eez9gKtewwoNLZ9teKfCGNOzylviRrYM3RVbNsN/+JCFYeg6PMF9SjMEldkH?=
 =?us-ascii?Q?iwngtscjlic1hoCRqVCJmj6d7HNxleCTaFizy4TtUQrPkFKZxwo5DUkhEUOB?=
 =?us-ascii?Q?2Zd9VRLCHu2W77d5qjsi1ZcAvoA7v3GnUMmr6eY41HJKa20Mp+BRbXwrxUG7?=
 =?us-ascii?Q?u2U4kPj7RktS/ukhJxiCFnb5SujWAQ3+cL/qV42JololiyxWDnE7bNIX0dTB?=
 =?us-ascii?Q?YIgBMw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GUukNL04ichmr3gZB6yyb2WhqD+BMVG55a8DUrwHdwmPNnVjyV8mn4qq7qRefthwSptXuMAG1ZrOfAe5MVxco3Nq74jl3LwNX8U1PhsORyFr7XCV/NJdrlt8jKwXCWiTiAq330gqtbar8MheSKieoX7chbYu49DrJM4V6LbRj6gTL/Chxm1FdGHgEPeZUpjNGmIK+m3tj/Iw5QEgkktGDfsGUGs8Nw4qmTwP90+Lk0UFOVb7nfGlFnMOSxxqkf+daZKqZmOmnJpc+U191pDdtil8Dg4BKt9TDzYcdt1ODkanE80+l3StR7VkVsyQRnEarux6kw3uZb7e3gCYEpTlONPnwec0bJkifM45W1o64i/AC9G5N7lqhoR36OSFsG57/0FJBQvxD9hfWYp2WRzYO2W7ge5zuPPbEiprgmBbOJC5kHzHGfGRRrkbkDFV0Hah
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 20:03:15.4788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d6ce58-8407-466f-c2fa-08de62961a1b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6131
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Feb 2026 20:03:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19457

meta-ti / na / 20260202195158.1912610-1-reatmon

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
WARN - [meta-ti][master][PATCH 2/2] conf: am62p: Add ECDSA key signing
    WARN: Commit message does not include file/recipe name: conf: am62p: Ad=
d ECDSA key signing. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 am62p: Add ECDSA key signing.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-ti][master][PATCH 1/2] u-boot: Add alternative key si=
gning
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 2 Feb 2026 13:51:57 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 3cd0d84f0816a182e1b4c2bc9215d2159=
9a8dfb9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602021018
- Commit SHA: 22e889c2057e86800522f69ac4d263b17101b2c8

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




