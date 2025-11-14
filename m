Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF968CE8D5C
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 16:55:35 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3098.1763139326965459098
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Nov 2025 08:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ahaSszvP;
 spf=pass (domain: list.ti.com, ip: 40.93.195.48, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLqbRof6heMPdSTiZ6gLQgV7ylS5EpX9KU3hwXQA8B95C48vlVyQ+VRiFRW3+AHAEWjw1ctYtXdzA39i/5bVmlxgj4PYyqXE/Dh5aZFLx/r6bs/N+xP8yC/+GOpuzc/TO438cO/bT5OLVz1q7QZGrFYrqdw4kgIjrB8jsTaVNZ4wTxRhB+XIyHHNzKyGmAmF50JiLlaVpie9eS6oieT8wkmsayPBjJrJjG9hIe17c3rXyRNdugr4w0cj2h7J9qCTPu3b17eACtnrKQraXGg6nkbc4b5PoIHb7BHt68qQ+CF43Nz/aBCgGqBFrFDl/Adb7OpnZs0QJZKlhqjchCG91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xq0+ZR0G3jE7qeQmPwzvZcMHeVm9rtmQejkzE7SI71Q=;
 b=zEcCgWzomzERa0GnAj3W710SrW6BfUegBaJ43DR7bBshLDZ3+6CXH40i2X1ah8MQeeiXL+9l5w6iW62WYnoRMbDN/hVXh2yohWwzc7mLnEFwgm4PuvYhaJznXtYafelJIHpv92Ke0Ijlc4Dwf0Hl1JYhcdoY5ALt94y/5Cs3DE9GoO4RKT+9eHOrMVhlOxs8vR43/cO6Cq3SqgIfNJdPL/qcrJjL3IcIxcdT53uExDNCnVITN9+Hrh7wSTsVu4Aauth0T0dMAuTz2IHwF4FhLR6H6pvALOGCHQoOjs29GdzyJJ3iD4jd/+P56HuJPaqVKfJbujPFMi3ZT3HGACl7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq0+ZR0G3jE7qeQmPwzvZcMHeVm9rtmQejkzE7SI71Q=;
 b=ahaSszvPTHCUHtPAACYalRJh5OKFEHhl9fQ4gNE6gACV2+xnzgOUuqlkyJUy9WhRO2UsWCKVWh3BtIRQPByHhyMzs+UXvEiUz+evZfwJTb47iIKB5NU5ezLhDC41Glusn1jdrlMl3wKQuMzo9d2ZMmc5cC3eHoBRhq7FDF2OEzJUOytmKPeLWqckurDSWZGJsMe3KAajHHR6UVs7ZHN2kF+aQgf2ZsWAt3allfYMVHNqbET3/1DDCtH9Eoe1PvbsiRp7cNE4zwamFAvFx4647T7oIXnz+mXBU0lhP8Mnlshf3GjB7wtVKaDOmOwkVW8HdaW+rco9I+i7DzDteyhJYg==
Received: from PH7P221CA0068.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::17)
 by CH2PR10MB4200.namprd10.prod.outlook.com (2603:10b6:610:a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 16:55:23 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::f3) by PH7P221CA0068.outlook.office365.com
 (2603:10b6:510:328::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 16:55:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:55:22 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 10:55:20 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 10:55:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 10:55:19 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AEGtJJ22347962;
	Fri, 14 Nov 2025 10:55:19 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C22049ACF4; Fri, 14 Nov 2025 10:55:19 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511140456
Date: Fri, 14 Nov 2025 10:55:19 -0600
Message-ID: <20251114165519.3706078-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251114165029.2048641-1-lcpdbld@list.ti.com>
References: <20251114165029.2048641-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|CH2PR10MB4200:EE_
X-MS-Office365-Filtering-Correlation-Id: 58253b27-70c4-4aa1-5b83-08de239e99bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ruvjSZaWHF4YAnLXe49UlDPdmQh0Vsme8hZGFIvIkmu7XuKrwf1E3Wtyy1Aw?=
 =?us-ascii?Q?tL0+mtJGl5ySWQ9YEbDi7NIXNuvJio3XIiVaxZEpn37pleXWxKGDsFQ3nm3Q?=
 =?us-ascii?Q?Wpi+DCec+mx578nq7Ll9DF0mYdm0PcGfvZuHBVa/+YopCMM/JTeFPCSUgeiJ?=
 =?us-ascii?Q?dTDXH73JtpND9j1NazKXkyu6ujL0VmEs9dqRYikzOCAReHG7Xr76J5QWjcb2?=
 =?us-ascii?Q?DlxBg7nHTg0wbE+zI8Yt8hq6SjWD7s3HsTy4ebIr8oet+QCZ7lXEmJsU9bZn?=
 =?us-ascii?Q?UJphEwyMUUWlsX2lihpV4irz6oB/S8RIUKpcQZO/7JhiGnfeqn9Dlt05SL4K?=
 =?us-ascii?Q?W3QElDvYNkglgIgeRQtU94Qj1iVszATwtYnlALP/OVM6h6vlY+2NjtnSxVu0?=
 =?us-ascii?Q?2pQw8NDoSy2vkoBWQS2AwmngPGXCgQDIBB82354tFaVVwT6cGKCsYV3svdiK?=
 =?us-ascii?Q?2diM2qQoxYTQaAC5ANJIG9VREWB0pbXgcXnytap7NxEZlQwHGDrhaA9fl2V/?=
 =?us-ascii?Q?6VHBRKAmbaCh3JqOJg9joZqmMSZSMcSZEo5YR1QDq7yPLGsQZKso2aa4Z5gE?=
 =?us-ascii?Q?BLGwNbSbn4OfTyeV2VHsVMJoLRjrNZOEV3ZsqROvm3ckCGBgRW6lAKyhE9Nt?=
 =?us-ascii?Q?1sTfV8gxKD/h5mHC+H537HM1+TrV3PBI7WcwYq8Fner+MyTiU+dKwmzyfQn/?=
 =?us-ascii?Q?oUdJ+OE3H5GttqkpWYqmt55UM5hdmRipRoEKnV8w/eF7b4f1dcVXhM8Q15Rg?=
 =?us-ascii?Q?1vhWW5T07+PvWrxZuqq5AfxfhcabbDUu6zhxmilCU10shctC+FA/aR/bkMDE?=
 =?us-ascii?Q?pBnjH6GpCoj4LZR9+6U8caw0m/Y9/4v7F0tS3HGUyDi7zhbrLBaEAt3tTpsN?=
 =?us-ascii?Q?N2d0DqCyQCnM1zuRe14ePGX0pW95PuI9+fqm63oFlfNdFsvO4uEKxWkQeYTM?=
 =?us-ascii?Q?LdkujdhADQo6x1EBkoFhuWMHkCzVRSZM4vwzdY6I0DaybcNO5Lxlo3UFXI0s?=
 =?us-ascii?Q?2bKYaYNio0XbgyLvoD6K4Fz0Po7KR9Imm+CSzkuKAkpamDMao2mZ5xLWRfSr?=
 =?us-ascii?Q?ujvq0t112Glo3WaSu/HV7wG6GBMbZfx2iq2ZstMWfzYDzFe0eiWUJvNOzEJm?=
 =?us-ascii?Q?KlWaWPlluUdMjEj9yd38ujSor17g1TNjaLV+YreTVzdkPKw540WxY5159rqE?=
 =?us-ascii?Q?aVzMn9tXIDclrIoOO76/ScnWa4p5Y8N0dFOR+iwpP5BOI6FHP1fgqEDIHAI+?=
 =?us-ascii?Q?yU+7h7zt92cDZnVxzefzm869HgrMTGUdefp5pDmMxqqo19mZ61aon/8C22HD?=
 =?us-ascii?Q?fgLUIdTvhHrfRi8jk07B54TuXjzHldOxquCbxL4jPxbP+Pfv2aQkRYIhqQC2?=
 =?us-ascii?Q?TpgC4lmCjmzJ2tNUbSTfF22gMDhK0wkMDTi6batKsAqMw+af4AwJnJhlc73L?=
 =?us-ascii?Q?SvCoVOHUrvj1ryVG62xhYp5jMnnpfpwa8VIWwOlwaw3DOhEoyDbC9uZG2l3w?=
 =?us-ascii?Q?8h8g+chvvL/AUm7JttqunY88ivC2MsMQkBL7/AxwlGzONV5FC1Z6eXptSjCD?=
 =?us-ascii?Q?Hi5VvVWFje2h+g7MPx4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:55:22.3816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58253b27-70c4-4aa1-5b83-08de239e99bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4200
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Nov 2025 16:55:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19277

meta-ti / na / 20251114165029.2048641-1-lcpdbld

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
WARN - [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511=
140456
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.scarthgap.202511140456. (COMMIT-MESSAGE-2)
        patch



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
ap.202511140456
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 14 Nov 2025 10:50:29 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 46660979e88f7707fb5be20dec352485b=
2dc2521

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-rpmsg-char-examples: Fix patch
- Commit SHA: f9194de549b3c76d4941cf80772d215c846e01f0

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




