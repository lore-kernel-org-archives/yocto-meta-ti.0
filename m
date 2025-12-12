Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F372BD43366
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 02:04:10 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3395.1765505042091691117
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 18:04:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=UPeNzG7Y;
 spf=pass (domain: list.ti.com, ip: 52.101.56.48, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvy0+etiXYI5KUlm5VSqsb8sQIEYMokn018ReI+NbhnLwfWdphe3dQxu6X4sLOcHJjzizYhuzTKTUFC87mbUZqkz8o1vSZQeiv7sROiSUZqjkCkwOK9n2MzRNyuo7y/NE7C1xjWkNyTApDvjWddh70C8VD23aUQBTqzUG/qWGF5xcHJNeOTo6A03OeIo1/2stVSDcRhuhluNrjC01Fl7Evqq0S6Sr79UlpSjyup5jDIpwIUD/kF0MXzZjNJvkDWsjdeY4/st/XnAjiuvIpAgrT3qR34BmfnQt1PIu2kUhBeJC8mmYvUg/UVWom+vYQb+jJvdOkCP8067RIggJ/D5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBgxjH9BDut+prpviFwtgfjnxqa13ltYAVvRCXL++Uo=;
 b=jT3phxgNRGYWqk6BJJCQul4Nop9ZCoyl5YE7hMREre05+gxJ6ojypKC2NFiTkhi/Q3t1N7HO9MfoGfWXsjtVnuuNYIGCOLXYMg7xLr/Uk0sBioABwtWCoy3XOMhk76QLFdbJ9ieb0FTS3fKeb7Wpnl4paxHvZflZq4OcajWT/frN/PnPLrRznYpzrHABEWGI646lJuLzfy7IrKCEsvCmUFhGIwT8s+FTJkGNtBYiUUGsL7ZZT9fATges9QJv1E/vTw0ACK5YS7ItyU86b41l50i2eXnJw6MMhX8z4dqNGkwcaqKnLle7aQZh8BEDIs01RmEZFw7Z8OeJglEkeauKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBgxjH9BDut+prpviFwtgfjnxqa13ltYAVvRCXL++Uo=;
 b=UPeNzG7Y2lMm4fqXpm4OOcIet1GD4TzvShSgXIun2XQqqbmpWlh7073X0OKUaXbIP7Y/xrvSRb1h3n7ufe7IaQGsFAr7SnJZ6Kse4R4UzL8pB4mrO8Jg2JGySK9QmUiPgbfDzErBXrYhJTaOYNM30+oX0JC69s950R/giSbFz3StjBQZv009+OiY3OAvPOBwsnKUaiNWxyzCsUZ9H1JEkvze8buqehn1x2ee2WHcL+al8xEp4+yx7VaYLwaHyC9MLVWeHxIRkGR7dnoHyRQ/5G8edb0iK7oKW7Gi6zgFNJpBu+lKExfs5pHBrwZBVqAtIiLeixRwasX1mKTzkilLxw==
Received: from MN0P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::15)
 by DS4PPFD14B646D4.namprd10.prod.outlook.com (2603:10b6:f:fc00::d4a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 02:03:58 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::81) by MN0P221CA0005.outlook.office365.com
 (2603:10b6:208:52a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 02:03:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 02:03:56 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 20:03:49 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 20:03:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 20:03:49 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BC23noF1462152;
	Thu, 11 Dec 2025 20:03:49 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3379A138B5A; Thu, 11 Dec 2025 20:03:49 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512111451
Date: Thu, 11 Dec 2025 20:03:49 -0600
Message-ID: <20251212020349.860266-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251212015238.1862952-1-lcpdbld@list.ti.com>
References: <20251212015238.1862952-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|DS4PPFD14B646D4:EE_
X-MS-Office365-Filtering-Correlation-Id: 309276c5-03f7-4725-3f44-08de3922b535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1BsOfFNjSMhHuYUohpb2h9RmVWcfkQyjNTTveaqHIj3S0VpcHri01Og5c3Zm?=
 =?us-ascii?Q?Q/0gocHEx/2RmkJqE7mUfqo00zZIF5QKyCKTG20RiFptmGW9Ez9TiJx7SjUD?=
 =?us-ascii?Q?4whrlMY0yu8EWF/uFpBDVtNcJ/1NTFW/6+Yk1PJwqwhGgyWHg+lpbvaSAf+K?=
 =?us-ascii?Q?M57Ns+xIbcthLI+2KC2MFkgQb8i5Q1BLL8GLERLA7DE2vmeEZtsBV4xVOQ5v?=
 =?us-ascii?Q?UVDwvhrX2ZcXhSn99dHf5EYeiWw97s+VAsjPxDxxeP8pak+vVYpJWVopfntn?=
 =?us-ascii?Q?QhQilSWs+QB5u9xQra2F8ptMnUnFIvYrUcNN/d18fJfZXwU7OUtVsbXv2Axf?=
 =?us-ascii?Q?78DAruRmR/2e3P4UH1yaknz88j9cdxNSpITwjdY8KVI8Fbkqb8JUhV1r8s1p?=
 =?us-ascii?Q?U5KupTKtLmUUkv9EITtYhjSAQC+HsR4EErVNheGxKXF73ss2afvtfee1d64+?=
 =?us-ascii?Q?FaGyPfvmjVZiQvbC8NGH3jgbIuHuLLggNemHk+6C9euMIhFjIKHqvC17hUru?=
 =?us-ascii?Q?3EfZtk29qIzLZF78MaLfp1/jGl8N8BWpdG2liMwVPYfTmXE8ljYitGWKo9z7?=
 =?us-ascii?Q?7UeowtOY9oefax7YrmPfKPorQogGV8b2350HcZhyycCYxI7QsrCQgMEbrazH?=
 =?us-ascii?Q?/YzW7tkhOfoP5WWXEE5XvYGGTWTPwLy82VhDjKAovBUTAoWZ0WrRE/T1V9xF?=
 =?us-ascii?Q?z2aurwEiNlh8hxJt10G5coggyBcZ9Xp3xRc8xKjZALNXkEWnxmy2GNkdcR7J?=
 =?us-ascii?Q?eAZLnJtDxEZgdehgv5DhR+jCcmWqszEMuwW3NB+hu3t0fLpcfXSx2pNqSbkN?=
 =?us-ascii?Q?554aKUI0/9/X6DnfE6rbaZPb4Mg1jP6dNVL78lXDqca9BFIUZQgmTsBF0IzV?=
 =?us-ascii?Q?iO8PEZYssAonvHrWxi6ssXVWnUMJaQInkYiDERk6UJ91dJUvSmYPtpRpPWI/?=
 =?us-ascii?Q?IA9eopxrbS7rI1VOJYfeeE9xA9cYpMLN5jofMmNpKH2auNys8Yi58ylR3T+W?=
 =?us-ascii?Q?/mSH5HHTyXH2STdsc2OkNFwrXGvaJRrc7Po8d6ngWaHREaaw3OnOGI5MrZqq?=
 =?us-ascii?Q?fM35FKhVziIIuVSbFQyNFb0T61FirHwzLVZo145psdiA5I6BuP5jgNCchZGS?=
 =?us-ascii?Q?Oxi4/lUYVUhLIpBEq1Rc+EYAGJ2ztUlWCrkTF48hlQfrPLsZiYFFlO2xw6mk?=
 =?us-ascii?Q?VQjUAxWe18lImqVm2dGFc+h5lhM2f6XiUwspJ3sSVJrSCQQ5CwkU/WLlMtzb?=
 =?us-ascii?Q?2enFC84HQXrxIOmhNn7/clEc/WrS16oJFeRwShOv6K2k8yV7i0CK5QSTiJl/?=
 =?us-ascii?Q?F84aMSfYkcT3W2piYxhchIRa5W0SfJaOgVGCeqScxlK5mufKDraehw3qQYRI?=
 =?us-ascii?Q?JogKmhKZlzebd/7IBD65RM4YumJAYefbe3mNcCY5u0K+Qv4uyXEQY7GRu1Iu?=
 =?us-ascii?Q?rl2Px6alz4Qapb+IGh/mszoCE2KfHbEQU/r/PmvdjyautqqTWqYS5otdJJdz?=
 =?us-ascii?Q?xizymE83HV4d+MbOlsRDLil+hBftDvD24541sOSvMRTFmGHh5xSbLvhbJA1k?=
 =?us-ascii?Q?GloswnXYRanZM6Vhryw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 02:03:56.3841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 309276c5-03f7-4725-3f44-08de3922b535
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD14B646D4
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Dec 2025 02:04:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19356

meta-ti / na / 20251212015238.1862952-1-lcpdbld

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
ap.202512111451
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 11 Dec 2025 19:52:38 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 371f27a0d9978a87a71596fde8b5f6874=
7ae84d9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202512041635
- Commit SHA: 802cd01e783aeec00af81d99cd242f20ede3adc9

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




