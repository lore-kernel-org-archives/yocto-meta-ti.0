Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363A7CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 16:30:44 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3176.1762533040673098249
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 08:30:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ZAqYTRtX;
 spf=pass (domain: list.ti.com, ip: 52.101.85.8, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bT/cIJg3orVpsJgVslIPuHLw35lVSU8C330J6lzPj1XG2lV6iLb5t8clbjORZMgcJxT6vI1CA8OFe5WJNVChDFdGJHUySWEVct1ecs55kOVCUITPOX0UpGD1OgP/o5BwesNHMWHICObnGt4Po+IMvOSxw5K+KPmAqq/slmSMpKY4IWwUufdUX17YbTLYZZzSv5Kp9kFynqwXXT4UasDgYG0dgKFHkf/HyQnlD+85Hjq9P4N/31mSFWmq7e12iAp9u+fMs4D2YjS5T9Ra4oWLzMDSC4pfm+wzl+eJK/cWkFNbiDXyRAFIGMPyC1hA2qEmaI26hbgNPXRTy7dGm02HQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQW6P4S8r+/rhonQGG+EvQcXsQx8teiVng57oXQiO2o=;
 b=GtaEcD0g/Gespb8/EW+yc9M/yNR0RE24s6+H8gepPPfaCcvg+HlDs8tUv7fwABtUGzn5erpJP0SG3EdpaxS94JhBgwPGzHyEkXwHlxMSnbU1qsknZFvv3Y2Y/JNMFwSpex3UNkvfJRCKdeEQEqhoXVxqNkdrjQ0OpaV4K67/K+BlgIwUnicII9OmXnvDTkwMb03IQhlmzU8eWZWYJ0LcwtdMJWSiG2md7B4Is3KZniD54877eKe/42A0s+MqSdiLM8Q2/zMwrvN8hrtg6lPDf9yEbfjhjrHfbZ8aZiQLVbhgGINrWzA8HadDSgLl8GuYBdVuD1QppntA6ALKi6p3Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQW6P4S8r+/rhonQGG+EvQcXsQx8teiVng57oXQiO2o=;
 b=ZAqYTRtXHcSKzJ6Btpm4BgZI8zoqa1i5QaSRq7UJcYGWgDBwrOnSccM3MDjsEJjn3nsxfVYAPzOLDsXsVKd30sIDdXJX3KnIYXEj/CtbIskzpIiTDv7R8zUYaZLSb57wKYD72yE5YLEBaqKOOF8pg1iFmC0gRk3Y8H/O17bLD19sXs6AqGiHYl5M8uNsqgMEiKRUm/y5jeXU+uQejD0UolYiUop09mq7SQA2EiwRQ0b522EA6L9lv4Wf8C3siqYWc8zLxxmrDVIbHRTypKZAfNqhdPzmTPixFi4jd2m1zHGs+7WRq1wCB1Z/okoxb8ljth9ZGv3nWa3ZucJsBLzu/g==
Received: from BN9PR03CA0683.namprd03.prod.outlook.com (2603:10b6:408:10e::28)
 by CY5PR10MB6215.namprd10.prod.outlook.com (2603:10b6:930:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 16:30:34 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::7e) by BN9PR03CA0683.outlook.office365.com
 (2603:10b6:408:10e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 16:30:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 16:30:34 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 10:30:31 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 10:30:30 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 10:30:30 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7GUUZ02213829;
	Fri, 7 Nov 2025 10:30:30 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AF0C39ACF4; Fri,  7 Nov 2025 10:30:30 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] check_yocto_rules: Add new exception for packagegroup-ti-core-initramfs.bbappend
Date: Fri, 7 Nov 2025 10:30:30 -0600
Message-ID: <20251107163030.36859-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251107162907.31733-1-reatmon@ti.com>
References: <20251107162907.31733-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|CY5PR10MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 738c5bb5-df43-40f6-684b-08de1e1afa08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nPYO4UqiukxAbGQxDg355xYZmLaeGRSz6ApkJbEOU6rI45hmg+sxgrYqFERG?=
 =?us-ascii?Q?+L+UDqCNXIVEUXIFWederRdy71AvXefdwFGW8TMducTztbKoebglOJDXztjS?=
 =?us-ascii?Q?7O5XeZnP2sdd6AHkriwIU7TaKiBd4bCbD3iV3xSqcNq4bE5yC+V4lafkvKkT?=
 =?us-ascii?Q?VXQXvXpJYi9bn7p9eggz74+szqs6bZtwAr53mV3DyisbZRK+YYZp4J9Zm4dO?=
 =?us-ascii?Q?vogTTvOET4iP0GsVesX8ehfsa/FfQGh7PMSlFBY7TKZyPxFGk2SAVpeWvVC9?=
 =?us-ascii?Q?QYWl70bncIqKpQwJ0SLT8cpESvE87yL3MzporpoYPMY12EJHESnoj64CyAQX?=
 =?us-ascii?Q?8JCB5rm6NHLpLShIJjGEOGCIEy9oc3cw6tckgT2sWdKNagBgdvZYOC0gH2D0?=
 =?us-ascii?Q?QncKkBp77VolnQ6/iX1T2A5zigf/Mz183/cJJDndNECj+aI5paTAQxEStgVu?=
 =?us-ascii?Q?BflXan235mJjhOZK+o5906TuSYZRMNotY1pcCDGPYePLUakPc7GkCO1zKfSh?=
 =?us-ascii?Q?aTPkaPQ8oWypLoHE5wFCnOsJaFOuQTcz+U9cqDId2uQN1dkLHGUSFiO6p1/D?=
 =?us-ascii?Q?BsalrHNvNSEUsRhsXKbzagrrfYBWvBvQ2qKqsydzVAAXYZNrfWqWFhyg2Htq?=
 =?us-ascii?Q?jt9jg1EHlUgNLPAl+trPsf/j9gjbC4PEPt8VcNiRVv0Y2mIrKVW9Rw8Xi3ea?=
 =?us-ascii?Q?U40wOLxrtxNQqPRHJEaWeOH/uw5Fr1QmQu6srhKHlcGiIBm7ldp7Ubqq12Zw?=
 =?us-ascii?Q?nSEPR+aB+HWUF+DcooMIXKhcxeyP4mVvS8pWbCkq53ZZBM2Wn3OjccQX4LwW?=
 =?us-ascii?Q?XULJ/KnXpMJq4L4YcsPNBdM+lUzJ+IXK4NswktcncNHOVAa8ulZwJwtgIq9s?=
 =?us-ascii?Q?Pg71D+uFedYNfutnN9WBnyEZISF/IcScpEnrTQcbtyz2pTDfSzHTzhEqo4wf?=
 =?us-ascii?Q?4w3Ab2BQ418mrt8Mgxry7SshSVdhUsfxNVEDEM2khkQf2wjtdkeqlgmvQ2LD?=
 =?us-ascii?Q?GkNL3aDhXxzl/K8VV8fMmXRSNFFGgl9mxYh14Rp2pHJLZrYV+wcxZFONU4ah?=
 =?us-ascii?Q?3ulPX25VcL3d61VeLIxc39RGultq3e2hCuGrbEs2vp9wh4VHrZsP0nuztr6+?=
 =?us-ascii?Q?WbHT1AB/CzEgQAoV+cSqq5mq+j4Nu42QyV6RsPsUw3VHCyeUxOr8LzC88834?=
 =?us-ascii?Q?npirFfWs61IG4aluTEEGv0y0CIuvHnVemUtP7PxXhFAXOFgh2zdiw+2hbqOE?=
 =?us-ascii?Q?7tKFsPy5IW0cUvbl8AVm0BuHh8Xu3YCt+soozuZk6sd1tZ4YfyZqEkBdWWb2?=
 =?us-ascii?Q?fyOVxm/JoC8FKz0Jkzczhx/e+8mFTSYOfoNAMORf4cK0hQQuGWggN70ihNc6?=
 =?us-ascii?Q?UE/0+o18JUQalPhyRbcxWJ6xKDLUOf79iSj+FKcU0SWKDRtKScuhKd37FwJP?=
 =?us-ascii?Q?6hD3a6Psty+P7YlNZnYfvE5qPXHRshjOueNh7BHm0rhNsP9kXsmRzeO4XNZ3?=
 =?us-ascii?Q?/lu/5qCqxMlXgSVyrkbfRXEWdfGJ7KyFnyD9FJSiBtp4b9qIMnouV5P4kHNz?=
 =?us-ascii?Q?wCDHMSGLq3Ic6OFfpAE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 16:30:34.4862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 738c5bb5-df43-40f6-684b-08de1e1afa08
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6215
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Nov 2025 16:30:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19240

meta-ti / na / 20251107162907.31733-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] check_yocto_rules: Add new excepti=
on for packagegroup-ti-core-initramfs.bbappend
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 7 Nov 2025 10:29:07 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 45b4e2e447b90dce4d2a5981eac1bd21b=
a8cc561

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: conf: machine: am62dxx-evm: Package eHRPWM overlay
- Commit SHA: aca8792decedd7c1605fe042c841a1ca3ce73498

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




