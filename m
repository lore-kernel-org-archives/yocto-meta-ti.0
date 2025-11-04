Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2200CCFA00
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 09:26:21 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13849.1762248378354433949
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Nov 2025 01:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=FNeEQsK7;
 spf=pass (domain: list.ti.com, ip: 52.101.56.7, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tds0ZuoB2ssRcw27efiNLbTtKqyBdGvCNvE6KJkyGnjAz3EPk+5MSv6sQ71fqKVzO1l2m+yMa1FixcOx90MV8XA2iYDyj7Ty+7sV2wXUIWT/1Je2y/JK5QUfZI0tQG2sM16OL9vB+0QpTnYEAaUVurFNKYCbJsfdl7CEZ2eRpytTNLem3mLwrTnXvCOlmsySdjX143NP3nchLYC2qXJfpbEE9VSKe752QFWxQEJXcdoB82HgOA8rR1OLsaAY8jjQg0NHWvJfsz2y+4WjMG4z27LZOMImaGNG+hGaPgNWv9K2Shg01zN8RQEvNTlG4/FheMJ338olcgzz45lp1iIcvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ef8U2W/DtG6mGj9GCQhjXXsL8kE/ulrwy0PiCRQsXE=;
 b=ojl7Elnlat5PzroUC81/M0eyurg66KZts2C2VKf6C8yUXdBdxum9A/ykVM2GjERq9OeIZJbQpEASEjMt900H1nxV6EEcyvTToGLjzTwtpfe5MtbQ7pyj2qlQCBiX9toU3wWxCv4I1ekS3f/CzABrqLdbKH8JGzbw4SMSJwW2Z1oSDqp3TEcE9MrxNPNLoPMLkPUPdugCkR6jUPtl5aDW4H2W7cW7sI7WzzeCrhjOjicd7EWQmqLjjPDcfabweNwUDQTLkKne0MMY4L6t1qW4C1n+GI5/ryIOLCNQRvyGrcg/fxJh84jcAz2mWihVq9HK850KF62Y1KoIrmuQVSJuDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ef8U2W/DtG6mGj9GCQhjXXsL8kE/ulrwy0PiCRQsXE=;
 b=FNeEQsK7aK/awYAu2Xd6IQcEfrDCBN6Vdr3UIzrbFAsAty0r041+U5vFJrUSajVHkEdUcX/RX0qcJxtdkrID5WrzV9Ke+1TcndrKVEw1pYsoyOTWz4ZUg6Cc6J9KS8/FiQVIrERmg2fZjvtXCECJRkZuSpqfL5j+USI+bWz3+LqxOuXok8JM7PMcUEH9PwwJ+y0NGXK32jADxMRVm0DXDb2LcHJXOoWPP/SBoIKnui5lyAaFEslNHRO0LtYPIhA0dfGuzkYSxZt3nmqYNV1cJrG1xZ/wBHl4zlJURVDRdU34rQKJFLPXmeCQKHqJMctY1qoUX2JFLERFx+g4IisXsQ==
Received: from DS7PR03CA0092.namprd03.prod.outlook.com (2603:10b6:5:3b7::7) by
 DS7PR10MB7375.namprd10.prod.outlook.com (2603:10b6:8:d9::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 09:26:14 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:5:3b7:cafe::e3) by DS7PR03CA0092.outlook.office365.com
 (2603:10b6:5:3b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 09:26:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 09:26:12 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 03:25:12 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 03:25:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 03:25:12 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A49PCUj1722858;
	Tue, 4 Nov 2025 03:25:12 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 6C92F142E38; Tue,  4 Nov 2025 03:25:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>, <afd@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
	<j-sahu@ti.com>
Subject: Re: [master/scarthgap][PATCH] recipes-bsp: Add TI PCM6240 ADC firmware recipe
Date: Tue, 4 Nov 2025 03:25:12 -0600
Message-ID: <20251104092512.3341541-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251104091846.1599044-1-p-bhagat@ti.com>
References: <20251104091846.1599044-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|DS7PR10MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0291c8-9d36-4718-d436-08de1b84326f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5/8soZKX0xNpv69JKrfbxLBhuiM1CRVLVSaen0AkIsM4ZsNnFdWAVGPuYYwa?=
 =?us-ascii?Q?8EpaKa/t5K/2tao1+nnnoMU+GI6qUet7EFRs/LUbrusnjbm1+U8bQMMam+/i?=
 =?us-ascii?Q?WpqX1Pf305j1825Q8JU4T9AqF0yH9bAgqafjunmIlbIl/KCSrylE0tmb3Jeh?=
 =?us-ascii?Q?ar9KApO8/AiuK/QBPFQmyK2wqCYOzTZQU/Piswb5RyXxoLEy8hpwM4q/wV0w?=
 =?us-ascii?Q?7v1A/ZGEe4qjDuC4oTZv8ArIiFNs0SJP8MAA5w+dSldH8qVqqIGudxZEUMXS?=
 =?us-ascii?Q?CiAARsrfOB7KOSVPBl+U/0mUY9P/cY4hFmMudpR8hZgfVKu9R13Pyvpl71Zf?=
 =?us-ascii?Q?KlVV1NisCa4Fg9vkzAfi3nYfvZKF2qN8K+dNXrjo+psa2tkSdL4F9RrPYWJm?=
 =?us-ascii?Q?D2HEzqUG0HR9/Y7XdluZRWiwYCi8aS5SXip6a4/8WPW5ckh+oblippjogK9f?=
 =?us-ascii?Q?ak5kb+/APhS1LOOenEkuNCcf9h6X+tvFJj08OxGdxh8mXBJiFrws42rW7ybP?=
 =?us-ascii?Q?dtLIsFSNlDrBN3hNw4+q0+RfVrkff8XZLy/W9l8v/OoyoYNmwrO0RmxZkJ4f?=
 =?us-ascii?Q?7D2pA1dtCQlaS1JTvJia2blI6fji1Al+oWi608ZPqohMScO0AP18dwwsgy0V?=
 =?us-ascii?Q?1H3hzN+IFRaW2m3s51WZ/LIU73JgMiftqoS6nxO/ufFIftElXF6icZ8YfkWf?=
 =?us-ascii?Q?mlD260+uRLA+2GpKm7D83OnmyLnmUL4W6UK4zXc5lB/c3WD+nQl7+JzbLOD3?=
 =?us-ascii?Q?44BrGneEiA1oZINmQyJ7OrgsRsniRof+YATzjEM7Zh7DnNAls8Vsux7UPwVu?=
 =?us-ascii?Q?+mpmoPvrb4DpNYcQP8W4u69SZPMWtobMLPCHyqb4pCu1077K4LFvCHFcWLf0?=
 =?us-ascii?Q?y7QXTy4KNXG/ksD71VpFLBfgSmV5pvEUN80deXDPnuRSZfIhQXLDJzcKXg6i?=
 =?us-ascii?Q?g5kRC1A4cIhcQx6Ls4fbEbBr/rh8nEbXrfGfyng+CEv6YLWCvXj82C7O67Ru?=
 =?us-ascii?Q?DuE9CmqjKd7kTqGdowCAetLfZ9jFrkOMd6OQ1Rs4UaUWWuDyXGBYx+lokN/F?=
 =?us-ascii?Q?YUBKZH5WHT/19UK3QrdUekSrcp/qxhVg7iLnyUgjajROv7SKzhj0xiP/DpXW?=
 =?us-ascii?Q?kLjlOVC/pfbfh5CzpnFsqcSQQ6CNsbU76wiawxy7dgfLHW7956t+UPzpw3V2?=
 =?us-ascii?Q?bjvME0DDK1p0IS7HDTxOdW8LmzXy6lu+3aZAFP/zCihX7He3tRhgSoNwt4IQ?=
 =?us-ascii?Q?62DN3zErKmE2Jq6WHaOiDhR2kyvypFHY39CYoXH4bUgoYL5JlFZJ/Y948uvV?=
 =?us-ascii?Q?6pd+VYhoYgnueGQUSyu1CDQiIOPE0JQE785G3LimNrGINGErHpHIyhCJvTem?=
 =?us-ascii?Q?vQu8xMPW30fB6X1AtTDLQ7dJlfMqL4vkYMG/SInnGOJ6gfDIfuThRj19Dr9m?=
 =?us-ascii?Q?XR34iTusXC8TBAbIKxuZTHPSs+Ki3MN2YHqjSyCG7YSCkIj3EBcIUehzPhAI?=
 =?us-ascii?Q?CKPxBUIX3gyBh/vOqExioIle+tSw9dmEITmOJFSr9lqNdRdEvPy//5vW+CKz?=
 =?us-ascii?Q?x6Z9USMZYpiqduHpC04=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 09:26:12.7953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0291c8-9d36-4718-d436-08de1b84326f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7375
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Nov 2025 09:26:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19226

meta-ti / na / 20251104091846.1599044-1-p-bhagat

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
WARN - [master/scarthgap][PATCH] recipes-bsp: Add TI PCM6240 ADC firmware r=
ecipe
    WARN: Commit message does not include file/recipe name: recipes-bsp: Ad=
d TI PCM6240 ADC firmware recipe. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: recip=
es-bsp: Add TI PCM6240 ADC firmware recipe.
              recipes-bsp: (COMMIT-MESSAGE-3)
        patch



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
- Patch Series: [master/scarthgap][PATCH] recipes-bsp: Add TI PCM6240 ADC f=
irmware recipe
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Tue, 4 Nov 2025 14:48:46 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7f2bd9da684f733fe10ceadddcb802190=
9741371

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-core-initramfs: Set IMAGE_OVERHEAD_FACTOR
- Commit SHA: dec3f236ac32ab2ea80e6d0640fc38ad26dbe5da

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/scarthgap][PATCH] recipes-bsp: Add TI PCM6240 ADC f=
irmware recipe
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Tue, 4 Nov 2025 14:48:46 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7f2bd9da684f733fe10ceadddcb802190=
9741371

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Vishnu Singh <v-singh1@ti.com>
- Commit Subject: ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
- Commit SHA: 879abf6914437e3a4da45fd515f33ac583bbddc5

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

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




