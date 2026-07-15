Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75A3C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:34:08 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12314.1784133241270389642
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 09:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=J5etn5f0;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=BEubMzGB;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66FE2vAk3824767;
	Wed, 15 Jul 2026 11:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+xdr55FGaAFkXeJLJsGjIzacf5d4PqDKunRnOMDha
	C4=; b=J5etn5f0K/N2vdYu1+2jVm47yI7XE0bCJ0DF1VNqWStK0w2hmla48pHy6
	jBtudAyi91B9G6OUkgXXFS+VZf8eDDcl1laBO/hSNb8SEqmPziuZ0zB37bKkfsEA
	ys3YLDp1j4tW5W/Y/Nb7xIVdoLBYJtMKt/N7er8nFtOdHzUWcfPVw4RNyUysrDPE
	gIWL7J+OMcuQgakWy1ZOSTy448g91guBRQNCq7uStxWEuXCxwP9tHWjVgbZ0x3DC
	THapd/WI7BTP/GebQHoPqzRh3VdM3U4MQsSwmdhZibSregMQCmkzcA6xv+pMf6Or
	MkazhSSJEcxYG0CFtPjd3GXKocnyw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fe0504nbn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:33:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iinqcNX/F6afySHfZs8syUrSZ88Um3HOkLUYM0E4zhnStgUpBS2keH72e4VwQTYWS/JFf5AS3q+7Py02g9BPrb9ZomLmwJq1ehOlKcShjAQ+CfRYR/+Fehkk1sNYu5uSFW6D5hpnDamcPlAnO6ifKdi6RbZgedFrNTR7LwEgyaK6yLN0nlvN8IcNHNtmrE8DVIED4wTAoSXhcSeFulj06w/171EvLYG0nY4A99bFlxQ3ipd05X86p/g4sDDngB6ZWGE8lmCZBPQ9vliUrlUxfgthad6x/ar/BS4ws3Gmbhj0r4k64b1VmdVjbegwl+OqNHKOMqnc3/zQ3LRc5t0eqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xdr55FGaAFkXeJLJsGjIzacf5d4PqDKunRnOMDhaC4=;
 b=nN6Iu8Wi0uVABE0DzSzCO4I/+K1DEnBkgK1LfUu96Dwif+i2zp6GRHltRvMyBkOJa04wQEk5IyRUjjR7rEBuk9X1/3O62s0iLbtGVIkGWdtV1Lbg1Lph8wXLG/CrVcEf9h0KTIMmdRQciVBk2uiVyJwukhxv5laX5IOuJkZQqfy1mjBI5wUvYBU8i9KW4cWhUPjifcd70ROJPHkJfeJqRsosfbllSwgVhho3ltapzRqTYkfJZCajR8Q7oEY7UzY6QuQ6sBXnQacKSzgWRwEQ/bx2TWL1S7/IHniThsLrRO+yAWyDklPkmHfoHRD+7FclgqnZYZUxMN3iKHVsfjIjqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xdr55FGaAFkXeJLJsGjIzacf5d4PqDKunRnOMDhaC4=;
 b=BEubMzGBeQZNBKNHXu1+5RFjgnnQtwPHLjm1b18N4oqLu/wsW1nClOk9AX8qOvwXCjdXIUkXVRamyRQ6kSoWVjkNRZXkpxR0relm920VZsbf634ZTAP588O669WYcO6W/HG8zr6rp/pmIvybDa8SvspE/W/lyZ6By9399wPR/85ZU6pzWWJWMqvU88bc0MZFPR+7uZY2KcNSL84cC2Dskb5jKaTmS7HZGRwB+YQzigPzyuIs9qGeANtz21Ktwz8/aiOGO33kZ86UYAKf64Uice9zXDdC4eu4jyqJCxgtY/ezaCILOWoT0F36f23ipkYEG1zwzVWgrZg78o3v1/HaDQ==
Received: from MN0P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::15)
 by SJ2PR10MB7057.namprd10.prod.outlook.com (2603:10b6:a03:4c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 16:33:52 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:531:cafe::2e) by MN0P222CA0007.outlook.office365.com
 (2603:10b6:208:531::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 16:33:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.3 via Frontend Transport; Wed, 15 Jul 2026 16:33:50 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 11:33:43 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 11:33:43 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 11:33:43 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66FGXhh41460731;
	Wed, 15 Jul 2026 11:33:43 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4462861B; Wed, 15 Jul 2026 11:33:43 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH v2] u-boot-ti-mainline/next: Update git server
Date: Wed, 15 Jul 2026 11:33:43 -0500
Message-ID: <20260715163343.3317098-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260715161432.1790195-1-reatmon@ti.com>
References: <20260715161432.1790195-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SJ2PR10MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b72911-ee2e-47dd-d8e3-08dee28eda0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|13003099007|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	dv9onrXN9UtdR+AgqdW1HoDRYdRiERieXyuxWiLZfRsUx05rBLZ2WWpOZfavblEAudajpLmlwOtLNpeid1ZAaQhPSIkZTrmHUHKzpHy7RcuNwfnquwwnJ/rCUQnNUWN8nlwFaIKhpjwJ5I2NZWN/cBFfdMAc7yruczw0anB4jGc4d5qYI9AW2LiGGSM/BOWDlbtftLTB9ZZ4d/VZQKuEVJ7IV6oGu02r+kQ/BqYmbPVGKsINOVyTpAAeKAZ9IvlzJUvGRyrBoFYSSN5M9PU6l78guSNZkfUlX0k0+8yllg3tkUBMO/2NbgRuZMBYgbTh+dREz9ayESQAyuWJQ9oIr4GPYiG7L4UrV1RxnaV1W1swxRswQ1YlZV6xWoIGrnP4O2/Tiuic7AUvPcQQ0NMDsdlNI3v2q7c50VDxg2uTcB+nRdPX70I1WJrrLOyj73QDlbIuZG9yrN33+PhG7rQmnfxhKMYvSUYi+ZUxbBgBL+DFtTVmBcVV0HO6d6kXa8nImSIjW7uSctjF0MHP3x7j6cGqmbHxe5RGhL2Kr1M7guvlhdUGfb+nkoyyGdT4E5LYn0TLJL2948bhRqx/LpYJm/F4CAhiIVJRaFDGGS8FAlK7JgtR/qHyGM+EaDN2IBOh9VPz/9qguJjgtxs3w4tW+MrnZVTc1MF4e1vXnD6+boh9ON8IVORIpFi7pwpV49NR76f1xkBgzl2oi1BBtwTbaA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(13003099007)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EYYa9Uock3sJYehdhudk9DGjuw17Kbwgpao4F2awZK1qwIt3Y++MfnA916HyX2bYypLSh9hbljzU/MaJ5J2LRzSazei2FzjLQ0mvcotvYHPolzddcuMGuhcrTOlF2SGay+D9kbLcaXKguB6sHy99C1sSJfCbS86LlpvG0byO+UBIlauBg3l1JXOeK6kEjDaAM2dbGbmQz1gd7HPeNvrdABao2k4YSsIq1l6Uixmfz88rLBbZba1BAuIdUh0hfXA2VSRqPWYuNbBNCfrFIHzHkbmRsJ9Km8RqghEwSeS/DEddfNRqRloPakfsz73IESCAnDcB8SrVaVen20pVP6iiOUkiwda66h9ytjjQF7ck/0/hVVppiW53Gu3gZhEClcu2Cbc/PsF8WVJjgfEW+E4T8CZUoaer8p9LGarxkDKMueYN2nvtuPkTm06u31Lc+9GE
X-Exchange-RoutingPolicyChecked: 
	GnUkKP5FDO4n+QM6ydpssV72Efe6MtBz+R62azW5fCxLUGFE5C4q1tBbOf73co/4jfQlZthxxvixD7O6mlqSi+vROANsyr6QgBS/t8ZKwQjY9qiB9/KWxLU4RvHn7eNFzEKwGmDznDnS8p9+56tmPaSOwoDjv0d1fvWBGlndb9cMvPzhJIl6GwVJSQqij+nRbNV886RDaTnFnZQ8WeAoZJQuRoPSCnKrhT+Tt//kd0tcD+KSvheY9cQbEBdu3gNx5sS9LoIpxypki1PtYKCDUzOaTzyBJoUmRdNf9u6MG9IWWEytHtAoBUR4EdJI2LrIMzpKJjym8G7knD2VFGkrwA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:33:50.3353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b72911-ee2e-47dd-d8e3-08dee28eda0a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7057
X-Proofpoint-ORIG-GUID: nK0TSJc3Trdaonclhd8l55CNKumHDvub
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE2NCBTYWx0ZWRfX5D3JKlKo02Q+
 KlJXiWkNS7qbeqs2YP5qdNgCLBPRcc0bDt0oubYsLQX9N5n7hys8FR+syygtypG/xDjIgOaA5BM
 NypDR3vOJ3831mFchjER60alTSLfPBg=
X-Authority-Analysis: v=2.4 cv=KfLidwYD c=1 sm=1 tr=0 ts=6a57b677 cx=c_pps
 a=CgODY3tvNtn0KPtxrBvszw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=SGkRdsTFUzSa5XR03aoA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE2NCBTYWx0ZWRfX0Mr3k6Ys0dXb
 g19gByWeaEF3cI7X/aAs+8QhVQKwe83cUBIH1oFIrams/zS9phCBTvqNuxK8Y9LhzeWtNIclAL+
 /91G/9D+TWVbmj9WZT1ZPrYUU36fI/slaWPt2Tu0uu8rQtBzuUAapKLnSUI78ap0S8Q6I/cryVu
 e45mfLvSeEB19LtyCp8A+gTYiWF1jOEdu9yyJ2UYSXcx+Ru9rko8c3HBZdfntYdEheU4OHmj0kL
 kdvOHuRH7fWVmGcXFz77+L+ZEbvzAg1iVlndTG0J1W4+2TRk2wJKAvOyUVK1NX8UxlN2SA50HLx
 cnr7t1787flezDdFG4b99U8eNe7I5sWC57dN1IKqhFkUudlmhSUPtNRfRPcW1EulzPn9It61BTZ
 8iPrHmpOzTbOpEGnd9nSFicDt1FrGwj8PknR8LeEnufavJJG5lFcdlaGJgVQYvYdIWbCglutRfa
 AF24WytrSo2Fz/6SwEA==
X-Proofpoint-GUID: nK0TSJc3Trdaonclhd8l55CNKumHDvub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jul 2026 16:34:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20148

meta-ti / na / 20260715161432.1790195-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH v2] u-boot-ti-mainline/next: Update git server
    WARN: Commit message does not include file/recipe name: u-boot-ti-mainline/next: Update git server. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2] u-boot-ti-mainline/next: Update git server
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 15 Jul 2026 11:14:32 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 816c3282206ddf8b06f5f102657f5413540cc6ec

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202607142200
- Commit SHA: c2bb926e01dd6bd539490892fecd27bfadde62f7

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2] u-boot-ti-mainline/next: Update git server
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 15 Jul 2026 11:14:32 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 816c3282206ddf8b06f5f102657f5413540cc6ec

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202607100005
- Commit SHA: 42b887f0b110eecb91744625bd4db09b1ea59770

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




