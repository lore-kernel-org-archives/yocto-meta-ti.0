Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F88D2FEFD
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 23:15:38 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.817.1769555731653412441
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 15:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=bD/OjflK;
 spf=pass (domain: list.ti.com, ip: 52.101.43.1, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iA8uv9bsn5GWDfQWOJYFYFSsv+5CyRsDRvKVZC+GhNhYggywWuCfv2oa1W5tnqNWQWu+eG73eqPYSfSDUK3X1Obt8SrFEQbUb+jPrJwGQ6FmwSo9sXuZNOn7n3uV1gWU/N/wSPqr6MCUFGMYqziTGESh2pWZ/tRyeOv7cAoHppPMqhvZ4N6/g2VZeEsULG+TbNFiDEXn+s7BYCW4df3+J2Ei74j25+6OVN/5IbNo8P8fA7hv4F1OTaU+OvMUy2SPMCB47C4JhkV0NSQWTocDtqmn53uVanYD0R/HsA/bKkbUAcyVCqeFUBrIyWNcG6/xICaysoSSb9pZBgIaIUemZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLjsSFVNxs6Mo5rISsqisEbaodWLOKD+b+/6xaYnL1E=;
 b=ANg6Svq8S0UgAEArf8YjfC7Fkuy3byjZ56aub/nyKBvpFloM1xmN9pY72+wsnMeiQOEw7lvPOHh6qrRtN0nAJls7Dn3A5qzaMnRivchit/htdBBiZwNhfOiMGYiLRqh3OZdHjqvmqlIVFl4KF58zyz4Am5WWgk9qLzz8IpR2Ph8G8eVcj5me63TSH43qj3ERcXme1BJkOMP+rwr/1HNTOCEUFpA+Wc16C7TYoA6SyIFi/KN0fpeXlNrgHjZ5QRMY7xgIS4xS/kZS0ap3upTMcjcLz1VEedGt+I4eQ7xQKg4QGJRwaV9kHCfdAEPcpskU2vOiZdPREIl1qVenQwktcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLjsSFVNxs6Mo5rISsqisEbaodWLOKD+b+/6xaYnL1E=;
 b=bD/OjflKP/i6TbIOR63EfKXq4M6dOy4jHRZ7wLBmqsrTlMzC53osVOxGHD2GZOkQBsO5sG/u9fM9S0um6v2W9VB7dWWURd+EdT7ziX5q+G/2pml86SrnYlIHZDacg72lTFT+9pXeCxMtIz5QQLQAUen1zYwaaq2rV1yFdk487sBupoL9quijbUWBVC3gIe0MmvyYCce2/BUbYrCWgH8oCylFwBYwzaObpAa3/ORgYHe7m0I7FsVlj5qup7NGVmG/++9H7JXuuo+CWxjnWnlIE/r9zLLMbV4/+ndxrbsY86sfdY8WcfNAVm8kCaJMDxAjptdEDz2K1FKlc0b0C+rhKw==
Received: from SJ0P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::30)
 by SN7PR10MB7001.namprd10.prod.outlook.com (2603:10b6:806:345::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 23:15:28 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:41b:cafe::aa) by SJ0P220CA0026.outlook.office365.com
 (2603:10b6:a03:41b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 23:15:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Tue, 27 Jan 2026 23:15:26 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 17:15:24 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 17:15:24 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 17:15:24 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60RNFOiF1314514;
	Tue, 27 Jan 2026 17:15:24 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 896E69ACF4; Tue, 27 Jan 2026 17:15:24 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] linux-ti-staging: Update 6.18 SRCREV
Date: Tue, 27 Jan 2026 17:15:24 -0600
Message-ID: <20260127231524.153434-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260127220444.21374-1-reatmon@ti.com>
References: <20260127220444.21374-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|SN7PR10MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d785f1-3a05-4a47-9067-08de5df9f4e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r/H3JrTlsakJlfho9LpjHY+HKGf/nBFImpF9HjTBi8Iqtp43NWXEk4WGMfzZ?=
 =?us-ascii?Q?4KhL/Egj6K0/MrtjePqGVHUNx2dDJ6+hN/C94DSFHKAPYcB8Ch5Qbh8IS+6H?=
 =?us-ascii?Q?iQnUAkc8LYyvp11KT9PRYrSvv/gIPMt4/yTR744t+DvfqiTibZ/mFBYzvTv/?=
 =?us-ascii?Q?jzQ8iZ1TDIEDBQP+zrHaEAI8EQI1temLntGkkCtu/6uww79B7A1OBpaGAw1D?=
 =?us-ascii?Q?apnE3bUnIIq1Gmyi4pvmpi4Jms0AtDzZi7Wr27zLlPPADZR1Mxp66QyTBMtq?=
 =?us-ascii?Q?LBxUsN/abE9r/gd30Shxq+ZL6i5rosb+fLlmIzdc9G83zqlGzxD38aqZ8cU2?=
 =?us-ascii?Q?QTjTyminuDylFvnADtGZC8kG1KG7Kqhhu69+zx0B6b9/tFDlFZdUasZ6RJzo?=
 =?us-ascii?Q?Q1lL1FUtdZ/UvQ6AkbdXesJgIGXFKgqcHAu9iMhoVlkiGqr9kk3ILV8MmTJP?=
 =?us-ascii?Q?dUjOjBK2glMx1x0yTJ0s3sY4PegaVQY7xQXgoOHg1IpMDw26J6Lh5T9a8MPE?=
 =?us-ascii?Q?8m/sikoWjZJLcqkqSnkw+ifakbjZYVNeISVWZxkKLASobyxxTZBbBBNpDgZz?=
 =?us-ascii?Q?La/dOn7iakJtEEMkporf1cP7ZRt5t8s9As+uw4S/x2ClRjV8BMNLcWxBpbdg?=
 =?us-ascii?Q?q0tQSIZC7du8He8sgO79mTA7se4ssxXFj/aYR757b0GRlH8BOKaOAcrzH9AW?=
 =?us-ascii?Q?tNSygLrMnV7mV1U0RukTKmsfSiiDsrwRRfYNsR2Y0S/TuQUTjAb1lIYUO6kY?=
 =?us-ascii?Q?Z9nzfZ0B4ScA+tZGGDErIlECkeQJv9a+/eqqySbo71+GGQMLMV0Qz1xeGfHC?=
 =?us-ascii?Q?BFO+j531P3l1y8aeOLqCgZ/pO1ddSAi0I5ZEmua6eC2Dxc9Ojwi/PYJBdxk2?=
 =?us-ascii?Q?eETZeDoGyc5KOecQDNGAXTLon0hwPeuu6uwvSUMb2ZeRcgLRfp14Zl6ZZ7lR?=
 =?us-ascii?Q?9imkcQBVQKzKTen4tO92PzWvvZXQIqJALFF3RmK8sU9C8aEzYWFrHd7R+wc3?=
 =?us-ascii?Q?/dbzjUfdey0mjM6AsBMz1AfSImn7Z+ZbjtRHgdeJ//A+y5T08+uGTgFBxCAn?=
 =?us-ascii?Q?BrFnvQ3ggV2Nk51nisfJqO70lPDUvKeEVfTrW/1+Sm+tqKHal+dJoG7lWayT?=
 =?us-ascii?Q?2mS4cGXDqH8onpaGlKgFSjRgULOZl5SRiWwRpZIVfM9KXFDnk/Wyw4bAUzAq?=
 =?us-ascii?Q?I0+RXgpYW2ZIUlLOTcMxWZnh44lBQ+IpFz9MSqHyulj4nMYGV0JQtv8lngaY?=
 =?us-ascii?Q?wjlzIYXgTWB0T1khM1o0YUJ6WoAqg+gInPUyOkH58b9Gp7+wF1jAsWJYx+J+?=
 =?us-ascii?Q?URcd4+qDm88vj5jEWUqULjiRNFYllwsCPViJGrEZIjm2u5oLIcPhNNK7FnF9?=
 =?us-ascii?Q?f7Vv/3FRcri3ZeLqNb11u7xU30/dS8TrkoCxOR6DgFWuaKeBRjn6Mkzag0Yz?=
 =?us-ascii?Q?RvE7faZO/9EppPrGc0Q2EwtJ0T/IkDAmww1H6gnS9TbfPnLVituiUfIalt2e?=
 =?us-ascii?Q?BClL4nokEcJ3ATJowuml2mwMpMLXWr1De/JCGSjmOeGv1KVu67+MlhYSFPOx?=
 =?us-ascii?Q?9Uxxdhh1HTrYoliL4duT9b4IogwEaSebYGGf4rlggzW9UInL+8lBmaPuAVrQ?=
 =?us-ascii?Q?JdvOKEfcZ5JwWXHhsELsCEQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 23:15:26.8616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d785f1-3a05-4a47-9067-08de5df9f4e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7001
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 27 Jan 2026 23:15:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19444

meta-ti / na / 20260127220444.21374-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] linux-ti-staging: Update 6.18 SRCR=
EV
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 27 Jan 2026 16:04:44 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c8e8beaf18c97391e5c3aecc0fe2ec8f2=
fdd1e0e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Adapt to upstream change to UBOOT_CONFIG flow
- Commit SHA: 85c3cc60bea8bae345c22eda82fc81d5cc9bcbc1

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




