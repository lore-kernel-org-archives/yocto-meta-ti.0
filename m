Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D66D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 09:06:08 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12052.1764320766070839957
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 01:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=XEajFPcR;
 spf=pass (domain: list.ti.com, ip: 52.101.46.29, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVbUscWuVZjjfRpNOirhqUdQbKZPWKBAAY+OAQQAoBEMLoYuctKWZfgjeKMPYTafe9TvzV9M6tyDTzwb9GD2BD6Es6G+AFek++5jokX5KVJSOj6hQudUVMoO613k94Qzbl05yKC/vSDUffrHHUUIa08pZECiOZxfI82lP5SeMFjw5+xwjXUg1kjkA0DSNS5iIAz4mv+Y43shICPm2lSXYix55h7qXDeJ9otIyNHwKCy2g9EXCxW+I4nbzuRYwP2Fw89UwBlrPipuv+SshB3wyQnSNKWsPdbpu2Jfg42iQCfQX2fxEVcfxLpUjM/0Qc+iHT51KsFlkQwvaODSYLdwxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCJoTrzBKL2U0x/EbIg1LoYrY2T3b+Ka+galInziGvw=;
 b=fnWldNVtLhG/cgw7Lvf1amYNVoW0mGIHs0NxduT8hfSapwAPNQvoDS7c85q4NuEcdcDt2QZzj9hMVOryFm/aSCiWFITWmTMCBIwjb/IkWQVv/ueC4k0oYtC9BDL7UiuAF2BPkDTW/OshJwf8UK+WJyoxSARBSkz071r/o4TKbKz0tLJ/YtcQBON1222+tbYfk48+FnoA00r6fJehmtu8uMpnHjmiTfy2mdMjYNPMvIo14VMrVNCwec2/76aytD+eDowJSchBe6Zg4FAFbE0TjOa1uAm68npkA+4k0Xksec8E/oqo2mG+FrAAc4Q1cI0sXHsPOLH+EXRHZ+fHxAtBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCJoTrzBKL2U0x/EbIg1LoYrY2T3b+Ka+galInziGvw=;
 b=XEajFPcRw5DbrDpBhIjJv8kEgBZCeXNIx14sDPR7U7qZVilsJKUzbzhLvmdaDYPNStvuakbcNgnKfHsCdL+2hqS4d92oCsSsPNl4+M6GbYGJ9t5tLlLqi71aUQ3OQNTPIVjtdVWNAHzyRAJBUG5jG80w90rfeGcEHwyb/y2SXPQQ/+ghb5imUYhg1Knt5uHdKkKB7S9s1Ko8sfVQvG7anG7Va90sex9Et5fYYnPk9agZv/DiUBfHnsxbuLfASR1nXBaNISTX0GiUTgMaCl/8IwDdeIvnRK/6VODZy8v8jOuMe+tPXnba1ZHHiXNjkdC1ohm/mmmxXFUkfzu5WBBrOw==
Received: from CH2PR11CA0026.namprd11.prod.outlook.com (2603:10b6:610:54::36)
 by IA1PR10MB6734.namprd10.prod.outlook.com (2603:10b6:208:42e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 09:06:02 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::da) by CH2PR11CA0026.outlook.office365.com
 (2603:10b6:610:54::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Fri,
 28 Nov 2025 09:06:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Fri, 28 Nov 2025 09:06:02 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 28 Nov
 2025 03:05:59 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 28 Nov
 2025 03:05:58 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 28 Nov 2025 03:05:58 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AS95wFI2204327;
	Fri, 28 Nov 2025 03:05:58 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D7D9A9ACF4; Fri, 28 Nov 2025 03:05:58 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Manorit Chawdhry <m-chawdhry@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Aniket
 Limaye" <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, "Hari Prasath
 Gujulan Elango" <gehariprasath@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: trusted-firmware-a/optee-os: Add LPM support on few platforms
Date: Fri, 28 Nov 2025 03:05:58 -0600
Message-ID: <20251128090558.3707598-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251128085314.2671804-1-m-chawdhry@ti.com>
References: <20251128085314.2671804-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|IA1PR10MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8c37f4-e6c8-42ae-c487-08de2e5d5aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cgE2+shH2BJZhwqk5c3mId2PryO5e2g9wAyjrso2eiU2bzyUa1W82qfa8QDy?=
 =?us-ascii?Q?QcThIpxVeELAQ1CoAoq9rmm2WWDlZBOLOPeUMySOeFXJTC/cFuZuhJxm0Vjq?=
 =?us-ascii?Q?ZaedJBC99+8Jvmd70jLptWG4jvN4crPpp/kac8BnDSb3KxaPZLEpvm4yn+1u?=
 =?us-ascii?Q?N2OwhrcuN5oyDZ1eiBdWVlEbYXlsf+di17rMOFaDOU1le8X7VVeIf5/6ISqu?=
 =?us-ascii?Q?M5s9CDzbpLbeLodP8c9WQoAI3J+2yorz/MORNITXdi1dhfKdO3fhyyp3JwfB?=
 =?us-ascii?Q?hxMVXJKEhL5Ip5BCME5dtIGnxHtE3OmP0UwmUO90X2Ih/spg24XAGb/zesk3?=
 =?us-ascii?Q?0f0txpChN4ZWK6ySQ2V9QllK5AtyOBu7XxGqwROOlu5NfoCMQX5DEpZa8Bra?=
 =?us-ascii?Q?sDRrJHi0IpvOwdn9YoW4NZ6VeRDxmI0xN5FfnIZ3NBGmB6hlhi/RX4mccwKV?=
 =?us-ascii?Q?gxer29c/geW/vgRoBXLRcMWszaVI3ypdhL8ebOn2CKZHQAt1IgVF7nq4WIaW?=
 =?us-ascii?Q?ifevxIF5KpUd9Lqg1j2Vg2SZwoDxnl7IFvD3IWmOeu2iYDEJpwTCp8fzrME3?=
 =?us-ascii?Q?z7Y5NcoHg/OQW8ctUMKvdG5YZw8NpxzUwlfvw89KQZaceRcs1uoXaVaiXeTb?=
 =?us-ascii?Q?xLEVW0ibuG4dkDcBoUiPKP4hJMU/gKvcXvyaBBjo4a7iHOndgG/LinXxp1YU?=
 =?us-ascii?Q?MCNxcuOEgn2pZ0RmrvZ6/vgUnzHxc8x9S9X/YC3IKl0IvVHl8+x7sy6MeyyA?=
 =?us-ascii?Q?CT/5HOMKL643j0LMbHNAkl0X/BOeX9DlwPwUIjALztd/GHFZwVbblDivVbNh?=
 =?us-ascii?Q?qdSRvkKjlTpLEfwAmNX5ywdQNFb57wLiB7mXiW2K917cELNtAY1HsYnqZRjx?=
 =?us-ascii?Q?awUVkZeXOLkpIyCSsfKfEwsLbtwCwaQXH0CJ5n8PBKsGaWrff1Ctp+0LGsTq?=
 =?us-ascii?Q?CNEtjRsNGb+jH9O10vPVDGUQqx9b6CZm2PErxLSvn+xGP2o1tdUID99Z+pJB?=
 =?us-ascii?Q?ITlX6Gf4lJfn3MVqWoO8ETlPqahKRDCIwXmuarv/91JaGXW0GhPMius/5Rxv?=
 =?us-ascii?Q?YWA5L81aiZ32LiAl7cPxZmOQZWEJddfSFCNm+VYRRQqsepp9ZGB++zMV5VK8?=
 =?us-ascii?Q?8avaiP3H4CWRnYIyLifX+k8VLb2dAWxC64lqfzYX/PPQBlyV0IXUYOD8RGZr?=
 =?us-ascii?Q?XtJehxMkZDxijSsuqWHFGkevOw3d+oadVM0zgCp92ODUaDC9VLQb+IEZ6mmn?=
 =?us-ascii?Q?/GloWS3C07DUnwNan8a2d2fA47aiOHjroikL8JpMIGiV409+iSuz9HBX14yQ?=
 =?us-ascii?Q?oCO9ekqhcoQ+F1sSBesY7BYVnq36CH6h5sekhRARMAj3+feFokGTCtCdnhP9?=
 =?us-ascii?Q?FYLDX6UXysP+0a6QRbABmoCjcgchsDp4vYUZg1gHS+ugQpVPJOvMeGc+ZNmK?=
 =?us-ascii?Q?WFM3z87mIaPaJn9e18aW7ZQ6ZV3jNKphIwFGAm04dplOf9T6zqmC0GUlDBq2?=
 =?us-ascii?Q?PYbeaWAxGWgamz9J1yaFPAvrMga8ITgIaIvLXelEwdM6UZTSex/HovcVT5f3?=
 =?us-ascii?Q?tlxcZc50+puLvUjqSBw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 09:06:02.0460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8c37f4-e6c8-42ae-c487-08de2e5d5aae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6734
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Nov 2025 09:06:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19304

meta-ti / na / 20251128085314.2671804-1-m-chawdhry

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
WARN - [meta-ti][scarthgap][PATCH] meta-ti-bsp: trusted-firmware-a/optee-os=
: Add LPM support on few platforms
    WARN: Commit message should not include directory path to recipe: meta-=
ti-bsp: trusted-firmware-a/optee-os: Add LPM support on few platforms.
              meta-ti-bsp (COMMIT-MESSAGE-3)
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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] meta-ti-bsp: trusted-firmware-a=
/optee-os: Add LPM support on few platforms
- Submitter: From: Manorit Chawdhry <m-chawdhry@ti.com>
+From: Abhash Kumar Jha <a-kumar2@ti.com>
+From: Richard Genoud <richard.genoud@bootlin.com>
+From: Abhash Kumar Jha <a-kumar2@ti.com>
+From: Prasanth Babu Mantena <p-mantena@ti.com>
- Date: Date: Fri, 28 Nov 2025 14:23:14 +0530
+Date: Mon, 20 Oct 2025 11:26:17 +0530
+Date: Tue, 11 Feb 2025 18:20:17 +0100
+Date: Tue, 28 Oct 2025 23:24:22 +0530
+Date: Mon, 3 Nov 2025 12:42:57 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0bb43a6de13d63aae5870c1882b2cfb85=
29dc4f6

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: layer: add github MIRRORS definitions
- Commit SHA: ea43ed2a3963a6073097711476caa0530745a8e6

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




