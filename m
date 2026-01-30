Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1043D61012
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 06:37:47 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5263.1769755055416135161
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 22:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=G9MOslJM;
 spf=pass (domain: list.ti.com, ip: 52.101.201.10, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcT3EGvClmOhtSd3k596ck3Zf0ShlZo0acKnsOFiKQPEC30MT4uKPuMjjujmRT5eneaQ7sL3fixKb6GG56g4dl3sen4INGfgnFvZD+QhRaByWRG6sXgTY5dPQNf5sJH21tB5FwwqefG06m4nxxv8zQ7vPgosIMMKddYtYD7GwfN0a78RefzVpvrkG6lnhQVq5EWNsb/tuWNwn1e0NXf3eRwmbNewsr6F4bM4FnGfGHxQ19UqbAz6izd18zQqdErIoEsuVl/rHJCSeaEfPs/Trd+gjV4/+Ysvp5hInitiuwDnOEA+DIsnskLdXmsKdGAArg9TqY0luVtmqL32GfiNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9au3tHxhWKJ0gLEZ+jOstQjo0XvsHWQZWq//cxBuU0=;
 b=Gmc4kkmShOrfo5UyXp070jIKv3kOJ9DMY3rfXH1sIX1wYFmihq8cVzToMrV5nNBdDf1HJ/xafS8eOJwaOGp3mcvt0ksZHPDqBUaSJ22CKDTyXGs4lAdvgfeYxdruIe+kkY8ywyGiZbSTrlJYydxSzBBIcKI0+L4jsYodb+oIXcFwL22sGVewP/zlzNI2gKos9hq546f+bvjJdWbKKvNRRqWQnCgAZeSncqb+bqTfKO+932AdbxdXmAp43ngfYuqYH9TJyF4smQF1L2c5WvF1OQ+DUFLZ6Cf4Cgfx/BX0ra5kggDRuWVEoOJnANPliSv1WqgUnTVHUFuun4id+Js1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9au3tHxhWKJ0gLEZ+jOstQjo0XvsHWQZWq//cxBuU0=;
 b=G9MOslJMfMc4oMqRUr+1kf6Lf1Tyxeh3GgwVXRUg7KqpvnLEjHIPKQSI6bN5TD9lW4z9+0M/Pg2dB270dGLGBU77zr3umgFat/bxPO8U2AodsHmX/dOq11zSYjchySsSs79po7FuugTC5yan+kefGxNztWaU5Drbqh+LgCJSdZBTrOdW47v87QSFcZUzYzdEraBnJ3e82flnhd40LPdHIltadK0Y6Yxh5xvjVPIBU0lg9ECSUWDXL6/bvgb9/v5D6IJPsunJt3YNQ1295zU5JoLnMXnUuTECTxoXn5FeTq5T5hqdysAgXlOJ4TPy1oqNfXi8k4KS7C7gBWB9XXYZyQ==
Received: from BN0PR04CA0084.namprd04.prod.outlook.com (2603:10b6:408:ea::29)
 by IA1PR10MB7114.namprd10.prod.outlook.com (2603:10b6:208:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 06:37:32 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::f6) by BN0PR04CA0084.outlook.office365.com
 (2603:10b6:408:ea::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 06:37:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 06:37:31 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 00:37:31 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 00:37:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 00:37:31 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U6bU1F864022;
	Fri, 30 Jan 2026 00:37:30 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DC11A9ACF4; Fri, 30 Jan 2026 00:37:30 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202601292132
Date: Fri, 30 Jan 2026 00:37:30 -0600
Message-ID: <20260130063730.3222462-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260130062712.1460938-1-lcpdbld@list.ti.com>
References: <20260130062712.1460938-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|IA1PR10MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a5a26e-3db7-4e5f-221f-08de5fca0bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EmSE6wGKb5m0RWqff00NCct54+EUfxxWsUS8j38P/w9em818BV8v0uT2NrG/?=
 =?us-ascii?Q?Rl0K9bLvvS07NapVvtM3Z2Ei7BqsZXJhGaqCfbBUjj3sJktjCgpzxcXDepbV?=
 =?us-ascii?Q?Til8MqCaW7ywOFuPFZjAXhYJUnal9TMBfdAJTDpvSjJ0/+PUdwDOPCe3ZoC3?=
 =?us-ascii?Q?mvKIxidRkimaoVe5pIdo+4rvlZRmktp4a2rm00whhs6f7QtO5egaJ4k3nI+s?=
 =?us-ascii?Q?otDLYaMIzaC3q7iVV0dxMRhzkKBdPdpbVcbmQ/uTerKaWoTv04KJbCgMkjWl?=
 =?us-ascii?Q?Hq2wZ4x3CsbwPFhReTd1kURthS5iwV2/uDAvqN/9/je+ylghsrr9/SdwOmDQ?=
 =?us-ascii?Q?6iMSFi0aN4XlbQcb/ChHvYE7NoC92eXRyX0vP91RLOMc9Z0CN3wutpErH7XX?=
 =?us-ascii?Q?+WXqu1kuVTC7i0ROv2SKkEc51UK9VqVPd3TJ90VBxf1h/vFmTsulsW/k3wpM?=
 =?us-ascii?Q?wKiPWL9PRpH92LOXst/ri4vp0vahf7C0hdBx0OtFWIUuZAyE28VnRaUdKFo9?=
 =?us-ascii?Q?cN2pHJS8rc9MdoAV6vZwUdAGZ2TsluankfX5IbtaNaOLME0S9U4xyHxTG5lr?=
 =?us-ascii?Q?LOHX6O3ZFpc0jkFwQMJSz0knliSWmW2Ste5xT3mz4plZX3YsTnggotmWCE9j?=
 =?us-ascii?Q?myWzBp4AN1xML+TURMESET3nDJZl/UFCycpRWqtATOxuQWXhVtUs2gs5sLm3?=
 =?us-ascii?Q?MK0zVH8w4GNAHHBXG1cINCn7jh4Lf6NDasGUVE0nG0JPV95qZlvHMSMnXeJA?=
 =?us-ascii?Q?xM47njYJZ7ubNfMcE1/d3w3LYH/UQYauD8gpgifX0bYX3n70+tfet25I0dWX?=
 =?us-ascii?Q?QrEaJy4UhwAA06P7fJEZS+7Yovn5JWzT5WDaFfDJkRYMvFt+Z5LyMwBQG+TO?=
 =?us-ascii?Q?WaIXuoSOKsN5QkHG9f0RIw50qgzq0//04NTI7J4kWB7JfdAlusagPaFbNnUo?=
 =?us-ascii?Q?RmWqnxeORKAnTEOuYjEn0zgZKEMpBwdLQHRElnRtYz1bVw/TEZLEASvOVwY8?=
 =?us-ascii?Q?yW+PfBpDuh1IVJBjNoi1cKfOnUhaetOERYL/IkRyWjVo1yNtAygQuW1ganV+?=
 =?us-ascii?Q?xgQziBafsQvDy+sEr3FWVbsI/O/E54wt2GQqjL5zt4Ni0aH4YMp8q5xNDEGS?=
 =?us-ascii?Q?Is2iC0R/sMjOSoa3R0EAJcfEkkqOy3uR1t3uxDVPSK5/7doVyS5tvIoDnPEW?=
 =?us-ascii?Q?RYh8RN/Kn6Kdg/ATCn6lgIeys2sBSrKBswABM9L6FsrBhlkU14R7KEwg+ihw?=
 =?us-ascii?Q?KWewkpd+q4NDJ1qqc0k5Wh+6yBJsM36W3d/PL1VWRdbsSxEtBVhYLOKBz5oj?=
 =?us-ascii?Q?xisPB+RDqhFAKRjKIFieLniTzYeN5C1KQXPScTzJm6hselYvxubhy0enC52Z?=
 =?us-ascii?Q?aapTjcGb1n4Cju08EDQ3j0+slOZ1pDAmxrXLt0qG9s7k5ycwJ55jO0sR9/CF?=
 =?us-ascii?Q?3NYWuJufgCvNianaY3USAQZwHvHD06fwOg9QwH9E9rNofX9YSFA5+qup8Ewc?=
 =?us-ascii?Q?qtINwUDbWPXoGkeGi+wxVJTZd8xl+5/fVjaGkOuV8ZZcksos3e/ge0VhKHLE?=
 =?us-ascii?Q?vcTwDEDp/f8nwFDL72LVKvZqYxIr+JyDg1vYGf/EzZlNZTGMM92rFrz1Rp1w?=
 =?us-ascii?Q?k1dAzbIAvycEYPOsujslpZ/DT+cGXJ9QAioz4P/O5jhPPBwd25xUjzae27Ww?=
 =?us-ascii?Q?jOcYpw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KiPFxVYBTpGUw7sc7WA8wRfz1vFcQXlZDE+au0acO1wTVw8FUFjbW6LLKGbi2m++ozbcFFm1D9N5CIokpt0UNgsRFE55N37tt8VHtaCQElmDCxNgNLhvN4xQ49LR/tHsmQqOLPbzSbpX+MiSxAkgwz6kGIQB8TUFdfyl1HIHgVwY50PKN6rjYiPZVF1jyLvcpg0JZpqHFolTYtaiUH3Xsb/OsRWLz9YUU0iH9jNLSMT8eM0Yr4M8/oKMo71+tLuv/jw1l69IntCOLsg+Q4rSYkaoUgfkHdXVDvGLTtEXItwKC0LaeSE+YX7Hg+3cf1pszomuYYz6oG1w3OjS9LwEi0zNxTnnlPiyvkNbPqSIb+CTq2tqmhXaAopejug8vN/ynVcSOA39Fnvet7R9A5jzgdtyT92/x6hNgnBvferkX967e9DCN1hVFTgPCBoiom9d
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 06:37:31.6535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a5a26e-3db7-4e5f-221f-08de5fca0bb5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7114
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 30 Jan 2026 06:37:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19448

meta-ti / na / 20260130062712.1460938-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
601292132
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 30 Jan 2026 00:27:12 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 27674d5a6a5c6fcd713580b5a48374ece=
488a6e0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: am62p: Add ECDSA key signing
- Commit SHA: aa5c032c2f4a6e07026320cf81a05393c252d5c3

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




