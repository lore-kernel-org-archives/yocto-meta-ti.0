Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A97D78796
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 16:02:30 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20077.1766160143945711003
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 08:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=pWgXg01B;
 spf=pass (domain: list.ti.com, ip: 52.101.61.2, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYIY14Nrl77hKZxGW6jgk+vvEUnJwhvF3/TulvEcqabNhazxt3c1OZifp6gp0rLYPT2vIcaPWF3mdgY2NzMH1CLUAzvjGyAJQLrshVun+xZyEvjZUK0zIOaOyz+q1JY1TjYFl8oGQB92IVkrZDvmY8lknNa4IDFJQ+fR5mxgeIde5i6FRElIezELaFOWvY3xfjHS/C93Sg1FE4VIZgAG+BovaMmytzhWo4NKRGgYTfgoKdicbUq7dcKvjddSNvPjQcRBAJ0ehG8yue0QvHHL9p2VPDIBv+CCxkRJAyo+CvRZXvt2SmGP6BKRPkPFsDCdm1dp4v2sjIZOC4zRt/pN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDev7HOAP2wkgbx8h7LBI5nQcj8Sy6G4GyQJUwsq+Ow=;
 b=EbFZaq1Y+BEPQshTNl7vuP53AOkZm2sFcFzCo1H+QGM6Uy7CRQtrdA+9GgWLcvVqwLmenHxO6uXVo1D77JKx+bERmo9kSJTZHvt3itOnN7Dxb+A6o1KEVs7ZWyPDWg0SFVcPA34H3X1WfdRBmkMcDW9sPWLurUCbMw0WYXf/N/CVb6nlYp7hbdVkiKZsDOsixYKjPiHa9rrKG8BqXil2iIbK4on3TyUXGHTeKHYEq2NY4ZCGcJMHWpyXuO78f9WjADtr78Krlint6sSaLPQU4kIDPRIcjSEMFQhN9/6r01caQgEo0DUQeZsF2xiFFo59D3023Ox7admmnMnHAfle4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDev7HOAP2wkgbx8h7LBI5nQcj8Sy6G4GyQJUwsq+Ow=;
 b=pWgXg01Bz4BgI4DuAjhETEHA29MnRTi6RF8jPYKI2xcq6Om+EiAguDFLyxsEuLoQ61wrnFgPqQ64d4PGYlSgBwrYnMwqgWrQkGSu5j/GFPXlkIVpxVSZlRyGbEFyYxyfIkM7ykI2bNYreLOkMpWYO+sJHdJfK+dmGaBNt6RNYBVG2BrDpcv6+6kQTBnq55lJ5Yco5efrwVI5FEw7uI9F/a3NI6qJZAhbkW7IcsqFGcGTrRuvhhUWnz2/42ulviddPrqcSAKIUkHsrkKgrbkp4e/QBWiRYctqAvobslDdeKNAPJiFdlvywOfwfuuZoE+44Q3AlfZ7TfIcb0uhRV/XKA==
Received: from BYAPR04CA0035.namprd04.prod.outlook.com (2603:10b6:a03:40::48)
 by SJ2PR10MB7670.namprd10.prod.outlook.com (2603:10b6:a03:53b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 16:02:15 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:a03:40:cafe::78) by BYAPR04CA0035.outlook.office365.com
 (2603:10b6:a03:40::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 16:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 19 Dec 2025 16:02:14 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 10:02:11 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 10:02:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 10:02:11 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJG2BbU1098957;
	Fri, 19 Dec 2025 10:02:11 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 57F0F9ACF4; Fri, 19 Dec 2025 10:02:11 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot: Update trusted-firmware-a locations
Date: Fri, 19 Dec 2025 10:02:11 -0600
Message-ID: <20251219160211.1790111-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251219155144.161794-1-reatmon@ti.com>
References: <20251219155144.161794-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|SJ2PR10MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 4129ea6c-2380-478b-013e-08de3f17f9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VtkWsgZOeHQRlxIvda+k7LE+rP/zXLa9mtRaRV2Zvs3zIFLp6PeepbGHz8py?=
 =?us-ascii?Q?2zz+I/0JGIfpdBfF2doAeL97V5cz+Ksyfvh2Tiud65wbtRttKUTivR2bl6Z9?=
 =?us-ascii?Q?1YKhsPqwuxR1h2rTVKv76m3Wo7sb3sg/edD8K5jLQO4rrngouEI7HTyK80Yf?=
 =?us-ascii?Q?Wj2Qf+/KcFcbz7m0ggNC2d/H2e4ROOaorF4CX/hCeNAKmLST4dvLIC4ODZKk?=
 =?us-ascii?Q?bjt4p52gK7y6RZutUblUfMkqV3E9RouLsTLyuAxB5KD3WC5kWldGr2o2Twtw?=
 =?us-ascii?Q?4NiYK+ntS7RtNKXrGbfFGoOD4yXdMJ0kY3eGwDo0dT54VpApiD9wwSbfx2oY?=
 =?us-ascii?Q?M4Nx1roYxTGKQYiI1cEuzLbUyRRPr+z3y2oSVvo6goU+plChslkWsc6i5r1E?=
 =?us-ascii?Q?hQ0Izt1Cuv/tK91UchEKC1Gg4fly3f3eL5jsDT5IbZz3se/J0VByFWp+bton?=
 =?us-ascii?Q?BtrgSjc8O3xvkS981wVWNqWhIElusPH9v8bNpe5BlGWt3L5X5vuvQMdeTQQh?=
 =?us-ascii?Q?DrumuzKqnBmnnoF1K0K9yqy2jo/RK16DWT2STtl48JphwWLWiXpAihUH2v1s?=
 =?us-ascii?Q?OtdPBSJi/YRQAdA7snMIZkXBKjR01Vt0+hbTNdOpcmExErpVeyN2jgnAMLnp?=
 =?us-ascii?Q?0bg/4tNjVzRLx03Yp9mei/Us871IulzDtTmDjwgElhnNfYsxi6LdPafZv8gD?=
 =?us-ascii?Q?HHCCXwM+s9+UdQRYzCeG2jzdsYFu7RnlwqSadOeeplWIr29Ww9JddsJaU9qd?=
 =?us-ascii?Q?hFdo60wENTGCxn78jAbZdBjkJAfRat2O/9a4PkThTw2OwyVBtc6ypzM3l3zP?=
 =?us-ascii?Q?m0HIRP/4kgxqt3vJoo/X2hdpJIjTEZI+EVdypXLFwi4u2QF118aot97rnFm0?=
 =?us-ascii?Q?/eqcc6p4/kXhv5NYIIWHW7mBsTMUmbulm/pq9uFHWvRff6kvZOF3fQYeZ+bN?=
 =?us-ascii?Q?JLZYDqbmJKGrNddIQ9XPIwoGdQNikZKLCePcuCyyieHb98iUqr+kg4ZJkuYA?=
 =?us-ascii?Q?vIT5iDNAgxyHppp+cYylXGdN/CWIkDk/q5Q2G1KZhD0ducjVyYqD2rEtCS4n?=
 =?us-ascii?Q?7Z5dVYCDkVkQmH3rgOD3EbTZItknh2iYGpHXjfOfA/WqXjppV9a8VOCoIYAP?=
 =?us-ascii?Q?v7EQw/t+CatyU5fQuCda1ZGUgY5p+J3noxu72oFI74CCahzyufKUM2W81S8d?=
 =?us-ascii?Q?66HFXHmcBkN0oc3r2IGpbvTPuQ38uZyGk6uKlFhx/mubvFJzk12kX7cQ93nQ?=
 =?us-ascii?Q?8zuaRL79rmFBfVul5RqtPotfPq+ut2SW2/UEjrUqK2Q05RW14nsCegPBDXb2?=
 =?us-ascii?Q?+69XR5gwsov6XC6TWB2WBeZ3hqQHFIXAsF1VeXSSi99FFXO4/b/NGuvJOGMr?=
 =?us-ascii?Q?K69tIZ7pU8dKp98Grd/Zlc+6Y/iPJGDOAkUTnSf1ZzcqEFQzu+NR3ImHqqG+?=
 =?us-ascii?Q?iQ+V9NXzAt15hFixzaYSsSNNT/zztM8GP8YiurXYgAHXL+tUVXqsbQU22jT4?=
 =?us-ascii?Q?QIc6Qf8uC8Jvejn/CLAzwiC1dc6sAM2C9TA1khMYHpkG1Zd/oeSIheaji200?=
 =?us-ascii?Q?PXWo3OMN1/sLAWpFT38=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:02:14.2707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4129ea6c-2380-478b-013e-08de3f17f9fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7670
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Dec 2025 16:02:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19377

meta-ti / na / 20251219155144.161794-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] u-boot: Update trusted-firmware-a =
locations
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 19 Dec 2025 09:51:44 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: eea2d449bbda53aa3bb99ad82700937a8=
0c1177d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512190100
- Commit SHA: 6093ac7c4688919ff146b20ea0a5f5f6607dd385

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




