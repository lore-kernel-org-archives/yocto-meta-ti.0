Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5692FD68BC4
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 23:53:30 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29046.1766015604077592870
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 15:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=H5CcpwFz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.7, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abc2jdr9pP9cqDLv/+5QlEENZ/34/kz1vvejfy5SaSKAiAC10m9avlWLv/VzfpVH85UNYacOf0lLNLUbxdDYsVfCz1bmqLx3ZhrqCt+m8iYlCO346YMG/+Wjk3JKino8Cb5mS7rApKJjLB1Tzv0Qemwz94JlBOnLdwWwcdNo1omSaEHtK6l91A8LrfM3RH6SDJupsoQZeNtj1Q4o/ootD8uGw6kWIMZhu6wGdBbTSw1nyC5daj22XNcPd9NX/A/cecSKleMPxurTS5VuG+5jlJ0KeEOC8XBagHflurpSWAUJvj0yzuHUETrY9L3KW7daqczGD3DLnMEPit1el9WlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f8bBLTN0FWxWkHGMvi841ROt3TQ3MhDofnVBK4UgXI=;
 b=v9Lk4lIJiugSbHwSKmLRPFh8chgmdqvEJYlL0e0Kc4aO/PE5LxofakoVmNTvyb8aAbV3h2rvu+uiUlPuChI+JH9uG38Geja2cm/1sLRBmyDwFrBwy9XjKI82SB1ieI9sct60TbPfYKFQepCvB0+rZ64DdPUfWRLvEcqAnaPByP/5oIwgWfmQTQteMtAQYoVzjF3nD32x3jCPr1NTs8lbGKgek46TtROuYin0jHyTz0YONVkcLH7WVBFuYQ+pAn8CLWOU6w5dZBukFBFre4uCX9u0XH/St4/ED4O6S8mXCB4lsnhcJv9lqsKw0XfvS84/EHIvVPbYkIxYfkLqF/6CRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7f8bBLTN0FWxWkHGMvi841ROt3TQ3MhDofnVBK4UgXI=;
 b=H5CcpwFz2ouAP3vnjsNKJ3wsiKtf5gskp7S0MDVnJl5E5Oh3QsOwzEtoSqamL9hdYq5F9Zq3pZ8uFveH/CScNp9tKofbuA1vi4N4azsJYeaad8K4W2quYr+OhK0A0G9+Qj9w43YUZBPHbPgwPIBZ+SOANo+g1uHSth6KBezFQCw=
Received: from BN9PR03CA0666.namprd03.prod.outlook.com (2603:10b6:408:10e::11)
 by SJ2PR10MB7581.namprd10.prod.outlook.com (2603:10b6:a03:546::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 23:53:21 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::6) by BN9PR03CA0666.outlook.office365.com
 (2603:10b6:408:10e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Wed,
 17 Dec 2025 23:53:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 23:53:20 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:53:15 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:53:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Dec 2025 17:53:15 -0600
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BHNrFMm2432696;
	Wed, 17 Dec 2025 17:53:15 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [meta-ti][scarthgap][PATCH v3 0/2] Add support for BeagleBadge
Date: Wed, 17 Dec 2025 17:53:13 -0600
Message-ID: <20251217235315.1333746-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|SJ2PR10MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c07fc2c-c562-4d43-0301-08de3dc7753a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6qJ3uomQwMTiRkI7j0vVKRNMJv4Ga6PvYYNjSdArxRMTaBGzzR42PO04t57R?=
 =?us-ascii?Q?EaQ4sUWHljWh85TvLdefB29TlKgAkGX+HM6jIF8bqjeNh1I37cecgfYnHorl?=
 =?us-ascii?Q?HJlMWFkthJHt2pX0T+1/C/PLhyclQh3NxAcJnbong5qLJDkBbSY96Aq/dv53?=
 =?us-ascii?Q?Bb574E/v5RnI+/nXEYaoGGs/q7Weyfw9Sqf7TY24VcyslHFArdCk3EwEwpfS?=
 =?us-ascii?Q?LkwHGdYnV18rsd+ssauYdADtCTcTdyj8oz6xEPxh3IEXJjPP9NZ8Ngbj5GGV?=
 =?us-ascii?Q?xElGuRcaW0/vHV1rtvRBVfZh4nhyVyrjcHJ/4AadoKxFcLJWEh+TSvfa1rT4?=
 =?us-ascii?Q?xm50ubGQfZimh6wfPHJVpys9D3CY5a/k82BJNmF/YeTneeugeQGvXCQ/z5bl?=
 =?us-ascii?Q?BM+H5OG/XKOigonVlpv+8c7k043vV5j4P4tgKeRG2lv3bFqNX9ABg/pN0wgH?=
 =?us-ascii?Q?1C/NfSM14dRp74M3YuFcmws0UbOuOKo+pwXQEJpnF6elFn5VQo8g/HAdomZs?=
 =?us-ascii?Q?z+FNdb/sIqx3vXd6AQA2nvEN70/NiJlKYuG5D7RSwtWID0704BxsP0bOyShZ?=
 =?us-ascii?Q?nWmo7daQtYY1/NQoJdq7+KmkFUln9N0xdmkRJMDhitbfQ4WN2OpAlZDQBEM8?=
 =?us-ascii?Q?96Z+BAzaDe57xrAlfNElDhagLUgTtL3r6oiHNGHKFdnGaSyalrzHVUxhTLja?=
 =?us-ascii?Q?Q+zD/1DrGsG1Oc7AWdvhtxRXCo9ZHc5k79kkw26b2/1N3rjtwdy21KYR5zTh?=
 =?us-ascii?Q?hPgbARiMOaDxF6vni0mbKqSAhvQmx0CF0qCvKLaHoB1Tb1j93lf9TSYCGQml?=
 =?us-ascii?Q?4QfTrEuCz2zKr6h6uhsBMW0UD24QrDFF249NW14x/9wiB7mUIrT5twE5Ggt6?=
 =?us-ascii?Q?V+UojdDQfWvyPoTADDskev4kutzY5QU6PZ0Mk5TECblDcvrkIqQ+1N0BY2lD?=
 =?us-ascii?Q?TAmYX6NMUx5frWiaPiIBily95EQfbsmqQu6E8i/vYuGpPOwtWYz0VkaiDS0I?=
 =?us-ascii?Q?5Ho6pKDH44dum7aDmMg6JYqR8VurvREbT4Y8xyRHM2CcqIcsphmCaJyl3RKz?=
 =?us-ascii?Q?AKnzm9Qrp1bQbH9eTFQ9kgU0D4o40nVpmX5m1tGxgbsrWJsMzlcKmNvEcTkv?=
 =?us-ascii?Q?wCLdgfmWMwIu6w6wGd+kKYXITM+jGFv+ASGKrs5hPGbUG+/TaGyTCfoCwUKm?=
 =?us-ascii?Q?SxU1JNrFlCFMCX4f+Y+K4AQ5+Y3lwSS21Tzp8sCQARE5EBttmu8mg6D7wqmQ?=
 =?us-ascii?Q?nUpRiBV3wPfaUEZp/fxhCu6RwcQb9H/+oiF7n/g1E2A1Eo7HdbT71ScWjK5N?=
 =?us-ascii?Q?C+/IcopiE6pzc4wHxoG3ktqVw5Q4Fk02TnsJGfgzuSFlZRzbsCpB/7bMpgw3?=
 =?us-ascii?Q?HsU9XR6iwXDKvyN0PsWpJBc4n5i7A8z4lYYlvnACZWbrRGfmvMQc4jCg4rJt?=
 =?us-ascii?Q?uwWk0LARsfN1VceU5zcZ3p0EqxGHARnMhbdLMzMzJnE2YsFLjCtwoX5bVtHv?=
 =?us-ascii?Q?zXehBsuxEv9vOICt4/MCxed5odyUY74zoCGnQ6AcQZwtv0rUPOIu/0x1fzfC?=
 =?us-ascii?Q?1yPSbdAvsRG29AmxsKE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 23:53:20.6641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c07fc2c-c562-4d43-0301-08de3dc7753a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7581
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Dec 2025 23:53:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19369

This small patch series add support for BeagleBadge
which is a AM62L based device.

Changes since v2:
- Fix patch 1 commit header
- Add diffstat in patches

Changes since v1:
- Drop beaglebadge.inc file
- Update commit shaw for AM62L to latest ti-master

Judith Mendez (2):
  beaglebadge-ti: Add support for BeagleBadge
  trusted-firmware-a: am62l: Update to latest ti-master

 meta-ti-bsp/conf/machine/beaglebadge-ti.conf  | 22 +++++++++++++++++++
 .../trusted-firmware-a-ti.inc                 |  2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/conf/machine/beaglebadge-ti.conf

--=20
2.34.1


