Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AB3FF8875
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:41:02 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4625.1777491654664807364
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 12:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=gfmwVzf4;
 spf=pass (domain: list.ti.com, ip: 52.101.46.5, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfvlXCx77iUlw49aWPck6JVPut5hGouTgcv9eIoEviNSuZ9oHotp5rdgQmSiGlI13OLKPYmP+rLPlAfAJTPqZgdswJdMiAU3PKDPgD8UgvjmswaYccs8k3JQvUNjjnE1cgoCpI54PsoDg2RrEIPCFTvUByqhSkE565Niawn9NYx9kyHvYxGhSIg/3gNLozLZ0VjkWHOqm4jaTGLUDYsUp+1ZW1OxZVXHo70GqEcIXvX5taxyel9CqRdICvN8+nW7ZUNc2ONMn+TAiIE3AyhzvMgFT8gpiwazCvhD4DMJmAYmXApO1gXGXRayHsnqN32kr8dVbB5IanLWUixTlXpfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3f8naFYnD8Vsy4zQnOYnbY0oBCdnvyNkDC9iMA3SQno=;
 b=i6NgdquAdnhzBBQqMHGZZhGylsRPAPWhjJwEhy9Tc6+4WUyFLvQ/oYJCDn0pIeM79KSQpDqznURvQxVy0RycQ+AfWV3cPIsQHNmQkuJlRBC6kaXYIr/VuPmMz2E17/0MnuTFSd0qJsDZsJ8dbu8ewTd2geEuN887Xc/qnPNk6s205/gnjjtzE9AuEDyz+EfEdJPqvXade3KN3/LsR8mj2jdeXes1JtuCnfz9OglrgzqNy9KJp5qU4t9XJj+DVIwZ8n9QmsVOJgQXgd13nNC5OIwBMyB4Es2DR//T4hturkR1pxv/qIy+g4lroEyrWoYFY3h+9X7K1CXljeGuAyrN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3f8naFYnD8Vsy4zQnOYnbY0oBCdnvyNkDC9iMA3SQno=;
 b=gfmwVzf4pvAU/KEx2qgRC3H11w8yok76BmSD+ztX2MNghBhu7vfH6+qHNkFvxdk4hmPKzBxG1s9CaQkMrQGqw5SrmuRd+0B9zE614ygsEAlYRiL0lpS00rE5hHKHd5g0zYFV7gjjKq4Cvt5JS/nmUjjSSfvwv5SuEVqhDnhsTTPlJcMuc3AXS0OkkHyM/QhUWDc9Vd6oDGIUgK8ZhrtQGq2ioW3MDiD7PyZqhmgWuacqimAhwtmGjubAf9Rv/f6Alh4qRe686MwLmyobMHnZ3YvPQlH/spE8oVxm9djFeH6ycTVZDznWA7lfFq4e5h6VmTxDoL7dWvRJXCY6se+Stw==
Received: from BLAPR03CA0122.namprd03.prod.outlook.com (2603:10b6:208:32e::7)
 by BY5PR10MB4369.namprd10.prod.outlook.com (2603:10b6:a03:204::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 19:40:49 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::a1) by BLAPR03CA0122.outlook.office365.com
 (2603:10b6:208:32e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 19:40:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 19:40:48 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 14:40:48 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 14:40:48 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 14:40:48 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TJempm1470986;
	Wed, 29 Apr 2026 14:40:48 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id F3ACF2A67; Wed, 29 Apr 2026 14:40:47 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202604291207
Date: Wed, 29 Apr 2026 14:40:47 -0500
Message-ID: <20260429194047.1126134-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|BY5PR10MB4369:EE_
X-MS-Office365-Filtering-Correlation-Id: 318cf677-ece6-40c0-7398-08dea62736e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	dTTyL7I+I5S7JVWYZlpB666E9XiNpsfrE0RylpzYG4Oqptbge+jPR/TrlJdqdruCqFj4b5J0HG4B1NuOTPsMjnYJZ5Tn7SyEKjCmhiX6K7F+YVNohDj+rMZLAGDX5afjrhM7uQUml8Su0OpO0pVdh1yYw6OIdiOhTdRToeq6vkkx0OAfMz7ffv9kJn2t9Yp31GrMlwx6wOiePR4cWS9e4+ySWJIyT77Sqmp1wvag8ugYNGCztNglmPWb6D78neFvh9dkBwqcgSlWsDXvzXTzLEBWzwepj41TQcRKbH/sf9kB21kdRxb7OjaH03NqoqLstJUUTDOyzj6Q8ZH4WF0CUSCZvEULDKMmwj0x8gqtbZisi1rDjOdhSDEiRsM2taBwavzIDc5D/T7cgKZ4aaJhqw/DYo4jP3yg5Lyp693vyUQlte0Bql3b6ca+zOv67EfVgUPpclSNWWOrgWdGpwDk4ikUPDIsF9VCbFltgUN8o4PHO0DX1N9wXf/Bm3woBjkCaVY22jFrsle+yZK2HcLVgWVmepJJ2tt0fkLqcukLJ3vpLm+d+txuEOd0sIv5n4E/FCt/HQHUYV+khGwjIEIk/k6A9uxvmRqr70m0X2mPPDkAZDNJd+BxOyNK86yk3lgW2JxDApiljdftJLPWFzYsO+u2QhfKhBTvvpmkgNZ9IudE7vGxlaveJvWeX4Mxw4BiH+Yw9FHwmmQ2vVo/d5az+KjrvIF8sQNTqeGktPR7ytxTv8ny5r8e6safLDOiXHgH2+sbuBCf+WogmvcP38ixFg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FHG1g4lcVQZwbjk0G09UYB7f292L+DW1Nn+vSaHW5ETeEj2ckw6qRArKyZIQKlxvXV2OPLDh96uE96p1KBF+QQeI6QQo1btQM4MP2OyQqjgsPbv/S0WfgpSl/2fM697Xy4UwwBhV6v8XTIA6aHKS9GprnJwbzYkrnnzZrJQPPi35hqFNprMdpEX8bAWBwYzhK8qRGP6322g0uHy7fRxHe4sEguhS2Ek/TsKo/j8PdgNM5NqmaQ1WdgHxqa1m+Or/npBFzz1lfTP6auXJqsYJfMsLEhn5mYUzVRJY3zYcF6fFcWdO5OgJrFnqQYeSAitdshmZJX43/gA80I6WjWPY8e5phH4MrjY+B25I3xw27eU7B1moQ1TCGnjELXoboPnz2REy8VdaeXN9y1NDPWn9LE69QfhhyhhAtp5QPRkL3j7OqxtYjLSj8HpNW2yNcEDX
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 19:40:48.6957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 318cf677-ece6-40c0-7398-08dea62736e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4369
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 19:41:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19918

Updated the value(s) for:
  linux-ti-staging_6.18: SRCREV

Changelogs:
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-k=
ernel/log/?qt=3Drange&q=3Dfa14abf25646c5814b997836539dbb859d6a669f..4495407=
cc08e68dd65abaa542e1f13ad2ec90045

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 1b7ec01a..16d26a3a 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S =3D "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
=20
 BRANCH ?=3D "ti-linux-6.18.y"
=20
-SRCREV ?=3D "fa14abf25646c5814b997836539dbb859d6a669f"
+SRCREV ?=3D "4495407cc08e68dd65abaa542e1f13ad2ec90045"
 PV =3D "6.18.13+git"
=20
 KERNEL_REPRODUCIBILITY_PATCHES =3D " \
--=20
2.43.5


