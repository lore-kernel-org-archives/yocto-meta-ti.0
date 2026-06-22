Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258FECDB466
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 20:18:40 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6049.1782159513506560242
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 13:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UZES29Ca;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=aPlO84of;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65MJaWA62220829;
	Mon, 22 Jun 2026 15:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=cAkbPFxgIVta+YNhpLCOS7l6toMBFyj43ShcQr1AJ
	Jw=; b=UZES29CaWu08Qmd+eAMwi1SI+GWLxMR6Vddq+keJ4DOg1ZqWya/QqSwJb
	WnKCTkL8XIn7eqAeQ/cSX1iQfzQ6I9zrRR5ZPLQzhw+WsHZ2Al6NidkvjRZNIwcO
	IpLiIm9Ux8/37Ka+fcIAU3ntuGVDAJfYFf7vzfBJTP78JtNLRHUODaJin5bg791V
	sEq7s/J9jDwIDhpQOL7Kuw3hjpz5qdF72j0Ld53xipJDRNxlrIz9tbxWhoCmwvrE
	hoc3Yu6S1A/D7ygzUi/F3ZF4VT2CanHsl7ZsBm6aNGjapOf2KgBL3KCqjBuQODS/
	3PKbA+B+C/N8pE9Wloh8fZFFl/nqw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012006.outbound.protection.outlook.com [40.107.200.6])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ey42xu044-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 15:18:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbEJMYODmq/MMBe711zN/P1x8dQnnH5G1Il/ZgAEgSHedF1ZwAAI6eqGVnt7AnZlbkztHsG34zElxXe3J+wg8Ng8MXK+IcZLbA1EAyrcAphTkE1ak4QbCEv2DXuGSwF4WvOtkHxlhTxAzc4KJ7AJDcjgQKpVSYobLbmJ9sEUo347MqASh1T/eR38KQoNZv59gVJZ2ZPqyYUtwdQHXl5iEnJUD/csEvoqlnJivOz6YNFkxOVimo61mAVbf0bHUXYgCjco0nulEG9QmeKRU7TQeqW9SXI+OAvA9WryczHnSvodKratWrkFNUGVqsfC97bOyKRFIl8BvW6gsdqanc1m8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAkbPFxgIVta+YNhpLCOS7l6toMBFyj43ShcQr1AJJw=;
 b=byxWWmopag3vzC6/NO9tz088w8WJ2ehu9WCOoKY96+Q8b/UMM80ZywXOKazsPLIPREkUDe8PHhkh/O8sp818tCTT8i7EG+tEkumHRLyH+ryqFcKnwpJRLFB63B4h/5a2/p/qJchs2Ngwvd+gu/1qgPGrA44apRezh62ug8DylIHb+JXP5Mi7cQeYo7F15Bp2klVEuG89ks8yaaLlWjLTLJBsPLIVKJMBYv4fJf5d93/EfCLoC5HWUy/Y1nXY0PwPvFoNJGVIgI+ZbKzxmdCKPxJPRMroAd40YURMbcXRrLslIkLUwfnmj0MIfowBstaYaqBM5JU+zfrRrUIyXlcViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAkbPFxgIVta+YNhpLCOS7l6toMBFyj43ShcQr1AJJw=;
 b=aPlO84ofQWukkvzCpB9uW4MJBSXFj5fBalknJm+ASyYcONegnarFIUo7a6EBN0zTMGug7exaKv99d5acvJufJ00D4sp2K0QrX+QB48G+17jzxfCfCzbk3gfR3m2vxtSDgxs1pk8YvEzbWkUNQtsmAsUIBvo5wlJDQvC7rba12lp58I/T/tlyxGAo+TfdW9vdmaA39WnEykPYeRJWJ8Fq8gwY+WUSVUOkniD3Pz53EFozHeQuCvBeHvhLsOQG9HTZJU6fitl2dyviyyiUyuB/sSjvZl1hsnSINejYrCzPK1f70I5bXS0ai3wdG5FNLMOx6cQC8v/De5hQEHNPnba6Yw==
Received: from BY3PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:39a::34)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 20:18:27 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::43) by BY3PR03CA0029.outlook.office365.com
 (2603:10b6:a03:39a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 20:18:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 20:18:24 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 15:18:24 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 15:18:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 15:18:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MKIND7671012;
	Mon, 22 Jun 2026 15:18:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CED0E9ACF4; Mon, 22 Jun 2026 15:18:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] linux-ti-staging: Include CVE exclusions
Date: Mon, 22 Jun 2026 15:18:23 -0500
Message-ID: <20260622201823.434247-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260622195440.3482698-1-reatmon@ti.com>
References: <20260622195440.3482698-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0895edf3-bb38-4e80-08a0-08ded09b69e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	PqWE515ExjgF5UESJGEoIRzlgGqnx4tWH+cM2aJkIzIS+CxVjKSwi5PvJEE8dGq0TJ7kfF+wB9YpGHSWEFU+qIMHKsVNCldzPaBtkKVhLsJnwXheJ1Ev0nZ3HM4BVCNxrHiiEp+NBGThCT5m73DhqO+olQKNtgEukIq1oDFqXXbMlwuVcFnQhdGSxZJfscgqYOnktLZgX3ykUskaYlJorLdfPucC8xyqfc90GrYfSOuO+Y99jre/L9KLzM6yIE/UY//LQEVljNd3y6VppuR3Vt/wFC7l56rfIEM4nhQs2raAxM96XhYVUYL9D5ThQDrlNKcX1I35YtbMptPX9Uy/GSUjXDOqJtVg67omTODsDQjtq44o+eQ8886llbdsRuC/d4uOjZrDpK81b/jg9ZEQHwZ1TfOV+4TwaCPL5WvXR/4BttCyJJIKp4N/LisL9TZV60e2EAXp7AcPV3CVDL4JhEDpUvvdI31RUFPlM0kjvodDsvcg22DtM6ewdRswc20kgnLaXHDHydoAJqbIV8PxlaeyKE1G280SN0OljLG15/u4t4r+lx8tNbtvDXvoGhWYjz94/Sy4rDiIv2mgBTx30KN6jN7PD0gx1i5abZn84JcsqLKwAGGYw+Y4mFWz4O9RpVdTkVbLCzKeIM+liHpoPoM50hFGXhQObPC1Ots3nKrIz5T6ISMIPKTsOXUI5ZxE
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hSARjS6YJK4LawGkgHAb87DDwxZV1L/YkfkRpiqucphqLs6VO7MhhgDsRuxvMfKG1UkIUvWZwJvB0uswWU2I2F02zN2HUzAwWS4YR+xRXxTJyz2KYe5gihuqkQ82TwcN2Ambpk98xDSgw7nVQGFpfJLlJeIY6xvckh23/TomI/KxPiLdKZo0H7vL7aC1IgGRuo+rkIXbkF1z+7nsYHp/h/Njhuaj94zqH74+lpIf3ypEJO0P9NaaG+pNr+mhGxZ/uDFFXveICGB9J8Br5QDOcywX6hGyNtF0li2V22Eb2/HCe0rtUnThqTWBng/mw3UGFTPFo0BhEHkd/4qw4u0V9q73TQJ9lK5SM+/MW3tiOOLy2Cqal4+hqqCdlMsehJNNnP7PedtL6LN/3Xzgx58krYdNE3lCHsiEEBcTg1iRcY6PPoIlCzYLDUvfac6lXgtz
X-Exchange-RoutingPolicyChecked: 
	VpYcqwIZ3LnlrXuCuVqG+dvu++cKmPDVTFiAz+HA9RWm69QyRDKB1x12o8TVdZKb6tRS99saoYGuN4wM896GUSaDJeJe7odZikN/sdw7HZkX5ddZg6SgbZE5Fu3uN+cPSAZTRlh0YYWoN127nXKkGv/gplsclns3fEeVAAWZejGOkW+64J6PZHnL4jtd0RTB5V5Tz0F8HZDlJOi1P/TFcMkJS4/tulT6pDiMQOLJIeOZjsiWk/pdp3M2Urfku1XIANK7/lYVIQ2xUAVJZKSmK54ImbGkeQNjPicnkt6DqyZVuB/cu4R4NcROCxJ/iyc8Xpfm9yne7NMcritE07nrOQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 20:18:24.7041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0895edf3-bb38-4e80-08a0-08ded09b69e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE5NiBTYWx0ZWRfXyJzvPpaxyLhk
 HFXn2e829BbdkBCVQyS3AWAinD8EwjotVawlJxnguSdufJWaYdHvD7PvSsviZXaw6+v3I9iScJ4
 KNjoCvGEUonH2B7UMkRa+uPdIT0onus=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE5NiBTYWx0ZWRfX9Bxb1w1XXlZw
 1kBWCMfMVr+/9NRZC9qKUtvqVFEWKQlwHFBoMko/i3UcjZ+iJm4RFfj99mot/rOGMHrka3X4Qc6
 0BodG9Sbkm592G8RZJk/YT7QlZ2HNtGKWDGVnRaj+lp7TwPCQWaCNfBxGNTTk0Lle38bCc3nvSx
 pYCWT6HNNERA6kmfkJ3mSkWjwcQw63CGWih0AUF/LfMf2tyM2hqki75758UcuIqalS2j0HVu3IO
 G+YgyjAHeK2lCyKAff3nqgvn4ZXSlXdiytGMxqQX6wvWeGzQRmY+urI5TG3CPtXHdPWeZvlU4w2
 /Mmz2r26KICVWNGM09jQ4oKWBHhz/2MumzP1hptuMXDaNT/BJzlyYTKoLgvptDFlL1kaogF6Z37
 vPSyM5TsuW6wKzpbpETiSWgFoZpVBgVuN6+vDvlHCFGRslZCJ1E8l8yqqaz/rbQKdL28gBfKo2i
 5B4daQOhAX4jjQtM7GQ==
X-Proofpoint-GUID: yLE_di4Tib9GehTmoE3SUitgM-4NYSN7
X-Authority-Analysis: v=2.4 cv=INgyzAvG c=1 sm=1 tr=0 ts=6a399897 cx=c_pps
 a=wcVwjJSTJ+Ev3TLsT0vURw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=KwUc2yCoGRQA89PPVg8A:9
X-Proofpoint-ORIG-GUID: yLE_di4Tib9GehTmoE3SUitgM-4NYSN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220196
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 20:18:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20053

meta-ti / na / 20260622195440.3482698-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] linux-ti-staging: Include CVE exclusions
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 22 Jun 2026 14:54:40 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b8f6daf319e004caa56f82cfbac16be6e3e30ce8

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-ti-staging: Include CVE exclusions
- Commit SHA: 6b11c6282df6879784e46f3ed5e6580fd8ef14c5

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] linux-ti-staging: Include CVE exclusions
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 22 Jun 2026 14:54:40 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b8f6daf319e004caa56f82cfbac16be6e3e30ce8

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202606221055
- Commit SHA: 89fdd50042c501aa8b77fbe8eec3f22a89c6f64a

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed




