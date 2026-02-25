Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB15EF5544D
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 03:02:58 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37726.1771988577666795908
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 19:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ml8svI8s;
 spf=pass (domain: list.ti.com, ip: 52.101.53.21, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4Q/k+/iU0mWYYyMuFObkFqKcfaPIur0U1YVJSHUfcH/o/SAKQhapcITAI1Oa+fUWRBxoo2Vi1tuw0fpT1vU47MXUaLxieHJEuoTmsEuP0nN0ssxO8HZWnQUcl3FD6Y2gTS4PuvQG9w+v69EkKF8ynEpSHPlTQF9l0ck3DVtx2WSqV03hser0cBdSMUJStR3tYJjr7lllTOeHolbPLN5JkVs2R3W4KQIRTC2HWF9hrjMKrDCSHOD4ZuHKFRH3JXsPcM2qMDiQqfEpzI8N6V9FVshX/EBp1CgmGTTrv6oXaHMVw1c3pKHKvyMA9UkOrN1bq2bEXWEFLymfGnTKFP0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ud1WR5GQF9L+FiwI1zy2dQPS4L0HBO23hfok1qOq+H0=;
 b=nNGoxwYaytG2DooDg1CT7KLdJhuA0hxG6Ibpj/Csd9AQIz7cgSXFZuTG16Zulurg2MlE9ZXNqGBuM2zq8YzDdVHN7bT9uUq77aX+CIytyaPbdHrU9h97Pqtv79aYowfy1DEHCrVrIF3qZM3bwde95OqeWpks0msfpPIDHdSMNvNIgLoNb3wfP6hk57jSbXEf5GXVCxxTsVs5RKdXD7/8byhKDJY2anl4R9ANLNoSPhIfjgnSIMumr/FhOSZWBE8SC7fiMRs6y7U1OBpUy7UqUAiEgWY1+htAHQFoyUJoHJg8AqZW4Rh7G3E6xb14H+wo3T5s20+dZ//5d8GcHPCujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ud1WR5GQF9L+FiwI1zy2dQPS4L0HBO23hfok1qOq+H0=;
 b=ml8svI8sEPJCki1lSc7NUe3PDj71smEnHpUmzVUm9T2OiNBdTs6Iu5v+olRTgAB+18OMQtlztdOO5AJqlPIpbYrdnFjXYAh9ZEHMY4322A9pgnSNqQH8E8Uu4d+of3jUSDFpzID3bJRz4CD6BEwtny/7xDv6cb6fdqlmU8mM7PGsa7LJACuVeirwuZOOtc7Q8hoyW2MaWJIGjTpDRBvcafN/d+jtllQpOwy0gegIn2fsHsaTXM8wJV2BIqnmaGljM339X37iZ+1O3ULRpnzrCRFBAfofqf9hKMaRvrq/Yh2AmTbiYt4hxqu54HEp+OAnJ+BXi/qd2kNRKkhP7FoPZA==
Received: from CH0PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:76::23)
 by PH7PR10MB7107.namprd10.prod.outlook.com (2603:10b6:510:27a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 03:02:54 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::17) by CH0PR04CA0018.outlook.office365.com
 (2603:10b6:610:76::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 03:02:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 03:02:52 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 21:02:51 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 21:02:51 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 21:02:51 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P32p1C529881;
	Tue, 24 Feb 2026 21:02:51 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 826442A5B; Tue, 24 Feb 2026 21:02:51 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/4 v2] ti-rpmsg-char: Set DISABLE_STATIC = ""
Date: Tue, 24 Feb 2026 21:02:51 -0600
Message-ID: <20260225030251.2622444-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260225025155.2981821-1-reatmon@ti.com>
References: <20260225025155.2981821-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|PH7PR10MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee39246-b867-46da-b078-08de741a5df9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|34070700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jtPEwLiAKiHXziioo6lWTPaI/yeDL6L4eGKfdHaEDpA+pvcH+c/CAkuYeHil?=
 =?us-ascii?Q?egt+XlInAc2UOWjjeCJQ/h5nUYMi0pF1gDXf+p1elwf2fNe/pKpmTJBUn2aB?=
 =?us-ascii?Q?cck/ysvpEgF22zLycPJrUa9ffaQ442s3wn9/czgNYsksHbdZvf0O3FkEJbJu?=
 =?us-ascii?Q?+gvf0F2WfSVAkC/0/GjqYw8upr0FjjIanZkrE5EAmDzirZlJVLF1XwnhVG2Z?=
 =?us-ascii?Q?ZYT534BvRQ43Ng02Z8RZ7XvskxEd9LNQn7CHoDJ/ira3oRf9njOm/L7DiaBY?=
 =?us-ascii?Q?71S1toufxr6RrMiQf3MiqTIGxu9HfJgHf+b3jv6f1SKX1peaPLcJwl6EVnjw?=
 =?us-ascii?Q?TKkKlqqWr5JXOIYPesUFZCtmU9cHYMy1HAmCA99G26G0hZfu+Xgvue9ZojFs?=
 =?us-ascii?Q?zXCcNxf88W22iH4DpLpVxSaD/DJ4znjHZlp8N62IfgJtlac9gpDRq85G29JD?=
 =?us-ascii?Q?7wqVgm6NDMehMRM5Hp+p2oFPvffCqKS9pJO9K9AN19RdhhTKm/QFTBX1Or0j?=
 =?us-ascii?Q?ejVNGKEUrlWlrz/i2HfiOE0sbiAiInGOimDuGGhSElNWwQphwMjM+A7vGRjb?=
 =?us-ascii?Q?57HZAYvPocoWYXMmxXu+wmHvOUVf9liOu89gCl3iOlfs1jamxBBnyGbkG/jR?=
 =?us-ascii?Q?jjw8IZcVv/nXSci61PtM25YdZvb1r+ROt8G4RVmffbmyqDrczqxjNQZa47YY?=
 =?us-ascii?Q?Y+XGqINkIjyHBg6Cr4GkIb8JLGCr0fknnU76qSD3FkhlZ9Gm6t6SUgWqzu1F?=
 =?us-ascii?Q?hVwwTv0knrQWCtCUnaB8cEh5/EWlvTABvuOIDFpeHUF3Buk3jIZwRrCHbMLR?=
 =?us-ascii?Q?K+0Wiq8V799eTGFPIiz44tW0pXfFfSPEfLnXq7P2YaVl8QH80mvpvPmruf+Z?=
 =?us-ascii?Q?5PaCOhmPOoerrNmG2WmOuQhieg5Dcilqaa23FE5sNR9+VTMT305BQaIggkru?=
 =?us-ascii?Q?8U6FigqgF89TAAnF4xCk9mC6keMn16e6l8Yiy2TNKdMxtlqM8qkcmZ7ENcii?=
 =?us-ascii?Q?UdKkQ3sTVfVJwvgZSdRwyIviK+OEBExGf7FiDZ8eJ0sf8Z6X62uMqbfRWYBE?=
 =?us-ascii?Q?zUQFdxCudWmizIc9kWMLeIL/sfDn6QzH2PjdpZoY4mkWB1pgrcjmztJ+cr89?=
 =?us-ascii?Q?5M58K/p2o3jEGo7tXB3K79PHO6g1UM+e9HvZxT16wXT6ghhjH1a6ivCHoq0e?=
 =?us-ascii?Q?mSnoAN5inxn6K7K7JsPEtLjt2mjr8VVfwPk8x3iDUL67ryWKsFjUdzfA0Reb?=
 =?us-ascii?Q?/SSHRjHtIRFpJQCYD7UY8U4Z1mWjCQ5nTiSUkzNaw15civUyk0IZ06W4GQwL?=
 =?us-ascii?Q?2ha7O09am+1wMchzKuh9ldmvtVkqjorZncmoOQUdv+OnMPszD0CkM33ktl71?=
 =?us-ascii?Q?gRuHyKfaWGLyMbODjlBpngAecAoIVgwccokcTCox86aGHB1j3ES0w2JvPyfG?=
 =?us-ascii?Q?2O78yyPkZ2BooDfXiN2SEnaezz66NWzrqp01Y75e+Xy40GRZgx+X4sln7Hli?=
 =?us-ascii?Q?3zKYD0FGiEE+ujtESdQ3pBMI+bL3avUS/3NVhnlM2iia0P/z8ic0TC7Nz8no?=
 =?us-ascii?Q?i81+tO1E1Cymb2zzWwCGEUbT+8mDIfBRe8n6Y9kgS9xCVULKNFbFJtB73tpx?=
 =?us-ascii?Q?3W/jODd/6U38YPk7w1hN3Ko5q+sLYOsaUW7DPPlNF0M1?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(34070700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9wXB6H/yGXPSwOJIUcESpVy/3EjDqt3HIeNL7eYOHB0JxjxTG70+gi3EJd0+apPyrakJ5ae2BR1vjgZEvB1F5lCEa0JZjNgaB8yAhmv+53NtQJmyACbA+/eelSVoaQb5OyJIZ62g1lh5inz/dhOumH7CCePryCzfbNp/WVlcDG1Ldc/U+Ekf+g7cx3vb7cEymQGrkwPm/cOsv7KupiQxpEqrfCasm0Nma5WI/G2Hn5v1hNNMHDQua195qQI70SayWWQPtaxqVxj5uFLjsTWOQFinclyEDi8OKoBFD35M61h4SZkjJ0S3r5dc2Thg2b+9zpXgv9AU/BHiHhMFRpm3pHo6PJlDhFS9icx0RI14CkaCQW7VfA3HhIL64L+cVfexqbzbaEyz5TFmn/1yw8+NidaP3aIxlCzU0l5ZWm3a4g0xdcwB3e8ai09cIBf/RhzY
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 03:02:52.6747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee39246-b867-46da-b078-08de741a5df9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7107
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 03:02:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19605

meta-ti / na / 20260225025155.2981821-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH 1/4 v2] ti-rpmsg-char: Set DISABLE_=
STATIC =3D ""
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 24 Feb 2026 20:51:52 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1cd812d2fa0f337818a51c3d0204dd074=
1048fef

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602241800
- Commit SHA: 4cce297bca77323fbc8ba600e7290a9759397ad2

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




