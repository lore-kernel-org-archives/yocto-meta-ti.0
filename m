Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03004F417F1
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:54:30 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16512.1773068065802460703
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 07:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=pFqUQ4C8;
 spf=pass (domain: list.ti.com, ip: 52.101.61.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gO07KJFthg9VgdWN5mvDeJKx+9tlRohKd0bfV0uAmr1EiRou3Cr2X92HSdHHWJ8rEcFZmS5sKTl4EIvH3c3Ik9Yt9Tceu3X6/6GEmL7aDbGFYo2bL3k5GMVYKa2nXp0K+2pxdNvryKmtZ8JahaMwawJGBCL9bxHxuZTwrxgbaWQ7lzGZ4tXlwn/RPpE27PRd0oDNddUNJ4BAz4rRRh5KAlBpc6xOUDwiHhpuZRji6ljJCDDKq/NxIgaCbIeygeEwoHlujlwhCuhtA3dwYk7WY1GY4zoqgZfvSC5YIwg+7mIbd2c+Q5Eje9mzenD+qB4NKXO7HLOqncJ7dhmVUYWoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+gX0HQguW9T26JPMFDU+LAvEKGF8ndYqrhYEhoCxnA=;
 b=m26MHQcXNcIzMIhurX7WH7qMhKiF3yqbOuosANhcdcuMtovmdpjPg4UUbC/LI2uiO94iJdXE92rLtUWTTfEHlMTn7WoBY7+n5AdoueKLJ3GcsNkQwihfOYWOjcBMZngL6slbyX/NvBts8XXv2A1q0vZ88Pv2Q4nOCSkflvEjTNnZQ+Ru3FxUVkuiUKfpbyaRl8H2naIDCOdTqSND7RAzjFiLB1Y7dOVnMJUN7CiDhHe+yltLxIlKRy+nkg94EGSOW5HQlUxGJaOzpartwW+nA9hYxW89oH6cVi0fG9vzwWHLmHwHVVejouODGjnfXc7G7BoG+gRJXDuUjoaNQICwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+gX0HQguW9T26JPMFDU+LAvEKGF8ndYqrhYEhoCxnA=;
 b=pFqUQ4C89poVy/iEuNMC3nZyOS5nPdxXynz0kFSOR6cicWD5XzKPbSajnwFMNlCsPVlw0swT+US11umK36LP4bB/9NDIDtovzNdXxoYFVzMiOvOCk3ZNeyA1f1gS+wuIngtLX8kv6UURKMRpAEjmPEzkCDqg0UyS4y2f9bZBxpVlD/8HBQT1GQ+8bDbtw0ZqPGg0jInytGf+Jilrlk9ZQ9L7dILSlXYyShcFzLGQCNM1WcIe4X4K0uqLQDefxQHt4+Sm2qFB4MglH7cyQZzlfYJ5Wd3A6qFdj3rlt//xCBXizoPQaneAM3V0n1J5EzbHYTmrF7Z288STwLFkig4n/w==
Received: from BL0PR05CA0016.namprd05.prod.outlook.com (2603:10b6:208:91::26)
 by CH0PR10MB4923.namprd10.prod.outlook.com (2603:10b6:610:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 14:54:23 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::5a) by BL0PR05CA0016.outlook.office365.com
 (2603:10b6:208:91::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 14:54:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 14:54:23 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 09:54:21 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 09:54:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 09:54:21 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629EsLdO1299819;
	Mon, 9 Mar 2026 09:54:21 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 546C0142E1D; Mon,  9 Mar 2026 09:54:21 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Prudhvi
 Veeramachaneni" <prudhvi@ti.com>
Subject: Re: [master][PATCH 0/2] jailhouse: Fix build issues and QA warnings
Date: Mon, 9 Mar 2026 09:54:21 -0500
Message-ID: <20260309145421.2795618-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260309144356.2709949-1-s-sadik@ti.com>
References: <20260309144356.2709949-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|CH0PR10MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: baeb456c-0241-42b1-8d73-08de7debc08f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016;
X-Microsoft-Antispam-Message-Info: 
	u9jpATuMdzYywyh8IXH7k+z/lWu9H4UZ8aC1Q+OTQ+gmyOwPGkZSPquopyNtz31KjjwDFvy935prPCPTIQ/5Laku7OIEDkELRQPsju+I1CQ0BuHl2QBk0vuSpEmvrNd3/8lbMjPjtP8I3TSIUza3jpABL4E9AstcRn74MFH87OpZqB2V+CLyo9i5c6FhU0wG3gwSDH8qW/apu4gaktcvsbWDhOks4EpO5kcwWwQc2E6wqcqb7Ml7GCpbPVQjW8w0OmjBQssyjAVtHPVu5MfMkSYfgnj6tJZWJa+5k3o1fo8aYmAGV4Zmjkp3MTUM7OSUXI+pCSURzbonbH00HHoVgNcw+Nomy3xA5v8wDml+69oxEFwzZo7a/Oiu0UK46skUiWCFhV/7rlc+yUpEi7ptfuUsIGu+2I8g/YTe8wuSPgiC93+huZ1rGV8Pgvf0hqtW0D32WEfxeHZQb34/brlUqew7h2Cox3ZH36T4Ksl4CDraNptMaVF4yfK08KvrdAhROoMSB/7ho2OWNwbJUqWCBezVL7zNfHG7FuNpwiYEmYNCuXVvgS6+y5Fu6/q3ME20ZOivk+NzVHIyCMlwMz3QpXEO8MiX6jE/QSHHmeIxOATEZcpRcxB04TKB5QVbn0v21tzdR0bfaMfQx3GqniuEkKPC7PYsGTgiknu5ZHGmAJbCcm0GElL/dVSBLAd7adk2K43RmwGd89tAo6QcQAN7zwHFG/WiBrCsYKZKpRqGCWXLqnj93jcjssTXzcUWtIidUY66DzkQd/Pab1o1khYa2A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	K5fC4I1DpcxIkeqXqBUw74xWltA6g8zR/WdPDb4jaCGJo21WAefa6S7lYm5ol/LbyRetYq9GXGTBuE69eelqo81pYXlU4jq8vBWvcl7k8Hjhp8y4fh76+DcaPtOX6QDHge80Dy68TyTuRMIEe1y4F05Dx3nQYmC+Ikz40xQl6Q249JJROFM/BPy/xJMSUKPd5zV7r9HcaK32VjM46o+JW1AXUVr7fMniPNL2so8xVBWW2ZALGov8dNxmj4S82jNyv5u5JqnfuWg9IWW0e56X4nOOzd5QGPQD4anNVcAaZDbnlyXk+sO0z2VjT5R1n/cU6aVo/+ElivbAXWJZQV5K0mzuHV0IM1ODVmVYVN6qbszSuWfpl7MdNA89mHbJ4IubcUM06Y4CmRBfLyq36FJZfbWMTm99PkQ/2lvCsMr2Jal/6zPvGMWectGvIYqY+/27
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:54:23.3417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baeb456c-0241-42b1-8d73-08de7debc08f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4923
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 14:54:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19677

meta-ti / na / 20260309144356.2709949-1-s-sadik

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
- Patch Series: [master][PATCH 0/2] jailhouse: Fix build issues and QA warn=
ings
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Mon, 9 Mar 2026 20:13:54 +0530
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 1645cdc14f1bffc9fe0e116f6e378a81c=
fabb9a3

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: deced73fc1a79071913faddb857ca79c2f6c7b72

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




