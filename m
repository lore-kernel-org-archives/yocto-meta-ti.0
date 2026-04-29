Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C9ACD13D2
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:46 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13591.1777475376505542296
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=UiGu3CwM;
 spf=pass (domain: ti.com, ip: 52.101.46.63, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3W4um4F4N9tF+Igk/9eWqXZOLmMN3C4Eh0NSLu8sIkHx5OT8LSHZeGeZdKl7uV8wDYICkNPkNzBFeCVYLrQk7nxeG1d+rkqh7//g3wGheMDQJaDeBvWnTxs6YMpLwuxkmmq9pBUjnt0Sn0DKZ4oPmK+cGhpEVz3Ji1I5qF3zBdAS2jQW9/AmPB/gEEwaMUa54sIRV3DTCSldYFvbuSFw6E+e+EtBzrobOb+2gat07Mvcj82QWV7GgLTmfHHvNeOtYcI4tYbd/9Ck1J86L+FBFNR1U7fHx9M6kjZ9VEOFwZXaE2+abz305bwSBvY1aEj/SQ03SQlqbtmmKVwzU2l+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fv6XRgdnxeDvE6BeGxQHpV6WNLoEaJOwY6LcFq86vm4=;
 b=C3LKzGCQGkhMPhxbw6N3zq7BnaFKHM4MKHYLgN4qQcjieKb3Kz+AWLBH3zv+oO9iHyYso/BgkY1N5Epm6IVq/HwnuX89RvCmg9JizyImO4pnA4HcVVmxzoxQTwFfAJwBZ3gZWVfCqf2vnWgwUc3wUCQ7Z0+p9Jyrn42tsnKnVs+raLO6t6g9jDN25BON6CT9wz8LWko4fm61hMicK33v6nJstiCV8pxw9MoWQPb83yhgnUZy+WqSkzNFuGMOqd02zHVDqVsDq2a6mKBzsb7/T2GIdI7GUVk21XK+DEiKlzTIWqqHuyJ/abG7z/SFZxcvZK1b8O3Z/cq5QK9by7LaBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fv6XRgdnxeDvE6BeGxQHpV6WNLoEaJOwY6LcFq86vm4=;
 b=UiGu3CwMeWY+9DejCJ/O3lrPpehk7EDzZjlBPwhOsooTRQ6YH2sNmlL3/vrKnyhFYBNZZkJaHHWyrvHxIGLFuyRORNgVcGObMLuQ7uvBDj8qCOjJrGnFScgZzsscDhffoHGrRHloMNVm06fihHdDrazhroooOvUMJitaiIlcDQ8=
Received: from SJ0PR03CA0112.namprd03.prod.outlook.com (2603:10b6:a03:333::27)
 by SA2PR10MB4489.namprd10.prod.outlook.com (2603:10b6:806:11a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 15:09:33 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::f1) by SJ0PR03CA0112.outlook.office365.com
 (2603:10b6:a03:333::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 15:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:09:31 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9KZA3565161;
	Wed, 29 Apr 2026 10:09:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XQ-000000046VK-1drd;
	Wed, 29 Apr 2026 10:09:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 06/12] meta-ti-test: Import the recipes-extended recipes
Date: Wed, 29 Apr 2026 10:09:14 -0500
Message-ID: <20260429150920.978263-6-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429150920.978263-1-reatmon@ti.com>
References: <20260429150920.978263-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|SA2PR10MB4489:EE_
X-MS-Office365-Filtering-Correlation-Id: efc3964a-e5c4-4dda-f0f7-08dea60150ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	M8gFdm6Z78ei1wY+Ppm5vGE/CXtIvCjBaZjHKxl2zAcItBScBvzW57Ogd8OWKNM/aa+4Pa8EI27g/yPzHHNC4xonpD0HONDBz9WDPliDHuTv+AkcARg4arAxgVEn2+zcnresikdLw5C+FjjgQDrLIPLvVM+ioG6ricuxlqX8drIQTODltoU1kU973BJdETccCO6mXcxEj16+VBqlFRNftQ/U0r8fxdWNCavlj6NfgUBKJIxREZMwa4Czhb5yWEZthtMlUoJ2Zmy1kv6Ess4H2jL6GzWOvrEWl0F+mYCrANH9KinlSbyHi3d6an4Sr8eT+gPPcdYzaWsfQryG9pZd+CVTdtnSahcJyDFaMzsWYslLD9wZRPsH7dwkEhl5REirgASCe4P3u0L32D0jNG0GvxYQECJ+3M30jUqK8p+D+jNyHHY67kNiXO9V3u4cATeeTEl67ZxtP0d8eIM0bc+k+07ffoRHlkS6tDE072AWAgVDOu3lUPrRBEinPmBF7hbSvqSqrDIDimWWlt1S5Tq8CBfI/IYWlxwF9R7HMSLdZFmexk7BG1885+G6ocCLNYZgZw+5CSQu2xLCFtqbzV6CfB68r5TpJiO2RI6Ni6HJo1If/qk8/duOFqngbmMp7MRlDP5mIRJ2qz/M5r4n2jG23gwhqG38j0AJG4UkWNbdjz5NZ4XrR2KEQX7dq42v28OOQLe0oL4ax79aTIFb4J6xjwQbxSvIdlHjPI7NMBT6FDGn4BihSF4FLl7iYqg3ik/EqqPuKD7h2EP0pTLjzL5l3A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eBRYARjmQOV+wK0D9FpdEVT4+8q09DK3JJbaPuQtuaBf0HpuKd974aVa11I2pFhVFp5OlYy15VXd/D/rQ53KGsj2K8Y/ROT2WnV0BsXEiIokYggvVaAlpsNisuOvY6Ezj5nqIf/UxTC+utwYY1PMqIgS+YmnaibudN364sUphU1Cd2nrzTBn99oLqQ1KQpbglLRKk57nnA9NgFNEwyOzs3MD3XeqD3ZJp+ixgv1U5BOqiOA9UvdX/QWgczBGCc7BU23A3o0hCaN9ZRpLgrH94WIzy5zjEVr5k1MawfwHmNaWFQUXh52IXk/bA//cI1s2PiUdeuIKrBE7vnaNm8BlCi5hHy17GVnM3GD76QdYz0/ZsBNG4UHoDbq2/1pGHJFv6rG5i6QNE/HXDSjBHfi/xOdVo52ooyQ/C+NuExid0nDg843lGbMT0/TNP+KZs6v6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:31.4708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efc3964a-e5c4-4dda-f0f7-08dea60150ec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4489
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19886

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-extende.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-test/recipes-extended/bc/bc_%.bbappend | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-ti-test/recipes-extended/bc/bc_%.bbappend

diff --git a/meta-ti-test/recipes-extended/bc/bc_%.bbappend b/meta-ti-test/=
recipes-extended/bc/bc_%.bbappend
new file mode 100644
index 00000000..29d90a9d
--- /dev/null
+++ b/meta-ti-test/recipes-extended/bc/bc_%.bbappend
@@ -0,0 +1,3 @@
+
+RM_WORK_EXCLUDE +=3D "${PN}"
+
--=20
2.43.0


