Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16274CCF9E3
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 19:15:35 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7469.1762542934017035008
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 11:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=WVuY9zG0;
 spf=pass (domain: list.ti.com, ip: 40.93.196.40, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ/3xqjWFaUf0SEPu+iCqhCgZ+nDxAJJiT++5GN/NLpy+QOM+fOptLPvmQCteeN7bLwK0wYJL5OdF4Y6g+PtpF6SUiPPkV9jVSGa3fpuzoOz0B5kQH9s4t+zk+WKpuRGgGC6w2W8C9kTIf4Z72lZpPebwuTAUN0Nshe4+bVLMnz790Jz6YVMy9T0MDhu5HtxHq4nr/85A5PEo+/MuR9rg2KWudQfjkAEclb1OWV4GsXaNY8JUghj2xUmSPtD3f9aGKPPvJ1ybC08tabOOhKSse7gkAaa3GDw3xRT4I/aq9dN/iSe/+te4we+O7NMqVqtJSRxwQ9rnXJP1iLIfJkySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdqTheDgklbGLMZm84uNZgiLefpxY+5zi732VpczaBE=;
 b=U0gWTfr1aGTLb93dA7VI6t264KM6/L0XpBLwnpmMVI3vgeURGaP/sqYM3Zpj6qM16aBLQT7lQfhKbzOJnHRHDHVzpkq0t00hXWgHPSlOE8iwSgC6um2NmQTyCPf3pDKUjh5GYB1gi3ie51H2uDcFeSOH53xdqH6Anczl9PjJSs0DS+Lhuf9DQ5S/a/K9maCD9mOvCMdePh0Mvbih/yC3yUetv5zBRoY2d2OF6yeIci+Ae14aS6O13LfdyACepZgEpNoa/PyPK8HwLOjrriA75cmrfWetHf6SB/Der6Af2IlqyGN6Z69LENPYEWvlN7hZVQUBCYwZTiZmy83RZb1V9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdqTheDgklbGLMZm84uNZgiLefpxY+5zi732VpczaBE=;
 b=WVuY9zG0ymIRP04ueefBbD8/Oyw9AE/sg/V5ysgIymErMCI20y5gPPNH14A6Ho+eOm7Xhh/f9Qgo/ggrE1yGI5YnYlBNEF2UQUZjYQ8gxhPw3X7RYqxTA5+G0NXo2wlrl6auavzZzQ/+NGaNx3ot2AX1J5I7gUvNg/IZqFb9jKp/Vy1rptp2H+seNpdJrQtbSeqlH7g1BQSrQ8dUHil86f0GmSfWfeUnJxu1Jak5NrZDHa5aXCgkh+64DLskfYctL/9ANRpkQ3v0NmYoX3VAMwqYombkF21abuZykn8DxYX2boejKPd3HL9z1pSuAPFGo02Hvws2oV6tcajEaDkxLg==
Received: from DM6PR12CA0018.namprd12.prod.outlook.com (2603:10b6:5:1c0::31)
 by DM4PR10MB6863.namprd10.prod.outlook.com (2603:10b6:8:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Fri, 7 Nov
 2025 19:15:30 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:5:1c0:cafe::22) by DM6PR12CA0018.outlook.office365.com
 (2603:10b6:5:1c0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 19:15:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Fri, 7 Nov 2025 19:15:28 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 13:15:25 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 13:15:25 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 13:15:25 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7JFP0H2374925;
	Fri, 7 Nov 2025 13:15:25 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3F89F9ACF4; Fri,  7 Nov 2025 13:15:25 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511070802
Date: Fri, 7 Nov 2025 13:15:25 -0600
Message-ID: <20251107191525.56391-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251107191326.481781-1-lcpdbld@list.ti.com>
References: <20251107191326.481781-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DM4PR10MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf95c00-cd24-458d-6c14-08de1e32036f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Apa7pixj22B1txPgGEKOzk+ULm+n/gldLCaRyWGzl/JKpFN6EBwhrDuAAzfg?=
 =?us-ascii?Q?Y71tdJiSXLbMa/5bxxZpKax0vG4wHhvxRwgH//T7wurFOgptbx6tNYO7WhHq?=
 =?us-ascii?Q?iMiiYyUbI0q0rj8qIBIrduY456RGjX/5+CJhN4ocxMdmf0tEq9IOuT7jsFHF?=
 =?us-ascii?Q?8z07xiYHTWs7T1v5osevn2F6FO8TjlPn5bSsGJeB5Juwv+AEA9dNmwY848I2?=
 =?us-ascii?Q?0f3WmdLHuHtkKIqxXMBs5NZW2Io+0f02UWx/hKZZ4EwC2OxMatM3YmJNZq3a?=
 =?us-ascii?Q?RIa9zaHt+R0cSuODM3JUfMxgauWIio+R2OtZuWjXFYpUkRp4zwo2tkeapxiZ?=
 =?us-ascii?Q?gQ8zK0tf/YrCEWPUZxra2T+qs9I8Se9xMeetm6cNlbGZ+79QijdCSitX7wXZ?=
 =?us-ascii?Q?TI7Ne3sovr8qWplxviyS9Znblv7vH2maXotV7Xb7WMZ7OMn0lWwwe6Rfq8Lt?=
 =?us-ascii?Q?YCCGoXSvHUepZ8ClfN+3TCMf1azfN8SgcdgjwmTLQN6OsfVUfvPnICU7JGzI?=
 =?us-ascii?Q?bj0EDqsqg8Ut4GoTNgSDLDd5trocj8RB2CxXKfnxapqNjptd/h6CfrflO96o?=
 =?us-ascii?Q?p3xOyYY5y00j/5/7o4hk/HSR2JfaWtuqjhxnJaNOBkwRoDDA21p2vwc5dDfO?=
 =?us-ascii?Q?GFPvJjkqpwmC8ENzYfXA5mS3CXCl+aneBdhLYWuP7kGOcT3HLlYqBPBKonUY?=
 =?us-ascii?Q?jdXrq80YifP1f1vHcvG+1F3kPzJRJHdUyq1QHiqz9V3jnR+88XDuJ6SMgIqS?=
 =?us-ascii?Q?gXF1zI4fRaW3rhTBIFf6qoC4+AfoOK6g+/r4P5ibjdmSXs7H9xTG8eMYQk3o?=
 =?us-ascii?Q?lKIK35GE0YRes1xYNwVfPTbciAd6eca9UszqHA6BxVLhoHe+gjPABsWxq9f7?=
 =?us-ascii?Q?r4gEfeFVKtrPYxDxHXbRASETD9iKTOsQvPdBVWxvvBtZFCGQWK4dK3pxiSz1?=
 =?us-ascii?Q?ZJ6Om8VvZjih7QlcDEWon977pyDiaYgUVGT59SfIQZqvenIpKGQmlz3uUcDl?=
 =?us-ascii?Q?m0qcW75kZLG5Pxx8LiVW8pNQRslqczLOm26EXWocYRd82cCMLoxBeN6N76rF?=
 =?us-ascii?Q?s0jj1uVwNY+AQC5TcgHcOBWJkwU6XTUpN8mt5BZYA5AVT174eCCf7yJGCphF?=
 =?us-ascii?Q?UDmfnPPim/gsb3lmEqgDA8zK6sSuw2KjiB1qGHJ1hUE3FxgQ6RIXd5jc9HfR?=
 =?us-ascii?Q?vuSmQULvsRIluQxhsXxRGU47tcE7IuqHSCVGf++lGVRdq6VC8obMqsZIYROT?=
 =?us-ascii?Q?yf7dL9pK3QbOe56bU/BeWhRBHsnobd+rckG/5x58FSdw+xTC00sEmQn5e+he?=
 =?us-ascii?Q?OPsJpmCDiq9fdxA7meaW7ZeVDJkvaGqYrVrXuK4phK1nG0BQfIKJ2vYd4Hwd?=
 =?us-ascii?Q?VzdnFUr78A7kvg9ukYVROsSTuKoJQ5cgrzq02VY5DvF6Iv0RRoHcI9cP2Phv?=
 =?us-ascii?Q?0WEObEmczne6itHoNzp9ID4GHscUaB0yMa5/8x4yPCIIfvkdTvUw0ifPAQVb?=
 =?us-ascii?Q?u2wYH4wSP38/WvscC/BSi/Wi7Jae9zm7T42w?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 19:15:28.7084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf95c00-cd24-458d-6c14-08de1e32036f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6863
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Nov 2025 19:15:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19242

meta-ti / na / 20251107191326.481781-1-lcpdbld

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
WARN - [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511=
070802
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.scarthgap.202511070802. (COMMIT-MESSAGE-2)
        patch



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
ap.202511070802
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 7 Nov 2025 13:13:26 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: cd84f7775e4fc141ccca2bba8a91358e3=
bc7ea2b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Vishnu Singh <v-singh1@ti.com>
- Commit Subject: recipes-bsp: Add TI PCM6240 ADC firmware recipe
- Commit SHA: 92a0b3c1bc93bc8d62b5140b7e1d4a45c6f9e65b

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




