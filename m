Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548E7CC6B24
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 07:12:29 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7874.1791961942573244895
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Oct 2026 00:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=GNjz9feJ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=kcqGxXEw;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69E6lDIs896700;
	Wed, 14 Oct 2026 02:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GLZr7lB80nFe9VbQD2YL7/nDaaflghqpfS9H5sAza
	6I=; b=GNjz9feJTPrvLU0Z1q2JWlZx6UpvL/SeXWPQyjky2sbR0NQ85N3tEG/9r
	mUhcJYswJ+g3sCaselxFG8KMmOjrUC/WqpxIVUEsMT5I5REpDJtZr2JQQ+LFmoJY
	sXGX3e0+lLtNjxznJkdAXhVKTiebthEalv83d0DbftxIV/TRFuZTDPBiJ5Q61uhb
	3UlO7y7udf8Ria5JkdbRsuo5AmAsjI2YRfVd8NSwdQ7W+lbObEZV2HoWxiiMkdvC
	m4f5U/iyVBdKZraPvB2VtvW61WkWyUZBN8Edw2uHb19evl9k+kZmCcP0e5cUcqBk
	wd7EgYLj7PwfwaKZHzliu3AFRls3g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h9u8kk6ku-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 02:12:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktRp+o2+YiEu/Gsdweqrzru1Wna96B+T10jJwHyTzDOV/cwVEq+tKrOeQCfXajIatjtAC22T7IvwUqntdpWaDtP7sU5ZWT3zovuelC6VLMigJU1uVnXdjFnhztkpTzRXxkw8tSuneC995foF6cBEIg3oygg6xAry0l6qRuTUiXeOlj013Kqj2Pi4it7uesws6LRVazU1yeB4vbtjAQLhqHSIvMUxDDPBpzA5DNqQmMaKjwk9FpVUNsZyEDrS2wlGfKQK1ESnIIs3EGQruReXn5tY9bdHFG+jgw1gHOB5epOFhsaKCycFJfNiLWPhuxW3NM9HJGxGcnruvqWWYMgHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLZr7lB80nFe9VbQD2YL7/nDaaflghqpfS9H5sAza6I=;
 b=bv7127yPjgvjnm4yC4o+fz4kPdrj3VF59EJQgTGdnHPFdQ40xWq9hWjYHKR9EozjERXoqS7FXstkSzvBPX5RaNqWROaAJORhB1VRniXk+8r0RP+yFJAPyADN6ZxtyzY1SFSe25BcJbdzQwqJqsbrUyVBkuaIkNvX3FjtI3ETIVPlcM3oCeNEqW80mNgmISza9L1uwSwNKL/mW5Dx/Osxi3TpoZqqGi9Eqn1r9BdGAghT7K6y+8aEImrfSEZeOWZj2EgqqXVl/nBCcauBZ34dOALmhX13MYcIdxIEu52tAcTEz+21F2rDBr1fiyb45ibLmPVYn4pPH8i9mJZybb+JWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLZr7lB80nFe9VbQD2YL7/nDaaflghqpfS9H5sAza6I=;
 b=kcqGxXEwRFxcwKRVivTcHts6oNtpIFrDtxGCie5d/QIOFeAxlYWxi8b2B1VH5euEaaL1ku19lmkbmT7EpTR7E6w4bb9GEpmAhctWeIVaSnuenYImzGg6MM13AJndtaoQldb6iQDyKjA9EcKZpwHjLvYmnQjLfPFkQmppmsg3HEXWiwWfZw/j9aNaCKgEkqTqeehjreNDYnmw/GCi0OnE7FfjqH3M4wa/y3lxtI8IkkZfEMazTqZXpnitOr3Iu2Gi7jeT8+n8yzxxm+Z6TSDx1Vkz0+6tHrRlnRoUYjXvlHeD2sJlNPQcIaf1sxu4uTBaxDOIJiHVvGaXys98wJNW5g==
Received: from BN0PR07CA0010.namprd07.prod.outlook.com (2603:10b6:408:141::10)
 by MN6PR10MB7490.namprd10.prod.outlook.com (2603:10b6:208:47d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 07:12:18 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::8a) by BN0PR07CA0010.outlook.office365.com
 (2603:10b6:408:141::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 07:12:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 07:12:17 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 02:12:06 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 02:12:05 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 14 Oct 2026 02:12:05 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69E7C5WV2755126;
	Wed, 14 Oct 2026 02:12:05 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0175C9A9C2; Wed, 14 Oct 2026 02:12:04 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202610132200
Date: Wed, 14 Oct 2026 02:12:04 -0500
Message-ID: <20261014071204.2204838-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261014065230.742721-1-lcpdbld@list.ti.com>
References: <20261014065230.742721-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|MN6PR10MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: ee457de9-7931-465a-0477-08df29c27b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|18002099003|10067099003|22082099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	EB6LgWdv4RAaj3o5vd9iuWbIJisw9CXjEgqv1fo34o3vUAiWtQ1huXsvukIUKw9dcYWcNXNDUwJxQVPkZx2bVYb3JOOfdN3xecsYckVwKzBYYyO+flBXfHEOv3vaUJn2pIfTg60/4hunmyU5tetlIXc1zU29P4q97LcSEfM9mEGrMamVJBvULpM50X77/o9jpTRHHnsrnfKP0Nf8t1fmOpy64Wa8zB3Rr0en4ohc9OEoMED7EDL+GucFM8SrXK28vF3rDbJt+TgW4Yv+O8qLrchL/AAWWhg9OA/LusXLRNBPeKLC4gPWXQGvyMnQoLhPkSg9W5Xw0HKmwTlP5fEknH3YQBfX7kFBL7IrA1U2ZPetgOjifzju3L4XdOjv1v8XMzA3SPX63oirvSx2BRlcNxck8Bc//WlSo7Nl4QfPy7eA00dA9JokH+y/aI3eqGx+mmvmnFO20mQq+gyISFLWI5owIscFzcIq7YMkdbdDCU/XdpRFKzD+o5y631GCHcHeNQLhiB9bFPbw/dmMVq6+Iw8yfqasUA0YMsRpD6DzoXIXUjcFBHk/xcrENZ3BfmcsVIlDEImIK3uNbJrZdnUDc+cQUK+4ViKFseTcRZv6q7qQNaXB2QOdxQTqsYFxf1IvgWW12lXl4lDp2H+N1s22NuMPU9uQXQn9R9qsftUJ/1k1yr9UMl2LAz1Qp3z7NP2d8LFl+QngKxJNN/lrLoqysw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(18002099003)(10067099003)(22082099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mKLm15rBn2uZ3G6V1wTqPqDvLwTcK6egaw1vPQm0tiOKevwALtMTzccHPHx5opZULt1u1TJMDONG56/ZAMNmUkDvvjZnV7XBv+tW0+AUM8Wis21jXKSjA0ZjxOG0rG7iARO4z7U/mofPYL1od1V8LqoF0SIccQgKeMaeJ3ObAxQbzmvxspWW/yWoxLINyITExzf6cULX6jL3X8BNQK5xWOL6/Q5iiCAakhuuUV1q0wkl78ndQQfbFDRCVAJhEHhcd+fO33OFqNuT+NnIID/oGbdySM47MUQiM9GHjd17QAZaxHXVxGbGnzKQEDmktutG21RXnN63J2Issnsgc2k3HoOaoXCwB6vER1ctDFIcjdb+LyRZYrrTz+Q8VjEXy/sievPFbo+cYQpKdBZFcSTAxQ2khTVqLRGBrnusx/dbwg1uSJiWuwbofoIGB/Le3HLG
X-Exchange-RoutingPolicyChecked: 
	uCTYS9zrIRgojYRNNUbYq/4HfPMoyOW0B+jDq5jV9hzXvdNM3UJaUcp7htfKvevIKdIx6wEDaEaeOU2X93HT8/7X08apsbSJ+Reztcwdw5rrmV0IN0uVtD3n6UeYZVfIcSXJR9JvT76d08gIgwkrgViFzLOCYMWvFEM8Bj72TLcHb9pSMDYIHAIG53asGnhrMvvm0kflbrz+wi9yuxhBP7K7/kHjC75fwufrb+sSapSYDBoOTuKHHWy6kOic7ghSz8tdOfSSeeRe1ZHU3GIXONnmtdCdDl71HSGH/qo560Hb815RXAnZ0aR/WcNxXhifUrUbli5Qc2vtsLu5p3Ov8Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 07:12:17.6268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee457de9-7931-465a-0477-08df29c27b36
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7490
X-Authority-Analysis: v=2.4 cv=AoB7T+9P c=1 sm=1 tr=0 ts=6acf2b55 cx=c_pps
 a=IFr6uxAXmWssV7p2N+XdEg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=Hpw5DEqqg3_IZErpDJYA:9
X-Proofpoint-GUID: ENLV1Zb_LfjPzmp3-iDlLPEgCn5kEzTC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX/pfMjQb9jQ4t
 0/ZgSzplclh12fRorMH0E0AUmmhVxW88aScA0OsZrKeYNqhXr6mksiZuHUgRjrNyhNtRThTUPhP
 tJyd24IQBP38RffcK5NQmNa8w0oShh4tsZk3yyf0qP5ESLirAfHYK4fVWf1+fvwAX9/lodYbruZ
 /+NzowT4Ex/LZ0QSL6D30YXHT/QedajdNj23oLX7hBGFBVlU70keFtW88rOAU7ubz3XGWv1oXEm
 9qLTx6q7NrFc6cGIzIu9c25Nt6zq+Q+nm1IUKlWCLrFBx9qfXdEV/Z20hDA5PMkA5/YO/H5GNM5
 ruXYxRHteoI++LQyOnG3ErG3eKNXUhGpMOFTFptAKVIcukSfexB+a1ua0HK65YkDNGSBqyoEauf
 4K22oQHex0nIkHRNSnwQqWlgCgJ36Ur+a3bMMm4OtsVoYjBdgTwP07+Iz2pLDQbXAkEGHZfoCPN
 RzivhKma6guJ8MPKKNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX3dE2RkUJrhgA
 l3mhbqozWYkN2JJ1SeqrnQsLJxe6C14mHQgLRZpQPvn5yH4uUGTkRUGnPgC0dfJ36MvD61hbA6L
 CBxW385UaEuUiLmm6+i7mtN+DSiWnKM=
X-Proofpoint-ORIG-GUID: ENLV1Zb_LfjPzmp3-iDlLPEgCn5kEzTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140028
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Oct 2026 07:12:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20456

meta-ti / na / 20261014065230.742721-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202610132200
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 14 Oct 2026 01:52:30 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: bc34be257e3e398fddea08c0928f7ff365bb8b86

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 2bd07c4cbfc422684c9842c1fb3a89d1c2785eec

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed




