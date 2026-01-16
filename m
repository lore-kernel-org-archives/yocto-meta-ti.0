Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A3AD4A5F9
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 03:51:01 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.195.1768535455853090912
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 19:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=aPm+qYz+;
 spf=pass (domain: list.ti.com, ip: 52.101.52.68, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbBoB4Js+4cuEV+02ESeresXremYeblclyZP/w7kd12TpOdpiqnbQZ4rS57iuubPqhC1V6lPiuu3oslJfySM9GlLnsH8dqFQMJQr+73YVFm6GntGgHx1ukwYQ7eyBTkIDvWcIxyfPHhUbDuQ9HEXyvMLIFh4NAn6jg+GKxMugDVOEHNPSF9be5XWpWmpeBxPHTh9mG/FjhJG++oDf1v2wskRzM+WZZHvKImY5teM9PY7XIgF0B7LHVfalaPV03iz7lyxEnL1v6V8UYfuZIHT9UcSOd928e1ZTGUq1pmCrn1STBQ8eAf7MLZNwnyLZisH97N4v8OgRJYxWVbwDqHSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88XsdlooBxJSYtjHJS36nCY8zVziKkkWv84x+zV27ws=;
 b=M6S6VtYUbq8pnO7ndEaY+7yTFeZbPyBl+2WWH3ZiNYof7da561r1udp8XpRWSMYki2Vjo7cA0YTaZcbvbs34hOuyawSA26inx+5SN7MGDdazIfHZW0zxONGSf+sJyZn5JId3VUiEynpIaJC6XNLwCTSyBHrXD/veSvkW8bYwOj+30AqqcU+Qh9PEDUc6zhj71+EaVdpgGprsRw24p+SQAdzqnGbxrD66qLyy20biyv2rPxUYSS0N3+qUtQaMO2/u7swGjMtaAY3Brx0ZbpNe06OqhXfQlcx7Ap7xvtmFqr1ELKS3+kMirMJedq/WAkriFsIpVTelNc/grsu9OLS4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88XsdlooBxJSYtjHJS36nCY8zVziKkkWv84x+zV27ws=;
 b=aPm+qYz+cSc4CzDYyNt8iIkchZQmKU2x4kbSr4oajgjvKTyebgM68ucTAmOEgzadTdzv0w9uJBKr3+ilvmIjTmTyyzews1UnIhPyRhUS3nf+gA683y4yj2GnRNh/zljn4e2plVipHyOfMWKBx2g6aNGZFlwfUTkmyR3Vio8VWvVRB4PJle60DnWOHtMPfY7HJ0nYRbWipkjoiDSJTEiX4nwdfExLVmU+eiZQ4WY7fHj0HCNDUBQ/ePXpzi41jSVxDuce8M5WTudV/4T0w35PkD0x0HRNyor9o94kPZSx//8etBDcvvaiW1pQ+Myi7gevPuvVUUHvGj3vO+t+BBuRkQ==
Received: from SJ0PR13CA0232.namprd13.prod.outlook.com (2603:10b6:a03:2c1::27)
 by DM4PR10MB6888.namprd10.prod.outlook.com (2603:10b6:8:100::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 03:50:53 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::c9) by SJ0PR13CA0232.outlook.office365.com
 (2603:10b6:a03:2c1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Fri,
 16 Jan 2026 03:50:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 03:50:52 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 21:50:51 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 21:50:51 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 21:50:51 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60G3opqR449601;
	Thu, 15 Jan 2026 21:50:51 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6B4469ACF4; Thu, 15 Jan 2026 21:50:51 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202601151800
Date: Thu, 15 Jan 2026 21:50:51 -0600
Message-ID: <20260116035051.1070096-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260116033542.1562461-1-lcpdbld@list.ti.com>
References: <20260116033542.1562461-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|DM4PR10MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: da7f8517-a325-48f4-d78f-08de54b271db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2ec/D2D31qjQ2VsK987QOrLdX8CK+C6mqcdxJhjofu2M9lO7P4lw1xTFGrMO?=
 =?us-ascii?Q?CZcAmyft8Y/Tjr3biq2U1TIIzJbuyAKTf/xVx/wb9ffJ8DOMPZ119DoZbQb1?=
 =?us-ascii?Q?tzeptmbKAomOsxrlZC+5P5JydDAd92Lz250RobYZD6P4R1+hj1Bm2Wz4uPIC?=
 =?us-ascii?Q?mVeLMSAb/qvu+mI/Ubdi8PIQXGzxdaPlOev01ydjO1Mwl8C+j8GgQ/EOyvdG?=
 =?us-ascii?Q?5ZVrQb8l0zlTe2DXUywnN8pTDD50WMfA8+AvZ2vuMqAc+Yl2fH3HduDpW85a?=
 =?us-ascii?Q?hUKwsl7OkPPykrj05QsMzbz5xVzPWl4il5Q5yDLq1vOINJ/sB6DvrUnr8kIj?=
 =?us-ascii?Q?6Ss/MXQjlgYhsyK9LtTXxn20XFOPeONAQR2O01SbaLE9DsxgQGMpi0a+zPzF?=
 =?us-ascii?Q?EQdZOSR5lfvUxENGjN+QD+vbLfuNs+2EQbrAQ4RlpKsNKxlkkHSXFp5hw4MA?=
 =?us-ascii?Q?kEcHtrjy6oYS03MzrjA221NlJkz59WRbMgZpMZHvxqrIFh0XUMhs+eoCeqWm?=
 =?us-ascii?Q?c39Mrz8GHneg2VVPAVD62wB3cW6xsLbmgDmGZYu5GTOs2BOrq08MkhMjBVh5?=
 =?us-ascii?Q?ezeX4kDqhBimL5bfrBIZf6Ujw9krHV+Pmym5v2E49CZp42s8oRscOwUPsoiZ?=
 =?us-ascii?Q?5VST6YtOg0boXKeUrklo/B3xeuDb4Q6UujmvQ9SadhFdNuu0MtpReIYGgdBA?=
 =?us-ascii?Q?O8QEsPUP2RFHk19YqYjyCvjlFteKxtY34AA1cVQTa/4hVXBSFpkADsyL97vn?=
 =?us-ascii?Q?+pM5XBcdqNu/osIMZyl48M7bIxBQdRGwzkcdq9nWEtIWbeACsR/04J5UFtXl?=
 =?us-ascii?Q?ejwL9veRyUlJcuPw4Q0mvvTez+0XA2nyzEbcjazbcPycTsAQF6PgDYhTcz4d?=
 =?us-ascii?Q?kIYvbFBcWxWTN0y+yBSXR7Ipq3S2WbfsGUAGK3PALEuZzke90i78iCGxZ+WF?=
 =?us-ascii?Q?/qlS56DCqoz86ZZfh4kfDQrJQwnOWdfA7UShiw/hqMbj6zm51QiJYniz3/E2?=
 =?us-ascii?Q?5QN7FI/JEPi5pL+QyszbJ06zSWHnunaS4XRol4ZYxRCsB6AgYxizDtWsChR9?=
 =?us-ascii?Q?PGyxWRYY0WMIRQGKZpPgpBJX9tHg7kkc+emX9PRpA+1AujHZ2obO6Bp+3302?=
 =?us-ascii?Q?cye9OfErTdJvwOCRMPIX01Wk9XHPdSQnRGjYN/VVm3XeidpVu17xGvtyLzHH?=
 =?us-ascii?Q?G+G8auNF8Z1iYcFQGOo4k0bZ1Y5UthXxYV4AjhtR4l+zoeXKiZtYgL2Oh+6w?=
 =?us-ascii?Q?a7yptoufIWf2BC85GIHSOsAbIt6iB3gcZ25Cgrg8k7Z+Fyt4fOSvfqtNe8Iy?=
 =?us-ascii?Q?6nJTzS0jn7xf7ku0KVEHRo3NuI5fgrClHuUPXILSYcV02yRjeQh+3ZaBILhH?=
 =?us-ascii?Q?Jj1LG6lkbTAeWTU7IdQxT1uqN6iXORACH4BR7RsdiolWN7Y1Jd9X+maT2hRK?=
 =?us-ascii?Q?69PwATJR8WdaPlDbF2gMJtLBoKRvnlyl3tZYFoyuyalPL0GqYUik3oSB0tYO?=
 =?us-ascii?Q?4765NM3JwdRVkAs9hNbwzg5uf1Ap5aT6XJZwRPtBuGeQQ/P+pix1Txl2pSjw?=
 =?us-ascii?Q?xmwrCcoh2qzIQ73YecwRik3xxMH8h3pqtCMAaXwfK4xwEkrQrngxgoa+vN60?=
 =?us-ascii?Q?sv1RpXEEJgG6shirQL7iqmQlhAXivdwTwJp1a3NIdkIB?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 03:50:52.2987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da7f8517-a325-48f4-d78f-08de54b271db
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6888
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Jan 2026 03:51:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19425

meta-ti / na / 20260116033542.1562461-1-lcpdbld

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202601151800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 15 Jan 2026 21:35:42 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5e604c2482fd6288261147fed9a88e069=
1c1e8da

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202512240400
- Commit SHA: ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




