Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45911D3B9A2
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 21:41:43 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2322.1765316498748023864
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 13:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=N1nr1Dsl;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.45, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObJoHalwmS/JgUlVdrce2sNjUD+KSHMFXyQR6ONZytoXMNBg5NTSzM8YFRT07nTLa/KJ7khxmr7qrSqfRpGX/0a7aDBqT3JC6wXmnu/c5oRqdziOc4wPkYs4ElBLcuG9ClDrvbN3Y53LKEm2xlUOu7wGKeyXbalv9SiY2PHWNokS1X3bOeOsZHu5rxzMu0mivKpHz61FLTE9Ahrx+LeS1BUMO0XyQEMtwjlYTsjkuk50eBmRCFG5cI7meabNSX83hQpsEXVB6jJKwgpS0mX8WzkatvfqmExjwBJ4BY7MkleYbffXVE/UYXyS5tJQWC/WvFXSe6ce7AdE+Ht8vqEPiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dkXnZ8r0eU4sDViZFuW4DpY6ec8BVzKoQkbuObpYAY=;
 b=un9R922LNBnhY/BC3Bz3yluo8Pibm9I+HVj0shS7tOYkwf362GK15C+89AmNQgIH11kgS2LlxBTGoJ/b5insAsxOtG8Rme8KpzbygQRpiuFucLLITBt0vJe56vVfoFwDV85WYwwHj0Kbg/kVDorSoJRNaMfRxMjhcDI1M5L+cJdPSXGn9DoaYVlZrb8oedodQxYXSdZpUQYF+KNfmngJ1YKSjMP5S5h7IH3e0l5RzVFV9i84g+OX9hSYEW9S5IXC1NslK6oyNOFvnhdLRdEZoylxpBjHcKbYPXNZ3tNIuoOKAlIkj1hhiHsmsC4/SlxNKNFkv9MjwK0FhiUpNcwQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dkXnZ8r0eU4sDViZFuW4DpY6ec8BVzKoQkbuObpYAY=;
 b=N1nr1Dsl15qwD7tA8bRT3/bN4ebAiN84v4SjwJyyQE/PPHeZ8uTLHUTgb0NI20pjMISUg4OVl0370vAqGdHoC1hnt2au8NBI8zW5skQnh8Czvy/+zQtJ/qUB4J6N2NTrGn5wimtCMRtGPnrlj25jjjqGpfYvSmYnlCwIH/ZeJGY=
Received: from BN9PR03CA0116.namprd03.prod.outlook.com (2603:10b6:408:fd::31)
 by CY5PR10MB6021.namprd10.prod.outlook.com (2603:10b6:930:3f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 21:41:36 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::90) by BN9PR03CA0116.outlook.office365.com
 (2603:10b6:408:fd::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 21:41:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 21:41:35 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 15:41:32 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 15:41:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 15:41:32 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9LfWVu1872068;
	Tue, 9 Dec 2025 15:41:32 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vT5Se-0000000HIaB-0sBP;
	Tue, 09 Dec 2025 15:41:32 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/3] linux-ti-staging: Add initial 6.18 recipes for LTS development
Date: Tue, 9 Dec 2025 15:41:30 -0600
Message-ID: <20251209214132.4122996-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|CY5PR10MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: c437f0f4-9317-4f78-b46d-08de376bba46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QdUDSSP6p+isZm9eqss9eXGW7YDaGk2g4q5xqwumEjfXdrqgQ5x+NCDWYJwm?=
 =?us-ascii?Q?4nPbsb6QRvbMElVZMTi7C7NoWqirc5t40zR9jCP/yYugIwb48VZlzT77uNwc?=
 =?us-ascii?Q?18QjwA0DcDo05lCyhX2yPAqehsH260TW8mbEk1k6mPDhlnNCszVVBNC1/jYC?=
 =?us-ascii?Q?1840sTkwvygZthW+qzlaBMjlPp/XmnY5T0jpLnLpvLGnjcMnQraBtsswqGju?=
 =?us-ascii?Q?sT7hMWvxG6AO94Of1SNGxieKM/7bkQyjZSvVTUmNByop9DxQf7p6rnBpAu8H?=
 =?us-ascii?Q?EbIFG/U8X2cl8XDS6G+Qo19/iQLMGdUEDsqeNcr54M1Hq+bexxzAPToQDI1v?=
 =?us-ascii?Q?ndmNlCotkXNYA8VZZIOxkyW4fyaQfhW+ILCOor4UxeyASX2sWgz4IxkIYnxT?=
 =?us-ascii?Q?+Ui1v4+vteKNs4IvMquJ1MAAVtZESpEjf78wmum9zaFznZomeUC7Ji7vK4Dv?=
 =?us-ascii?Q?HCN0GsjCVMME6gkI9tY//Fb03n82fcSC9xbK3Lspa+nNP7ZkuCo0v6w9WSTV?=
 =?us-ascii?Q?i/CBtZ1c9Ywlh2Psu2BbdoIs0kxjw5n5UB72hRhb63XUA80yAqwSLlNk9kmB?=
 =?us-ascii?Q?KV6zV+vB4iwiTXm7eRllZcg/4HpWdRPAWoNtOUODBvGo+0lGJqXaaw1ZvfHM?=
 =?us-ascii?Q?2N2EAtc9jKiQRs5gbJnEq/HChrVuz0cnUicukXipGwBuEIPvMrbR+IW2RUJF?=
 =?us-ascii?Q?GcZO+s9JwP7GZTLrXNlLDrksiRFBoza3uQqOhbKqkzL1jPAR8Qe7Ro5kFtyI?=
 =?us-ascii?Q?P2q+CylG/q7QhojlfRljsIYCXJZxS2H8rQ9en2kXxpxSuyDGXMv/UuIv9K2Z?=
 =?us-ascii?Q?0DEA/C2NnXTCwhh+MI9jmrO0jpkhn/F6+bbLm/gVNVjyaap+SvqQ197Xmpm8?=
 =?us-ascii?Q?2X9XHGWhcP1U/dVBRT7/YVuyiOGxiRjLyNDsiB/cnYoZ81Q4zQjR5q6FVczk?=
 =?us-ascii?Q?aKd2CF0dCe394kZJurkWqSmg7xPKcRUr13yx5lORFfgivqCdWmzQTiVCzehN?=
 =?us-ascii?Q?nJa+LjIe1IUY1k/A+45bXwBbRyqptXBjo1Yo+wgfE0h+TghSZnyMUZuguJqS?=
 =?us-ascii?Q?nErj3C6Ourmr8EAZ1kNuQNQjLHo55/2/OcfVPJvMc9h6lR2db4ySY/ZevUCW?=
 =?us-ascii?Q?uEvE9qu2fcZFfKkoXjFcqalEOPxhAIyUZM8uUgXHVpQ6tLrwcrnWqS9PQqjD?=
 =?us-ascii?Q?PQU+Lp3YOzA8rDY/CWicPi6Z9QUUsMOCaaZQ8sWsaMSkyy/B+0FU+voaqQ5w?=
 =?us-ascii?Q?jfGE7D8bD5seUb2/KgZFiAgxv2jOA8HMAMkBvkDHHvFqKE54lJ+nL6dYh6Bh?=
 =?us-ascii?Q?l/yN0uI3NWGScbPFyd9CqJInOQwqCpuWZRueLUTal+pvg/M68HOwXUWjQxJz?=
 =?us-ascii?Q?uAWXbVbqvICRTZiEeSnR2HP01Q4SHEQ57f00ADV/7vw9y8rLwo4FEvPDrT0E?=
 =?us-ascii?Q?0TMsLNaeypTjvX0T/qjVSHF8KenI8T5ZeSSLa6gVMq4BO0oEtSRZORUNU+25?=
 =?us-ascii?Q?WDuL2oy7FSuEIZzqBHMUJb3bXBKbwsgR2a4IRiEJAHFtY2ya0CRNdV4h+RoU?=
 =?us-ascii?Q?MkGIjCnIwxAwsZSRsp0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:41:35.8189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c437f0f4-9317-4f78-b46d-08de376bba46
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6021
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Dec 2025 21:41:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19335

Add all of the initial recipes/files needed for 6.18 development.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../defconfig                                      |  0
 .../k3/defconfig                                   |  0
 .../omapl138/defconfig                             |  0
 .../ti33x}/defconfig                               |  0
 .../ti43x}/defconfig                               |  0
 .../defconfig                                      |  0
 .../k3/defconfig                                   |  0
 .../omapl138/defconfig                             |  0
 .../ti33x}/defconfig                               |  0
 .../ti43x}/defconfig                               |  0
 ...aging-rt_6.6.bb =3D> linux-ti-staging-rt_6.18.bb} | 10 ++--------
 ...-ti-staging_6.6.bb =3D> linux-ti-staging_6.18.bb} | 14 ++++++--------
 12 files changed, 8 insertions(+), 16 deletions(-)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.12 =3D> linux-ti=
-staging-6.18}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.12 =3D> linux-ti=
-staging-6.18}/k3/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.12 =3D> linux-ti=
-staging-6.18}/omapl138/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.12 =3D> linux-ti=
-staging-6.18/ti33x}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-6.12 =3D> linux-ti=
-staging-6.18/ti43x}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt-6.12 =3D> linux=
-ti-staging-rt-6.18}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt-6.12 =3D> linux=
-ti-staging-rt-6.18}/k3/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt-6.12 =3D> linux=
-ti-staging-rt-6.18}/omapl138/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt-6.12 =3D> linux=
-ti-staging-rt-6.18/ti33x}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt-6.12 =3D> linux=
-ti-staging-rt-6.18/ti43x}/defconfig (100%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging-rt_6.6.bb =3D> lin=
ux-ti-staging-rt_6.18.bb} (55%)
 copy meta-ti-bsp/recipes-kernel/linux/{linux-ti-staging_6.6.bb =3D> linux-=
ti-staging_6.18.bb} (79%)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/k3/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/k3/defconf=
ig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/k3/defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/omapl13=
8/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/omapl1=
38/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/omapl138/d=
efconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/omapl138/def=
config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/ti33x/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/ti33x/defcon=
fig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconf=
ig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/ti43x/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.12/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/ti43x/defcon=
fig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconf=
ig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/d=
efconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/k3/def=
config
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/k3/defc=
onfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/k3/defcon=
fig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omap=
l138/defconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/=
omapl138/defconfig
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/omapl13=
8/defconfig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/omapl138/=
defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/ti33x/def=
config
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconf=
ig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/ti33x/def=
config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defc=
onfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/ti43x/def=
config
similarity index 100%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.12/defconf=
ig
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt-6.18/ti43x/def=
config
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
similarity index 55%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index e817b530..a979668d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -1,15 +1,9 @@
-require linux-ti-staging_6.6.bb
+require linux-ti-staging_6.18.bb
=20
 KERNEL_LOCALVERSION:append =3D "-rt"
=20
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.6:"
-
-BRANCH =3D "ti-rt-linux-6.6.y"
-
-SRCREV =3D "c79d7ef3a56ff61dd83d5527520b419a4f0e32e2"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.18:"
=20
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS=
') else ''}
-
-PV =3D "6.6.58+git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/met=
a-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
similarity index 79%
copy from meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
copy to meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index b6d882d8..ab75571e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -13,24 +13,22 @@ include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.g=
etVar('TI_EXTRAS') else '
 DEPENDS +=3D "gmp-native libmpc-native"
=20
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.6:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.18:"
=20
 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
 		      ${EXTRA_DTC_ARGS}"
=20
 S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
-BRANCH ?=3D "ti-linux-6.6.y"
+BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "a7758da17c2807e5285d6546b6797aae1d34a7d6"
-PV =3D "6.6.58+git"
-
-KERNEL_REPRODUCIBILITY_PATCHES =3D " \
-    file://0001-vt-conmakehash-improve-reproducibility.patch \
-"
+SRCREV ?=3D "75433f843c99d1ab544808749a46a6e2f0151a56"
+PV =3D "6.18.0+git"
=20
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample =3D "blacklist rpmsg_client_sample"
 module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: virt=
io_rpmsg_bus"
 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: vi=
rtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti_k=
3_dsp_remoteproc"
+
+DEFAULT_PREFERENCE =3D "-1"
--=20
2.43.0


