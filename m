Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38F9EEC2A0
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:18:15 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6984.1771885091930466817
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Ocp5VO27;
 spf=pass (domain: list.ti.com, ip: 52.101.193.68, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnIKjhwjBPMXoAtFzKmHKCu/S+ipBtN9/xZ+J/CDPsqIBwOiXvTaU3L11V6mlKfWHNlpmFiUnNenENmFlcqGhYKUPPjltlX0VI0P54reBQm4A+KK+8VCi4AJxhdHlAxWAkmZEbRib8ohBOERtqBwH/6TwU/++lzQsUB0G8TG2oJ4CydrUP4ua5SH4WDE3UW7iGH3pJkHH3xcSDi7eT7V2DS7UhkxTOcP/30yIqYTKiexjvHnVamVVHgxnkPDtNwHKA9HHnNwjKLdBwk9H6n9CLZfxGg12CH9ApcTJIi9rbEGTe6atvVsHaBh1fdOZyUP+3eluatnPR+nJCfdcIuUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/b/KmpegVEUq4dn2zh13Ch7oeGEYVL6tzDkFfnhabs=;
 b=HIUEWuME4d6THvhmXuZGVGHFefPdzTb7oevGp6ZCEhZ2KuY4L3Zv2WZpqtuZgv0XlfcNEfapJf7OW6Dg1Leps9KCP6nEjlWWPtpzi3jIq/tQQeLHqCl0IZub2dImCyvbQ9l4jKrtj3ylzbCQLpahkwkc/VvPiC/P6UDxhBcKa6Xf+9T2ugZcnakRnPGA0CuaWtbfqjnMfbu1gHllX1MnBWYmjasoNI845YQRRBURCII77sFAOoXLdT7TaLNbuXApci5JD0xZ/ZOnvdxBuQ7WtBe9T+DDVss76CMcCZeu1pVBxD4DSqIsSrZKuXQzoEmSiUJCYWnAHxVRto6LVPTv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/b/KmpegVEUq4dn2zh13Ch7oeGEYVL6tzDkFfnhabs=;
 b=Ocp5VO279rzO8+Rh236pioRwrRWBCaVeiHhTy6fvyjIDzx3eAQai3WF/+LVdbw7tBHSmdMYNXgqXDHyapF3VdN3Rnn/x0zlxcuBS7owcD6kPP46em018uuhWPwOuae/mUWV8OkTDVxZwuJVCPEhVgsvqTmoYrYTYRcpRanmkqe1YdwYw7q+u05jwEXkJDk5L5Z0n7/SJdHML6pD6cLG5kAqvllCfy3ON6zgjwyjUsltf9TYhzdn/F1yIMXsFZL9C2NEJGFjyWZq+hEu4W2jj/Plh2ga4GaD5AvO2SspZFOMqFj/xHOGZHZOd7R4dUgkM75RUnos4KV3ursME0qsK2w==
Received: from DM6PR06CA0087.namprd06.prod.outlook.com (2603:10b6:5:336::20)
 by CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:18:09 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::fa) by DM6PR06CA0087.outlook.office365.com
 (2603:10b6:5:336::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Mon,
 23 Feb 2026 22:17:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:18:08 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:18:07 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:18:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:18:07 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NMI7D51099213;
	Mon, 23 Feb 2026 16:18:07 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AFA3913F521; Mon, 23 Feb 2026 16:18:07 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] *: Remove unused patches
Date: Mon, 23 Feb 2026 16:18:07 -0600
Message-ID: <20260223221807.3360392-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260223220739.1224122-1-reatmon@ti.com>
References: <20260223220739.1224122-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|CO1PR10MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: e7480f83-6dec-421a-8868-08de73296c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AyiDdD86HGb/dReEerzIb17/QoCYh8TTdb9xZ5HCOsNspj6oCFLR/uUg9OXh?=
 =?us-ascii?Q?BfaqnpuqK4ns4H2fwGKVcqYm1uiGpshG25hgvvQwwf+3aAb5JahlQnkiRhS8?=
 =?us-ascii?Q?h5c6nCwvm82Wiy4GCkIftB15qylQ825fJvZdu+RABjCT+YyPl97WcTeeGhWZ?=
 =?us-ascii?Q?amkn3eo0i7DzN7/OSKyIjeeWIwQx7h6ncqvKZOgiLsxEB2FNngC9pnl+l617?=
 =?us-ascii?Q?7TOmcj7Zq3BeQVE8I7u2BXeGVS4ek+eLdQKmBnVP//3VYwWdTUynubVdKbWu?=
 =?us-ascii?Q?li+KwTICY/YF0pZbDEotGoBi1OGV2nnokdqkZ4Dd4iJcZV6IoFyNF65lTPOU?=
 =?us-ascii?Q?EvRgUZzmAYDbYunnhyD51ycZz+Tru2zGIZZC4eLx8XSKsvGxkZxL5EGgBZ/W?=
 =?us-ascii?Q?gKLmsqBsYCZgYrnbqDemDPw4Fx64jItToFiHwDyfIaq3GB1hT9rXsZu+oBQv?=
 =?us-ascii?Q?lUo9UrBYEd1xJR/oCUMnk8OGVgT+2rJ3/5wWYiMnrv25uxhy76xFf/2adMXy?=
 =?us-ascii?Q?w/RDNkgGCA/wfRx9ZlZWgGHoz+r8r/DHoBFZMryFBDHsMwyXO+0sAZ1g9aUW?=
 =?us-ascii?Q?Iie1MHNPgCop8KmfvoBQhj3WtrjxBbK3MHUIpI1pcPz5pLNGmk6BypPEZ6Hh?=
 =?us-ascii?Q?Spx25qpOzTX9BzHvNpRSk/IfOZFuX7+unJYo4X/I5yHP/jjMjQr+X56kleY2?=
 =?us-ascii?Q?U/MyYjbuphDBcEqrBAKl3g8Dx7v4LdJPRQhEOvrf1lTREWknlHXYcL83l5Y2?=
 =?us-ascii?Q?IH6iYHuEeXKg4z4YmT3M67yNiOLwb6CUmLvFfQh9T27g54uodaXaTofjVx66?=
 =?us-ascii?Q?H+VcERlXxyguXnX3ay4XohtJp48EGg+JG6W7PNLcarVindhE0OFj1koOHk2J?=
 =?us-ascii?Q?dLWBxZxuApLOYdeJr2MaLwWIwW5lxzOkk6Rh/wq0i3oPblFGwd1whk9WdD2u?=
 =?us-ascii?Q?tQrbtuYVWyC3INkjsG98L/erJmKAcBd7nkqGQco/k1UlCe7EdFfAu4NjaNzc?=
 =?us-ascii?Q?k64g6cmqwSpiBu8zO5f9IuFuZbKWEIoMj77oAETAJKzzlQn3L85+u6VFysMN?=
 =?us-ascii?Q?XliP107pMNt1N67R0dF7FauJZaMtvQ27ZdxjXlHrDX2mYPTCeKl5cgF1meoZ?=
 =?us-ascii?Q?1nPff+nh3nuhdHqVqV93YcmpuCOXHE+VqPHhT/4NpL/L0n4+8gTx0foaBMcZ?=
 =?us-ascii?Q?HXZRqXUUCivRCRJQHn8ROpsNj+n0xg2iHA0abq+giaikO5ibypc61M8tg38y?=
 =?us-ascii?Q?Ldm3M1yveMd6b7ov0eqBBAnRvIYiY0TNmIsrS3edRSDkvfBWzDSfZfSmcnN3?=
 =?us-ascii?Q?lroZj7Ex/WzYYAZXtwUlBY+2IVFilQBd6+nI4iK/ULxXBbHwYLORyXBBgitn?=
 =?us-ascii?Q?ZVKptyr7SnoQpe+1HDRCRbO88HtiJ7yeq8IWFngQPjc8kZq/zuZ14+8It2Cc?=
 =?us-ascii?Q?6jl6tX6RX74hm04EUBp7qJtoZWcvwty2SWDEGZyKLdTYiLQLsmtkqdXeLwkD?=
 =?us-ascii?Q?Dr2A03vzOmuvbiTyqO+C5nc6pwTNNq0gFUsad3FI4eQUroiNKDBjPQYCvLUG?=
 =?us-ascii?Q?H3k77c0/A57M/U6uBYB1kb5tgsMdGFwBYGM2BYI+D99SNXimFF28vGv1EUEP?=
 =?us-ascii?Q?cKnN/yfPYoqrYEGWpzge07M8xgNHrsTzkIq8UKhFkqpioMCgkI/Qvg+yudFX?=
 =?us-ascii?Q?5hkrhg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Wg8Aub2lBjREZwgDmGwfIfw31hWWh5vinyq9qbRpQ+EPHMf0LoeMlum9jKWIf0b0aRvQXFEz1jxrDTCoc0kggcZda+/d3nePLu7Xv9c0wPuX7okvGv8JUWCb9vp6Swr2v5dvD/6pvb85VZYUMSnIxO7fMotIOZH9jZk+3Salxvaq26DaCT+W/hruWPEM5b2t1HPtUYL2OY/ORtHzTuWBlDYKUduUGOivhoEH5+V5iUI/2phfBCYpS6BX1jYxa2LJAWSlFgqJ7myPrsVI9xlCx5+nEnp8Ge9psDelgMscp95tWvoOqkJLgVZ+lbOw9KFNSZwwiC5iBXFT+srU9LPzcgVl3pI2JJ6mjOxRPeZUa1Ksbs5Xz/ALyFAwN1T0QTubPbKQkttjRWsTXcIOdDj/pWv0Ges8bu6jP8WKkNy8UIU/FOfjRxqBeYeL65a/0rBJ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:18:08.3171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7480f83-6dec-421a-8868-08de73296c7d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4468
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:18:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19571

meta-ti / na / 20260223220739.1224122-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] *: Remove unused patches
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Prasanth Babu Mantena <p-mantena@ti.com>
- Date: Date: Mon, 23 Feb 2026 16:07:39 -0600
-Date: Wed, 17 Jul 2024 14:55:10 -0500
-Date: Mon, 3 Nov 2025 12:42:57 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ce549bb977fbce91af180b86dc0acca63=
b1e3dc5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202602230732
- Commit SHA: 1f22c78e4d1d58fd7117f4834bbcabb47574104e

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




