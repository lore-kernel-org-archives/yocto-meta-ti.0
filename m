Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB7CCA5FCE
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 00:01:51 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.957.1790899307644660123
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 17:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NneQHzk+;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=rzZeQpdK;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 691NFke52972278;
	Thu, 1 Oct 2026 19:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CkJtIl07CfO4aCuGWHN5IxhJP2u+JmzQOZZx93CHa
	qk=; b=NneQHzk+EgSFne17OkF9I0xCq9+IKlnxklbP3rIDCvS+lPVA7tXXG23h4
	eyZowqR7BG5d3e+Slfrnd/3Ni8mMC3u/75l6JGAgDIxMW6v9YcEBzqUNGl3ejCNZ
	9y5PYZbSQ48Pd8Kcjrce1vSQ5sfaGq71UGHTSYXJ9snMOsZpp72BnC1zLwl4Q7Rx
	4uHy89J+VUi3xs4ESln3+7oaIpkCqR/34OSau31XgPB4Hdq5P5w5BTVc0G1X9ibe
	HH3gyR/QehbMU9gD5aTCLJ2n62BNS0yHEvyfxG/z6ELO7D9xceDTazskWNtMz/6N
	DqzoXQZc3A1o9z7uNvoo4GD9L3kAg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011029.outbound.protection.outlook.com [52.101.62.29])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h1kqynpfk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 19:01:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4IIhY0bXQGveA/yc6nIdpfZopIJiOZH518NTdqiLpb7CrHQr3PWiM2CzI0CRMiOQX8Xc4X8BtSmsSLtybMxXNvekXyhQzF7CIzrRe7NFMwEijhDEYFl6KS+buHRenpl+yOWqlxDk/0m1uOI/Z6lmOBZ5eIgsJrKyhFCRlmCgU1JMb/NUfU+XMYXWsNsAJncb8c393ECNUoZZL7XZ3YjATDcmdvoTz2GNpTSNtS4z3z6Ak+ufj74rxfv5IDV6o8EYlo9okNb9aHhCjKSkmwhXWdI0DvTnR89qN1mUozQ71bvvG2pTvEYfSaNH5v84UTYltIrNP/K/rsG45IcQAYWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkJtIl07CfO4aCuGWHN5IxhJP2u+JmzQOZZx93CHaqk=;
 b=qijFoJGQChpSTQ/3EXu+UdD/t01amqmU3GJ+8ex4JgiNS9ydozzgtbrfxCd6M6MSIE5DIt9lOm8R4b98bWKhcIZ26Kc0NbNsT0KHH8SuPMbMxdZ2vaSB0L6dP4OT30i12/0rN/ZPERkLVIU7yQ1/7mxI8/jxY0BvXuFS0pgsyQp8j/BoO/1Hm8EQu92bfhDbhWEcvNpldeCiCMg2iU6GvLjBozh+VSq6IiYqDzYhxQHR+Vft9+gwcIJIZOloXvifE3JTGUfLCqyAHhPtOXIOhze0hCAUF1IAxw2/PuXT31cFNRMxxd7XOM/TXf5DG4nqwp5qxoCrZDV1Uyo8Lh6r3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkJtIl07CfO4aCuGWHN5IxhJP2u+JmzQOZZx93CHaqk=;
 b=rzZeQpdKMNHsFW7rOvfqbsOrkdTw7CNA8LnqQpEcb9VE1ZoaeaV26qitQyv0OyIt0dhOvdVjxQ30N62eQbDB8MlpweoVlmkFV2iAshgl/GD9BbpCwXbS2lKEAIgifu6hqeAaAJKjJty9HDBo70U8Vr/YuBbYvh1Y58oUTbke/52Uh8Pi8Ij+Ph2mqMBCraFDcwuRcYdk4e6/rff714MQU1rbkYE62qio7wgw+1lW0NDID0ICTvJbn84YqW84kG38qfHHhJ5fKR1LwobQpFnv7EE5B3JphG0s62nQ9UADmvMQlZomX4FkTDKnaHQOrQTjyy/JuW1FxuI/wK70IndnAA==
Received: from BN0PR02CA0003.namprd02.prod.outlook.com (2603:10b6:408:e4::8)
 by PH7PR10MB6154.namprd10.prod.outlook.com (2603:10b6:510:1f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.9; Fri, 2 Oct 2026
 00:01:28 +0000
Received: from BN1PEPF0001854B.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::90) by BN0PR02CA0003.outlook.office365.com
 (2603:10b6:408:e4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Fri, 2
 Oct 2026 00:01:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0001854B.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 00:01:27 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 19:00:58 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 19:00:58 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 19:00:58 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69200vV03449361;
	Thu, 1 Oct 2026 19:00:57 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 49D5D9ADAD; Thu,  1 Oct 2026 19:00:57 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202610011545
Date: Thu, 1 Oct 2026 19:00:57 -0500
Message-ID: <20261002000057.3801555-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261001234414.3295046-1-lcpdbld@list.ti.com>
References: <20261001234414.3295046-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001854B:EE_|PH7PR10MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e7ec65-cadf-447b-4d29-08df20184ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	HtlspfMmXHWQWqLNv9DPqROilItczGxZrLnrXRlSUw1YXWUjwTKeCYuPewMJt0Thi5VvAAWpXjGs/sW15APMTVkt8fy1BR4LMhAw7R5zc1FzBvTwXivSxlvfFG9MYhwvz8x4w3g6Jkod8oOQoUjHGcKyVYFWMI3uaXom6/S6vAAeNxe91sydlTQJUKYoDtOhjG7fKBoxNodEMTX2nx0RqVQukChdq2++hr4MgFSVscqd+ZPt6wSvBh5pfFaoVknDHmy0oPMVwLec/BcOPRnRVEFd6FRmeeLfjutBruiL9uLnX0t9Q7j4Z6KaWWCyus6i6iJ0VMYymQzCleQwIpUN6hMBXYV0HcNzpxnNjazUeKdK+h+5mMWwgpD5qYb/qGBxWlf5mgfiAbkvlmKJLulX0nl8lyfEGJUSP09JF/1Sv/ZUlZr5mfSCqszy9oZIRTvHg/khC+U2pKiWLRBVkovmDyjSctrlSAdrOJ9f1yAq1OJFuG2CP8GBFa0vXlIwXQrkfzpHM7UjXyjC9trMcaR4o8yXLmHdST2JQW34/tfsu253R206ua++qJwBiV4Wb/qF99B40dWsEzBKuBSRsuA2FFsUwJAb2ThxngjXjxbIcvPAtbm2yUN3jZ48koV32xbjte+M7rxsTryaRPI+V7+smyMneXoKm0yVhIP1FaflYdlkLELcJR1YYtPdE+qHUBOq5T8ieBkG1M41jnH5trRhFg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	A9vwOTaUlUCWT6cZc9FutKQyrXIYxEkzusg0bCKotwkzTn6XGASlmx7JrP7o82dYG9HdICZ/TUAO8BzK5k4jId/vyJ57tjMUQz0L4+ZYFcWy6jRtfkMaIwhhhbYwBgKFRtIy8/X/pn+DUk4OK2MWCVwcX9sqlqbCNyAzus5445/O6oWZ+LjRA/SQaqv7n3ILbJaJIAX+GW8y3A4u7rEoZ/HrNQimY8WTcqfED0nzgWn8Eo8ColA3cXRimVd/c7DKsap6n9LBu2rjkig8UPgn+jU7IQSO757iv5StpLOTQawKDcwWH/UawOMUcuTs4960MeZ5WaFuTPW+dsNUmNHA0uhIB1CII8gzo5cHyyD09WOdAVK5DlT5uY6412EfZ1ZoJvFp/yW1bSS0GKgpeoeN8TtHedi/oRC9B3SakRw0jCqVysqAVyhtzRN+FpjbL6RM
X-Exchange-RoutingPolicyChecked: 
	4bcv08cGEy/6OAbmUbzttJnJLWCdVNHeYMSld+aq9M8ogruLwAwg3LZIJ8dDkHa1Fa+iXzOacgVQ7DYFDi41AXBPm2leh34bosIjrkc4G9mJ1tzw9YQlPbOUo7nYEdIyFlb7PwD+OELleaXCl0Pay6lhXDhsioovIS1Ydhh/NMpYgjCRNzMmE7nj9foDbsIA8bwsCFg7UCogs4ErRReIc9if1WpkbUkSLyeRLV8hjibuW+zh2qvZkLKn73YDgEoVbJNr65VP2VRxCjkAEqQYysz1n/2sHUCyI1OPEgkBoOqBPBtmfVV5Sfu3KSjEmOcrV87hEmbsR4LPjx8r3xyCsA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 00:01:27.9642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e7ec65-cadf-447b-4d29-08df20184ea8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0001854B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6154
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA5NSBTYWx0ZWRfXz8o6XwBb9gnB
 vhNmkZf1LuGVG0mk0haNyY6AqLK7ROXwPuK5eJ1b6bT3Yf0Rwg4YMSTrl4vwvpYLbPHvSonGP/f
 XHUcvn32SGJZ9FaQ7181BOwF1F3Ahbo=
X-Authority-Analysis: v=2.4 cv=a6alZkSF c=1 sm=1 tr=0 ts=6abef46a cx=c_pps
 a=KPt2yGXPmw0TDFl7M7pFkw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=eE9ZshYBlA_HZQ0kPdEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA5NSBTYWx0ZWRfX9sCgBDtWEfMs
 +7yXtI25a+If8qIuD8riGgN5rPw0ja8wyVRX1NFHHqdvwkfujhuhLhb+nfwCKRUY9uiPXbmpyXj
 P2pSxX4PYVG7OHNoWNs+0dqSFt1ikSCAYNuKsN4+/Ay1HlHvE6dciWt1QgyMo5lKEQDFSyJaE78
 2q5o9G3KEGN6URmRc/jeF5MYfx6nqcr4/YrIBMEV8jlVdn49D5khXitxqUHsAsfsIEefl0OTRmu
 G/F5Zod/AjWkjBC04TQiG6sUkv//4lt9OjEq934/lgqmt+6b5iqBVGX/jeGgEIukhVyOGCsoZ/C
 oL3ogkHGesU7TYeLUECsvBRN2gdmhVPKevFkp6UWTC+dvP98OPo7aAJTCS/Ib9fQBvdrjPRPAUN
 tje5VItAbX/2FW/5wZakbzLs5VWxQDmzb98vzZVt4fFUpvovt+zW2BAM5KR6mk4rKZYD6GoQt+j
 TAvsq6zl1BcYndqDfUA==
X-Proofpoint-ORIG-GUID: 5_TnwPagNQmmIxqJE-zm5ul8wCQqtqc3
X-Proofpoint-GUID: 5_TnwPagNQmmIxqJE-zm5ul8wCQqtqc3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010095
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Oct 2026 00:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20431

meta-ti / na / 20261001234414.3295046-1-lcpdbld

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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202610011545
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 1 Oct 2026 18:44:14 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: adb57a01431e156286967c85f24b0ffce53fa366

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
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




