Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C80EDF027
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:18:01 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68053.1770974274185251352
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 01:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=uHhpzKnI;
 spf=pass (domain: list.ti.com, ip: 40.93.201.42, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4bJquOdYaawuXaCSFG3gIMQGHYWlFAc1IvYrVA/oKJRPP6anNTnknUqscFnL71oadDhaLXgYLyTag7lRWqF2GbCrEmbsyJ1izHle1YdZDFIAlMirrYdJt86fIqybqmJxf1QhipW23zZvqpiPKIz1+v4u6oC67pMjB88gDZ3G12cNus+VYX2dW0lBbacj8mOhlP5JMkVVCqSKvyOhavV4xf3ITAID67+zh39t03eYvLdeFTmo9MJXqcySS1L5JYdZ+hNsHy4VWCtrTiz1bQVOeTDdQ9SQT7daVSgWsDZRVSLHKjr7FD56+j7zmEUeGlbBtSk6ZSuL/JsE4O8nVtm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10LaXi+svYE9EZZdORHAPEkgCAl1fuRPQREcnaJZWn4=;
 b=nORI/ISqcS16Gw4QCLvcVdP8Zol2Q34Q13gA5EKW3G74JeltgFODWgqU2J56zCEaS+IS1S8bfY6xdow+Bf4l8WqbGGWv1kpTOTBrWcFXrl6x0+Pq/iwWjEgxt++9m0FfLSGqNE2VWkNpsaeED24DbWfY4D5IeJl0tJEqjLIR3Gae87SiGMumk6tIxJbKqhIXz+KZgE1KMCDl2e5cbgvh7gAmtGJJr0isMWOLGIBQgWaMekdlY6Hq9+Nmbaq/pDwwdWkj0v9gsWOd709p/CXxslD5lsR2+lkW5xr1UBU1/AcyxT21NDS3Zd8etXKnRF8RhNHJeyzN+w+16Bi2SMSjXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10LaXi+svYE9EZZdORHAPEkgCAl1fuRPQREcnaJZWn4=;
 b=uHhpzKnIxfCB+NRXckmJQowoLEiLIvISt9AXX9pxp3pJ9ila5fxvXKSe82Ki2wvBqRWY7Y4LHN4ddG+bycvZrgr6AhY52XyJiojSAGH3xLipwp738I9ZPmHvWRqT3yi7tD1hgcRAEZ2Llk30sahraZOuQOsFOGU4JvnuQnMJWsbDKL2jtD3h87rLVvcfJ1UqF8mRfM5yRz+F4Z4K1lpuhZDg2CE2mxCwHOCYYFOHqOS9so9+w/8Tq3ePnVVRFQ5B90J+02vLD2YJ9vCz7ikQ5lxxi+Sydfg968HfKwai2jozWP6LrDf/9VOGn8m4dz0URybiqtizY91GwWkqPs4uCA==
Received: from BN9PR03CA0933.namprd03.prod.outlook.com (2603:10b6:408:108::8)
 by DM3PPF59D9BB966.namprd10.prod.outlook.com (2603:10b6:f:fc00::c29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 09:17:51 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::4b) by BN9PR03CA0933.outlook.office365.com
 (2603:10b6:408:108::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Fri,
 13 Feb 2026 09:17:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 09:17:48 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 03:17:33 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Feb
 2026 03:17:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Feb 2026 03:17:33 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D9HXSS504919;
	Fri, 13 Feb 2026 03:17:33 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2ED4013F52A; Fri, 13 Feb 2026 03:17:33 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202602130100
Date: Fri, 13 Feb 2026 03:17:33 -0600
Message-ID: <20260213091733.3199257-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260213090535.1798480-1-lcpdbld@list.ti.com>
References: <20260213090535.1798480-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DM3PPF59D9BB966:EE_
X-MS-Office365-Filtering-Correlation-Id: dc60f4d3-39e3-44b0-5b0d-08de6ae0c1da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RMzhPAZUvW4jPU3sUWLK2q5tbNv8IotVlpkjO5KIF5HVItRZMmqqsypNevhE?=
 =?us-ascii?Q?QOo1HyhwRUUQkgOjMbHjJ5XD1LlafvogoJCwAQ6AQO5n5w1OhcEO+3bAXxyD?=
 =?us-ascii?Q?XVOwJq86BYP2NofTp2E3alhsKUUcqn98M2bgolAdsjcdfxtxWkOkI304sAhO?=
 =?us-ascii?Q?AZjfllgIbYlSL0mCe7bGBp6KG7ZANG5//BMpyWBm7P7/iO22xl4dt2YpAZzt?=
 =?us-ascii?Q?71ZWwFMwBJN7MGHNEsyIMywD1dbEGo1lhTaOsKzxfiU3kA+g2gceHeDLtLle?=
 =?us-ascii?Q?z2Yet+ehrma2qqacBv8zFwx9wbu3/0xZzu3/o76Nyv75r+Zpf8CFl1JC6giG?=
 =?us-ascii?Q?tuetts87vVVSQpgZgYCDw4I9uZA5Jc1fKCXP9OLfpOFD80WD/KyZNfXdR2nu?=
 =?us-ascii?Q?DwiRre2exTNTFLZFUmwHHmjTSiOcRVX8sIUXf4RI7nHNy3qT4xaGvpw9vf4n?=
 =?us-ascii?Q?uCz+/bZvA78Pp/iO20+pqnvPISN6CMXookf76EqPo3TNOf+Q5A/6bEujgI4O?=
 =?us-ascii?Q?VrjogflJPhxwUZc07FaAtwDPEz+70poPDT+J4AZtv1x5HJC29nrGD3wLl6X4?=
 =?us-ascii?Q?tThVmlQsNpyjMCwU2tUP2kVyvuDQqFFZoaukBN7BniSZzc7HrU/azZxBEwYa?=
 =?us-ascii?Q?owDSjQbqjFGtN3rxrG29lYusPXB6ovZSFK5Lt7ifnXYGxWO3GCIGZGbygkqz?=
 =?us-ascii?Q?8QuFjzpS1uoTVghf/seg6kt8AP4+W7y5od/MQRbMraRSxTmEfNUYrnvqbcF3?=
 =?us-ascii?Q?rvY+PKbxS3ie7yPQYWtF42/hrTh7y2irprD+MhRHC5JYCx606mXJ55RgIw0z?=
 =?us-ascii?Q?BFlzdu7Y5khKE3NZAvlcmvTiM4/bffSK5NVKyjsa8QlHnuY4E26P3HhS0ifL?=
 =?us-ascii?Q?HRgvjf4blMBMYyXs/QRIwwE7VidOsSVybt0oEGxUSXHXfg/xY14r+Zcr4Wh/?=
 =?us-ascii?Q?+MPLG+XwxZ6LTs3/Q0zqa95opGVlUWIG39CDUTxRJfoB7ywNG8B5EqBgSiUC?=
 =?us-ascii?Q?QFWFgbaDVCmbPSiFv2ikZxa+7XYZqpu5iSbUgBc/oDokARi8+0GZHx3Ebb3U?=
 =?us-ascii?Q?Ver/K+okN33a0bhgc+828PrtGgtRcqZ6VH+QviwKoWkJhO9iHyFLRgMkJzAY?=
 =?us-ascii?Q?OqX1h6kWr4JFi5QgiKkTdivH8TZF1XcPEK3YtN5KDv6K0O9Xpiu1JOtxxMk/?=
 =?us-ascii?Q?0Ay1AWOTMcK8uAPwtG4FEe+lW+PjK76L4u/nN2SG+IPSwi0VWKvSn/Y8eMbi?=
 =?us-ascii?Q?neUd3TbmDRJj+ed6o+Rl52A01bGSwZwvTS2lodb55nnAfrGcuCMN0G6vpCJ+?=
 =?us-ascii?Q?2OkeWj5w0sCaGPe/3cTj3godA6l1ys8l6d1AojkXqw7jb26+5gi/zQsjxSHh?=
 =?us-ascii?Q?lamb1Xl4BsHzgtovunHrW2rTqj8WrXNnDhbsw9PxdpaMS8i5p03g5C7LLWWc?=
 =?us-ascii?Q?1diJh/scNsHh3MpER/VKQcAvRO0nIdtpfubSY9+0LoyVzpPZWMR12Z9ZsvPr?=
 =?us-ascii?Q?YFGmZgMKtXP2WunOrYfQbUaH41tl4VIHHSgg0bzf/JBYWA8F0ZBAlQrWcgO6?=
 =?us-ascii?Q?kuE2FOuX95iIR+JsL17HN7McFq+CPEmMQM6yqTCSR5Wdhwmibh7KiifB8Njw?=
 =?us-ascii?Q?hjVlLKMgyW3TSrZ9Ugm6F2s7Jt+JAq4zvAKzxa3gM4hJ?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MdVRemdh6flwfWVuO5fWELLy2saaynTntEcAnXHxqsQYHwi532XV7rzNYCmMBj3bbLRutoKC3o6QKSys/S2CNs8OYee4bqrStklFEIr0EPge0ib24KsdvGSz7jbhd1ZHzQpY6dnVJeSt4jFAYskwm2PVisZSmmicqjHVPvLbPHwpw+6+xVywS/h19eIQR4h3MGQMkmd4OOCXLCBA8QxJcp+1kJkvmti24n7BY40s4yyme5jAM2IXfLWbE8J+oOBskXrhZ9B+2Hp4Wg+ocF1dxIjJxrxymtbU2Rh69VHg2OxbBJzNgbtQKzTyjxALvqGPXkpC4AtUeFuoCA8BQ/k9U/OBid97ahrnSzjgwM57eg+GtkoTYa/ZgZ4LJ0joE5ezxhRgEiHawBgoqdnXjoEG78TiV7kD7sJA4h/qACrf7WOsQ520kdQBEH41OJhrAvK4
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:17:48.9580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc60f4d3-39e3-44b0-5b0d-08de6ae0c1da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF59D9BB966
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:18:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19511

meta-ti / na / 20260213090535.1798480-1-lcpdbld

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
602130100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 13 Feb 2026 03:05:35 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b0a5570293dac8db477cafb2a1353e0c2=
7c0acd6

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: fc4156453bf618687af0c818036156bbaac855a5

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




