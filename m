Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CC3D29FAB
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 18:29:29 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51215.1764872959066345038
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 10:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=c+vj+LAt;
 spf=pass (domain: list.ti.com, ip: 40.107.208.31, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/3079zVrjsJ0kXZmAUI13i1Meg/2a9LBSoVX0X8U+JfRy/lMh/6Ia3Sgh+YKuSv1bBHxtW/pVpV3wvqOwmqsmHtL21/zraSU+tkN9YvfCW7xhNGXo82QQ/Py9Cqp0TYYtm3CoJdOJ1pHNRY+ek1s2TeO76yXPy8J4o+nglCfLOWsDzGzn0H+0RXY6khM5d+NbCxbuCv4XiCXKxREeOlumdZjIqU2qT1TuYn6J1dYtRwLGZeaGaEAznsNWeRIN7PX0F8YGu7vUxR5Fuj+D9F8g/OLgi3rrPEcefwM4+FqKbz7jG1ZxUmGYypQHxFx5I6SpHMUWV8TmJxnBHKxbBQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99xAfMLQ5F3yPWfDFNZp+1ANtHdqvmgWhmPjjIZgpEI=;
 b=RPXuoSLAqVrI3alr608sbnBL/hYIzKC4anUIRFpS2wZh/IbnKchl+TcnRbeKVErELSpWM3APLtIbUoNNjascGpezc3SORDo5GSWKekrIj1OckBTS77iTwpskwV2UQEgairyJSQjE1B7jmKv5vLHbxeGS0pLGpL9dN8SVOR3BbwJ3lVPhxe/HEaFprMq9Zr6tzSSKRadVR4HTvmdRKPZCnEOIiVAinCB/YH8xWlm3y64NhjJEzpwTScPrbQUXg071BRBQdU6TUpx1aHAH8N7EqCbSSlX9OjRK1kuQHDcwTemT8GHHKncw9XaWuhChWrnFshkfnrK4k0PoV98BdFwADA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99xAfMLQ5F3yPWfDFNZp+1ANtHdqvmgWhmPjjIZgpEI=;
 b=c+vj+LAtFOGmruzcCVxhabNsIEBVtzg5Xo/0Zli7AtgO2WYvt0zmgmPkC2DIqqV+NrniiBUTLPRkHDB+ZRiaQHY4RJq7IdV2UxXVi0lVwCqNWqO66g7wxjFis0ZwBUWJ7z1bspvpFyXBRJlFzToTv4Fo6fc7jMnQy+LK9Bp6iYOFJnu0b9dv748zwH/ztqiT8oNyYj8T4aZLdm4OdrRQyxoSsgTrPLi5Q/77qw3vKpyq65ERzY8ZwYqbsUW75q1vNrAZzl68IDYvRaJdSs1iya1AZg0Ndx6mvduLJpn8CoPYlgwjKpdv+l1DMnvs8/6jb3jWWagE4tEmfa5uyTabLA==
Received: from PH7PR02CA0029.namprd02.prod.outlook.com (2603:10b6:510:33d::6)
 by MN2PR10MB4336.namprd10.prod.outlook.com (2603:10b6:208:15f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 18:29:16 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::df) by PH7PR02CA0029.outlook.office365.com
 (2603:10b6:510:33d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 18:29:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 4 Dec 2025 18:29:15 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 12:29:11 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Dec
 2025 12:29:11 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Dec 2025 12:29:11 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B4ITBE64164409;
	Thu, 4 Dec 2025 12:29:11 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 8B9EF142E29; Thu,  4 Dec 2025 12:29:11 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202512040100
Date: Thu, 4 Dec 2025 12:29:11 -0600
Message-ID: <20251204182911.2159272-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251204181815.2021473-1-lcpdbld@list.ti.com>
References: <20251204181815.2021473-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|MN2PR10MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: 27ef459d-5e8a-4ed3-8825-08de33630777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Yb2wXNIqL5r/4oKyVuE/mXJtpdvSDWRdOV5mkwdKq5JG7joxHjAIoPnlzV09?=
 =?us-ascii?Q?Uo3GmqN/YeiHGMGzWXcAEsV5Va198iQZnhnmeJioYiO7T873ZL8GmwSD8e2+?=
 =?us-ascii?Q?5fI2CDA++5GiOhMJVWd6iCPNvPqGgTp0mWnJjuYG5zFB93wNVRB+wTpDfES3?=
 =?us-ascii?Q?ZPqiVSDdbOSoiDlzC4sJm0QFCDyu1+t+qEfJfnxCHyLAzVMXlgVhA2O9ZqoP?=
 =?us-ascii?Q?Cm+CPCPvtFXOQ4PloBjDX+Luhn4O3McfRBtXWcF/YPwE4iHLvR0oUCumLG+I?=
 =?us-ascii?Q?Rw8NcQb2oR5fdtPD/D1bd7juB3g07DewSW1bCPd5ZGpAzzJhtImXRloJ563y?=
 =?us-ascii?Q?zFZawDOUWkdoADCiyk5nmftNNoTQkRo3lnhAu/hP7w/BujpvhCUHyA6pyTEU?=
 =?us-ascii?Q?Ng97lsuU1vqZOOUs/0qOPkYgjOjwkLQe9jUvIaOKaJdEile2ek/Qe1ZaiJdH?=
 =?us-ascii?Q?t7RfkubIP5zzU9ePDx4eSNUAqjvmG2yIr7Bh1u5crtT14i0cr+C1Vopw+pDK?=
 =?us-ascii?Q?wyCmxdii/b7/3yYoyOII/phZr4AVZhEqDcfgCCLqFCfbcxibogHJDd3afGNG?=
 =?us-ascii?Q?7bkG/ayJ/nmZrUPfZIPfEw8hgDDdoQEfLzyKI5McQw8PV5KpBJBIjy8AGbn0?=
 =?us-ascii?Q?TtqIFWEP/TnS35Xaq/nKxw4BOwmED6UNLf+PQyiBRTIQpsBP2zojVEsRTUAS?=
 =?us-ascii?Q?srL7dpxgsdkoJYUAD2EZdUPfq9LIbXOFoTexYjGq5TzAQghYcxYixABC1QTp?=
 =?us-ascii?Q?28lLpsqmT2zbnBst+90boTWvzMI1IcsGHeMCoO/NAEalmgiza4ONvAuJGIsX?=
 =?us-ascii?Q?Nbe573cktWxHidQ0fDY0wPPCjBk92wLfsSYj6IVFR5Z4HtLHgxX6zqouk5Qz?=
 =?us-ascii?Q?9DyTFIHY/rgXKneFbSzrYx+Jp54ThJ1H7Wg7x9mQM1lS74tz+AI1yToe/Oiz?=
 =?us-ascii?Q?G3xsxMrn7vmAx/n4cPX5t9sPOgC8w0bjJNULwnXUHZa2gzaefj/cyBIhEdHF?=
 =?us-ascii?Q?Mm0DxLKsL3EVQ7NZMaLBbLk3FCemyqMU5deNjNdK+fSni3/bPC3RQT9MZKBu?=
 =?us-ascii?Q?4YM0mEFUEBL0hdNJec0PO9gQ2XrDwnKuA3c7hwC5/dOJyJlZNdMe2z+s0jgY?=
 =?us-ascii?Q?2bTvHppjh6tjDVkB7W8oZwdQc2zw+l1U7/qfW6mxgctzh2tzUSaq8A2ePaat?=
 =?us-ascii?Q?y6IwnscbEF6J54EMYxXo1t8ezwHXhRvxcN1ockBG+SpC1LAfQYDBlv3bYS2y?=
 =?us-ascii?Q?YH1MkQE/lhxi4PUfAriPEVrY7cZD67Fh5U8wN+uoOqdn5IBmF4sVRLwybfNB?=
 =?us-ascii?Q?2dudrdDAMJP6YkfdJ0paryXxwgu//HSuivM6L9oc0NDj5eYYe6noH912BKUm?=
 =?us-ascii?Q?1W+DszZ1y8RX0cGvmcAtRodoKLLTRvzxMB/S7OJtlUJD1yhipGxK5BF0DM6V?=
 =?us-ascii?Q?fPoxIdNE3S0JMYfAXHuTUJfhL9oftYElFbdfAdDebjFZLJXPL4afshiDszjI?=
 =?us-ascii?Q?pjxsUf9vLuoNCDqVE5tyJWpIiXDgYBVLvR4H0KVx4nFS9SG9hsqt45pmBP1N?=
 =?us-ascii?Q?tB3WCUorZMpwRVKvuMQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 18:29:15.2877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27ef459d-5e8a-4ed3-8825-08de33630777
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4336
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Dec 2025 18:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19331

meta-ti / na / 20251204181815.2021473-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
512040100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 4 Dec 2025 12:18:15 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5fb77c988c48a2037eab14d294c7df520=
f02d74c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Moteen Shah <m-shah@ti.com>
- Commit Subject: am62axx.inc: Add TPS6594 regulator and core modules to in=
itramfs image
- Commit SHA: 98dfd20aad4d065d0fd86750a9765e1535a286f3

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




