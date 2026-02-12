Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7492BEDF043
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 05:50:52 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39218.1770875442189041937
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 21:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=BnRQC4Cu;
 spf=pass (domain: list.ti.com, ip: 52.101.85.20, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCx+ynobLm5HUmKE52NLqIZCp4rfBiKI9PSoEbHxuCw6sLKFRALSZonkl32S8ywjjEBSbWKqk+UU0m+XJ5EoRYz2oWLA5to6rW/MAcbcONyAAjRXbxsEMZ/RS2Gj5mdMbshtcJw75Bx657z7d7TS3fQzvXlka+Vo1VUG4o8Zc4iMUbovJSxTAjtygI0IghNNXM7KsA7M4JKmqpzyM94eKp2x7WoWz5VICNmjZE8/qUA2k8g37ymFMyA3pdGxoRpcBT8e9xDYvCpayS5TID188G30Sr9C4tNHHb+Co1zmp3sHXYIJvNJ9uhXTJEztQzOCm+MY6G2vmBEVxiJQLlJdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeOLo8N07QNwaX9C34syXWLdyCYJX6MC1mHdthA/uFM=;
 b=lrz5yC6bfHgfNHSpP0UsFH3rJUi4FiET/evcw8bRcM1eXGTyf+woIXtZuWOY0faZlZF7O2iLTIa+/lTQFmrPUJ9cRuArIXw1Seo6Cj2fwDiuZRNU3MBbuOcYfIo0g2GQuLcEkQ0tNrWgwFgZJJvM1N9RfA7I6cV2vKwM5YFx0sjD1Lb7WRQm0AWuRhYwV3/fpAF7//w6gEytvQ4y1I/RZRKWfa4KA1kfivBc4Ain6uVvxCpykdtdJoUvxNpdZ7x/j2NpjrgjTflSrqm9ZXM8LFVCqjkGtfqS1qW4KV+UoVz+6bzQDwLd8pXzFaazoeLyBVaBVaZATAetQLJCQBptkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeOLo8N07QNwaX9C34syXWLdyCYJX6MC1mHdthA/uFM=;
 b=BnRQC4CunmhysCeLHYBd3sjcwOazzAAVKO5kAxiz6nAkr5Ju/gvjFU9DbbywbAprm0Ct72h8FVY/chliS0qEl+/TyDt2r4ZPJq/gJyK6w47ZYnQdlyE9N2rG/oPuIWklG5cT1dEFvgMv7DtpeUjqKTco8ymeu/nb68DWTgVMYDJsmGA9WCIdKS8+yj7yTW9nVeSO+4+WXx57xaEPjEwUbg4MzrqKJ4tlsVezg21RA1gX2xrutBuH8zbLL4Dvvf/XXZtyZ4HA7LkRKlAgNRmISSvkVNPzQ3inTUVbv/0TuHSx0zIkYXqyqFQvOvedeCUi3vXgrd0sCG4Sk9agDhIFAQ==
Received: from DSZP220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::13) by
 PH0PR10MB997782.namprd10.prod.outlook.com (2603:10b6:510:3b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 05:50:40 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:280:cafe::e7) by DSZP220CA0003.outlook.office365.com
 (2603:10b6:5:280::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Thu,
 12 Feb 2026 05:50:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 05:50:38 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 23:50:35 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 23:50:35 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 23:50:35 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61C5oZMI3685867;
	Wed, 11 Feb 2026 23:50:35 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4918A9ACF4; Wed, 11 Feb 2026 23:50:35 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Manorit Chawdhry <m-chawdhry@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Aniket
 Limaye" <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, Shiva Tripathi
	<s-tripathi1@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v2] optee: Update to 4.9.0 tag
Date: Wed, 11 Feb 2026 23:50:35 -0600
Message-ID: <20260212055035.3145287-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260212053711.4061247-1-m-chawdhry@ti.com>
References: <20260212053711.4061247-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|PH0PR10MB997782:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd6c361-9820-4332-8e20-08de69faa690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?52DnNVy8sv8RN2cPrul0fO4hxSGKpF2pPFRiiJppg/Pr7/QuIOYRbwUPDQIz?=
 =?us-ascii?Q?qGngqs1DKM1HQRKz3SHnzZ+EXz2nl7s8nmI8hk1RrqcXD+j9QuuBwiCoTcwt?=
 =?us-ascii?Q?0SRAIMuNbLjGlbCo+5ADMcl80DSLBjGM8MqrLSOYs2pAGZ8BFktnA0ZtFWmB?=
 =?us-ascii?Q?nLbzS3aoEReys+YrnUg5+F0fvtq7Lzx0i2LqaKRTIiJgux6U1fL3xaUXNOh/?=
 =?us-ascii?Q?lfiKfYARnIsV3/5LYHGYnpWEwU7HxyIwXfUwTxtwviSXgCgzuNK23Kk8ysHt?=
 =?us-ascii?Q?vT4vzUSWYoyBgt8TTeX1YiE9RDXET09wguPjmtM0XqXCdyTBwO8wOsUif1tF?=
 =?us-ascii?Q?q3nucRM3CnoeZOxEWEFkN86OW1zEa06wIOLtSG3yiU793/G4t8SOIGzK5GrJ?=
 =?us-ascii?Q?/XCWcphBxqieY5TnoRVE19sp+tz3Dx/SNJvl1jZOb4ZGzFKS1servtvV9gD6?=
 =?us-ascii?Q?bsvLeHboeWm8dFbmn4N7WBjQL7qEpza3GaSuPjQcRnD6QHL5gGptTMhqj/On?=
 =?us-ascii?Q?dQJWxkTgAgUgmGnaTOrpqQnc58DwQtZx8r70y0RejClc61BkTbgNCR5bTrWU?=
 =?us-ascii?Q?FCx+EIh5U4YXbwPVgEcgQwFC2HCdZSnN9DV9ySNTmqOTK0CSMNe7AQoqjNBr?=
 =?us-ascii?Q?Yvw+XoxlWntjq6vl7RSKYNh5vIS53GSR9IYeUnt+T0yNZ03mLgu4MlxeUFB8?=
 =?us-ascii?Q?r0zcIsb/FDem4ub6XlLC1sBE+VION21edS/tpv/MEt8//DJfgT1+cIaUXaX8?=
 =?us-ascii?Q?ogakulkUig58F3TYn/XibkWCcXs5HXTeiYizFYeVk1RsBDy0GkX2vTAsbIQF?=
 =?us-ascii?Q?dxdvaQwYvVCoGN/6JTs5O8w6hGut6piic0jx0+FlaVPsM7lrJ8A/ubG8UIUM?=
 =?us-ascii?Q?N1vh842y390MIGC7AjXmm8ckQ8NLps0dWPttigL5btwemYjL4lBUDsN01k3m?=
 =?us-ascii?Q?jXH0jxQNvQPN8PltPr1OduxLMEtHJOFp2z34YqWNwfqyQwF61Wlcjyp13NdL?=
 =?us-ascii?Q?TJWt2biYOeKkwjRHuwjM6W0iOCduZ5MCmG9E0CpLNJnPj15L5zAQ+cDa6jQz?=
 =?us-ascii?Q?HCGDvlR4oXR/3XdsTxHVnwkyxYheZ7tOmHPr3yvkt9u2pq6HFRKIbPcztu/6?=
 =?us-ascii?Q?JLw9GSJSH7Md6IdlcPbqaCwovYga98Z5k4PR4uGD/hqzBO6QzDxaK8AD+Hhb?=
 =?us-ascii?Q?HkT9YwhvRup8xboUajerojf1EIgerjbqqzjgenMmkLXz3DFdI7mRziFI4t10?=
 =?us-ascii?Q?qsMNvcp4J1yPlATIG/HNZcvYqf0WSZ3aUMabLfjM55dkVssBEYeYDcyY9aZy?=
 =?us-ascii?Q?YwsOMdE9qv1VtvpikiCYpy31opVyZQAJB1P9+vw007UBvhsQAJobufbvom2y?=
 =?us-ascii?Q?dI72P+cw54tRAqd9/vuvNKJapz1vAVlSKXrKSR4zNoIkDzrCmQP6Hk/xkpXj?=
 =?us-ascii?Q?gyfFNxHIiOOxGSA+xq+sL34WVECUPYTf4vFcXAHyd9GKQAwllKEEQGwAKLq4?=
 =?us-ascii?Q?C0tftt1fUf5txsiHM77fr9xG/2uCZdzFIogtj6VdrF0/oRjJ5PfKu+17VcUK?=
 =?us-ascii?Q?8YJR6gfj9rPLYGetEEJ6A1zXWuWV+OVGVfp5ouFmps/60IsOxwBevRWrwieZ?=
 =?us-ascii?Q?A0SRlUQ5MRSQ9l75IW55iBpq7Ihq5M0icJhfMxmnanslaa3hgZ0AsogcN4si?=
 =?us-ascii?Q?5dh9tQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fJhmt3eGZxO+Yb9gVQU02TU94FKxXHVHDk6gfbC3rZkXIuzyoPIvtQptQM9p2pmN5HyMgzdVBs+S2XTv7PNGtGIPxshSOv7EqjxwA6MIqZrIyav66yS9m/bs4zzbmEEhSpT2C1glDUpztx6T4U0ijLHGbDeJBbFfDiZp0FXLLqqapgWt56oMtm4srr99bAUPDRODoec0vmf13kvpqZf47u97HCPSU4C6h+KDY9iXZ742LwULBj9KWgx+t8sxv8D6v7hMEwX9s1pKymBtPzyQQP87mqn02+mwclg0eiKz2TLrhNUFbcioS/FWmJ1inp3r+GaOyn/Pm6CvhKTLzKtth1q2nsPmwW5NDUDimztz9X+ZaiNTJqrbxpRczjdpdc+6Ow7PHOdmYMQcExYYYycZK7fu8KCQoduLSGnCmXbVyDEFiaQKh8esMx0XPkCZOvC9
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 05:50:38.9423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd6c361-9820-4332-8e20-08de69faa690
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997782
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 05:50:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19499

meta-ti / na / 20260212053711.4061247-1-m-chawdhry

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
- Patch Series: [meta-ti][scarthgap][PATCH v2] optee: Update to 4.9.0 tag
- Submitter: From: Manorit Chawdhry <m-chawdhry@ti.com>
-From: Prasanth Babu Mantena <p-mantena@ti.com>
- Date: Date: Thu, 12 Feb 2026 11:07:11 +0530
-Date: Mon, 3 Nov 2025 12:42:57 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a74200bf97bd01f0d8947608b89c9bcbe=
48732a5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202601300920
- Commit SHA: 5258ee2f903d8f1e0cbcb9d01488d08b57314009

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




