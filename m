Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368D7C624DA
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:10:18 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12481.1788354615393778427
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 06:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nZFJz7O+;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=aNBo9iuA;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 682CUHFt2332315;
	Wed, 2 Sep 2026 08:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=OjcOj+pvvJnwwg+hc7NvMuXKgMFstYmemH4U1oUub
	ZI=; b=nZFJz7O+Dcw2kaIjRINrEUqWrmBpG/687SsmpjR4698MkzQfp5ZlR/nu+
	ty/8HOxA09enzSJVmA0/TTclSFgIxIZX9oYckys5WiR0vL/e379gk8rf+6j0CuyF
	758f64n0i/2XWVHVLiSATHwbN3zZyRbpsx3gVYAehg2wBl7MWHJTRMxF1louU4T7
	Hp0KQqHht71NqDZVvgsDnaF0qhlIh0PanD7/UAnJMfKH49Cncmk2wVkioRh41s/m
	79WK8Hz+3NyCpa7dKgoJji+kge8jDV5n7YmF/meAfKqd1nMP/bOuQMHfzC7I47Pl
	ITM0dTxtadfyQ3frt32FX1mJA6F+Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012040.outbound.protection.outlook.com [52.101.53.40])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ge7gqc7cf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 08:10:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbAXxOcAAb09gMJWj7Ld3S5dpxM5aD2OtxJCme3Chr1AhAoyIK8fQMWmurWpWKCtiy/9QV530rJUkQvldOnuDroIF7SGxrFSkXgCGqz4an9aiA70mjcIiuuN2FWtrWg1ajIBI+9x1OrhupYTuP3U9ayUql0wmvNdjHeQzfLoVuqAbl0dg+jqqk2DkOnrj6C4pZdrXH6sHcdE3dX/knGROXHxdxx9uwv6AoOuNUcJjtAefwnm3KkIddgK8TwH9US7rlfVoKE0DBQDHd2D4zBitkrnebJ4vMCFZ0QbzR8YxhfzqEM3keIZwQcC19avLTPS3i/toRbeKoT5zv9UdQNvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjcOj+pvvJnwwg+hc7NvMuXKgMFstYmemH4U1oUubZI=;
 b=POv3v3GrLLKjkkVm8vobTOg2Htd1cJUw2rCxpLuZOZcQEF/8lGQhFAwJm4zalm08I6Mf1KUMVsOxAuH1QT+MLahc2XY40ETFiEeg1P3cu+9Ew3IFH7RkMKl6tLSRj/FDCPtBVZVbkgQWyfzVsIFPpm1N9Fx34Fa+XdTFN1W3sM2HfDnp7ovetziA4Ye6bYUB/RyjjntZpL1oFw9wDgOrnuFjRtTnkDZpuX7AByMaf3DfaIFWJUrZ2PJc89g3C7zoH8hna+c8FqrOZ8Iyw7C739pNIqCnjOfMYoIPjc5YKZ7zb6hcUmN4BMgf8ctAvsFYuute1xLey8XOthiMtBHLHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjcOj+pvvJnwwg+hc7NvMuXKgMFstYmemH4U1oUubZI=;
 b=aNBo9iuANBD2O3HU5bUrBOa/IMRcu/H6VZj2oejiec57Mnjaio3cy4EfTxEjso2/L0Y84wQNZOy14tK1/M6eXF0qa8YGvzbvgJFMvFOrG4AioeuYfFh2/5Opi5NUnZy8ngRHdy+vpVJW4XNao1uqr1FLQiA/HR6MLKm9bY4MYUu6sR5UDidHie3055FIOP+KqO5xZovOO+85CnHRgvf7BApmoqikgNNN5oYsOecvyZNLVtpcQkl2FWGSoTRBrcMTenKw8NwB6/SD7NDBcvEk6lAKOnh8WTpSqsXESE6IDJLdfrbAXt8efQ5iubd/kh9N7rwCzcJ9dNNSrHl8sw1c/w==
Received: from MN2PR20CA0039.namprd20.prod.outlook.com (2603:10b6:208:235::8)
 by PH7PR10MB5770.namprd10.prod.outlook.com (2603:10b6:510:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 13:10:04 +0000
Received: from LV8PEPF0000005B.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::af) by MN2PR20CA0039.outlook.office365.com
 (2603:10b6:208:235::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 13:10:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 LV8PEPF0000005B.mail.protection.outlook.com (10.167.245.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:10:02 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:08:56 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 2 Sep
 2026 08:08:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 2 Sep 2026 08:08:56 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 682D8ucH3816275;
	Wed, 2 Sep 2026 08:08:56 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1C83E9A9C2; Wed,  2 Sep 2026 08:08:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202609011013
Date: Wed, 2 Sep 2026 08:08:56 -0500
Message-ID: <20260902130856.3564923-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260902124830.837257-1-lcpdbld@list.ti.com>
References: <20260902124830.837257-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005B:EE_|PH7PR10MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: b677774c-9bfc-48c2-ec4b-08df08f38023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Ot3/UUMAx1GXySuE0aOKrFBtKuHhRMdQ0De+9FIga/K7Z+aGj6MaqUQ/6OBTTWY9tZySSivL+jBW6j63k9iMb+vDd9odDUrvSf0EdAKpz6bopAUFdf1rUXday6uE8nZEOoN4FfH9Uyg+LPffH8L3NnteR3rPb3xBm8NUtEtId92CWf6gOE8jnVo9b5Rc/ONHvJ4iHqopoddxXgU/2JmbvlzsCj4RY9yTHASllX3vPaafJ/Z9pPfnWUQrVz3Splnr30wCxDNkLeKgShEua+NERvhtqQ7LzmuXpoJZ4lw67FadwqUOBPkIdZWV5F31gi37t1L+yxZAo8kcxjT2btb7h+LiM3m2C8E986x9EXhXqCAJVxD9r7ChSt3l1BDtlqhnkI+ldL3hpkMt54TN2RJw/mX35VTBg4wmrEQiWjS4BWIaaNW5MZ6xCIpADhHHOcNUHQjl8ScbtNYFWSqm98+k0ClRbNZDPADV41gq9rbVhGNGUAeB+h+j/pQb5BPwCVti9vO26icpfLEph04NKugMIs88WmLlyKSvXXH69BL3of5HIAu3R7SIza3LTBFbQ5I44UnNF/8Y5wupQNyORtDPJXbjaLUdinT/T5VmiB+hQU2RNZ8u1Kv3j35toQA5nN7C1dRGMdrZabxswr2GdGUVFvtsOo6g1Y4f0vtXtla5nlYEEW3AyHXEQzwgt8P5qqCtv7Dp3dgACB061ogu+9I9Vw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RSCMxVs6/KUKbt2woRi0laCQteSdWtXh0noBEoUCwljc0MOGqXPsn1bubAaI2KenQaMfQ0Su5+MvoYDBk11p5Xl65u2aImq+ZC3uL3WT7S3Acdqo/U/x1sSx1Mf4cdfTEkcNQi7JtMJcOVCHfNrZCwKyBWoQKE3C3axOzrz2VKr/CBghVolCELrPFlLaAuXifBWlLmwppW/CQF3ZdsaPGStBhWNp3Zzp1MW9WKzmI0OmOinLXBqMtmo3yznbszrBVf2bNs4h2srO/ZNGrRkWEuVaaKQ3DJU5G0ydJ1vByVkdZWPcc8V116U7g64gy0D1Xfyw0fdkwI2L8cE+eVKx788MPfXaqiEMdE75bWt9kJBX/sUbn1xLNascPSxhEjvHOOOIQ/ieKe9O5OiwcuEhFuqiPofu/NPPYp3RrzRcJm0Mxdq3FA8mPYkP25nb3v3Y
X-Exchange-RoutingPolicyChecked: 
	qfwMqEWUJAO+3bMOpnpM9LgTIqL3fPkWoOt1nJPJI6DryZHht+cVSmtKw7Xt2yftG7ylcJTu/FKCuHGJeaVlmQMzsNcz5tYExLmIgxGQgAVA8d+ZUk9ie/jspOymVGJ7cDlWdRqYaw6zotETG75FbFhv55/lkjnIhK1HE2FDCQLCKFHxMjLLzNkQtWx5kO13zVDmj1H5H/wWCDkpjTXFR0QmBie2dQDlGy2/IY/nhbujhCHnInKKV0vP2TUevh+tTVAOLNV0dq1YWsPj7h4V7rNStxqvli1xKGX3Be40pqxSoZyaqhPsI7b0ZhfX1VfcsT+6xkWN0x24ZzPh215hnA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:10:02.8696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b677774c-9bfc-48c2-ec4b-08df08f38023
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	LV8PEPF0000005B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5770
X-Authority-Analysis: v=2.4 cv=fZ6dDUQF c=1 sm=1 tr=0 ts=6a982035 cx=c_pps
 a=94FLU6K3oGZrB1XHaeOsDA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=ef_xxL1EtnS6UrlDfdMA:9
X-Proofpoint-GUID: 0jMACMENukzW786SgoG0Jo4aGtw4cw8c
X-Proofpoint-ORIG-GUID: 0jMACMENukzW786SgoG0Jo4aGtw4cw8c
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExNyBTYWx0ZWRfXzCQxXcJpl2Jc
 PE7sGALF9ZJj0Uda4OLKZ1eJ7ClmnP8bN67W9jlog3GUhGpY9vXjo/x+4blCi0ClhxBUwaPvsl4
 GLdd9HB7U5Yo4ZA7WeM3FYIAmT04xQo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExNyBTYWx0ZWRfXwnZX/umURBCH
 triPR2q0rCec7PYcWoqeEu0X7eT5rhLgl4B5XD4DpZytkOueW6OpZSt6uguf09uxJWD95FsWIU0
 ylMRyYnpUq60U8kZey30JcWMt16DiW3DEU0VyMGzopF1gQSMM1/SSbcby42ofZx7UIYzVUBeRH/
 wRZIa7K6t0RnKiVmG4wkohBOeXMkHfLziTmVtOLa9SLcI4Tcy5VRFmrIY3eeRe3OjXB0zfL3tLL
 J8/IB4mFImapR+kAQwCD/xgsJ4rUGlRKat+Hi/RpaChUGjiP7+viBIdiwjJoQ3LT43bKz4DYu5d
 07JQnNTZEOyWbK5vLwaFACEfPt+iK07cP45CLsowzVWcmaLPT4DDlpxuIz3inIJGvpNzMk11y/3
 p2mltD49B7Eq/RgT82G28eGcEn79ZkymXB3NrA10Euq3fvDyI5p/uZmWr+BmRhGSIRJi/Wryprn
 JQg55UIU1YaHkh9RH8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020117
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 02 Sep 2026 13:10:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20323

meta-ti / na / 20260902124830.837257-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202609011013
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 2 Sep 2026 07:48:30 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b9c0ec9dbcd2d2d07a51ff0f313ac614db4a2adb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 4359f764bdd9c496fd7b4f2c1319bdc646a87b35

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




