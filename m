Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513FAD7495A
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 06:22:37 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11589.1766125347200699232
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 22:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=tY2RwiVH;
 spf=pass (domain: list.ti.com, ip: 52.101.43.45, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5rCqrVPatjGdKzXSh6N4jU82C2V0mdL5iwbzkQxEMij0X3IFmT57L6/gnTw4J8uQRt0OPi4o29+xSEPVyXs5DAEWckgluSZ6/AE3VmblvMkp7i/RlCppd1mtFILroDgTke9n/hL9QIfHLYywcqvAXaH/jT/CbMPzj8+USzy7PGjgu9xy1zP8KCtW0f7Ab7Y9lLd7QllB5zNLqwC/NlSFZ7IMXcEHmTElQQD83W5sdfi08JBTUojt5wMcKxV/S7yjAjJ35sXRXESt6jVoAhNeeU6hqQolgIX8Hr3EPxJY5MpLRz7to3bwSOSGGAN5a2ptGU/HxLMBgAJMSSdENTNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAot61Cxdv+ED63O4e8rYT2PEv+xwbgVBOpCVGX8tMM=;
 b=yGPhFfaA6cOC1x23Lzg3uuuCsGCH5tq3fZF+MAMf/w7AHHXDjFAw5j5SjbWF1LBQXJd7hcG+WEgxgrF09JaJVC0lo86jot7qpmI6Wwd7Za1BCKmvWcYBYIyp3cRZQHUM8nxUUAlgeGWClmq6JqN/PRQh5dS8eT4dmoOOcJxnFqzxTszDByaJ73T+yn4lh3pswqzg4q/qzL5waFG1yjZ+7pPLm5iZduF3JT1Pnq0w6JDVSJbt65nWjJQ1XXlDq5uWqG9SfjHhKr51n8O8C4UXpOr1+La5JCalGf8TQlTY4c5D9GasQMeUW8kx5nFRp72aecO46MWahMQk4VcgPOyDfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAot61Cxdv+ED63O4e8rYT2PEv+xwbgVBOpCVGX8tMM=;
 b=tY2RwiVHFTROmDhtQao+AKV8jQeDDkNM4RZYCqO9JbIH24lDly3+uj/E7h/+jPGieZmsWT4EjUJORlvS8gNqq4yOt2/43i3w0lcT4Cemd8c/CkFB+WyxYe3kxPfNIL8SbhmvW8k6WWl/+eldFDXhIskXAuMIJc+DtMM5g6HiCUsVooiKmrddHQpOzGflePQY42OB6m+e0/qOTs3gurnUA9dvIAvHyZszsjw+JDXt7+pUXAMFQ4FoZ+O9nYrVJKCgE9Vq6Y2UO28xAG0GI9/4gGs/EkaKpaKM8JNSUVdgdw4cilmj4oVWKBlEeABNe7u7hb12MvUCqQ+wa/I6YEhR/Q==
Received: from SJ0PR03CA0219.namprd03.prod.outlook.com (2603:10b6:a03:39f::14)
 by PH3PPF54C97C915.namprd10.prod.outlook.com (2603:10b6:518:1::79f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 06:22:24 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::c9) by SJ0PR03CA0219.outlook.office365.com
 (2603:10b6:a03:39f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 06:22:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 06:22:22 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 00:22:15 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 00:22:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 00:22:14 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJ6MEU1463483;
	Fri, 19 Dec 2025 00:22:14 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D34B89ACF4; Fri, 19 Dec 2025 00:22:14 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202512181848
Date: Fri, 19 Dec 2025 00:22:14 -0600
Message-ID: <20251219062214.3648425-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251219061349.1872543-1-lcpdbld@list.ti.com>
References: <20251219061349.1872543-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|PH3PPF54C97C915:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0b880a-f165-4418-c4ce-08de3ec6f866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FweMk5cQCd62ezd0h0GKFl2UrxapPphDPo+eOWucbflLwh/hzl5OJMQA/udR?=
 =?us-ascii?Q?VNCEO+Rvo/vHJ/HiyZn5evH9Hl8083pk8iVaeOkV+/50MunPKCg8E7718PYf?=
 =?us-ascii?Q?IFAUkzJKwrb2J6XMRXxSwc826rgxo1aiDhj2W1BHCoyGCleTn0I8KHv+Cezg?=
 =?us-ascii?Q?3boO8Sm3VoWnCfEv5jZDsku9ZeMf61DkQYLbl5CLDb/UoicN7qb9/kRqUnT4?=
 =?us-ascii?Q?DWvfzdiAt/VIYnvJzLu1Smp1iaUEcQ1UXd9jpewTOsR7bj8rqgtLqeYrwKW8?=
 =?us-ascii?Q?T/swoYqQqxwJEcqzx8g6NQMd0JF57M39ZnUWwa3G0xJjPOrB11MTzHKUVxQ4?=
 =?us-ascii?Q?l9J/yWlXHStyxtGZD+uF+L8HeKegW6cabh1OmdX9fC//EAgk+B+DMVZPSOkc?=
 =?us-ascii?Q?JGwdTEvZnW0NK8wOw2upb1FFEiZ6FxihybgLCt2SiMnAuzB97eVOc6rG09LI?=
 =?us-ascii?Q?I/KXr+1BeS3Mt2aW/xLUK4wL3hrX6KK2fPZ+LDZ5Obe49z221bRizy3brAOc?=
 =?us-ascii?Q?7AJ/4ra5C1kf16KbAG50VzkLFwCHI34394+E8Af0DmZ4urd4qo1M+4vmdfPQ?=
 =?us-ascii?Q?wmApW0TpzET2CoPpAFahh0wf5r/EhZyIsBEqBqI4R+GAfchcoS5t3vonm3HW?=
 =?us-ascii?Q?pN5jCuPY7thFXeHgG/+v1ye3RQ9rzortc79RkAU1EfUzPqohfyb7hgbhN8mN?=
 =?us-ascii?Q?xdom0BdvCaEJtyc3c/IweOG/y5Ncnq+ro7GRR7X8iYE17RkcdooaKIYGKOa6?=
 =?us-ascii?Q?QKQBqgt6nBHdurzkIUdUlLGeZaxSE1NBZC3OKpbU4NoHqucUFyyPY1TE9eJ9?=
 =?us-ascii?Q?H123GwALQqkSFJDpLp2xnxubIMPsP0BkZMwgaPt4l8hs+MOimWas1y5NmVqr?=
 =?us-ascii?Q?mFgUhlTPIOSlRkrRVudgv6wVxU5SwhTgmxVjugHzfQj137CCHoMtE9BTLUWI?=
 =?us-ascii?Q?QsC/ZHlifE3iRESGM7aAnkklj9o1pBMLvHCZSkrjUBdV+ghqqa7JOvDMo02S?=
 =?us-ascii?Q?JLFFYBmnYYRdfnbKeQIBMeUm1KiNzePeLrvKk3OMk+CW7jn+ssPhVDVg1kyc?=
 =?us-ascii?Q?r3qqajG3/5f2j1PyHt2B+qd0Rr79NcYi3MyjJ4K5r+CXuDxcxjp33g3fVpDH?=
 =?us-ascii?Q?oAG/hy+dEZ7c7pf+dHfR468L66yVwgsCvbBf4o2hXBETNkIewZ7nxcRkOJcF?=
 =?us-ascii?Q?XxovOegWLOqTNDfQffpbAp6tZc+64WCulfPznYf/a5BUw21xCEDHders6ORM?=
 =?us-ascii?Q?fulT0WmWpsxl6/NWtfBHTy+jcAH2deWCqqf/UWKU+dXwhbItVUb1ipEiCYtB?=
 =?us-ascii?Q?E0vImIBLNG6DGhKP8t+hyp0HZqxaFQCoESvjir82eLTe3thz4pCflzbJq/DY?=
 =?us-ascii?Q?8rN9pDXQ2nula8VRvRJNXxWx6AZSzEr9Mb2FjN0ZNhGbnpqixVcVonRmzzIM?=
 =?us-ascii?Q?L9K2FtTDaxhEaExH5OBQ1l5OElsDcqkQ2+FPciyDwh9ZvkIbeftd619eElcX?=
 =?us-ascii?Q?bkzg/ZlnvjtqiY5WqMQ/A1U6E6XbYJh0wK0czvzaEsdRNu/ONUcS2P30LBWq?=
 =?us-ascii?Q?4uvjgA+sPulTcXBruwk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:22:22.3787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0b880a-f165-4418-c4ce-08de3ec6f866
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF54C97C915
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Dec 2025 06:22:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19375

meta-ti / na / 20251219061349.1872543-1-lcpdbld

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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202512181848
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 19 Dec 2025 00:13:49 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4062ffda5a242b82dfea0aafe707f80b7=
1af73ea

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Judith Mendez <jm@ti.com>
- Commit Subject: trusted-firmware-a: am62l: Update to latest ti-master
- Commit SHA: 71de48a7220442695bfba8cd50eb9d0766e960be

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




