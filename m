Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3643D44C76
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 16:12:54 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39701.1768493569873376720
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 08:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=vAm8O5VM;
 spf=pass (domain: list.ti.com, ip: 52.101.85.19, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xccv2n9jaYy/oPQdw+3flEhrYRlqNSSCE5QQTbFloCZFhC4yDjrvmflh7TOcaYnzUWE8obSxcgHskeTn8bgUtsBvvXTMrJStDjxi7VKts4LAXEXmpr0NIEiLhbxGVxXz2KDhPdhZbgV5p8+CMfWr/WThzNJ6ZuKP8oDMZTUhb4D7LLBkNqoq6kBs4pvEre6xBE335Z5fEtB35gDpy57ch7sBzgXLVxIdtKzePE19/j8i9n9cR4YfRvy8fv+0wSbrfAK91EfGh5lrqU/+qzDRChYrDm4ePpvHpV/MxYQUJ8acyGLDHIEAViCn54apTXx8PgsHNCeD8sFiQKgUT+dJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsBROOqGmF+XJIVJ5sBdjAhY4vQUSYKDYKAALlYlCWI=;
 b=piN0BVnksN9y6qw05z2ksER6dtpggWxEhYNgO/+rxtaKaXH4kiWCNGmeGR9h2eGLR+4fZOS3Lsy+W82UbP2DNYCkqh6Wk0vTEh6pqIzqdJxWfxtH20r5qlQhooc9dDcf0CkSAZKOYbh5mBrsi0jf7UfhqU0QBUpf8HnwIqpiyCmtOVAyvnMhFYuwCI4PYfeeLDjVu7S2NepNQsCDNYz7bLHWRpblQU1psKHUMGGjPQV3asVU19caooDs/9Zd6uqFpc4M9iSzsqFaZvBwn2Huj6sY2BAjAMzZ+QCvDeEndu5BQEqzKHtULYZgwmCURga57CVhw3tbujM91gpkeoggAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsBROOqGmF+XJIVJ5sBdjAhY4vQUSYKDYKAALlYlCWI=;
 b=vAm8O5VMYuXZuVaesaPx05UufxF8nj/7fvhcbAQUK78QOreMfVPEIHpxP2geRwi3ljGSMkKrSnIeCjuO2Cm+uOVWJ7HdoKUFnG+vCaQ0NNjgJ2juJasAmavguLHX86vSHpUJaDjqdjGpk9i4EReQDjzxoTyizEXk71AuKIuRyeCO9eMvXNW2Lkb+dLWPTtvkgGSVcygi2HPISPbyKZWaXd5HN2LILWGWVZaaP7d22MgxD/nk0WBUxEMwWvffY7Asp/v635nQb+9gml17ILULNN06EEZ+HElD1yJKy85PPiOYAcEqVQOBnrtCJDc84CH7nKTJxnc3HPbVIYDvf0JEFw==
Received: from BY3PR04CA0018.namprd04.prod.outlook.com (2603:10b6:a03:217::23)
 by SJ0PR10MB4494.namprd10.prod.outlook.com (2603:10b6:a03:2d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 16:12:45 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::78) by BY3PR04CA0018.outlook.office365.com
 (2603:10b6:a03:217::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Thu,
 15 Jan 2026 16:12:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 16:12:45 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 10:12:44 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 10:12:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 10:12:44 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60FGCiGs1821429;
	Thu, 15 Jan 2026 10:12:44 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 512829ACF4; Thu, 15 Jan 2026 10:12:44 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] linux-ti-staging-6.18: Add config fragment for j721e
Date: Thu, 15 Jan 2026 10:12:44 -0600
Message-ID: <20260115161244.3400040-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260115160413.2999023-1-reatmon@ti.com>
References: <20260115160413.2999023-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|SJ0PR10MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc13e6d-6254-447b-35a9-08de5450eb40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d1At0ls0a13uwd8tcyxnx+dWD2IotT3s78ENTdDGRfrfxnZHRw3xrXBjJRhU?=
 =?us-ascii?Q?xWY9YtVTUPalntuOZoZcHVDTBl3Hj+hFQSR2KfqOIiHdTCFaZIC0Z8vfL9kN?=
 =?us-ascii?Q?gLiMq2AHL1fH/G6y8bGyxUsrvbMquqaqQu6OlLG/epXGDpHaCGEzf7NiJadO?=
 =?us-ascii?Q?3tl33h6qZg3XVliM+xAW5AVnN2QDR4jPQ6oPzu3KH+vHdf3gtSCNu5w+RTAa?=
 =?us-ascii?Q?hJvWcBK6b041GNyF447Wbu9PgUt54OkrjD2D1QafVYFtPuCSVy142XFymVDC?=
 =?us-ascii?Q?GOLCPJbtmsQ3yZ9uY3iAgP09OReQXje9blqE4mrjcML1kQURUDRV001rm2qp?=
 =?us-ascii?Q?v+VnuHPOsHl2/LVB/zfdpSrr/ApeMTT9rkKg3Olm5fsQmQEWd3TDEqad77hc?=
 =?us-ascii?Q?eK058KweOlQnbC7Fn5gOQPFWdV19HekVVxsfEsDiFDuqQk9BUbiSqIf7LAj4?=
 =?us-ascii?Q?CyYcOrl/pd1M5Z5PBCA8EYu5zg8pfEsksU+G6mQDD/nPQjokbmcOcHez2Hu2?=
 =?us-ascii?Q?8pdm8xUW+RoeZC/Hp8zi4bUTcO22u5oQ3CPxAFFOAaYQD3Vi8fSGJuFLQt4m?=
 =?us-ascii?Q?moPu4ZEhAuZags+G977uuyNXaJfV6WQgEwP+r6RYGcmoOuV9mI4UiS2K0zGE?=
 =?us-ascii?Q?OpRLMxnAAhBUNYPmdkK8nXsD5w/lMjW7SZ8S9lRqRu05+/oCfgo/Mnc+Srxi?=
 =?us-ascii?Q?Rywso1+LhUzwm+06jj+vKJK4Iva7OPtu8uO21Guy0ThiaVq1UyLv3bf8mU4O?=
 =?us-ascii?Q?tCC2sL+zQuBlIkL/Z3XjHQcVJsnjI9jt97lqC+dC6N8WL/5JSay4WwAC7p0m?=
 =?us-ascii?Q?oqRv9eP/hwL8y0kVin/iqK9qaJfA7fn/K6GgfG4X9skgNPNJBOcXImkxB5iW?=
 =?us-ascii?Q?dsBvLE71HacC6RN1CY+1TpQy1HCN5hK9KoQrrPb6wNszOVikYgo8sIek+Pnp?=
 =?us-ascii?Q?LNsbG6iccI1u0KLD0GZzcRKOoY9jCUKX7U4xn2mJb0vJqnKSBqWIXQE0YHi8?=
 =?us-ascii?Q?8SSK2KpEPKgLBh2sN+UZk8qEkLWBD95Xdw346S9BNHWSC88GAeBeEkw04+EX?=
 =?us-ascii?Q?6cKA4ZFgDduJHNNVu2BVcWdLZompwGpuuS5uVbwKFOp01yZ562whgJiWMRuV?=
 =?us-ascii?Q?eEafD/wcNvIpjczoK3ey2E96eMF7E9ZhOKUl1+3atWTH69d53CL6zVXeDG7u?=
 =?us-ascii?Q?W7I1hRV55gxNZbveQ/2iD2ztjCMneCBs0JPcA5Cr33BM4J2yOnNV5X0Jd6GV?=
 =?us-ascii?Q?0jOVHpOsr/MwtP7/Oyjpd/+P1rLlYM8fxiwZ2rbXhVmsHnzYyKhTrPkb2y9i?=
 =?us-ascii?Q?zcYr2dXNGYndw6g4rsVyMHJ8uCm+IJSXOrdmZCxLiVVoVLihsC0iIgQ0Fvsc?=
 =?us-ascii?Q?3FNaUMWKrDn9KF2aaO+UP+XfxQtECD8vmpLx2EcyS91LZdhdO7xsaj+FZ7z+?=
 =?us-ascii?Q?+2iilsZJNyItl+lGs/OJu/VIEsejJif4yzIkimv01ckclQqH/MCznkuE0Qvg?=
 =?us-ascii?Q?9oBxMWAHn83lkGm7Fk/rHTjyk78DFpwuhPxfn0Et2mwCKzOedtJoexRyvIzl?=
 =?us-ascii?Q?r3GLKDq4wN1c5xoB1BzM+yIbWWt8c1lGNXTMdcixHXseo9mOB0kZ5nqWjo6d?=
 =?us-ascii?Q?Cd0ladEMItwgKgztV3Pb3+OTUJl1bGAg3mLFYjPWipezsDFl7nvI/qkyNseq?=
 =?us-ascii?Q?o0xGRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:12:45.2844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc13e6d-6254-447b-35a9-08de5450eb40
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4494
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Jan 2026 16:12:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19418

meta-ti / na / 20260115160413.2999023-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] linux-ti-staging-6.18: Add config =
fragment for j721e
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 15 Jan 2026 10:04:13 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bd80348311a112e73a2124f7ccf4c8243=
54eadd8

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




