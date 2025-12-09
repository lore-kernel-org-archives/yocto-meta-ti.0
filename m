Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7A3D3B9A2
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 21:53:13 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2548.1765317190979376505
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 13:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=gfLYdW3l;
 spf=pass (domain: list.ti.com, ip: 52.101.85.3, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyHvzF3NDUqlv2Uop0uN4qs4FCF0/21ZUk+jBjvSUjTDfonzs7TaTwtIb81ge0rL1W8rLnHGCOdek61vWC9STSR0SdqFelO6g+KcxAIAZdp0WB6pWe8mfSS3ubIK2nfaE91bPBjqbDC/efbi077pfAlMBhXe44ToJ9RSlpPzJamms2SyM6eCr0UACFhD6xmm+lJrWyFo1qNWjkZQhFauqyBbD45w605SJPvIiWt36pFKFpfnkoCcSWNgdhG7+2OY5uI48i4VaLqpxVxM5e8B3sRzcgvqfmhhulP8Peu9y9tBS2YMef2DXfbdMvssvzIv517SQbVb1/b1maZxjv26yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEERiegD2/Lq2z3lE1GjldrnfzNZsJ00gY9Q1cm4xnI=;
 b=y+CwjJ38hSjA8Qxn2dVXLDuShbXvmTOAuAuqXfipRJR5/jiyLmTK9//8EOzgVMV5t/5phYWf/AR4D8cQv7U+oRZ3C+YB/xTdtobhpP5BRF1B+FFxQCa7qtFVQovGWFt+BidFryX2iONt2ov7X/UvyGFt4RXkIqiR+x4K34xYOi+XRDjjlMm+7Y2u9eGBCZLGskSZNMKPBVBCfuQXQqosCdSAbmdBpgOHky7t5sECAvwLeYx9gdnwcfGe6eLmP06xdB/AYOp30hoeCQE4UeFdF3QI8Nby0HpR5nu5BPTmLaW4xtzrS9GrUpgn4Mrswoh7YhRF4tQNwIRW4k5fMGEh2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEERiegD2/Lq2z3lE1GjldrnfzNZsJ00gY9Q1cm4xnI=;
 b=gfLYdW3l8ea6F31V/iUph8fwqiUkXGsSdachm1IUzsi55DrmmzUDSrIpzXh7xVTF3BeKFWVeSZ2Ck877jnzIfoG4wKZTZAd4UBylNvhkPpWVGwGrtY/kfVJM4MQ04b8R0E4m+3dW0RHyW5/Gc9lnAaao0T+Y/zAYFwtPMkkSSS8j8VhLvPVRu0Wbp/aHdQt/3SKPeU8Jpjqy3zQhRr3589+idvvqEKmdmZ1KkW234BVzk3pHh/PgFNhk3/CFgd2wtmaYFl6DHpHdwEIzuzvdwQQ1ykALWG3CXjw/iuKdb4NnPJuQmaXnUFeQ+ngMRmdI7gDpgmd6tWz9jNrs5TAxgQ==
Received: from BL1PR13CA0209.namprd13.prod.outlook.com (2603:10b6:208:2be::34)
 by SA1PR10MB5760.namprd10.prod.outlook.com (2603:10b6:806:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 21:53:09 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::3) by BL1PR13CA0209.outlook.office365.com
 (2603:10b6:208:2be::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Tue, 9
 Dec 2025 21:53:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 21:53:08 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 15:53:06 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 15:53:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 15:53:06 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9Lr69l1884097;
	Tue, 9 Dec 2025 15:53:06 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 688439ACF4; Tue,  9 Dec 2025 15:53:06 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/3] linux-ti-staging: Add initial 6.18 recipes for LTS development
Date: Tue, 9 Dec 2025 15:53:06 -0600
Message-ID: <20251209215306.1363206-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251209214132.4122996-1-reatmon@ti.com>
References: <20251209214132.4122996-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SA1PR10MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 878aaa19-2db6-411d-da38-08de376d56df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K9AFjC1jLO/CX1ts5+nrZwPGyut+7TGfpUV7jkbJfeMXJKWNv2CH1n1Zrn+9?=
 =?us-ascii?Q?ANTS0b6pUTKxPzxAE1F4rsDtCjry5vjk3t01MC74BYOTuIY1oNlGhP895ct/?=
 =?us-ascii?Q?IE96rDTHlD8CsFEIA4qk4nFKM+3o1GmFN9ghaYTL1Sk8i08L+MXVBhkuJzcn?=
 =?us-ascii?Q?qY5u72RIIrJo80jetIxvLztotkzQgbhPMhRS1BIQL1/Ii7kQSoc+w3P5Apzx?=
 =?us-ascii?Q?O4dTM7RpH5N8XpdvZ7vGNbqakT8W3SV5rPT5DHhgFvhy684x4xnEZD5XHRPU?=
 =?us-ascii?Q?mIK6TEZb2nY1wgn5qxIIY8VsrYTfIZvI4zmBXXXC/3IyXNPTDCCB96YCQrI4?=
 =?us-ascii?Q?6mGBjgmVm9dSLr/p0PG1TfmdjPapDNQNq7/y2J8vq88z2iCxhafjkTE1ZOvk?=
 =?us-ascii?Q?3f0DGRXRqRUzT9qDjR5z8Lj4ieTmL08pUfUSzni4pKFVfE3bAex5Y4wWo+0C?=
 =?us-ascii?Q?f9xbw5qlhXy/ltQ746jxFG4yMdwsEGEMPW2xO6fk3BlJ/vYUgCeGrZBc+Lbw?=
 =?us-ascii?Q?VuKXmOq/0UrhiZb+RwPglTASrYnzOvj/mMRwxNR6Q7PP0UMsNW2hXqCCgIVy?=
 =?us-ascii?Q?r7EbrMVgvMqkGUqLKHqreqEFD3ZvwazppdqmQVkKS+hebJsAeN3rBC73dVx+?=
 =?us-ascii?Q?tCck4Y8DGnVMyB8kTzrruGkD9mjAvw4wHhaJ1utV5zaHrQNUyJ+7wdf4LwNw?=
 =?us-ascii?Q?C7rw7AgKtYMwnSRdxcv+PPE7TtoXBLqDXKuvQeTh9gHcYbv4yRcmySap2PAL?=
 =?us-ascii?Q?0APucNfrfXqCHLdBoCyO/CbHrEH9Jriz9/VRZgp14jE5F8oa+bcpI0whwvpX?=
 =?us-ascii?Q?AxedJxLcTDsSm3lghIwNy5jd85BzV5LG4EXI59qKehC6g64eKTX5jQ1qkEfc?=
 =?us-ascii?Q?MnHE48p/UVr/bOA9zijMnhu4LMQEuWXqi0HbvLtq0hhWxHZCq4JQkKbkiVJg?=
 =?us-ascii?Q?sw+fqoR4O3eNbIr8Pzd/gAiMEuZwA5FTra93b8gByXI3zeO7jE6ku8VpCn6G?=
 =?us-ascii?Q?1TCxPjowquQRq03cM5UvxBNlY3Q8VGq/Kls1r2UtTkhZgvsiG9hTY77Dn74Z?=
 =?us-ascii?Q?Th7X/4n3TKMmvbDyD9ZCml+MQoWZjz2/wopshedyJn6ieiR3B/+8EGhGmjCb?=
 =?us-ascii?Q?oAfhRdOyOG4itOxMiKphGRTvS5FQeEF3fM8k3DA+ZEeCMn7/ujLCaZ7zgZLg?=
 =?us-ascii?Q?wMiHlkPWk1tYQxgDNrs/edy4f0yBQuAQS5ciFmP0FRTV2awhlIZd26pvvsPx?=
 =?us-ascii?Q?oJ1nkCXJKgsoyn88QYVI5CmIGY1qPggh3L9G8KD4v/eE2pW4HgGLVz2YvTvC?=
 =?us-ascii?Q?gaVqpnewHszaMNz/JzdG69XvjndSf96YGv1OeZufIOPWJyFGvAAxese6O2ox?=
 =?us-ascii?Q?QS9FJByFaFvDZobvOobk8aVpeRsUM7ySe7ponh0tP9Jn0oj2aC9jnMZrD7aN?=
 =?us-ascii?Q?DcRRKy2ghhEZsks6ZwzppSajM37OA5XVgLi/uqBRf1ldC1YImVj3XOsbfyC7?=
 =?us-ascii?Q?5gtPrNzd0s5RVFYzPrGfJdFU5pDjzPy9zODZ1qVMDoUCcsOyeRZ4h96R8pwq?=
 =?us-ascii?Q?bNaMPJE30NST+jYtqP4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:53:08.0436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 878aaa19-2db6-411d-da38-08de376d56df
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5760
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 21:53:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19337

meta-ti / na / 20251209214132.4122996-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH 1/3] linux-ti-staging: Add initial =
6.18 recipes for LTS development
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 9 Dec 2025 15:41:30 -0600
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: aa1363af3b62f06c40f3b5a0cb8a8818f=
054f0cc

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202512090100
- Commit SHA: 166b69e064ed4623c1bf36458994da1f8ddfeaf3

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




