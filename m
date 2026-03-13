Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB58103E305
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:42:48 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18875.1773416557715366483
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 08:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=DQkC4lgc;
 spf=pass (domain: list.ti.com, ip: 52.101.48.26, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpBjPJggXLb01VDGQKg/XmmeBk6lOKW/8GkPRx+2fxijk3SVpcFAnMO6XynW0Uh/lCG+IZyBv5i07I5X+VM1E+bKWzDEnhHWePZl57xT6gadCTqLo7y68KGytuKkRe9VyciOWXLs8Z5ME0cxGyygAu80DnjVteLarkmnq58jeLbErvy5iXsupZwaIxyWMrEnGh3UqKsf4bSJpY93WLaukGDVphl3ThqadolGDazQtANZKbu0wKbfmLgI6CYEz7H6E3+z6N8b8GftHScduX5VTfUTKxd0JE/2JyI/LpXnYuq+ngelC+hhvyUfd8kEgAwONileAUsq7NFaGB8liI64wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ty6ZvDfiG5brlxSwA24jx4jPHvfbvwQBv44nxU+X44s=;
 b=luH6D59cNUdEUenRayCISC9AZGUBIvKG83wG/fPNFsTrcDRdKvTZj91NFQev7dgD5WwwcfFs2nJsSY8xWMaFBAetJCXjiIjwYTvQRhCsxPXLoiE+sKFaQjOny2LwobuWLpepdCqyfBJMgvgcdJ2lCVgbXZVXtLfRQoAUS43x5lJizvSeruBx9GB9yZ98AsQ0zOL1rmd7gbGIWJ2JCnTfS8l7fL1pKo13jSEQMpU1CgtQOHn48iFREQq5xaTff59SOD8MOU8Yf9aiopaBY3ZRGDs2tEVoyfedDrEVrOepzm58lM7Yt3k2fx1lQ7YBvW2kr2IWO+h9elqamSfoK9pjuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ty6ZvDfiG5brlxSwA24jx4jPHvfbvwQBv44nxU+X44s=;
 b=DQkC4lgcDzVeRIu0CftMSXKZtO3gwYXs3l8M52DFXUro750MFa1tDTo0NvbbLiTv5Bjh4xPKnKKZzEawYKlGNAFZdLWFeiYLNober7GnbE7TY3QhiXFJMXaebnjydqAXnXJK6pWp8sRAKzMbdg2ayiTkS1vms1fXBO16+EaWkqTdPIXXKa9mzctXVLJPdRsFJClSozifgZBmZTuvW7uh56Wy7te83dzAziU/YifdMIiCXJ8LH3uWB294NYGiKUQw+JWdpUjKPnua2Lf9LVRwZzuauqbWALBCdaMG9wky8bNdhGyQAKN7AUcfx+/S76QJoajbojQc+OQg1XlunxDMng==
Received: from SJ0PR13CA0217.namprd13.prod.outlook.com (2603:10b6:a03:2c1::12)
 by CH3PR10MB6810.namprd10.prod.outlook.com (2603:10b6:610:140::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 15:42:35 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::e1) by SJ0PR13CA0217.outlook.office365.com
 (2603:10b6:a03:2c1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Fri,
 13 Mar 2026 15:42:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 15:42:34 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:42:34 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:42:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 10:42:34 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DFgYDO778634;
	Fri, 13 Mar 2026 10:42:34 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 3DF6D142E23; Fri, 13 Mar 2026 10:42:34 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] linux: Remove unreferenced patch
Date: Fri, 13 Mar 2026 10:42:34 -0500
Message-ID: <20260313154234.2137689-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260313153112.3721901-1-reatmon@ti.com>
References: <20260313153112.3721901-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|CH3PR10MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: 5663e0de-3450-47e7-5a3c-08de811725ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vEN6ATktYjgCUIi/PL9oiq8L2ixYZDdwDAw0w/QXnuGJjTl5vim/xi+7fpJoEV79Yn62eygXOmDa9x0evPSQ4Q0YSL0/fawUMMSnGfGVntx31VJ+C8yd6eInfFAHcsiIPBnXElKyMSYDv46ZfRRQyl8Wn23LiuIdd2yS7oqeYbDSSb6sTY+jrd3KpmWz2ZdRjH0s/lGhBSvxbPIqO5JVvTW0i6OWlimq389qrJBI1O7ZBwFkNMPjaSX8E5ihJPIac1Umux5pQ1Q+Pb3JS59TbydxNZ+s2PWdLFBl3LgmIYhqdnMm/j8UL8703BFk8Hkfr1LlYWJCxO0khV6CY6RQcXCTJV4E+v88nKeC5lJYFi8NUbsYGON52eLWtr/zNdkHrfNNQgQejLrf0ZK8G0YKpks4RbSGLxpW0PtV9cdd0MFuDoBXtqDbjpTPo8mK2OylbVHi+HzLOEtfq1ykiM1gQ2fMXHcIHPBfDRTwyoucdzr4XLK5FVoIsnFLX9sh2F/jpzojSAm4k8WnrPpuQikbUzLtgE01eNMAm+KLKd1BUe6iWPh8x/4dzurbxvKZFJkD3sBG7YRwQiinBOK4vlavK2CXDzpK+IOIj875qVk9VfOsXJgXHomOlzpbZJSKsOQGIYgBiXfBnqBEbdAO2J0M7Cb0U8mOqa89uCSfsm2dm2HM5Kf7fLLY7R9+5Z1iQczYKlvOBTAXD8fR7QPZSHFZO/Hkgkfhqu6vLnS+etiNLHCrLRmLl9saFzzt+hNoFo0cgSRrMYYo6xq0bHCwRQnWKA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ydCpCrFkT6bTxjpVYgcv0OgCbneKTMjreK7l6XyKpqCfyltq2dKXibU8Ls/P+JrbfB2PBuhUZozrI7yGTrc/73MDIuz37dEVLmaICl4z3UvVmh4O2zBvVLDauGZLzIX9JCy3+sUbwdgOZASTQaEYnfAygDN7o54vJj2eoDzR35XXNAOvTYffZ1KhPtvNH0k3E8Lr1ouU9DA9elDBCSMddujZBGxwh8kwqfqZ0WJLdIPsqCVD02ZwtoDIC8p9xovvV4xO1crMEo3G86TewZGf6Vnn+DDVDhl7rbb05s6C7RxtEbgOjmiQZYfO0VjufBgpAsOm6OY96HdxKFKCFh4mZKnbteitAAvvtEWcsDoulD3ksHWHf5xhENRYCFOvz69rrfp/1YuiSpbNrD7TerjCh0sEQJBA2fl17o5zZgL/N0UR3MDStCV7f7qq/FHKkjQb
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:42:34.8382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5663e0de-3450-47e7-5a3c-08de811725ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6810
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Mar 2026 15:42:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19715

meta-ti / na / 20260313153112.3721901-1-reatmon

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
- Patch Series: [meta-ti][scarthgap][PATCH] linux: Remove unreferenced patc=
h
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 13 Mar 2026 10:31:11 -0500
-Date: Wed, 17 Jul 2024 14:55:10 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5d1712bf1412690730b9c388fe377ddaa=
d0cd68b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux: Remove unreferenced patch
- Commit SHA: 1b499785681ca5eca247ff0eeeb9a44ebcbdbebd

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




