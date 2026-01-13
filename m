Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419D9D30CF2
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 23:57:46 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73269.1768348661523688110
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 15:57:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=lnvPEDCQ;
 spf=pass (domain: list.ti.com, ip: 40.93.195.62, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNGnajCrLh9SLc4J9t3xShjfAjW2HUg2n7LqqlL8+dZ0KF/tdsGSy8yoSgyj2tc1O9nbUaOoSb5aFTciLDMtPwk7GHl1px2WO8zdZZeuyCE01sKUTHASEyYoToedEGALeoPNijbBFFzxWOHoAuYxyzavSzs6yhi14v7Ku1aKJcRhQOaVG57tcX4j0OIC4wVaw3rAe5vVv1r/tsC9Y8yUl0igqunSxcxjVumReMv/n7QpXw6YMcKlmPtH+smOd4PpKKHYm1Rt4Lcm0/acFsv8VyMwQrost4lY6QysG8R3uL1m0Ej3pwgqFacDirlsnZJBKBr56KmKoHqCNl7rkXTp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uXJCPNVaXnWB/OHLWnlp9bdqCSxqkKyhKPd/2eLqyI=;
 b=XkLmePe1z0PJq16O6n5wOukL0ylEbi3TX8cgm4e3owVhrRbsivKj0wa/Qq8EL0sDw0gGxD4kV3v6YzrFLKq0m4GjUqcUS9735CNTdKYDgzglhzVGRzUmbJQzuwyFGgpXTYsgXYNcbce/CMUM6NQhHUD5h0kso5BvhgHwVadLwUhHZPNFBKol8q56gnNSTORoGHd99cBlfT1TojJWTMKKnQdNb51kaKTDiDlMR6SQrfhnqOoQKZmjMVZYSoKrMqVV+Q08XlTZd101T6wees8oKiPZNLE0UnjjiSKG05GxTe0iUNuN5y4zAEVDbtpHhTkth7jgkUUXL7gzGY+07waarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uXJCPNVaXnWB/OHLWnlp9bdqCSxqkKyhKPd/2eLqyI=;
 b=lnvPEDCQmytFdcMscUoSfwiH8wj1LtWpaWeRXsNhYLwxaRa4ODOcRITP/TTtea77QAapy2Jz8Xpd9CRsNzFZDLeVfXh+Pfhkf2daJAdakXvQgWQur47Ww8b3NPL3ALNcBLmeA76A/dp/hyuqLKRCYH8YiHZi2N6xblKCkUMMKxR0bO9NywbfnjL+YVP8QouifZ6AXlJCpfVkS1cJEVr1qr5CrZzYPtyevRK7dS4uERMLoEC0T8z2iOuAJ0LUtbG4VaDC+g+hmRrlSeJ68NzX/IouOMaDUm/Jt5Qajc/9GtMpINGD+grUXu3HO8gZrNTpcVL85N+2kVpOMWmOxotWLQ==
Received: from BYAPR05CA0075.namprd05.prod.outlook.com (2603:10b6:a03:e0::16)
 by CO1PR10MB4402.namprd10.prod.outlook.com (2603:10b6:303:95::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 23:57:39 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::e3) by BYAPR05CA0075.outlook.office365.com
 (2603:10b6:a03:e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 23:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 23:57:37 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 17:57:35 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 17:57:35 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 17:57:35 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DNvZ0D2964914;
	Tue, 13 Jan 2026 17:57:35 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 539DA9ACF4; Tue, 13 Jan 2026 17:57:35 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.01
Date: Tue, 13 Jan 2026 17:57:35 -0600
Message-ID: <20260113235735.2094676-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260113234614.549696-1-lcpdbld@list.ti.com>
References: <20260113234614.549696-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|CO1PR10MB4402:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e267cda-05b3-4111-f7b5-08de52ff875a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MLIXsb5JiMkINp6oKKk6aQATtYzhWmqD7XDczeaZ3tYOiVb0R1DCzNHhJ9nC?=
 =?us-ascii?Q?pbX8fGzybXQ3PuyhivKMbolom6dYrf1/1OUu2myGCxXWS4XWGiaPb9oTM4pD?=
 =?us-ascii?Q?AtxjzZ/qmLLlUnuHq14z8b8rXo+iqgSQWDoHfLY6LDC9M57zOAuE2Hy+pUSp?=
 =?us-ascii?Q?QdJ0X9pEUSL0bcuByXW2HegQXq4fBBPI8heB9BrJbdYu5aZzbYmDmVEe931E?=
 =?us-ascii?Q?uW4dIo6ZmmKflM7+iET/voCXpKFfTi+VnBrJQIq4VHqOJQcfD+FWQC6gCKGJ?=
 =?us-ascii?Q?Qp6NdClEtL8+hATvoGzfspoeYQaQ7oDYYDGEzcnQ407fwRb+0RqcO8xgbtXr?=
 =?us-ascii?Q?nDXU4QkavuN+ywsjXvxE0pTU8g2l1JCfCPmeEUcImrE3XOQdS2rLFbftKGQ0?=
 =?us-ascii?Q?BKz5f7URX5Se7Hc2qJ49TPnIRfs+W6r2QBi2aDMP+2f1fqseF4DxKAi987Kb?=
 =?us-ascii?Q?Tawx4gGtzzXE0AII4L5wZqOeaE6xOPRxh1+iClkWUf7cRHlFkgzamFUWZu8O?=
 =?us-ascii?Q?2Vbt6w6RfAt2Szw72oV1VAU1tSR8YPB/P8m42R4ywyW6SMqeeqeaWgrICJTL?=
 =?us-ascii?Q?5qOzpIe6SmUrzTOGFXOYKyO+B+z38HSZAkifRfRswqI7V3XQTGFxW6vbhtmR?=
 =?us-ascii?Q?/PFhmG6/cDrh5FIZpDkfCj82erLUvbp3b20CG9BwWjIFWs2JHSc3xjfwkRZW?=
 =?us-ascii?Q?2a4yYFtbeYuljGXOmEZg2deuQMSl6Kp0nJ524roLGcSmw08rhZk0/A5gckTP?=
 =?us-ascii?Q?nkOaXB4K6jagX6z2MPhgbrC0tLTDfHmXLNsncWlcR3/p3bANoT+HdQvhmzh1?=
 =?us-ascii?Q?BxrfgsPhm/l0RT+GNG+A+HBcbRjg0ns1givSiGNViDcJmnUcl529dFanptJC?=
 =?us-ascii?Q?q5tpmsaHT4vO7ZLn8pena48i/Qna+ulufKH348fTiiVhhd7bD7kUbWfHRsOq?=
 =?us-ascii?Q?b1lNrV2GBJ+RnFj/u+/QSbEUilaTVgWzFlJmAlGEpVP5r3tk6997aW1J6JHm?=
 =?us-ascii?Q?RlTEErOPnxo5Th6uJfCX26QITXcJOMbHABMlhR2AmH4KJuUUulJLLGATYQdi?=
 =?us-ascii?Q?NGxeRabB9CAyivqOJ3Cgt+VVF+2XjrlpG4m/dHm1GDmET+ybdfTV0P9NJg81?=
 =?us-ascii?Q?1hJG8KO9qEnXPGs7ScXRHwPoo8QzT+ah/cMRjnGiyo3Hqru7xVwgNRq4nmjL?=
 =?us-ascii?Q?rt0g9Dl2Ze+iNpUoAvrFE9XfMZHpIc+INA9pGIA+sd4QTKtiNzabqCmMegA5?=
 =?us-ascii?Q?PhFW5eKXPw3+0kLRpOk/k1wN/PDP7Mkv/z/L+TKhu98U4RxEkuWXZ9ZtQy9w?=
 =?us-ascii?Q?4tP/MF7t2enT+2HrCU2Xwh76/W2TsJ/ufRpiicub9OmrbR+y3GagICsjZ22I?=
 =?us-ascii?Q?VPCuWpblmR0zUm9JOJ+D6oCvPMO43MSYWgh5aSbDI6FebqbvpiVNeIHOtbq5?=
 =?us-ascii?Q?Ndz1n0t+NgU9i9/mmYuOII8I7pcWZh801SiQris3UzujizVA/LNPh//KuKVb?=
 =?us-ascii?Q?ewCWT1Zg4sEuBb7a+AODr7q0TCSZ4BWDcds0plEwxXmXlIfK2UZK3JAUFCHS?=
 =?us-ascii?Q?v1P+ZLKvLYFCMUylZsQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 23:57:37.2799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e267cda-05b3-4111-f7b5-08de52ff875a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4402
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Jan 2026 23:57:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19415

meta-ti / na / 20260113234614.549696-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to vers=
ion: v2026.01
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 13 Jan 2026 17:46:14 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: aa23c1b6801aa7dbea4b097bbec0f273e=
6a08ff5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 53f8ec9a2f1ef9b4da9f61755410fdd6a0232cec

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




