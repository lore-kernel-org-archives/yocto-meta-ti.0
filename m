Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C05CC5DF81
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 20:27:35 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5548.1787171247532221264
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Aug 2026 13:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=oYsXI+lJ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=WohBAmwf;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67JHppEp2915497;
	Wed, 19 Aug 2026 15:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VIEatGYX/FVLcEYgpVFx3NHz4H/22LjofbNMKihm5
	EQ=; b=oYsXI+lJj9k3NBngFBvkGxaOw9h1qt9zLzPwfsjadzxoDpj4Ba5/6AAJi
	93w3nW05ewRVh5XLq//XW/rFAU+xeSMX4J6uPmaiZAmp+KjkE0tk0yhvYM13Sg0V
	uIi7inhL+6gYqsUOS9lurexW01sLAKMyo27sc4kIO+vyDbuaObiuT/kEPF2vIJc4
	syVVLXT0TQ2QLAVY1jnqHGIhQ/0Xq6RjlIrL+WVdnTYfhdcUOWmhSZNL4scc7DuD
	HZ+y0twgfFLdwq/5VvxUz3PTyWkdycoqUgt3FwCXXnmuy0yqY2qVi2v4E/RX9wK6
	NLHhYf6sRldz73YLRER/xybj0hJrw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g4yejqec6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 15:27:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmH1MoM1YPa4F0sXRw/Ukm9WMTKteyMslcrcUI44jTMck7U4/EC7Ny2VywFitVzNLsLoK9ED4rLVHOb39szLaidkjt8+EGu92+bDZd+Puz+lWJKEv877KEI3Qsxn1so1XhCEo7Yy7F1nOMu3U56/jXhLBQuJzzbzGLs13nJco/biE0URfnu1gmmAjPOaCkKp3NSDZ/BIh6Ki7Egc90MUzj0JkYzftP8oWLQ7+2M5TX6AJUIQQsIFUtpxhTWU7QA7HsoE/Rn69nJVw8DNb+FxuvhyNWf4F3rJ41P7Da82QL35vyrmqFJnw9KK5nytw+dXXZqQuzrZ8jgiQXE/zroL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIEatGYX/FVLcEYgpVFx3NHz4H/22LjofbNMKihm5EQ=;
 b=yyIhGDOsQi1DmosLRlA9mY+VKxGJDVTgcsYoh6dLQEFciuRhtUeOUpXgiUrhxRFmVzWRkRq+inxknpAxRHsJpWmFr2ALkIHe7K+uBvD/m5BNBBcoBtzGJRpR3zO+O2UJz5iaj4MqjUjUt1GOyZMAUjZOiwL2XfPrnvWcSARaO3jkNwMxPT6DrcDaQI+ukaOmEB6ZHg8BXO3iDmoB+GTzm4OmA9ovtX74dsiOLNj009mhpX8/GNNp/qP9YxtjP+5CuSnCpEyn95FHtbd+e4H2fbbuMeRi87cQLj1s9e0lBN5nBvT4uEtdvzdRTUjtCDzfN99SYY8rO6Oagjed5Dz3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIEatGYX/FVLcEYgpVFx3NHz4H/22LjofbNMKihm5EQ=;
 b=WohBAmwfxkzuVNeddGrd/Rk0wcN7Jt5FbG0kUVFCk3fZ3ilaM1Vgbnkly6U7Uv8lbHQ8+JdmfFBGSX5c6e/GkUellEEtjaZL+3yFa20fRRJZVavKL6wg/WZH2fDfmitFmv1BrQT10YBApfvsgW6ggIAmHwTpYTrquE0+11kUkpUGW5rBwoqeaIBo6YWsHywFd64N7qWu1w8AZ8NIWP/jVCG3A4OHq6yD9lDWvQ2EiRd7X/cFZvGEs+O10Mvhk9t9gw+NpgJvk9ILqLRmID7Eew2XsFeWxqARXU0SH9RdoG6tnWLASk00ZOA4RKt4NYlB6JSx6Z8brYAPlsgTz2btZA==
Received: from IA1P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::13)
 by SA1PR10MB5687.namprd10.prod.outlook.com (2603:10b6:806:23f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 20:27:20 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:208:461:cafe::13) by IA1P220CA0005.outlook.office365.com
 (2603:10b6:208:461::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 20:27:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Wed, 19 Aug 2026 20:27:19 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 15:27:03 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 15:27:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 15:27:02 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67JKR3V22994820;
	Wed, 19 Aug 2026 15:27:03 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 05B5913F521; Wed, 19 Aug 2026 15:27:03 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202608190946
Date: Wed, 19 Aug 2026 15:27:02 -0500
Message-ID: <20260819202703.2640055-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260819201830.2993277-1-lcpdbld@list.ti.com>
References: <20260819201830.2993277-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|SA1PR10MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5df249-7b08-45ca-cd6d-08defe3044dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	MWkYu+oxARfvm2xjHLP5urLg+i7JQW1LoZRvJ0iFv+ocPD8qbRcNkWUdmIsSTM3jZZvUOJTMd2CZykG11LTCFzbXUE+etJ9cWkHTtOp7wti12UYb47bPt3bPkXUqyoC31nZHGuNY0OIfKbrW3KZ5RnHgaRPkQzcV6VR8+FMmPV5X1FXccgUy42mwI/j9YNmuoled+n5HTS/DJCWwEY9L6ZtvTlt1H8bfFCcbEbg2YprpLFmTv5gy04ZodRZ8zxr4jWJM2zSZZj2L2m2ZkBNQQW0fnRPFhKWMWnqx4Cg2o8n79P2WSck69ooU6+4llGvA8A2dJRYCwNuDi4soRtykJdblUDAnfeP+Mq9Y1XmDwEkgVy5laU1wa+CMkMKZiIYf0E5e845eGp0hC2QRC3fZna2n+1WvXhGaVQPJ6nBvtJ+YQy5AUHGUXI08fong7Z4B1oDSS7HlPvt+23ySY4Pw2kUzbaekjHTS/MOKWyWkbQO2povhiid6T1kKiVvvJjI3uT/G4ke8vb3n/d4UEERvCOTFcdKflpIet6NJEpg5Afr5f5gioqSZdq6gXU/moaHan+NlAlky8XxwrbTtkZpXo3+9Saju3pTAWDOlp05G+ET/t8ofVX8+1mcrmvSwFRJjZxPOTqdkgEdNa4cV13+hEV/cs5WmaA4SnQ/Wj4I9CaE=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dAJ/zL1x+LXvqbIX7aPNQTYoEY27nmkeRW0uiw4bwZCPywtEjJlnyZ6Q6kvtslqYyd/M0Orj8fb62+xpIsuhVuwfZGB8cJ4+r+Q3ScZu8Lab1KR6OiBS/15j1jr/iELEMdCXU83D61NO4HSULm9+F5tLUlx5O+epNEqrib2JlmrW/VSoeW4t8P6wsacEk2W1EJ2BPMS0sHHec3jcpua9KPj/AkTELPpSdrRTRO4EYcYcD65ZnApP4cvaoRhbMycmdAhS3pk+9s4ZNGpJ33xeY0Cf8bKfd++7cxGAxDwLZFrNdacGdLwCYQh/NvpAcolxUXhxsXa2D/cZIMlkr5MIzlj4+akgmk24/HoC6tN7DZ9aOP+qb+ddn0stz9c0W08gfTJPrOzs9iPVgrAmlLC1WKuuYQh375RGbxH1f9u8Xr9t5xgdvFiZ1rJ2cshLubLu
X-Exchange-RoutingPolicyChecked: 
	Xi7wUXOJCev48Wt+4CxIK42Y9FYG6ZksEnzWJalvBEnwDTQ22Se+8Wx9CzWT8mesWYJLN3Aj1X8a5nQPz25V7K8bzomzc0cxZJRLo3gflYxA5zRiLUP8/JrTZqAqydGH6aY6qtAMR7aT1QgSUTPbfsQz1ULenisjHoiPhOQZzuljWEhmNA1ZkH1/3NqvD64Nxgl+pkh08xqeMqx05YJfPggZF9bvDwDpRYyVMZObGkZ4UEo+q5ZjyzH5CQB0J+mC0+U6K4utWovCCEGKqSoI5UvKM1vSzmyT8zM1sD3vHwJSsDMwHafc7dcIGQAY7EHxzbaYUjO4b8TJOmHMjbymqA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 20:27:19.9229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5df249-7b08-45ca-cd6d-08defe3044dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5687
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDE1NyBTYWx0ZWRfX9vzGS6eH/SL9
 rUIM7kUFkpuSBRTS6sPw1qfhrC7BFrR8rgeVzqndHJ3TunUcmpQhBXKhc7I6eA42Cla+Al4t9dL
 Xb7B745R7lYatOKUQEN9WwgcQLzbIxg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDE1NyBTYWx0ZWRfX59JFJzawlVYr
 fdIIMZKnwWoqkqLnR5Uv7SAGco3VINFhySgJ9ZrHWFQYHT1i+ZKqFUAJi0E9dYpYzRdK1WCcBqN
 mgUQ5C7vWtT81u1WcYa4iKkDgh1JgvJldjS8nGQdKfAxb4cBDhIDHz/SbxTIWuLNezpWKbhxUph
 MsDKhrI0dlj099U5+4qe7eX7+PFgiQ7J4SsPkCkWd9vP6xxzXSR4Onnz1K57buccDi0zOV9oy80
 xhAyg8Xf+CMSE9VTuao1X3T+jEXb7RTrQ5wMZ/vcmKxchl1IpBPMfGZe4FqVp813/LMUa9zVS3r
 fw17H1OBu84sTDd62hpeI0P3zXOZ/b6mYgST1FAtfoIOce5mxloGvkbNyHUmnpBsBocbVS/e/63
 GhEgzSH1f+0vf921AnBDzyTtsrmPaxwm0Sre7+/W6LP1lrVMrCTNTsft771Lq216wjbBFL9fu/I
 yhbyMchITQhi08aE3sA==
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a8611ae cx=c_pps
 a=FTqHLmxhk7TnHmysD/QBZQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=nrBokKTXjNqfbvFcs3kA:9
X-Proofpoint-GUID: 4-okMfOGg91CUNUj2dt3t-WY5y4Mov1k
X-Proofpoint-ORIG-GUID: 4-okMfOGg91CUNUj2dt3t-WY5y4Mov1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_05,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190157
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Aug 2026 20:27:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20280

meta-ti / na / 20260819201830.2993277-1-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202608190946
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 19 Aug 2026 15:18:30 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9640a81c31726b0d3f48e99c208be84e7c994480

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202608190946
- Commit SHA: ef43a90c91d5a9754b2f28f09debd553fbc6a2d5

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
scarthgap - PASS
=====================
All checks passed




