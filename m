Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDD4D637DD
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 22:17:04 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.316.1765923421763217008
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 14:17:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JUCYHLG7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.65, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGBUGpYlCWh7VrAfj59zOAnYlo26p3RGzbf6cpH6Rku25NxHib72NBMPAlRqiQhSy8yuD2iM6Imb0BYAQLMYAYg2pkUjcTkadV6baTVdPkV3FeOfBzOSMBu7btz4joKAsBgvSKv4RFWUfuyhxNRTRDhCsIyQ5pmR2cDR8SWSCDfgZXIUzdFkg9ap3eum+A3f/Tp6fVx5nUKILKVl3Hx+QD3c1+13dyv8r0ErUtwJZKlSClyllHk0eUYkIZL6AIxUGLPxBM/vFFOZw58tuemdnLNssVkBERurtFyPzKL7JTCdyuaAmxYL5s63tysYOqQ4/UjnGU6aDsVXgCYf9a0MFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpSym33fBctX+DveQ5ElrsdFFvOP2IM9LaSLVeo2xr4=;
 b=x/raS24H98iW7giglO6mt35bQtV5gchffwGKTKT8CZ9XiIwqOPRMqPRJIyCZjzT+9RaeIQwYiw4VvAEsisK3oAVQxE5AQuCX0C2K8weJNp0sduo4JJ/p4+4zKuKbU4hJadNTH9fM9hpfljWJ5XZLUUG7DQo+mVvB3OLuUoNG6ooE1tFA9UOZOtcrHYo+i/Q6mlS42t/oHck0MFvLocTiT0hE+8LutTp6yAjIvDFbAYu96CcgI9lS2PpB+rshk0NOM7GBchf7XcQpzhWrx9vn5Hn+REIKprhC0bgy7gC3CF661cg+MKG+LDHigRREIp7tVkmMmZ/C6pyA0KEDuKcQpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpSym33fBctX+DveQ5ElrsdFFvOP2IM9LaSLVeo2xr4=;
 b=JUCYHLG7IVOlOk+BCzQC+ZsYPtVKEJvxsD6umaywvrlwWGBM6jw9Ur+2BqM1PgfVvwNF2SejpWDZ3jUEdfYWYVqJ4vjwgI6IMCJyC5YW9LYlIVYLOwKO5SmZRVpqN6b2m8tG1aKh3IRLZRx5ywCRZt8prhTsf7ohy+X8GtiSuSU=
Received: from SN6PR2101CA0012.namprd21.prod.outlook.com
 (2603:10b6:805:106::22) by CY8PR10MB6538.namprd10.prod.outlook.com
 (2603:10b6:930:5a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 22:16:57 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:805:106:cafe::6c) by SN6PR2101CA0012.outlook.office365.com
 (2603:10b6:805:106::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.4 via Frontend Transport; Tue,
 16 Dec 2025 22:16:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 22:16:53 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 16:16:52 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 16:16:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 16:16:52 -0600
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGMGqJB514024;
	Tue, 16 Dec 2025 16:16:52 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH v2 0/2] Add BeagleBadge support
Date: Tue, 16 Dec 2025 16:16:50 -0600
Message-ID: <20251216221652.2231748-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|CY8PR10MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 57150978-2234-49f9-a2a3-08de3cf0d11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bsJ2yVC3HY1jU6Itygcfn1QhN3jcmBTPHyDGgUxT3xxp5KEAl/vUQ/g9wwuY?=
 =?us-ascii?Q?PUnbR49smQ2kKJmDtvzjOL5YmcRYTO8dOmi7nmNi/hnz/jz8yxC69enXtjxO?=
 =?us-ascii?Q?trMS97znTLy5R9MRYT1h/FP8SdvV8lM/gP63ocfMntl5JYkOkz2QTc35eHpB?=
 =?us-ascii?Q?aBW+2qMIcx66DraQfej1aCq56z+kOmQciKViyuAPo+8QjFLU9Hxcz5L2MORZ?=
 =?us-ascii?Q?+B1Mjh/71qadv5u3tm/yuf703mibIzXOd5sGrSIrASdp+eFR3YYji3uTevNK?=
 =?us-ascii?Q?O+Jqim1eiIkQmQZQ99xgo5I7L8y9c6vonw8F/A9Du4SnFc50b7OXAaC25rkl?=
 =?us-ascii?Q?l+wZxhy8zNQoWVppEt7uwL7HSciQ3od20CGM4DOryKfNdbPAyNCe2xMydLbc?=
 =?us-ascii?Q?DUyFlmi+fesCzqxBsQPB518Grr1FDTW6Q48Yu9DWRdx/GsISv7gi+7QYLzZc?=
 =?us-ascii?Q?Kq9ep8YC/brMRup2HzyxZEbqCeanxdcFu1UU/6enbyN9ULTvRNmqAjkQ0s2a?=
 =?us-ascii?Q?V93KmiSK2J3Umpqjc0STk2L6rnX95MORo0i4LYJEjo40PFHb5ia0TJKHEY6M?=
 =?us-ascii?Q?GBJDQBDlW2iNe5AgA2MT+GB5alX3/D+1nbEeqFgLbgr68Ouu9vgs6YdxekQR?=
 =?us-ascii?Q?YT8dVAb/VJFnnQe8LRy5L7L30OcQRK3G1YQFFZI2GW5TjS+8ilg0gC6GM1AE?=
 =?us-ascii?Q?Qmo5nTjkuYWk9U31O1vwHZOqXw45VGa0/uMoeho1o8xInQkf2XgM5FjNckc0?=
 =?us-ascii?Q?5ygivNVq/Zxiui1dYt2GHnhrMYppHhZFDw+5V+0POqAhTP3V84KSlORfOU8J?=
 =?us-ascii?Q?VdEUTgUBquDHP5IbjWN2D95dJ4ySXYLkUsy2JCkyyJjh1CkyWQ/koeok+FQc?=
 =?us-ascii?Q?4rjnWcHfZUHwjeLno816W/brSs6GQn6CoYw/GhsH19EL6LWAP3LaKxSD2+eX?=
 =?us-ascii?Q?PsmAsDf0Npo4H3LVcw39yAg6SOhdxFJRBinB2ymYF6pw20axsXlMDXeQPKim?=
 =?us-ascii?Q?ZyMtSW6Mz++3NVE9KiUfLSKrb1t1LZuiSd5Z3dWPGOnusHF7EsxVW1gSezXf?=
 =?us-ascii?Q?Z6e4Wugz5Kp68yavuch6uQa4FfHYliEnStMUHM8vOHFgm5nx4rOB0vzHfyTy?=
 =?us-ascii?Q?bWO8J2hoxe6Nj2LKn1iV8iudSSWzDW6e++ite/LDPEbXyWfF496qfUdiTZQ5?=
 =?us-ascii?Q?XuAV/1FA2QMdb6egt4ZpGogePIqgINsUUfiMwQ7mome/iXF0AmoMM4LDKqX7?=
 =?us-ascii?Q?VYEPdHk2KOR1m2JXMlj208qhfqkrJPYVpt5AcTImTkbhr2Af5Uk7smhJFF0E?=
 =?us-ascii?Q?Z8Bej6VMStB20DlkbC8FxffiaL1EK8Jluj3Zc5k8QkfzvhyjSxDwxYg/5BGy?=
 =?us-ascii?Q?sxMikEHdtJqs0apbvMqAOF00UgheCqsRHpVPJmU113sxRnz1gi0xzTl9iSvH?=
 =?us-ascii?Q?7/DSK0j09Iy9A/T+VBQe4WDOnSn1WFiL6QBIEpueurmG4NrGA3/ReCB8dLDV?=
 =?us-ascii?Q?+DeCQCeKnncOqIhAYStRhcXVrX/zulr3Qa3yuKVUbpPT8QqcXEMiUKHO4JeF?=
 =?us-ascii?Q?WRDKFyR82eCvs0ywtak=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 22:16:53.0990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57150978-2234-49f9-a2a3-08de3cf0d11d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6538
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 22:17:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19364

This small patch series add support for BeagleBadge
which is a AM62L based device.

Changes since v1;
- Drop beaglebadge.inc file
- Update commit shaw for AM62L to latest ti-master

Judith Mendez (2):
  meta-ti-bsp: Add support for BeagleBadge
  trusted-firmware-a: am62l: Update to latest ti-master

 meta-ti-bsp/conf/machine/beaglebadge-ti.conf  | 22 +++++++++++++++++++
 .../trusted-firmware-a-ti.inc                 |  2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/conf/machine/beaglebadge-ti.conf

--=20
2.34.1


