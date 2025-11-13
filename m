Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE22CD5BB1
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 09:55:47 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20152.1763027738388614198
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 01:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=n7AA6zg1;
 spf=pass (domain: list.ti.com, ip: 40.107.201.48, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCuvyf2JOQjBlQmFiSrbFvQ6tr7i1fvLfR1z5wwaI2bzsXBRT//9n9O6sQkm8IjPxaB5YX3HzukM05vJEjhsV2bMsOGnvTiOGO/wF86JPgl6837dCVt8qS1PIqXd5cKkJdgGsFGJLHPOr2H+yzWnpxXFwO2dAU5yP5ZrV8MfO03AbJM8i2W2FSfbtW3gjugxHLQPfaBW+v0imV0eSz2Q72OWyRyRh6EUMK6lc2nMU0IpsxUDIUsNpomILbmbw8fYbuQKsLW2uQXAf3Ivh5jkrsvltN/C8RKU7w75GFzRlTOdNBfIHAlGgNdMYQW/in3PrHhVfXhGI6uDPAj1reuadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMtZyB5ef8bVd6DGjBh98cq2vEVF7Qdt5fBISPLItm4=;
 b=jiNA2yGthv3Em0QGdtIf9UsUr9d0dgymp7q44YKMaMTLNtp3cQ7yIdY0DOYL7fkIdXP7/x+b5MDeW0opWz3SSkf8Hg8ngvojVva3Ly+4/HpPk91G9+d6V24ykTxErarO1OY/I/TWTTdAmnW7YWJla6lkA9n4H/2r1uU+HH4aIh2CzKGsqKsNJaOLSx2pFoeDDJxjbnT/WVeBxw4kI/95vuTQRL4oJ7It6LWltY3VYCEfWA8O81HVb69PgXWM53m9w6fOir6kDFWQFghpQIRB8yt+L3x3OxHwv7irCkKkAEbgvFweCsSWnzmSBIzk0cW/yHWTcUWgoGRCy1B09kIxGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMtZyB5ef8bVd6DGjBh98cq2vEVF7Qdt5fBISPLItm4=;
 b=n7AA6zg1EdEnsdCpL8O806HIqRMl9ly78fRJS50zRJU0OZ62B0+iWSYkRQtaptcx+B7l1nOiwIfMGzebJN09O/+XikpjnlUA3tQJTR+2nrOuW+SxjT6Q/83ksEbYjNoSZN5sZx+yPhNrdNy2rtGzd9NeJwx/VdN+PIacWtkcisagk3CNuCG1dx/SLQ+eFjQmt0g+ijqCbar2MhceziS2dztq4WfsiuH/Xs38H3qyrGdhD3GoN7x91ftvBuMd0BnjpZmWuubemgZ1ldXoQIuRm/NvBPygmgrHNaP75fuljd79LZ2m6aaONoV+i0cH2qx+7sK4Xp+XtJCoDo20+l3gGg==
Received: from BN9P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::25)
 by SJ0PR10MB4448.namprd10.prod.outlook.com (2603:10b6:a03:2ad::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 09:55:35 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::52) by BN9P222CA0020.outlook.office365.com
 (2603:10b6:408:10c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 09:55:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 09:55:34 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 03:55:31 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 03:55:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 03:55:30 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AD9tUac076225;
	Thu, 13 Nov 2025 03:55:30 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B45F59ACF4; Thu, 13 Nov 2025 03:55:30 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Hari Nagalla <hnagalla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <nsaulnier@ti.com>,
	<b-padhi@ti.com>
Subject: Re: [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.10
Date: Thu, 13 Nov 2025 03:55:30 -0600
Message-ID: <20251113095530.3853600-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251113094440.19249-1-hnagalla@ti.com>
References: <20251113094440.19249-1-hnagalla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|SJ0PR10MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ab6f35-88e0-41ee-3764-08de229ac9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X5fzq85xhII+o68HDt9wZfHInZVUZq0Z5hn0kgaLh3KyxpZ+zM4mN1ONyNd2?=
 =?us-ascii?Q?7FxFdrm8oCySIJ89LD7zbh7ljVY5mOTeiEDb9x0LA3gYcks/KIc80UFUmNhx?=
 =?us-ascii?Q?ihqRpjFZkN0xzR2Buinix732TwHRCFtzdYoZ8zJ/VuV/2U/UVc/D/GAZkT/A?=
 =?us-ascii?Q?KELVEhFSb+UWiTF+cgbWFSqPYMTwM8DZD0zr1E/dbziBDV5M105ftdOJDOXL?=
 =?us-ascii?Q?sniIXMgOqLelx5lFQQCXE7GUYJ2+vF2lY759VygVEOdhk7FrZx15gKjr6vJh?=
 =?us-ascii?Q?l2o+/tXrhZ2UfA7ro+cKkRLekyBDUCgNDESn2wHPB3ts41s+Ytd9Wq3YEv8k?=
 =?us-ascii?Q?mzIJWYPqzmRz6mXPHlgPazVzx90DNSrbY3P16431CHBRqGAfYA80qqzXgFN6?=
 =?us-ascii?Q?woJmvfoEl14q/jC6K82vgrQK/nxcU4hr9yHqOjHTCagyf8jxz30M0Xwx105J?=
 =?us-ascii?Q?IybMwfKLVORtWDovtgUW5Sa2jERUT6dPi3ZNWglnrBHy5+oA6S5C0rgBvTk6?=
 =?us-ascii?Q?wnHCg2pkUDwnz5vDx31Fq0zWSd/+FwrGjrZ/KUdnR8j08csUNjmxCyo70iz7?=
 =?us-ascii?Q?6wgoSR1vsjAyzPYXjXAEBnxlIPnn8sI9H6kLkmAszhyvvYfAFVm69QVsDTo2?=
 =?us-ascii?Q?LzXKhvVvRgxpPPfBCQFEyXQJLxqxSb2LHi7wvjXO0jIRL6uIbEDKiVJYETgx?=
 =?us-ascii?Q?xVI3rL7zSeB9tp+hvFNYiLkKCA53dTdombj6IiACh16PVJm0RrsvCJm5pke7?=
 =?us-ascii?Q?SmsoHnXef58VTwKEQtH+a/aJ1xAg77oN+pG+V4raiX/jdC+j0UQ6MhH6bLtl?=
 =?us-ascii?Q?D+MM0RIGdaU5OPd5GKQbGInAgXLKDumbqlZikKNohXVgt3WOdEZvilGPuG1W?=
 =?us-ascii?Q?IIXP6D0LB7lqB/nlcDPljDhyjNu4DKOdqKQe6bhb2sh2Rt7HXEPFVwVCi5dj?=
 =?us-ascii?Q?PA3JDNUZEA5DGj67etagBSdaPmUi1XIs89RLhWMsf/5hcddWkui9a4YBVum8?=
 =?us-ascii?Q?tXMORQPNdLbei+ausLk6KjfSlGrk+LeM7Ry9jJwL4cBPcWOtqYsU15YoGzlg?=
 =?us-ascii?Q?+JUDlEbCWofgQufFzbkYEjoYWcJJPrsAXSah6JAFoAMPwvwiIQe0UDtGDnck?=
 =?us-ascii?Q?E86uqE60dqPAjTNixcZ3a4dL1SXgpW6ABL6V7zMvzvr1JEGE+60VdrHpt+Ri?=
 =?us-ascii?Q?s6zkvj7GZzc394YML1QMNxXDI5hLKzBGWHhcS9TFOwjOqfeCyFVQK5/1kJEr?=
 =?us-ascii?Q?6EYPBeLu7GAL+LBZn234uFDF1Xhki5NmjRDxmZpPq/Uu6HBScisftSF1Y5lz?=
 =?us-ascii?Q?k6adGE0TlftlZVNdOSlCAuuwRxyQwLdYwvxj8HfJ7mKKSBPYNIJocHaz8Hq0?=
 =?us-ascii?Q?0C+yPo3vL/GlqFNOoBgU3DYHjwZLOeWwNgJrt5OjEu/l2l3GYG0mp2R8cgg/?=
 =?us-ascii?Q?ussdsj2iUqDGCAYPcS6LsbhC9yHi18n+uOyz1EbQV2L9zOaD85otL0gQ/fdA?=
 =?us-ascii?Q?CRr+4JYv7SBptxp8ft4vs1oHKVkUOMS+/LRwOem8Xc0X+TaGt05KLHMiBNe2?=
 =?us-ascii?Q?rmdgGRMJ+AhHm+xmXJA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 09:55:34.1739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ab6f35-88e0-41ee-3764-08de229ac9fb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4448
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 09:55:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19265

meta-ti / na / 20251113094440.19249-1-hnagalla

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
WARN - [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.10
    WARN: Commit message should not include directory path to recipe: ipc: =
ti-rpmsg-char: Update library to 0.6.10.
              ipc: (COMMIT-MESSAGE-3)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.=
6.10
- Submitter: From: Hari Nagalla <hnagalla@ti.com>
- Date: Date: Thu, 13 Nov 2025 03:44:40 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a68a100422e1e05737adc01e6345350c7=
18d0563

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Anurag Dutta <a-dutta@ti.com>
- Commit Subject: conf: machine: j722s: Fix overlay name in KERNEL_DEVICETR=
EE_PREFIX
- Commit SHA: 8dbd05aa6098282577208ec7c6766d42d700a2ca

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.=
6.10
- Submitter: From: Hari Nagalla <hnagalla@ti.com>
- Date: Date: Thu, 13 Nov 2025 03:44:40 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a68a100422e1e05737adc01e6345350c7=
18d0563

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511070802
- Commit SHA: 5b095d968eb225b72e44dc164683aa9157ec2b93

Patches
----------------------------------------
FAIL - [master/scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.10
    error: patch failed: meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc:7
    error: meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc: patch does not app=
ly
    Applying: ipc: ti-rpmsg-char: Update library to 0.6.10
    Patch failed at 0001 ipc: ti-rpmsg-char: Update library to 0.6.10




