Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285A7EF99CE
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 19:13:35 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79675.1771010006564595377
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 11:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ec/ZkNC5;
 spf=pass (domain: list.ti.com, ip: 40.107.200.45, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfBNWR36GE8DmFFimpq2aaq4gJlEcdq1ndvL5qgye7Je5D+zb7yureg4vLrdbGNmm6b095dacp/CtNl7G4Y53WF8mUQTycEmh5BG1vOgYKJFkajj2npFQFJrgsiCODFV0qvt/N41ehkgzypvohsA4Uh20A1Oi8mSZ9TwGkj9jTBQKxldS2YpFIEwNQ3fbckAdZkfSp9D5cVPHnACfYn3raQ18JDLe2qvOf/O1cAqPyf1reIMcbcdp1PaZzAzAyMbPKC9bu+DHkQjIu386VPe8Aqxiro+fKg59SbgiAlrvRluP13c4o5jxfD/GeUan7yELXVAtvNKFCWDbgLUY4W7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DXhSwVC0aDyaHgC0Z6Qp4p7ERAvmdTTGwdLkaPE4OQ=;
 b=Tg3yNBZ/hlD6DGJE5y0gdTrOI3mUTgbyCMICn19dkNnTi2Iv091TuugwoWQRvG6hHfooEK0gzdmHk+qtvuhMYv9nXVVTr/ckaZwm+42uNcJhr1As4ESV4XVBjTylg2aiQdy5fPh4OlT+n+Od4rY1LLuF/KI5nUHnK1U3ts0/Rjoz6VSVw2iodTeFeb2IvyDPwK1KYe1y0oFqLf8OmIhweNJBWRphI4gjVDMReGCzyf6kKp2D/p3nIanEVYTWiMbRbWtVXTYq+W+IWk6F5AO+NPpX0w9v91zPJWLSHyTjAE2zzeawWf4X8Ypkf3cHoOMbKueSmYjtGIkH/KCnZ7keqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DXhSwVC0aDyaHgC0Z6Qp4p7ERAvmdTTGwdLkaPE4OQ=;
 b=ec/ZkNC5Ww/DVRdYfxMZGzy8pGHWRvTtsfUnlRnUYPXxIzBso0EIkDOBCqZ9W1QXUo8CXy088ng9lVO2v0M1lfex3xCHygGl9ARQTh9I/RXYRJNGHjwTtvka0yXYXhc0Aj2pPps7WSNPoA2TgoK0P0rD3vXPzBb/Sqe9/NpeIpUamgd2fnX/QZFJbWk77BMCeKvxBz7EaRVzgrfflLsG+Opg6y8d5inByeDqmKGbjwGs4mP0Bwlm7hYBj/xYlvsoh+NPhcUIPC/LXZrQKSODP6C8ve3sQXaTIwU5F6j6ksaxufICGVbSeTVV6AbqJIxsoF546ahL9aXCQO/OTNfaaQ==
Received: from MW4PR03CA0038.namprd03.prod.outlook.com (2603:10b6:303:8e::13)
 by PH0PR10MB5846.namprd10.prod.outlook.com (2603:10b6:510:14c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 19:13:23 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:8e:cafe::57) by MW4PR03CA0038.outlook.office365.com
 (2603:10b6:303:8e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 19:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 19:13:23 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 13:13:22 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 13:13:22 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 13:13:22 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61DJDMIf1261606;
	Fri, 13 Feb 2026 13:13:22 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9BF7F9ACF4; Fri, 13 Feb 2026 13:13:22 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-ltsprep.202602130934
Date: Fri, 13 Feb 2026 13:13:22 -0600
Message-ID: <20260213191322.3275607-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260213190329.2150673-1-lcpdbld@list.ti.com>
References: <20260213190329.2150673-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|PH0PR10MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1cfd06-f900-402a-bbd8-08de6b33f53b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C6BOB5gcGUcOwuYoqXhQ9vp8AjvD3kepJX/NmjAFgks4Un7Kecinj+XQuMuq?=
 =?us-ascii?Q?+5o0bgneMfgf58jLAfmZdE9nIT4FTBjLrmgxsEeTpUuGek3lt3cIuYZgB7vY?=
 =?us-ascii?Q?Wg4uU4RqNi8413oDtvEKz1MDIxNSQQkQPjOhdmfD2/uT091vyYxnBVQlO9V/?=
 =?us-ascii?Q?5ZV6FP/mGTnLt62fGI7JvtGazfijBBYYygQvjJdvOLu5DSipS7/9DF3T1/8M?=
 =?us-ascii?Q?hFfZPLwQ0SpgKIzJrgAQTm5ssV+WpJLeSBpo+Zqk6B8/QBOOAh3H9ExjpqIO?=
 =?us-ascii?Q?tYj0BcGvmku1cu5WHMJQ0LvSGM+afF+gOCEw5plgKQ1M8pwYpsOaTQrK92VG?=
 =?us-ascii?Q?pnoAmhpGvqdiW6NWd86Uy18Qie6YLfWsd5qNCijhDnzMb4WNfdL8LqBq5+GT?=
 =?us-ascii?Q?Bf7CuPIMSp6IId8dOjMqhfy2sz40w9urVb0O3aj6/wxw0dD5dKZiJocxrVX7?=
 =?us-ascii?Q?Uo5/v1K1IlSVOlMKtZ7Ctk/koNShO4O30IjCIGfc+M6CdNBGN9dXqPVd8/rI?=
 =?us-ascii?Q?eVWshTlB1hBH/BnqotZyf3tpOhRUvv1bAqwyz7k2Vg2eLGNv4v2VRjukmPuz?=
 =?us-ascii?Q?W+nREfPlEJSK8riF0MidRra1uv807XVDyVjXAW10n5/FOSr8aZdTIT2j2/vV?=
 =?us-ascii?Q?4/SCZC4V4XbCPOL55SdDh2XnzHrkP9tlNHFrX3C8PDbRABJnvEJSK5eSNynQ?=
 =?us-ascii?Q?JLSYKVs4zz8TnqO1uVits31G91FXczMEC2IwplCxfX5Cyolb1PlBRJy56Ju8?=
 =?us-ascii?Q?cwIEhWWbWR7SDdLR92tXEQSDHfvmldW+Ps+NcM1VElXnHexRYvPDFn5GmD6E?=
 =?us-ascii?Q?4TegbASkuNC8rgJD2YJGxgB/GO97tcPJ1wHGkwSBrU+22sR8PpaSMSK5QkZj?=
 =?us-ascii?Q?uHS5Q2uc9u3PTpJq9/zn5DB/a8Xf2fYGrgMZqn4s1IPVuk9Clo05ZAaYkQw5?=
 =?us-ascii?Q?e0JKLmeSF2Q+aqFe/dt+GEVhrs1m5HzjbpqAEjvfQB3xahxj6+16y8QvcOdC?=
 =?us-ascii?Q?Rw+DFUB1rt8e7KEUE4HR0iJrYUCLvDVqKxz7ApPz8lUDyqe+BV1IJLEBLxhb?=
 =?us-ascii?Q?WSQnBj8Kj1xRKNNTvueKGaIq03GQZF6Cwvz6ZKpcQfBQkdN3mbTmnpkQtSWl?=
 =?us-ascii?Q?egRjdCgMgifpHD57527nki+Dzadf//waJyMGF4mhtK70Vy7hqe6ke41vdNav?=
 =?us-ascii?Q?uT9ahLR5gYm+HUzfaGt+ItXXSkpoM6miQZYHPYPbGSt+Y5dJEW0H4OKXpKOB?=
 =?us-ascii?Q?2OzDv0ru2mdus7myzLNYT7CmDkSkgub1o5es4tLPau0Lf38LU7k359LLa0iX?=
 =?us-ascii?Q?OXkhQOLPcUkVR25XwMUNXfKDzL+1jpWNr1XwGrYPtLb68jRlH4KqSSMkt5yR?=
 =?us-ascii?Q?Ktdbur9vj/z0KVA6nI01nmvtxvXYLsCmK16eBVhGdvXS8bZOrrvngVXPgzG2?=
 =?us-ascii?Q?/bjNjOu5HVC0KrIEgV6UJkSubFWNsZcnOZBLVFDRaFl9M1LZ+6d5CMXIvgHP?=
 =?us-ascii?Q?TfCd7ZTFprEhpw9Wv6pjWjdtWDJF/87EWZcbHrpXsh+CnC251CU/Ef0AN+kD?=
 =?us-ascii?Q?H5gKdtvWYkgiJXJrXybUf/j7d6AJVPIGwR4HCGnY7G7f8hxMJ1PrdZdjc+Zn?=
 =?us-ascii?Q?y1OvapVz8yzkLdTUORlyYYIoKZafThsOQYDUHCHeLslM?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sVsyrINIRGYnTk76TetV8vqXwpGOcgU+MSYtsFWfU5vDyIz1jBdYJZrYObGwtnOHjQUi20jFX06OJBO2Ol2O9iOyCgKG+MSyqW0y0wgW5n3pTH2sKC6iIMY2XJwBW0+ej5P0lKYQmpL11hy1ykIAYhd5LlKv1L1/aHCSYeC6hc+fRXfcazZhsuLEKC4sKzoWOyUEUir724TbeSsvUDD4NBQZM9pLvXwkilK68SNpGdiSRc+pctv5ktqbRWMexjyby2inbZFwP6f2mf0c+5x1P4dj9jhMnm+LuvMdxINbh6JK7PCvOxw+bCPbFmtRoQhcUCYtaXk9O0RL35hUJgPKHaDrVwo9o8sabPbPODCrgj7xTeZYc3UK6O0JGp0t9rPjb/qpULPpDC3EASCk/cxtjuIaHM6PNje1n5TldNLKhBeRNYFXSBok1aUcg09Dbwk1
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 19:13:23.3705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1cfd06-f900-402a-bbd8-08de6b33f53b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5846
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Feb 2026 19:13:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19513

meta-ti / na / 20260213190329.2150673-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master-lts=
prep.202602130934
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 13 Feb 2026 13:03:29 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 78ef0308a6f48d768b3e43ff7006b99d2=
f5c8871

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 1cf25aaadcef6f1429e0fe0dd2e5f9fce99c69f4

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




