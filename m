Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC212C4453E
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 23:24:21 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12809.1784762658803740759
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 16:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=iDRIczeC;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=AO8iU8Sr;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66MHnJ7x2309832;
	Wed, 22 Jul 2026 18:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=thBflB0uz9f9uFep2aEmESZmHh8uKKNHw7vN/hwTY
	OE=; b=iDRIczeC8Nd4yyrgPPZTSgLIq9dhhvjBsAASissUvyAmZRRw8B/lsaCuM
	5VH7C4TRXo70ZcWvw/BaKIhV3aTyHSbFuQhu95EvL3++2FzXIx1zu4KbESjWu9Ng
	5vOuILYmgNccAno6bAFkuYsBI3hp+5CoV8FRlb2VhWGV+X+DkmuxBMp+obWwlEzk
	EfNvvY1/wsqhVQQW5b0256KncacAbEmNrXU1IKIpOYQsw+fEe88EpyTnW39jAPCB
	4gQ2QvwemD4682DlGHFNYQQOxk2YcKPgh3giEa92yXzWlqDnbPTyts8nl1fO1Y6r
	xjeIaqgYzlrZjDEfZfkNLkzb3fqtQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fjw4jkskq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 18:24:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWTdi1NAMWzWoAh4fQjgu5jYWkhTacLzr7smc/I/UULfi5+Ko9z47CQTf+tFrrl0uuACr5XiOIPH6u58qAVU6CnB1QOrP9qxY47R7pd09oFUmRHLPwpsGRKltsf7Z4x4FurEw/TG2SvfKrVb6Tx9WJXeLqxxljWAThjpTL85NwaGhZaPjGMZudWK3jUPFpPAOi5qqW5WCXYff6lGBS5OYq6ni2dZNcZ+kglM8AEGfy9J4VQmxw/gBSEfSZBncBiIoM3BO7FHThNSICHxVvzES07TeNKek8VrK5yEg83Aes3gjNMlhV4XrT1+GZPhMPZnreSum9Cvw8tLUi/fxzIuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thBflB0uz9f9uFep2aEmESZmHh8uKKNHw7vN/hwTYOE=;
 b=TgswTHd8BzYMmlZUnlKgBpmXyN+9gRZnteHoPiztaH40ITyqrpcXFXyjNZGSUFuRMPvBpgLU/uKHO8GrVgFW+XbMzrXLkAznIKXQAS0HG/gj1VkBXtBmA42ZfL4fGJ+3ruHwCRf7L8/snPVH7Q497Y0Cv/NoKBIUOGBNJAjnmC4cBpUphjHgyB9k2lJYlQvldabT5TdyHENMR0UfnBaQL5KUNvIgY6a2i55p4Ge0OGOYxpi0aauHep+BhVDy/ZEDMsafU4weQcgp7Edobjm2W62qYIyHXVAPatO844OPMHymr3sBKNqPTkVuskRPe769BV30o8zjEsWsc69dF0/W+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thBflB0uz9f9uFep2aEmESZmHh8uKKNHw7vN/hwTYOE=;
 b=AO8iU8SroB314waFfBIUEHLUmIRd3J+xEIxMTehJhN2fuikqO4rhYR9ug7Giw9B/7GyNx6C+pnhtZGjYlOnxzkCOgcZ7lxG2kpF7/KxNDxMmxHneKkGAcaXRflNn3PhCIu6yh2rxMaA9BEKyGO3Syj7qwrJCzY04uOOFvcd/m+E7cAQRz2S5ocC7OFBsHdiNv+cupsZ90REGr2tfnX2ZBCX5X0iNdgxYfDmqIKlqI+Ce2EVgOnkN4EPa/5kWqMsW6U01M0iHkHLLg6sPaKfSImmga2XSfWOwtmSuWvXuivkMgKPz2HFU5t78W9BqIQwy7S6NjMhGbVhocvfU/iQd6A==
Received: from SJ0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:a03:39e::16)
 by MW4PR10MB5776.namprd10.prod.outlook.com (2603:10b6:303:180::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 23:24:13 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::ad) by SJ0PR03CA0281.outlook.office365.com
 (2603:10b6:a03:39e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 23:24:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 23:24:13 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 18:24:12 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 18:24:12 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 22 Jul 2026 18:24:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66MNOC9U419481;
	Wed, 22 Jul 2026 18:24:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0B50A9ACF4; Wed, 22 Jul 2026 18:24:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202607220920
Date: Wed, 22 Jul 2026 18:24:11 -0500
Message-ID: <20260722232411.3062602-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260722225841.2359355-1-lcpdbld@list.ti.com>
References: <20260722225841.2359355-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|MW4PR10MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a8836a1-2938-42f1-47df-08dee8485739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	HgRUIc47p4YYkqVn8gSmtzXLPQ0/dLYnQIhPSduQRjrrWS6wt6JqWG227RmCSK1AdTfWA+2nDmQ+uSfeBxUJIl59//+mEcwZopx6KexNf0J8J4dOMEp4GH/IQJurYZwNHuY55L/ggVkDDMONOkjdJEuCQ038fQDWwTQVYCrsz1XwBtMnW79A8VdSFAOvWD1jBiy34w40eEm7Tfh1jF4PBTxaiidPGgpmmXn4GY9cTPhNzlmOXB/qlc6JGpe6Eo1IMobr32xZHUVdo/5uffYa2KovD73IEeSCHzSq4/PA6wwf3sCUUNlxY+2TpcnqJMjX7QsUQbaBwdUOXMHX5msM52ijdrl/uXkHXAXpVHgrkm/++/HI3E9eu4fRlROmiSolkJ0nKcMMmihqdjXBNlvkq9CY/5VyR4LCQON5TVcL4N8x0CDTTx7B3ie4YR4kJPg7DdGgevCerQ1586s43CeXUHvkMy0l6ky6eRwXoy95HRtPuGlB7TzCite0JluhfDUrDqH2bsUV8nEQVBtAEN0M+PNwjK6+vpIcdRi0SuwUcVf384d74TFPHBz2wtP2v8CqrJT+9vtkNmgEwpya4kygDC0OmxWy4IEpFnYktv5vYRlXKqCaIqgSaXO/YcTWaTK9l+rVmN5Ebnmm2tn9WB2k+ZVXf9exA/A9XRN6zsGfq4Y4VLyLVXSMpXhUknLoDyPq
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kb9Go1temvykc3A9FMjlqECf2bzAtIX8L6WA6q8gqXvVM0D2MXoDHKQ97hitDWZnHIw5PtfP86AbOPwNbR8QqYAry6Bi4cDD/9aGcsLt3aFFWZ5+YvQs9oYPpVcWVCd80cX8594gE3NYAJ8/vuZz0dWV6GGwS/JeV1Po5UW4OswmeoskCjyoyxRn+eUgScllm9UwGMB6ZUUjFy/8jwl2ygOJ5Ft1f1OOaNRWHd08msXY5+6JVxIktThtiHzecjGRwaYP2NylZKycaBEvAI7yOUZMi4TThaTZv04cStq56c2vQdQq2+oClHl/xc0R9s59XnHMp4sLhJSGBooFBSbqqQlYA+5huiWSn8pGr/rWsu3r6E956bmZLch4tecCGM8v7IM9h1WhDnUrvT/zaRVKJM7BIE8w4Kre8Yqoq2DfutTKzeIBmghicvI1NRjjhh21
X-Exchange-RoutingPolicyChecked: 
	ouwE2WRxFT4zfNMSeA9T5IPwwY37ubuZivLXJvubfoRJRWXjV4zy+fQuW06cafGzJil2UyznhToIViJa+vZ54H61UpQLzNP8bnLqBqYHrgNCCvMQikMUicnFT63xjkI15YttkcbEtkifoMjMvzuHlws+APD1QLFPGYZKvq7WCVK/V+8kSmgLcgR/XyuAn5lM8OSOyhnX5ESOrUwM6PprTDmBXvxiFgKeJs9JpaGCzgOxwPM6urqsf80AMeD2Of2ZgQVRhQoyi9fD8eNtPtnyi7EeXGc0Ge3C49pYfW2oF6/MLtAzA19l9yIhOLwCKFcuXF0k4dN9JiN8TGHGOSu3fQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 23:24:13.0457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8836a1-2938-42f1-47df-08dee8485739
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5776
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMSBTYWx0ZWRfX0r/soTurrD0k
 VhXd+oZA1SUJlfbrpqCpG2sOkShGNXNalcQGDN4HBkPUdpIa7XwFyFgHYUP9CUcqbERuxMYpxLX
 LFQli5X5/SN6S2dm3Z8TfZ6P8xvovqo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMSBTYWx0ZWRfXz/I78KbqKj4D
 i8TQDBVmcihsGjotIdUNRpU4b92q6pww582HU37RBzGoBpj3WTuaZjAQ0beIYvRYLl4iKs5/0Bk
 KEPLmUdeJRffVEJGj6FopBFRoec7QSVsLuNFEodcPsTbYvWMwSpmydDuNnuxd/dWgRCGs+Mnj5u
 lmLMU7reFT0Q50B+YAMo6hkcWaGyzeJnmkoKn/ce25pSxATgi1Xf9pkx8/MFbw50bbU2Xp/TTSH
 uZrxgk0WBlPozSE1xn9ri366/4+ISveRgO54mRx6NeJR7qmIhgW5mP2kG2PjWvYuAp/+T+kcT1o
 kYhO2y6tqjOREqEMM6CrkC0uPLvt+XBkUP8BwJR7kiIRxW5OhI6wiOc4er0kXdohBIQmK78KwD1
 v0T7sgahvrjH6MCc/bDClijKz6aLHGH4M0EBQB4apYDkm7HqhEIosrB4JyUB7C7oz8dWD9HL9iR
 GBqXkU+N0jua0r3xfTA==
X-Proofpoint-GUID: XxJR1MRe8hb_lKTXbW2QqcThayBmAYmX
X-Authority-Analysis: v=2.4 cv=ONwXGyaB c=1 sm=1 tr=0 ts=6a615121 cx=c_pps
 a=VUNJaWZlx74G+l0QYBOIDQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=ef_xxL1EtnS6UrlDfdMA:9
X-Proofpoint-ORIG-GUID: XxJR1MRe8hb_lKTXbW2QqcThayBmAYmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220231
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Jul 2026 23:24:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20188

meta-ti / na / 20260722225841.2359355-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202607220920
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 22 Jul 2026 17:58:41 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9e5f20701d00c40b9720e6a395e83ffbf349c6d6

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: f7bb41bca2b7adbe56255abeeccd80fc6cd9fbd9

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




