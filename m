Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474E4D3B99E
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 21:41:43 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2327.1765316501080541275
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 13:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=GLvl6bf0;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.37, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeAfJvgRxy9dtVcJ+UL09Mxjha9nlHYx0lICH/zqC43tkjZascLFGRj/t18GhRb2W76tM/88IqcBiuZsvwWFXjueFPFtCQGY8bhvdZCUtBwHNd4jtKnbP4azx9QpCE2J6j7mmBUatP3HQiffH4I++RhdkcR/nlIqB53vvNIQedAcBXKg5WZLm+noj6weOYGMzXuZjFxkRqFD2dlMLTPce49ExLtSMjGantg29kVI609G0KOHqOTG+yzSPV53si1wt/Gkz0AtkDEeKW1CHJYhYgbU/JaLihcqVGtR/SlgSiSO+RNWbHmeHzppIpVmIhlu9Wr+G0zccY5auKjk8tr84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bxms0kjKg2axAoUxMD+2pRLiSDwOa4HpH2GkFeANds4=;
 b=mJhVYczPYpiFpnrNFZNiNANfh1yEnwxhW9ITJjbAP8nNW5DKnq9utxZZdduWKvV14MmDcOs2eVFJIgUpmEvOD/kR2FWWqRakaxG5KS8QiIixCyH4eRuXGV21GHzbCTQCMSEQK6x81XDxw923pq+wnoQxsdKjMo/k0RTDroZ8IaaGzn8uSGait4NfOu49oxd0uV1FoKCtYB7Do3nvr8AZrJyY3/YSVBwdWminBgOB92vD6fohw+W7XMhs8lO6SAmNgjxjMmE+jb3N5R/Xv6ZfWAkMuhZ9CE7ANydL1LuAITOE65V+4GCHEctoJl6HRxEpFNsK6NK1JPIEu7KDxgAx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bxms0kjKg2axAoUxMD+2pRLiSDwOa4HpH2GkFeANds4=;
 b=GLvl6bf0em1mUSD5JocLrXUMuF68nnunoI1Zp1s9z7yOZxCvIJsfOv8MGxOaxOxbYOSvpF0GQqew+Q74O/WRaG/pjTn1OfqQIM+U2cnszk5pLlAFY/9liJQMNjh+4E/Tape1paSTL4374Qam/dsZkfW0bSudQtdb8w3H947ltdE=
Received: from YQBPR0101CA0136.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:e::9)
 by SA1PR10MB6390.namprd10.prod.outlook.com (2603:10b6:806:256::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 21:41:37 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:c01:e:cafe::e) by YQBPR0101CA0136.outlook.office365.com
 (2603:10b6:c01:e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 21:41:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Tue, 9 Dec 2025 21:41:35 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 15:41:32 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 15:41:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 15:41:32 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9LfWnD1872072;
	Tue, 9 Dec 2025 15:41:32 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vT5Se-0000000HIaI-151O;
	Tue, 09 Dec 2025 15:41:32 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 3/3] ti-bsp: Add ti-6_18 for LTS development
Date: Tue, 9 Dec 2025 15:41:32 -0600
Message-ID: <20251209214132.4122996-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209214132.4122996-1-reatmon@ti.com>
References: <20251209214132.4122996-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|SA1PR10MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad4c6fb-5b09-4c84-01ea-08de376bba49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OLOGCharZ0DPy8dmiM3O6eABJNgFHMojaPCgFU6SBtAOt40o/P4IUukDNuNY?=
 =?us-ascii?Q?RtYlTBuxo+s3Vy33NSv+778gWgHmbhbXWMPtJwEtJKvb/8p7XNRcIYuM6+yL?=
 =?us-ascii?Q?VW/8cHLl9otr+kS4IA+Q5/Ib91PyHgUxWlenebUcsamMARIiufZjo/Rm8fVo?=
 =?us-ascii?Q?dfli6QktJF0TUb2rep7izlen3WbfQF1eC4HJj9l6XqputKbvTUbPizZatnW0?=
 =?us-ascii?Q?lpnyxYiBcMYbJU3GquUJmBaGk80tyjCo7RMg1wYC5B3HBgRKVVgEYccahQ97?=
 =?us-ascii?Q?MfebZISIDffvqaAjFqQ/YegqENSXmupT+LO0edj+xTwzzHWhc98nX24e0fPz?=
 =?us-ascii?Q?ILoywB7DE776RGQ9IdfF+7CNpKyfz4H25DaDjDi/uyYKruJBlmE0vv6zS4VA?=
 =?us-ascii?Q?sCx4y/RC0Ja3HIJYc4Xv/rW/3GJaC7BBeTwWHdj91dmCWxN4ZSEQhscVKSWr?=
 =?us-ascii?Q?PDuH3kZpCQcwll7O4ww0UoXWYazGs9DJo0bkAZy/e/g7Fh6jpzcH5s9XxP4C?=
 =?us-ascii?Q?dnBbmpgXr3ZLi3TJk+okE0AXinugOfM6dlMi2vMvDAOc7XAXbPykDcN1jPAW?=
 =?us-ascii?Q?6zQer4GvtfeLxAaLE9ddo3Db8RWRVb5VQvcvT1Cv+uQcU1Dmpqr+tHhIvv87?=
 =?us-ascii?Q?n4DvI1bDIWy6VAXJdrEfyBmd6eewtVdh4UqG/Ha1uMDcQe1VxxqnZHkEfI2b?=
 =?us-ascii?Q?7uF9iJEezHAF5k4dR83rF1H0u5phpRjH6lbwX6C/yb4QJ3HQpRbtd3s+CVo+?=
 =?us-ascii?Q?2nqn+Ah2QJN8ueeErExwGzLNxyaAvq7H1klYePVRu4s5eUzhdowaF47PLjEU?=
 =?us-ascii?Q?3YC/gZBc3N6FVBFBUVTPDEtdkVKv7APaTxvmgaTPANvRLA4y9RE0wQb7gVtT?=
 =?us-ascii?Q?ELRrUsBKeJHs+JPONwdtzM1EqJG9tQ0RlJIbhFwp0b3DiJ9nuY2dMYHgcS3Y?=
 =?us-ascii?Q?f4il5/rJU8bQpECcRnrGjbGCgVYp/AtRtycZsxLwUm8wt7ohPuYrORGZFQs/?=
 =?us-ascii?Q?8BCCgcpD0K7hKc1WXxcZsnjYoy27MFuT0DEsp4kRDNA1gTpFKLADMZigecSf?=
 =?us-ascii?Q?x2QmmbOPw14rKtZG5OUxuQZGb+DltPwy92dvUDkcKDtgx1Ij4q8pIvy20QDs?=
 =?us-ascii?Q?wVsKGJqXC39622Q9cfXF4xx6nFzDYmOMQdyLIDVZQZZP5AOvHlH6ZENkNtlH?=
 =?us-ascii?Q?wwTlcPRPIN5FMP8fGU6xQJye2JCQ5Jp6gI9iSEZ/3DSRLusb81KXfi7HmEQp?=
 =?us-ascii?Q?FmMufWRJ501n8HHMkMoE+/q8m2i4tqqSqcUuSpAOi/217yCZAToE/QBVVxuf?=
 =?us-ascii?Q?CP0ykol4D9sbvigH9YbG8LvC5P8colFG3ocmwhBOVKEnEVaMkjVAVyeOf3q1?=
 =?us-ascii?Q?uQA2c+ACZlZp2jqtL+eWDzJ7LYsmQm0gbh4OFPDQr2Dv+YsSllkjXwMZl+Bd?=
 =?us-ascii?Q?LL2blwnaaowTB9xlOQb55jFgihKBKyDXvjXgqSwEkjT8yWnfSV5Q5Q+wdc2B?=
 =?us-ascii?Q?Xo1Z6SbAEABzGkYjSuZutq6LeUq4RzvOTAT06nMoWWSCeBHHwFjUAyeU02Wy?=
 =?us-ascii?Q?CKkyiR4Reg4AjE/Ywww=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:41:35.8415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad4c6fb-5b09-4c84-01ea-08de376bba49
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6390
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 21:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19336

Add entries for ti-6_18 for the upcoming LTS development effort.  This
includes:

kernel: 6.18
u-boot: 2026.01

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf=
/machine/include/ti-bsp.inc
index eaa501c3..0ca2de64 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -3,7 +3,7 @@
 # preferences for kernel, bootloader and graphics components, as
 # well as a dedicated machine override.
=20
-# Supported options are: mainline, next, ti-6_12, ti-6_6
+# Supported options are: mainline, next, ti-6_18, ti-6_12, ti-6_6
 TI_PREFERRED_BSP ??=3D "ti-6_12"
=20
 # Use bsp-* namespace for overrides
@@ -33,6 +33,15 @@ BSP_BOOTLOADER_VERSION:bsp-next =3D "%"
 # GC320 support requires out-of-tree drivers not yet available in next
 MACHINE_FEATURES:remove:bsp-next =3D "gc320"
=20
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+# ti-6_18
+# TI staging kernel 6.18, u-boot 2026.01
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+BSP_KERNEL_PROVIDER:bsp-ti-6_18 =3D "linux-ti-staging"
+BSP_KERNEL_VERSION:bsp-ti-6_18 =3D "6.18%"
+BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 =3D "u-boot-ti-staging"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_18 =3D "2026.01%"
+
 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 # ti-6_12
 # TI staging kernel 6.12, u-boot 2025.01
--=20
2.43.0


