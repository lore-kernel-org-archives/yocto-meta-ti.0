Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7428CD4845
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 20:30:32 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7651.1762979423684616060
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 12:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=qZaCO/Bl;
 spf=pass (domain: list.ti.com, ip: 52.101.52.61, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRvnwBCf/f6mz8SbnojWV58Ub50EDa8Zpmb7vb3OEm8v26/8JtWVx0076CO5YUYk0FYls//1Y/IR443/Pq2lhvaXnCcGDVLWGOC1Gr5ok8daF5Bx07z4X+UXMf0RVt9HNAef1JIOyF7v/A5NLS+QbB+KaoqYCTuR4OnutpC4zCuuRIN8cIVsROTm9BIqdI8Rpoaya2W5g7YQnNATEra/2g6+9p3lJqJVtNV6qAz/tlGlXN2qY3m3JVVg26+OCpKPB+s9n+THf8KGkj43M4YjhCWC0OPnD5wJsO7ZlwRIcWjoZXrfLlbIfbmg1BeOEDQG8hgZ/PHf1vtKiVBXdbLOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+apT//qFS4NsIYkIzAu2ATag9YPJts3UFMzztPSUrfM=;
 b=FG4wVyM+At8MI2zQ0NjSChi+ephWgFFZpfX7m7BtfZYXP1xz1NcILC+fis9+ELRgX65vQWaLGRjyYHUkbmHYCgnBkGw+EgVlT36+ssKp9LHYFLiBY384aCOSwoLqthuat1MmAJOX8ADBJLmpLWl9ZXK5rchikw7UcP3krHnIcBGQ0WCc47FOFYZSpEcTprxDqipqlwdYF2ybvXqOOMQWyTwL7tNjvpLKnxpF6I1qhrneGRL5OQHy7TgiJ1f9O1yrsG+139rn5nCVuZVNsBIfnrBFb+YgWx2IkimU+EASFqAn3Dem7aRZBEHSiLFU50Mtxmgk44D09rG4x94NjPDPvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+apT//qFS4NsIYkIzAu2ATag9YPJts3UFMzztPSUrfM=;
 b=qZaCO/BlmpZp9JESydpM5LozLI9eCZrOTSu/1Y5kO8y4TM9DzjETQpmf5F+e7H0yHDupnljG/E9aLoX32dTJqg/vVNdSkgZDrJdsgT1UnFpFXDalAFi09xKHwN9D1U43Kn2gtrt7P/GyRxHVfjnMGKZamxDA1UsriIHJcYYrQDk/1EKTBgcdPan3swa8Ys5chjqbjch9WzYmeM4zYlAz2YhEnshtBPUDawKiILw7RKKz5BlP0PpV2XcMe18HnpbdebZGMCdYHs9lB5Kx4VE1h8pJgllOFQTbySv23YqhRdzIt5TiQiiq+Nn0rNA3sX70GNRNtbkg14dSPP2sLl6Hkw==
Received: from SJ0PR05CA0032.namprd05.prod.outlook.com (2603:10b6:a03:33f::7)
 by DM4PR10MB6279.namprd10.prod.outlook.com (2603:10b6:8:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 20:30:19 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::c4) by SJ0PR05CA0032.outlook.office365.com
 (2603:10b6:a03:33f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.14 via Frontend Transport; Wed,
 12 Nov 2025 20:30:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 20:30:17 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 14:30:11 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 14:30:11 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 14:30:11 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACKUBNI3222438;
	Wed, 12 Nov 2025 14:30:11 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9F144138B5A; Wed, 12 Nov 2025 14:30:11 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v4] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
Date: Wed, 12 Nov 2025 14:30:11 -0600
Message-ID: <20251112203011.249958-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251112202652.3718660-1-a-christidis@ti.com>
References: <20251112202652.3718660-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|DM4PR10MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: b680403a-35da-4b42-e928-08de222a4b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?e/E2oNlgzlITHcXnHPngFayRXU/B1WDqJoorWNAJS7t8eNKpum8zMDhttvIP?=
 =?us-ascii?Q?NjrRncf75VT7y71OzJQ6YjnIIyf7TL2EB48O3Yl9Uwf0PwAl/jYYpE4CVrcx?=
 =?us-ascii?Q?tBnd0ueGE+ReegWNNYSVNjpV8z4y9rsTzWLytQmloKaKkOuL2+BQ5/L7g20v?=
 =?us-ascii?Q?MTvxqpUkJCIPNkrG7GfdLKrQ4x68RzCj20r44VKUlqtNn9CnmKzobd4lNs47?=
 =?us-ascii?Q?EbfJ9re1YsKrZzhlp80Rf/G8hDA3puJmVtpfqAwfMMoXp0Xuxg+ZRkdYyCyK?=
 =?us-ascii?Q?3Dkxn4SEWrIAfrnitbCzbawYGg3yvK0PqJ+Aob1eV5ntzz/b5pGCs3yO0lCM?=
 =?us-ascii?Q?rT/GqZFcf8cv3ookmQCsxfuttP5RQd8F9buesTIzubusxRAS2yWAoz8r6GK6?=
 =?us-ascii?Q?34X5Hp+eqwMnVkR585u/QltJR7TErNmQHMjX33l7e+I1gb6hmCJja96C+hdf?=
 =?us-ascii?Q?R6LpjiCA41oeG1zFz7aK6VHbExlyT+MZQpegXHe4Pipbvt8Le/oRtNnsyaao?=
 =?us-ascii?Q?Bs/qKmC3BkurCNUlhHD5JseQk8hhkIVzgBnVuHMERQKZngH7MX8wEI0AzC/d?=
 =?us-ascii?Q?WCj60VoJrQy4oxxX6MYZlyi52y4ByG7032f6elZI4QtbzA9oO0abT0fyY6UL?=
 =?us-ascii?Q?adz5VEMfLxyRdmxeMuqK1vKvezoOHc5kEDwLtAOsZfWXOsiobMGeW3S5pQ3p?=
 =?us-ascii?Q?MslsbXYY31lNBY+RN17L1UQZ5bXw6qu1HIlm1AOw9xkF4Ptw89y8dGAA99VY?=
 =?us-ascii?Q?dC/U8JPOh7eVBb8A2wu9/DIjUueFT2tiiILdW0yaVD7vNiKUZqjTirmaW7+5?=
 =?us-ascii?Q?cXDZ5nt5J8AYLB4Z354uclgqd7ql4cZ60dfOI3b3x2EjsZ1GKfKTQnxJEc1j?=
 =?us-ascii?Q?QLnbODXC9XWZ+ccQqc2ACz+teKjL/+LzLB3z+XDHoPgrh5XhUtWxBmTPeBOj?=
 =?us-ascii?Q?KL5VCadRh2fKAh4Tmm3lOFdZYheaLxhrOxgtax4hYaMOuFaSU/Pe8+3e2wA7?=
 =?us-ascii?Q?BN1ZNk25wSgw7sjsBt4EQPd4KLdtDnQo4fe8MmCipGADzTrVINVHmUgT3Pga?=
 =?us-ascii?Q?qjl2kwdxCQ9yjD3A93tg/kdmE4yKclGTBDrOAMR0toPyEeKms2Lb9qPPOUKR?=
 =?us-ascii?Q?2cqm67TZ/dRnX25f/uEyTGEGmNAhrBNyhSLWglgmwNJW963euBOVitX2GSrE?=
 =?us-ascii?Q?O8hPv50A7963dOyvcgjn54hX4JS/D2+HdMrOOyLn8NG0mjHbv+ATchA4OzKM?=
 =?us-ascii?Q?W9BH9bGG06JMjDyl+HyZmN6sAoA9NBMW+v6All4RVoRzjPl0zO3x6v0xrod9?=
 =?us-ascii?Q?VRVbbcsEvUFyBiY5aguhpQ5DROnx5rHRNiW8qU1aorUJ01sYdAf+me7YBWpm?=
 =?us-ascii?Q?7A6jyHCOFmZAxCIexhHD4rtFMBigNnUZyttVqJNMcJNXSZEgurYnsARTOFgL?=
 =?us-ascii?Q?jUmqvAJFdiLeEbC9cq9G+PRxgDBtEYLEADbarIpK0BvjhesvJrZFjNFQ4Ukt?=
 =?us-ascii?Q?8Ov4kTU1QmdWHWWMyvvZOF8PVDbbpSvY9abn2ukuwR81v8QjGUOMp+O8IjF6?=
 =?us-ascii?Q?8uMHkNs/PKO1OP2c0Gc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:30:17.4792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b680403a-35da-4b42-e928-08de222a4b09
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6279
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 20:30:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19262

meta-ti / na / 20251112202652.3718660-1-a-christidis

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
WARN - [meta-ti][scarthgap][PATCH v4] ti-img-rogue-*: Migrate GPU driver ve=
rsion 24.2 -> 25.2
    WARN: Commit message does not include file/recipe name: ti-img-rogue-*:=
 Migrate GPU driver version 24.2 -> 25.2. (COMMIT-MESSAGE-2)
        patch



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
- Patch Series: [meta-ti][scarthgap][PATCH v4] ti-img-rogue-*: Migrate GPU =
driver version 24.2 -> 25.2
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 12 Nov 2025 14:26:52 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 07b22e76cdc1e3f5f49d56a889186a4ca=
8003360

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511070802
- Commit SHA: 5b095d968eb225b72e44dc164683aa9157ec2b93

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




