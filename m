Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1D3D26D93
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:38:51 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17067.1767983927350780927
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=JDRjfyAM;
 spf=pass (domain: list.ti.com, ip: 52.101.53.11, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRh2BpBBiFUmkfVHlGzNFA3ulA7heP3Y/a4O9Lk9nboWcIBNjB5O40NH3u8mP/SunGGhWshwBCRW2VbFdYrTvsDeeUg7KVX/51cD653zI4NIzXoNUcwRe4+YKxf7COm3oU0eJNL3XANM5farKUVjDrxfOnt0o/p7dKEgKNOS/zGHiZ48Dkd+8yCXpjVCFQ/loYSTg233nv1IO5tyzCefdXuXGFYBvYIyzjeFs4H4J7GbenuPVp66vH7mdeQAAKDKOOjjFzjD5BzkIN0ppD7PiaXPUHpOBuf3BefXau4pWL8BzG1WtDHVp1dg6RK7QeFV9VwKhfnYOe5xdrbdfi6YZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ctDGyA+U1NohSuJS242oDFDi0eVfk/xrE+dB92WOTA=;
 b=Wq0Tp9x07Z6sx13Q0E+63ZZlvBnNujSpZM8dlnD2je8YfFGJ222t6+I1EeTtrsMx8BWk2NumKFrmqyTkNFIe47nm/9I+gF9Dl/O8PqP7GGi9m2oSD40FarNyc/bUk1whjIjnctyuvbLPWoZU2otuFP45HkhHT5GCgmMHQ14HrN2e0ox60cNLROOAlCRVzWqcIrJGZL2DtNFcRCS50POfuNtF0v0VhKJHMkXTaP9HEKa5Wx2A7PgK4OhLs783lTiSAJGwS5qXMy4G+bdOc6nCS62KMU6wTW86tSJWJfx93h7Dm0cl0uWPQs7FaYWgnaHfWXBC1apGxBokTgfYM4Sseg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ctDGyA+U1NohSuJS242oDFDi0eVfk/xrE+dB92WOTA=;
 b=JDRjfyAMV5W1Adqp9Vy5Y6Fh0uIEe6kns8Q9EI6ATC8m21+5t0otPFnyJOasFJ9JHj54WYwFOosBnDmLuOv8ZdMOvNz6EfrVJfGhSscU1usQbnOEMhoyy6VWcWgalRlD4qsj6ZOEd8cYUJ0AcgzQqVUSV3TsrYtTp0HrkTnQIm0TVbB7v3e+YDbjHYF9FkmPXEUTI0M40qiKCEYhuETBSNZTw7hED9iH6BTwhbuPx4cg+kHfU8BM+29TdrbE2WtKpgPc98cwoYTCTqWx/8pDqIhuxb0fTuEjOAbB+Tzkhq6IPhDjksZ63Gsz8YOJ5KKDDfaoiZmFXdlXjP495z0NIw==
Received: from BY3PR05CA0051.namprd05.prod.outlook.com (2603:10b6:a03:39b::26)
 by CO1PR10MB4530.namprd10.prod.outlook.com (2603:10b6:303:90::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 18:38:45 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::61) by BY3PR05CA0051.outlook.office365.com
 (2603:10b6:a03:39b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1 via Frontend Transport; Fri, 9
 Jan 2026 18:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:38:44 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:38:43 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:38:43 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:38:43 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IchRf2300746;
	Fri, 9 Jan 2026 12:38:43 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9FA379ACF4; Fri,  9 Jan 2026 12:38:43 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2] ti-core-initramfs: Shrink size of initramfs
Date: Fri, 9 Jan 2026 12:38:43 -0600
Message-ID: <20260109183843.3950421-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260109182737.2973551-1-reatmon@ti.com>
References: <20260109182737.2973551-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|CO1PR10MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d77928-5562-4003-4ff6-08de4fae51a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ExoAh1bCcQfNmEUeD8kOwE+Kfz15yFLQ1ACC0Lhv8lEWAPPQTDN9wICoJkCJ?=
 =?us-ascii?Q?CVn0vqzZWh3lbhSFwF+jxZHG3lvZwA94BN4Uz/zU7YjXSi4ldaxs5YOieLJV?=
 =?us-ascii?Q?ferqyr/I18zmipQI17uXXVq3ug3eDOGBn4UvS3I7MXvqdpO3zSjFXPLEWk+U?=
 =?us-ascii?Q?LPqN7FH3DKc9dn/kC0Qjy/Caco51P9aBaFD702sueA32ciu5CMWbj/3YQWrE?=
 =?us-ascii?Q?gELs1kmrUwvE3by3BYPzucocqmgCda1NqVuIL+A8hsT6Rjzzbdw8EPpEBeYh?=
 =?us-ascii?Q?ZEUemhXhXzch+ZHSoWtiiymq/aB51kDu1IHHf9XphSv+CvcpdYJRleU34oSt?=
 =?us-ascii?Q?9UkTbVkJzp9fKu5yHidB0Fm32PHUgkR8IXAwFXTTOLK8BjZBhY793VUwOTlF?=
 =?us-ascii?Q?86bpY6pmgaE/HtsceK1UXtbBROd3vS4gnnOgXMNutrzb3SN3b+PMEZQgkFRB?=
 =?us-ascii?Q?TXSgOecIaK+HxbZl/hxnqhzmKuEjT4GEIMaomZ2ZFtYszDWWBX9+cZBLH/CW?=
 =?us-ascii?Q?is9JrbIklCGMx7TPb+TIfGxAZsj8NnLfDSep5uJAHYKLy/yi/3SVhwwMRved?=
 =?us-ascii?Q?egZDncxWxwlFnBwb2zhThLPUDUV/d2q1TCZSZ0Ozp2YzKnRkfQfvYb+FoIFq?=
 =?us-ascii?Q?a7etyLDiLQKHvFw2Nu4X9XotCSALL8RtcqY+/ZT6dzRgwYy5mubLCjBvUpIi?=
 =?us-ascii?Q?WItovQkl5wsFJ8jVYLEtaqOQRR6qpvGPGP7+M11d7Fkjm6QoVdsXqEBNemNY?=
 =?us-ascii?Q?h+GTkqJMms6t5kYLjMENCvzJ1oWAVYIfL2uL01MG7HQc7PuffAMzYGdrSjCr?=
 =?us-ascii?Q?NEVStiea/lkS6MckfgIzs/PwlAqbE1fFLg1dGt3WovKFtfDDrNTZnFN/t+om?=
 =?us-ascii?Q?KMvP/5RE9X2jW0qc8PzugxNa/5g5TkxXy3l0Ditwmmwx/Rj4kAN0T8jDka6C?=
 =?us-ascii?Q?0xsb76opzzzx+uHasozxlIRKOTecM/tUNUVJSmXgAoLyps4HgpxzW6DFntzL?=
 =?us-ascii?Q?fWhGRw9e6POPVPPd5YgWBlpZ05QfN2If3X+21FK65SMH2JvRcWFh9m5Z+2jx?=
 =?us-ascii?Q?nqdYYi5f0nKCM5z6FKdW/gZ2s5nFuEarGjPNZ3qT31FxekUKNExsTF+/jhra?=
 =?us-ascii?Q?ZrIVRXbUsmcS4HycnfEX67NUt3fR8twN8Ty4f9KZtsZ/4Ox6DBsxBNqKSrrp?=
 =?us-ascii?Q?sYZrTEMx77emOCu0Y/Q3xAh9ik+W1IX8TdXTVWftbkHTSl4exMa/ezRtAPUU?=
 =?us-ascii?Q?6AxgFbA6bu+f7Cv6h9pqdzDATvs9rYbj2qBfYKoUQB16MPla6r84DSEhDXv3?=
 =?us-ascii?Q?PaDIb8NZM1vJ7DgisT2jXLT0mRSqVzMCC5OOUV4kVI3bOiGbTFszT4OjOzOg?=
 =?us-ascii?Q?Z1TF8NikY9Aumz8+jQQEVnRATW3+mp/0LtPYlhadwBBXdVHaJqieX4w1K4fC?=
 =?us-ascii?Q?TH/gWqKI9bF73XmPAqcSlea0nMcwKR3lx1ivnNb5B07EkgG+uZBFFEjrly6F?=
 =?us-ascii?Q?VHSwXcxxs+Kze02HSTQu7TCyOZt1VCWA1fQfLFvA/uhB2JO/0PmvUOO/3HbL?=
 =?us-ascii?Q?85WA7Z5u/hFdIp2Yqqk=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:38:44.4344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d77928-5562-4003-4ff6-08de4fae51a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4530
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:38:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19402

meta-ti / na / 20260109182737.2973551-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH v2] ti-core-initramfs: Shrink size =
of initramfs
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 9 Jan 2026 12:27:37 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4b4d0fddc49d187ca402fab32c3216bd5=
0cd38af

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202601090507
- Commit SHA: d32e0f2c335999ef512db67ca7674511b9fead41

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




