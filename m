Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54229E668A5
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 22:56:13 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28255.1766184971787051450
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Dec 2025 14:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=kvj75Wkk;
 spf=pass (domain: list.ti.com, ip: 40.93.201.63, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlhmHOpt2egTVEshbDK5/RlUXVXFRsQLqnpc6rogetb+kYeUSi65ujhYK08UhdKAFMTy8Cmtoa8ZrOHSe4Ik72dtjZypET7xMT8lh9t+t2gOWWNBi8z5k1vM0KTWMx7UZ+vDCegI/DsMJydgURgj+T73g679t62f+q7xgsyZgSr/vV1PN5XgZ8IEZiXRkR30g8/3CQhNKf8QSsisr3A4uNwGv/pNE1WLmgVwJoIroOThHrRz86sJ0fnggZ+uW473KOsk53vaehW51GyUoSfgaxjbXvVUNYZ9oVb/KDu3DMvy/LCwdlguHiEpYj2fz5ND/+DeIUlnTYNK0Q1Nx4/XgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEBbXRtUxOXKZWK0KS6QbFZChyl/hRROiShQtf2v94o=;
 b=y7NVpqSwX2UJUfCtZxz129JpL5tdL1lHD214yZDj/JMG7uOBYjHk1Ok5Cl9bEb3QhzBuJhon5HGbt4wDSeQQRct0UiC7iyA1Ix1hw9nf35FJVFlhszjRfaktuVOww6o1OQiOxZUEkoXpag9O/W43t2vOqCD1QrorW+VmRPFiHpSpI/c+ZsMn0NsAPYDy7/BVmaAgivEjTnbUSAlhWZxQrItdkvzhNi5pSA2PC5d7uTcw77qQrcRxa2kO0cC/8vVw6BO4CFLso6Xhn5stBzX5jm8SFGLr/T/kJta4RsMYeKn1Ibceklm8GHHcn/U4NmItozgZwtaXxrKglXO9D5apBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEBbXRtUxOXKZWK0KS6QbFZChyl/hRROiShQtf2v94o=;
 b=kvj75WkkY0j1dBbs90dqK7vPIs2PAnntqjf/SIjSx0Hi8BhPWpgcHNUXP2dDSMFkv5x6n4nC2051yYMkde2ppDTkZH5CNAE3CVbBfj55X3jilExA44AbdXamo5V+P9c4yM+5CSmpbLvU8vX/pFKbr9NBzG5X1XdVYgJqbqBP4esjyz88WFCm1k4Zr7OrF9e0zyuVLOlbAddkUelI9E6H4vUKRRWaLuZkHry+9TAbt4SPCmRwqOB1IYhgE5NGbEWJGTpx0JkvEIJ5n29FVFRHqhK2sxjDJN5fr0SDz4N6hohnDbhBDegT+AKU+aNsHsx5Nb5dp+5SQT2GvsMRlANSSg==
Received: from BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::8)
 by MN2PR10MB4352.namprd10.prod.outlook.com (2603:10b6:208:1de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Fri, 19 Dec
 2025 22:56:09 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::38) by BY1P220CA0012.outlook.office365.com
 (2603:10b6:a03:59d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 22:56:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 22:56:07 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 16:56:04 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 16:56:04 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 16:56:04 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJMu40u1558921;
	Fri, 19 Dec 2025 16:56:04 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A0AA19ACF4; Fri, 19 Dec 2025 16:56:04 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202512191404
Date: Fri, 19 Dec 2025 16:56:04 -0600
Message-ID: <20251219225604.219533-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251219224258.3145192-1-lcpdbld@list.ti.com>
References: <20251219224258.3145192-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|MN2PR10MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d9b328-6a11-4a7b-46dc-08de3f51cbdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ahf8C8k5IfKSjv0H9c7UaMGYhondU6jved6UXLZTasOhLKkT9kSXe6rpqMa6?=
 =?us-ascii?Q?gSZfp+yS9c0fOnyFzutKT5J29Dcvv/dj1gWUjxe5qIvTxWX3v0ZS+ASEg5qF?=
 =?us-ascii?Q?AcfUkYbQEoeE11xNNmExnnAhJk91HAwFBYsKA763Lf3cf64v/0mHMt46FLlq?=
 =?us-ascii?Q?C8PJgXhaaOZe6qQxsbxsd8RKl8ePa9BQUdd51txmHQ8Vn4Bg8kE96mbPI2jP?=
 =?us-ascii?Q?4VymrjPyxJm/eGEA2exPSeKNqhyWKPvMPCGccIl9Yyu8y0cMA78LXOXaqCXQ?=
 =?us-ascii?Q?hOOqRPklbUvtxZZ0taeEHpfXsCMZ6i7lnE2F0lLw8jOQ8uWFklxrFqexZNsa?=
 =?us-ascii?Q?qEPEDAC649OQ2kID4b4kbYv11bpDgiUCB7oFCr4WHfg+GrUiOpb4BOpH+Gz8?=
 =?us-ascii?Q?uGg7DsSMCKjVdNR4aVya1+lrjQHy3MhIG+zMgdjZRiIkD+NTAPkIIwDnP02m?=
 =?us-ascii?Q?wyAMGBgE5jC54wR+Wr4bmslLQ3u10az4kqatLsKs1EcHFUbh3eIMs+xzQKrl?=
 =?us-ascii?Q?BwKIEbD07SjLxCG0X/uqcntH7knxAOxn/W3DTdrvqMdROe9s1usOdnP9cJua?=
 =?us-ascii?Q?vOPZQOikb7vKLUhYGNDIWkHbS49xZzM9h+R6m1NOXTTQGmAujSXknxw7ZP+2?=
 =?us-ascii?Q?pJBYzP1w2jR3usP2D9QKVLtewVxc1+ooVSU5Zrv+Av+NlkLu/2ec6HAqCk2u?=
 =?us-ascii?Q?RDDH0D11nAY4nfqpT0d0lBnLd8V9WAdCmYOZIzdW9YCi7cAYDWrKFWrb1qDZ?=
 =?us-ascii?Q?CIWPXt8sBPasr66biDzsIYHmGuo7/4RIaIuLMEurw8ETVunCIgm4vRGPoFOC?=
 =?us-ascii?Q?ePS3J+jGYy6P+SKo94LvBqUXCkZXbgQ9dN3ykqd2PCpWizYfADiq7dPkPWbc?=
 =?us-ascii?Q?WZcRPgI2u4AilL3AgUe880koYGjBox1vC6F7NUdAsJJyR4WmEV5OCi66mFqY?=
 =?us-ascii?Q?VTSfI/Cy6zils6KTWv7o0T69tpUpeWDgY+To+jSqaZNtQCS9Y7X5tbU3dlZD?=
 =?us-ascii?Q?xlAnSixPQRbImLueJjLHOHlM1HRa7EzEDltiNQ0rKR6ZdkfQEZL+BtMlUV00?=
 =?us-ascii?Q?K/lLUgC06A8bhbXAwDA+E11d2u3KivKtC9xX8+DNVTOM9QWEMRQQU0xM8Wwo?=
 =?us-ascii?Q?krthOnfG3NUUNsiVSftgbLwvOezDhLjSHW8LFtJiHFzI/i7EJjOgEV7Zp2IZ?=
 =?us-ascii?Q?nauItdDvVGStsrdcsm2ctwMXeWH/NjbiHBvssdbtcXdit9AWkwgeDT795KQO?=
 =?us-ascii?Q?wdLJP57WUFHy5mZvhybngvC0mZnzohkeJAzjpnpYl6BAy6tP6XY31LSAvIly?=
 =?us-ascii?Q?eA4lKeaxZ8Y5WoyZ5PPdvwl0Pu1ZNQgQ4t2grI8z19KUwEzzxUXkFki6XTuT?=
 =?us-ascii?Q?mReRPjJBtzJbhKmYzm9U38pOGd7IaWLAl9/DOT/KuQ/qfaNYmCyegevKSu/B?=
 =?us-ascii?Q?T7doVoEEcoji+QloMCZO+/Pv9+cFBKFnatukWjrZEWgD4dFtG/yV+fCwKBp2?=
 =?us-ascii?Q?D/uabLXh5/D8BjruI27+c1CR59XdDd4qw55mnwFb1S5OL7LvqNAFr80Fd280?=
 =?us-ascii?Q?QC8xcD6boqMZjbPImtw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 22:56:07.7564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d9b328-6a11-4a7b-46dc-08de3f51cbdc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4352
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Dec 2025 22:56:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19381

meta-ti / na / 20251219224258.3145192-1-lcpdbld

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
512191404
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 19 Dec 2025 16:42:58 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 38b95f0c5b8bde383fc366626dba14ff3=
6bdde1b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: am62xx-evm-k3r5-falcon: Disable test builds for falcon
- Commit SHA: bbbf37c3ebaad7fb8b0d1631c7a9ca900126c7aa

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




