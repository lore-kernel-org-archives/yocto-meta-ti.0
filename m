Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A084BE9A031
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 18:10:58 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18726.1771351852553231743
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 10:10:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=bpzG9WfR;
 spf=pass (domain: list.ti.com, ip: 40.93.196.36, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wwe+//wp4ows4RdniAr9PnchOMg7X0nRGKcSRfGytNa7FGxzeEf5QgwrkFlIdMvS1BZh5/b0kmRFgWf5DOVaVU2CxsDRIGr7UvfAEQRIVWbO8FG/KPW1g3VM4lillzSkYHbugV8fKcOktcA0wOgLOcSVsSHq6ffrJ3cCbV49FxyXRQOKaX2IBf0NXpepAweySXVpRAQCgrTUjkauDlYh3b5+UuB6rIbjRy+wFuCZl31vO574InTVikfhU7di2P1hI9aordH3BAZnYld0C29O98GT/Oz/89gjAZCJiALOY8hHPRJaRkUvJP51fC5LD5KHQZjGFgQvx4WMOltIHLyJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b8PioNC/eHSnZYBTKO6/9uxf9aOeaTLeCtEkWjQbQI=;
 b=nccwFMZfBhnpfqedfUOmomAmxMEaFwyuajU3eSN2maPfb8STGWNJv01YEFBOpd/3OO4DK16E6rd/cbCH49bZJmTmQ7ZZmsxkapYQVOKIg3GAKKFOZMiWRCNLW6N16Zed8iQGawsSsNzS0wz2eiPAOJAeB/hIvvbECblMzJfIdeHvgbzdI9xiUIrCDP2msNb7EFLZbmUe57ADbAki+cKImh5j2IN5pWF7pgnNTkaryKMygtZtnRfCdQZcGdv1pzNpffbk5r0DEJTgV/B8ZxaGGO7StVpz1ja3B0qgTJKEBs97QQ3FWTTRGwXvI3O+PXwZJIxl7Wy27NjR/AbFbZhjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b8PioNC/eHSnZYBTKO6/9uxf9aOeaTLeCtEkWjQbQI=;
 b=bpzG9WfRTutOpYQ8GSDZZtqN/pMh/8XJnBQJgR5rqYsHP7h6ZQy8Ta88OocozRCzPUcZGfzAoiFhHg6puNzBdRbStJFTVkeOUePOBlOzUHxTxgHCwbkBhGt3RaWAUtSZheJssJRBoDRsRLE6drKF0Y25S5IqXeoBFlNTZlLGi4iRQznLUxSnT7VEUYUzxyRa+XHKT6kqC6z2kX0rhw5BwGAtLJyfyNqXK/ENDtN5Hf3qHqb0BPCO+zPPRwh9n0/fr4HjoThXsp9x4BfIgBIMrP4QXFmUaRx+RR7EMYVJZS7B8MevWcoUtpDglWXzgLZ2M/TVZZSEeYKjnMF3uxPsUQ==
Received: from DS7PR05CA0007.namprd05.prod.outlook.com (2603:10b6:5:3b9::12)
 by MW4PR10MB6487.namprd10.prod.outlook.com (2603:10b6:303:220::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 18:10:48 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:5:3b9:cafe::57) by DS7PR05CA0007.outlook.office365.com
 (2603:10b6:5:3b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 18:10:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 18:10:46 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:10:37 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Feb
 2026 12:10:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Feb 2026 12:10:37 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61HIAbY23280860;
	Tue, 17 Feb 2026 12:10:37 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7E1F69ACF4; Tue, 17 Feb 2026 12:10:37 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/3] libdce: Runtime depend on IPU firmware not the other way around
Date: Tue, 17 Feb 2026 12:10:37 -0600
Message-ID: <20260217181037.2619732-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260217180339.128793-1-afd@ti.com>
References: <20260217180339.128793-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|MW4PR10MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 587b551b-8660-425a-23cc-08de6e4fdf9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YGpju/sNesfoqF6HMke1mpTRZLzV/lMrblyjRa0Cr+zkhUS3+/LH2DKbuZv0?=
 =?us-ascii?Q?uH6kLu+63Tj/Dupdt7WiaphVvAXfaU3f4Q6edkmwMZSRzjzBC/9G3INt8vYs?=
 =?us-ascii?Q?sNiOFUAGzEackENCIQDwLpCA1cuxXAq4fKtEBQ0HNU2EBCMr/aYiGO6Dw0Zb?=
 =?us-ascii?Q?YvjRfLYoXQQXfXUf1RLtCLDqtlNp2mS1cnQPxkP/RB3Zl8H3LItXmmiqTnkj?=
 =?us-ascii?Q?il+s02nk5crlHDNksP8ihjd8zLJbKUaj4e5OPECPLIhzxqEXKccaELGzsClx?=
 =?us-ascii?Q?GcLxF2xdermqyIN1eKpU6HMJVsl0QeHODXfFGxlBsoA7RmrFnslJKFRD0oUQ?=
 =?us-ascii?Q?eSnnChA3Df2WDTFnj75+1jkGHiDZaY7Bu0GZs+n3YgEuFqaOxHBHVWnTNXbh?=
 =?us-ascii?Q?OiG/lmKJJcYTeL7cOCTpYyfddT0Tp4cUYtj8FKP296hkFtUl5XQS6Pod6cYA?=
 =?us-ascii?Q?x8O+QzmUkxRw4tUPv/bS7Dc+Ro+W9n1ML15uJW/YOuDSVdCMzO2/9owc12RK?=
 =?us-ascii?Q?wVuJ6/tx4YRhz0Q+L3N4lj8SVnV+oJV7Qp9EsOOToGTbkC3yBktKWc/yOlKg?=
 =?us-ascii?Q?ZElbaOikP3nLcMhaWQGcvVuI5MC6LZRshQqaM2YZ9SD7uiV1xXrIjCijPztV?=
 =?us-ascii?Q?h/sZU47oPZZ/NPt2gpYeZavLqkmZdhjNtoYRWPNW+h1ZA8JPKhUI7N2G/9AJ?=
 =?us-ascii?Q?zjKmx7eX4MH45v5XNpquk0+R/USFdYxXsVFecKqVQl/AqO/2zT8e2/gOVVhp?=
 =?us-ascii?Q?VMJSwk9tnvrM+NUDgDCEzzdOmV7252Y/xShrPJ2pzbhsRinSNz1kPJnfl1MU?=
 =?us-ascii?Q?f/tQ14cDKGC0utEOUNFEDIi0lY41CwgxFdnDPAgMXEn5Brhz4aklVFLnZyJD?=
 =?us-ascii?Q?i3GFlRuXxx6niiUFM1UxFp/jWM6hkfzyAXdgQclkEfzV4T5rLRi52aBJeINH?=
 =?us-ascii?Q?iQ00DA0e5YtWJdK5I+9cDbTBoKWLD9OlLPLZhdQO8qmzfrWry4lxHBIGJR4b?=
 =?us-ascii?Q?5etiL2sjy6OQ4z1ImnVXC52rvKAvksxQALKnBVGNLRJ7hrzgdLCwHppF0gI0?=
 =?us-ascii?Q?tvU2sznqX4ld8lNE/aR7mQQ77XUDGR28ZAunoH19pftT/OFJ9DI1o/qfQiT8?=
 =?us-ascii?Q?RflD8xNK1MppSo9PzKzyeC29IJAqwEwozvi6iRSBNwWpZQC1hkbjLh92D1fZ?=
 =?us-ascii?Q?LVHlPMsyDCIvOgsEQh6NhWn6C4Lyo842bicJXsZVInkY7BGS9O64cgm0s33b?=
 =?us-ascii?Q?14BYfTCxja1nRuKcBwcXcLn82zAcZ6Xxs9GmMKUecuSZhHz4PMdqnJJfMwGU?=
 =?us-ascii?Q?zposIRttlxNx7pVf8CHq/++riCV00aX4l38P3QjV0RvgWXlhXN+CA/vbmsEQ?=
 =?us-ascii?Q?/5f5JnUvhf1nGQuXXK4oYNKiRstaovG5FcFJpiMBCZEE6pC87K3EDVULwibE?=
 =?us-ascii?Q?oO15RLxY+mdIw5dhKlAnLRtg35ciKQ7D7FaT4EQLMA4fzqdiZsmU0+roGP24?=
 =?us-ascii?Q?7UEfy+zSZI0QSL4TVFzHlILZUCiWohawx6UePpjPV25GgeHEcM/kjwYAx9d4?=
 =?us-ascii?Q?FVgx+waT6/mZyWkCNoQggBGJaLYqPOdmNh5Oxw9mLJuLf2xF3tAWOmw0JfbT?=
 =?us-ascii?Q?1A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vsCXXY+9OYHJQmaaCRfygjXFvWxV4tUIoJdpV+kTY6vCOy3cplNnF4oVsGjeRnPe+tI86QtyyngU+yeEdUzVHU/kSCNDgTrdlpxoNTrPR9FHtTm+2opi8TEEfg99OHV1upvgyJxcBZ4rmg3z4p76cFvUPiQy56nzhKREkWq/PLRQiVO3Gc1hSKL6P+P+zXLGqBust7HwdwD/4tRkJN6kYk4Hf5tr58b+7jQVekxjvUaMDetASK7CLFqw4xpuFPN9Xk5Cwg5MV4Mim2CFhjUCy6DJ+Ym8oPi3dPXZ8Bk8Hsh/QiwmxyUjAoGMrvPXYIcygMCsnBXJFvi99i3JOHCDNo9HtXSOMt4rJJhuQkBvVFWfx4+2CAz1s8S/mQ3ye3pZqQUKsxoGKjWZUSwMmt7hxZCLbLePahsekG6Q+UcI9AAJS5TucM8S9fWRMViV6FAw
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:10:46.5573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 587b551b-8660-425a-23cc-08de6e4fdf9f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6487
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Feb 2026 18:10:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19534

meta-ti / na / 20260217180339.128793-1-afd

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH 2/3] ipumm-fw: Use prebuilt firmware from ti=
-linux-firmware repo
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-=
UPDATE-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




