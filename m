Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17A2D15D88
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 15:27:27 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17937.1764775640349485718
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 07:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ZXpcdkF5;
 spf=pass (domain: list.ti.com, ip: 52.101.201.4, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5JGM5F/YQAvF36OXrLbpvMkWkimGFCXqgQcq+PKflqb9xgJFbxxlQJOAilNQRonGJ1/C7rlJNXsY+eOK/N/8JkGYsI3MGdXpyfWC8/9rxGPU8UGlGfrWBk+y21jUUqpGW4wFM2lI5Pfqq/Q8rbYgN2sirVANOcjnJX+eOgSm3bH84FL5VGisGHEtDr3BiV8YqCDqeVLI5mPb/5zR/Cy3ZSowNp4+x4s9cyrNMJFh/dfSAZX0svYylYfRxp1hIBz57e8ykKHjs+GxN5+cw7nCSNa81vUpojG3TMcnvnQQ1UXJB7qsHXHtDyZJZNso4pigixaxOId9grrUQveGThPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9z+J/siXPeo9fhOWyCiI6x/3YOVg2rgzJQM5ZEH2SL4=;
 b=La5TMbNcuBuSeNv3QUFds55BkopPmyFtO7re/7jGiDYz9PVaeTpo1SEB17NcUZhsNJgPkjyTEWWSNyzYPOluZEXzUsvesgAlbXV97mQ+axlm/Npwh3H7n+aeAEAX0o7SBe9il0yTkawwqz/+DGM83pQUU4Jy5KE5Hw7bevfGiCo3NysXCkRaUulmrsZUCFEiWaHdS/Rz0sUMPmIuCO7bIdGOAH9o89eEnC9Y3R1wwp2aVwGiJkRPESMb7YW33tBCNSq4JiBwHlVMzBXkHsQXz2U5HIB53h+gVKYQFsVR+lcTqKkw555LCRdB78o62npB3xr7XMTBt5YL1yKxskn23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9z+J/siXPeo9fhOWyCiI6x/3YOVg2rgzJQM5ZEH2SL4=;
 b=ZXpcdkF5y3urBtB/tFXLTeWJdp/xBF0aifaKgXhTv9JfaFvCg/7zepexoJZC8YaJ0r04eTY1RDwCq3CyELANY/9i40WVWDUpzNOWikea82Z0YU12rIWFJpNAOuysmBVN1viCoQK1nwfbgFtftf55M3k0GAaTTX1w0EchLE0CuV4lYsYiELFJu2PIG7ABbZUcwmgI/hqZr9ztKoLDews2pDzMnPELalDeX4Yq4WpfZK8ybj+2LnV2tSqC0XakWk6Jz06ktWOsv+C7uIHVIP61Cx7/xqVvEZvw1FhjVxD8ccuAMAE8MpXNIOO4IJ6UcZfXcfEwwLdkY/3Ylo48xBoBIg==
Received: from BLAPR03CA0062.namprd03.prod.outlook.com (2603:10b6:208:329::7)
 by PH7PR10MB5675.namprd10.prod.outlook.com (2603:10b6:510:127::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 15:27:17 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:329:cafe::f5) by BLAPR03CA0062.outlook.office365.com
 (2603:10b6:208:329::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 15:27:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.0 via Frontend Transport; Wed, 3 Dec 2025 15:27:17 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 09:27:12 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 09:27:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 09:27:12 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B3FRC6Z029895;
	Wed, 3 Dec 2025 09:27:12 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 76A39142E22; Wed,  3 Dec 2025 09:27:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/2] linux-ti-staging: Remove unused EXTRA_DTC_ARGS from kernel args
Date: Wed, 3 Dec 2025 09:27:12 -0600
Message-ID: <20251203152712.3800318-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251203151446.3889979-1-afd@ti.com>
References: <20251203151446.3889979-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|PH7PR10MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f6a1bd-7bdb-4d20-2fce-08de3280716a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z0IEgwLW9bmQs+3f8Hrf8o9hl85NIVWea2vrNGkdqvu552bHfRwiR+X/REol?=
 =?us-ascii?Q?Sa6ZsWnWjfzpN/hS9YWHPu/F/+RpHaE2onyJTMr3/57d4LyMsV6kN2PI3mDh?=
 =?us-ascii?Q?27o2u8Tt1NBEL3jzl9hWIr1r/iA7AxiQDY3WJhK0F8PAFfv197glLVlrdswd?=
 =?us-ascii?Q?Jiewf6uSt4UYeISkFJgxjZBiD8vht8/YxylW7jMNLf+sO/JnzjWeI9iKtKez?=
 =?us-ascii?Q?W5P3Cw562ooYoUquChHCOcO87iQ/OvxjVvGbjVrG2BqUKSp5zDfU8d1VxEdK?=
 =?us-ascii?Q?2ydBB1SVHGd2kKcmhpB6EvTVG7FtoMRcylgYssI2dRYR3flHCYHQmPY/QuE4?=
 =?us-ascii?Q?JT6lNFlf2nh0DC41xylfSeucce02K5MokVtg1K6x/GIjgW40Vxf64Pg1xadL?=
 =?us-ascii?Q?DByCLtJhtSbwEjptVaEQo163QiL1n8jiULghlzw2YmK5ExjnPFUMh2C3qTu2?=
 =?us-ascii?Q?2MswjA72TZUXbFZu6EVpRJByWy68J4y/sUEQ6SEBnqcAWDJgYhbgr2HUtkA3?=
 =?us-ascii?Q?xV4bUKapNIhTrx1lWdNMdKAuzujU6nuFmo6ux4i5a4jWJ83zMlnzY1+ayNMb?=
 =?us-ascii?Q?PlD4dpoHj0atRDW8A0uNguYYJ/IfYKdsK8cQKor4nQBQFsB9/DpWjLtsiTRK?=
 =?us-ascii?Q?lQr1FHY9ISl6QFUe8chd04r1/8Y+U33Fj+EHUnnGiuys3jf5Risj8RnFLY2C?=
 =?us-ascii?Q?TznXSNtQJuo0x31hGc4whSNm/ytjNXyzFqikenm0Mb87as4stVrhmJyaI7EK?=
 =?us-ascii?Q?KK6EGQSuqTjFlExtVdhyGeQa/IPwVIRY1G1vPKqmcBaYEkPUO+PS6YXB4O7u?=
 =?us-ascii?Q?IxdF/yv+YNXzV6v3cFTEhJX2+2XBnLRfp9xvt6FLqs+luMlzsALXPuvslYl3?=
 =?us-ascii?Q?uNAkSv14a6EIaHbegXIk/glrKNBJYQgPE7IEbdjiR6PcgHZkK5wFBqdxzqj4?=
 =?us-ascii?Q?XFsuTTkYnU1If5PEZVtNFIjkSLInHdoZLxe6NOmn8x03lebw0oKu9XYsqq+7?=
 =?us-ascii?Q?ROj57CDsd1AbQ5ifo7T6uORA39yjNr/tgA1Sl0H4RiZ4IqNneQKAHVrNm2hS?=
 =?us-ascii?Q?2JfLttCjbozIKL5Cbn5euWr/uhmvBMq4wbDZT5qN3wEFOdXBXuhMKQjBd5yB?=
 =?us-ascii?Q?V3O0LSidEPUIo44G2uB9aGPKh0B9Spv6y+Y7zZmaGcaPkUqcD7VthSimr9lX?=
 =?us-ascii?Q?6/9L4/WOHnA/2uBXKEbSVncraOQtK2dUI8ZkQKDN+Oo/d4vR8eg+tOWlT4ul?=
 =?us-ascii?Q?9qsCCDgAw4/lm0efDm18VIjJRhkVYXuxUWOuzTT+sM0bey4/3UZTZ6DqCxp5?=
 =?us-ascii?Q?raMBNn2S9BdFAl27bmpH7/uHpMaOXzcrHa9yOCG0HpDG+IJk7vxZST25m1Jz?=
 =?us-ascii?Q?HVX0FElx+QHpXp0841at3+7ymNV3lXBSLw4OHiq+d0AkMh3r3SskjnBauPUv?=
 =?us-ascii?Q?Uj3Q+ac+rYPvJt4Y5CMBmEd5YGuUkiz04DnI7SO5iVx9iGfUniQpgZhyjTL6?=
 =?us-ascii?Q?3LzLAOEfMp7xKR8KnUoG5JANUARiDDYbWxHjXmlGBbiKP0U4/XXCaEl1dXl7?=
 =?us-ascii?Q?PHT0WKKSUj1vk/QwH7U=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:27:17.2066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f6a1bd-7bdb-4d20-2fce-08de3280716a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5675
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Dec 2025 15:27:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19326

meta-ti / na / 20251203151446.3889979-1-afd

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
- Patch Series: [meta-ti][master][PATCH 1/2] linux-ti-staging: Remove unuse=
d EXTRA_DTC_ARGS from kernel args
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Wed, 3 Dec 2025 09:14:45 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: c34af44cd4f69326619635ccec912b842=
22bf84c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Moteen Shah <m-shah@ti.com>
- Commit Subject: am62axx.inc: Add TPS6594 regulator and core modules to in=
itramfs image
- Commit SHA: 98dfd20aad4d065d0fd86750a9765e1535a286f3

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




