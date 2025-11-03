Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E47CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 18:45:35 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5235.1762195534304445136
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 10:45:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=XF1PUbBp;
 spf=pass (domain: list.ti.com, ip: 40.107.209.32, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkUSlgX+jDP+le3W330undd7oRK5HbDWKzQ07MR3KwrJJT4+fMH5/+FwRck1cTFIpSZFZsSBG4kKpX3Mjsgg2SO1KaJm1DoT8QAG5XrOmYtebvtabETAI/szfB69tOfRFCgS9BDZOKumbX3mS497MbMoPdkBCsqheL5J22W46f3HOPDlCA1Ue5FVqK9qiAawdM3+bTQIA8i2NAPNLerw3+OhyIhCIybwFcyJCDFE/HAbeMNEwhP6r3VtcvHgq2Jugtouyxljv8Uo1WEpOaI1L6A/ljHI6LAMV9O4Y5syGdvlRHwGT0eJDW65OYs6IAADJX+NxLKFWvEnwnF8hpGlYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4+DKMe7jV3jQArditYk4pFeL2yJNdlQwqqLaJ7OVgo=;
 b=vBz/ctR0xlP4LjcyTXM7JaNruZusXh5VQBqG2Jt6kMssWLL6o8CwY6V7tJqBOaEXyYha4uuaGgDjnKonA47NJgmGmHIJ1o01Cq8clf9NhxKJVnLoCFi+EsquESa26eDK/tFQOM6Irc+qfJq+AIyy0zvi5KuBIx/5tL1HKj7T04gnI6qTHB6wbe9zXfRh8i8JcZohR3nIXyC2ASPVNJcwdTkrbvk02R/j3sHg5zlFsO9vuM4+58PIg5Tmg1VL3filcsbhsgsRiVznB+9xWyxW0Yw2y+YR3glh7hq/v1JtJm0/hLM42IbaxcJeQcFNUQwHkK+Rx/mQ6Ywr/DU21lI7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4+DKMe7jV3jQArditYk4pFeL2yJNdlQwqqLaJ7OVgo=;
 b=XF1PUbBp/HXnkYdM4/7s6W3dU/kCBtLf4SIlNUeV4X4TET6l8vBwEucTxxoKqeQ+fmfSmT21TZQuR1IYgpIyPiTcHwuRyYDU8N9l4XPAIDNqOTvw+x1FU+lzHXBih1cw8URJ6trXeCk9Mg3gB09HtTLJFMNLhLd5h9qksEtxQiC7YxxSHiwZnZ4I1eJ9hCqBLBE3UrZqGtoJpTkRNJbJ1xe67Ecy3ZDBR2+Xqs6A9LNe8iJNuQ9vcJgmNrYnGfFfjDMg84jus3RwF5sqaheBoY0d2CRtemZPnLsB4UjlO9bwheyn79dApKuM34JXGRuA9O4VGcn0haXOKmXjR/V1aA==
Received: from CH0PR13CA0025.namprd13.prod.outlook.com (2603:10b6:610:b1::30)
 by MW5PR10MB5666.namprd10.prod.outlook.com (2603:10b6:303:19b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 18:45:27 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::ed) by CH0PR13CA0025.outlook.office365.com
 (2603:10b6:610:b1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 18:45:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 18:45:24 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 12:45:16 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 3 Nov
 2025 12:45:15 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 3 Nov 2025 12:45:15 -0600
Received: from fllvdckhpci032.itg.ti.com (fllvdckhpci032.itg.ti.com [10.64.72.43])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A3IjFCm2413109;
	Mon, 3 Nov 2025 12:45:15 -0600
Received: by fllvdckhpci032.itg.ti.com (Postfix, from userid 60899)
	id A941D18DC34; Mon,  3 Nov 2025 12:45:15 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [master][PATCH] packagegroup-ti-core-initramfs: move cifs-utils to dynamic-layers
Date: Mon, 3 Nov 2025 12:45:15 -0600
Message-ID: <20251103184515.1898559-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251103184043.3394912-1-denis@denix.org>
References: <20251103184043.3394912-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|MW5PR10MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c52e5e7-90e5-4df0-59d2-08de1b092689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SEmpnQT2gQ4q/0ZgsOnNI2JV6ACV1WFN2zNzTo7yuWCMqytFBq0AaPwBG7VH?=
 =?us-ascii?Q?l1Lhw3EB0HTz+Z/N8bw2a4jXfcLw8V5cdiMAw+79l7BWE0RDEXKTjpOYEY8+?=
 =?us-ascii?Q?5bQf7N1W/p1MVV3GtAdG84U3D3fB4ASV4uH1SzCIyv8UcYJc06UfuBUPfFYm?=
 =?us-ascii?Q?CKxSj/3kRbx8/tKvvPCFjhqSaQyrBGEknYfJASNoH0DUzhqNwOSBU1Uya4rz?=
 =?us-ascii?Q?YIn5bNyiBUF7wjD3HRTbfeJRRC6cK6ARL/PNJBRC6QnHoF4JHC+S0hyPrscE?=
 =?us-ascii?Q?411MOoVD94VsK3jn4NdAzxBfF4wf4DEiOmdU4T95y5eYFxH7J5pptZDlTDH9?=
 =?us-ascii?Q?TD0LXm4vmkjqBs6l+C0+eeTI4mXreisE6u3bzn8guT3tvPmvDmT48PG6CYpQ?=
 =?us-ascii?Q?hwKHzvFhyx2hql8c/Evf1VhjtEYUoBXMWTpfgu9kXo7Aw09/edtko/sD1crb?=
 =?us-ascii?Q?AT5JytOfmU/H6f45uACC+kcND8DvAUvUd0SADSeCf7G5uP1l8WKAj9H5/DIq?=
 =?us-ascii?Q?KZPmDFDXKXiwRatUkr3rwWvdiE6p16qojin/OSmOas5xj4Q1NiNoVEIpoMvS?=
 =?us-ascii?Q?gKkZD5v5htKQXm2p/u3Nfg3JP3yEBa1t8Pv+mzXhDUFV3lF/nWWSc8BfYMFj?=
 =?us-ascii?Q?7eWH/chEBuJGs3QIEPRaDsKdvFMvHPBsvGOTkYCHc6O44e7DIDzcVwZ8hCBZ?=
 =?us-ascii?Q?I6c2Qkeq9u/+gbBzM22LcllZSWHK/ZMsK77fs4DSuLG0qZBZi3LVM1QJ7ENo?=
 =?us-ascii?Q?NAa+9c3wqokYOu7FrB7t3JbhqdfJOw+OLJ6PIyWHidHHqS9bEhlkkKMIMTbH?=
 =?us-ascii?Q?k8Or07VvsCB3rrTpZ5yDNxO3Q82OZPwDUs/5Yjh+gwzFnq5sOlmrhHKMPx9R?=
 =?us-ascii?Q?wOW9aeiAysn654QfmxvP5x1IW3czeZLMqQLGiWL/OrqirQul9O1c0q1glQUf?=
 =?us-ascii?Q?WS9genp3DTzB0NzksqRkmKUapzyyNdcO44kelfqAhz2xm1L0n0RmPhezw3zm?=
 =?us-ascii?Q?2KChI5edtTp2YzRxfsVA06m8Sph7+MID/9MTGzwXI77A7op+XjBDiSzHwpFu?=
 =?us-ascii?Q?ZHjcgEXQKStDlsIBq43t1A62b4EdWby+2F2unWIra03GU//uaDKWCbrJlxYo?=
 =?us-ascii?Q?2Fgva5mF0wse2Ms+lc6fGSKpgYKkSZkbqV0v6R+IYN77z44s6QP4bSSpiOA0?=
 =?us-ascii?Q?PXQhGeYCTo1G2dLRWNtaiipUC+HfmE3nIgZ0GiR3AlAsy5z+XDBM8C8se30n?=
 =?us-ascii?Q?Dl4/RTy4DKuhG7yqdq7OXMGSidBBLJGDlKBmfgFAxTWgX5sXziLeM//+XdYj?=
 =?us-ascii?Q?A4ZY5llNhftmOarigrgWUJUcKBf5IAM5q3WUxvd7kZyQXgCpqKqxiDW2aRJJ?=
 =?us-ascii?Q?52aXf5amjxiUOI3TNR9V4kedNPyJ4+Nmq/kuw8Pj1xPWUj6aNqsTRCwW1oNO?=
 =?us-ascii?Q?WdxfYz9VKaRrIYBOLJCC9flBRDmCgwuMteE6lPTavFXMTJmmVtZMK1TFD18u?=
 =?us-ascii?Q?9yZmm0CIkdq2hy7bKjMrAUVB+IJCIm1zbISPlH2+K+EuVbhtjOoaOMUQKPmr?=
 =?us-ascii?Q?Mvvh1XsCSXkaObqihig=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:45:24.7355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c52e5e7-90e5-4df0-59d2-08de1b092689
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5666
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Nov 2025 18:45:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19220

meta-ti / na / 20251103184043.3394912-1-denis

PRC Results: FAIL

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
- Patch Series: [master][PATCH] packagegroup-ti-core-initramfs: move cifs-u=
tils to dynamic-layers
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Mon,  3 Nov 2025 13:40:42 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c6e9666c9ec7cc522ca4807ebfd67b9a9=
e48a022

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-core-initramfs: Set IMAGE_OVERHEAD_FACTOR
- Commit SHA: dec3f236ac32ab2ea80e6d0640fc38ad26dbe5da

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compl=
iant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/initramfs/=
packagegroup-ti-core-initramfs.bbappend
   =20
   =20
    Code Summary
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   =20
    GUARD-1
    -------------------------------------------
      To maintain Yocto Compatibility, we need to add a guard around the
      .bbappend files for upstream recipes.  In the event that a layer
      is simply included in a build, it should not make changes to the
      recipe in a way that breaks the upstream recipe from doing what it
      sets out to do.  In order for our .bbappends to actually make
      changes, we need to gate them behind building something either the
      Arago distribution or building a TI machine.




