Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534FFCA9ED5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 06:11:39 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7668.1791785493847204569
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 11 Oct 2026 23:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nGCzg/Gd;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=cQCccopK;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69C55SoP675646;
	Mon, 12 Oct 2026 01:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EbPC7gPKnapST0NBWGnxmjagthl/sJu1dC+t5pKyG
	Sw=; b=nGCzg/Gd8HyVRbwoP2DLxCV7Zy54dd1ALF8hHxo5yYgslQBjSeOwjccIE
	AH+DuoYzhl3rADcFstyNmQbvAlIzeCifcgNKdwosvoIxh2ngS31uHJRL9/806yUl
	d7lOtqHpewudLDXEeeEeFwnsJ88dRsdxbtwu/wtcboPKkdnUQB3XgiyLbkaCjVzN
	p3AGe1GpJl30g6N2IFltS7P0U6VdrpW0X+w7Jiqm8LCzPEuU1qE+Htl6sYyS5g2C
	OmzlXh0KDNFR3S2GnV6+MyaYjp6ssh8ibLUWcvwGIT4LiJMpBfvu5/KTptlXMxai
	fSUdan0M7pl8nIDED3fbctH0KDsxQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h87an3ps4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 01:11:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fw7SXwZw9cXvsOZF/kIxIU5u5+gY2lKGpVDQRDwHS+sbfi7lPrbUUduk/LFD6gurOvBwGm39bcsTvJlIZ7Pj2U7FKoTeegZ9foorldyjASKp0i4Cs9M9nMGoklr3q9e4te7RdY4uq5FX2Lni5YAuEt+BPhMLrIAB4pRD5b4DtM7P0yz0C70o0wVSPhb6PchLchsWQSLsyx4jUAJwK4u36iBWOXY9t8qbfR6L0EJ3eAz3UZrq8pIYRHB1a3MjBk4A6mUhjRSbbUQdlY9/U2H0FC+WUjYRA6e3o+7I3Y7wEOl3mmli0IhbEVlrITctQy4620AuJ7yE6XzmbwUk2CB5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbPC7gPKnapST0NBWGnxmjagthl/sJu1dC+t5pKyGSw=;
 b=OKy/wlJn5LTeHPY97pmJB6sSf35gZ0ID43OosG+i/jt5VGbp2aNYrjTaU1SFPHgUY50awk6TxK5YDuVTkSRPOOLfo6CHqt97aGh2sJFIAfneyR+8iC7YZ0CBUVpQXQezR41SNA0ChtJrssyQs5ivvq1pPY4DogKZe6yOzwGVw3b1OA8H5xQU7y9l8lAdekG/kFT6sYJRiEMuXo9jlqiuCDqmInlfqgntUROAKWQQK18n5+EhK0E8cffsZkiF4YJXlZ8D08DnhCRb12p7xvdqlqNfjyH70oxjboL8KbMZzX1S51ItJSBVMrscN739Tf7xQKKuiWhobFrVqsVRaza/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbPC7gPKnapST0NBWGnxmjagthl/sJu1dC+t5pKyGSw=;
 b=cQCccopK+rW4fwAeqocnAqMNgpHzqUTiZ82dPMrlEloolCxZlGv5Lx9GbVEZmcCJm+/mAXzMv38JffNGB77dHQB4Rx0uaexeVXzu4o6fp2KuYRE3Dar7uMcMv709mquZhlHTbewynIWi55V/atj6/Inuc3yQh5/krvTCqZGY381p8qLQ6qhKDM6a1wHPCWx9nRAPRzj3t7GIqIE7YjoKA8n7GVNLC/qtQORotBrzwX5dKEwlz2/6ligi5A4OD4JNYuqQPpAzZQ37v3ulYouYfi6kwIGCSk9xcMKkCDQIHFYo5RWaSJtT6Mr0F8UZov0Ttp7RAale64+xHqjMPzvzcg==
Received: from PH8PR07CA0018.namprd07.prod.outlook.com (2603:10b6:510:2cd::15)
 by SJ0PR10MB4511.namprd10.prod.outlook.com (2603:10b6:a03:2de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 12 Oct
 2026 06:11:29 +0000
Received: from CY7PEPF000000EF.namprd04.prod.outlook.com
 (2603:10b6:510:2cd:cafe::5b) by PH8PR07CA0018.outlook.office365.com
 (2603:10b6:510:2cd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon,
 12 Oct 2026 06:11:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY7PEPF000000EF.mail.protection.outlook.com (10.167.247.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 06:11:28 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 01:11:06 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 01:11:06 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 12 Oct 2026 01:11:06 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69C6B6fJ3524650;
	Mon, 12 Oct 2026 01:11:06 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id E55832C92; Mon, 12 Oct 2026 01:11:05 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.10
Date: Mon, 12 Oct 2026 01:11:05 -0500
Message-ID: <20261012061105.2937577-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261012054756.1561142-1-lcpdbld@list.ti.com>
References: <20261012054756.1561142-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EF:EE_|SJ0PR10MB4511:EE_
X-MS-Office365-Filtering-Correlation-Id: bee0f469-4b99-42ab-2edc-08df2827a73b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|56012099006|18002099003|22082099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	cVrPZCzTgcb1xNhoLIRHPsfE9CTtFes8uwSo4rhiQcGQPUaH3i1h8PDGwifX9eqR8qklBYzpy3lRBQI7m7WbNrHbqEAIAVWIenWSlAi7HS2suO9bRGK8n9QHxnyzrqEwKOMNKgJnUc+KbdWWaFd//6VQ2qiLUWKcsrlieDU7vKo0dAk1xpB7MPMtXEXL64hUJ+mCdgqJKCX3uoMwaaoZI+bzO0aao/Y7WmWlL/kuLBpeMQZoca/vctQl01C2rrxpEoOO7VBBFmgKG+LtjyfygQOUZQA6hoYauZXvkVFtWJnVVg+Uig4t+U6xBu8q9TLaoHAa7UxO1MnxGOnXFaU4NKQpaEZfd7H4+B+fFnlTSvjnKTJpWVZSHwtGLQy8cu2p7vmWdpQGCoiKgtwCzjDBLv91hZbd3+5iRM5SdZhj1jYCcD24i6kqHjZT3m+zFpLESlizqdGR/YjF0cymn5aQLQgxQCSLErMAAoW8iG2zkViS7lCpCJ1hvLt9d/QSvafohsOl2oDj1x+gdADZx7SDkiHsbv/iPRFiorT8ZL8gtu1HOq4OGxrICh99YiozUcEKYDUww443G5Ro8qZHBNU9RgNHJdVz+MlY9OLoJ8UoPb+u9Be8UfUSTVM/tDEgav2unTNLKGJGtEO6wMonUbvFnCzvToug/FU2vrKENulJ5Sm80pAbRhE4f6hP7XJbF0cGMAyItlPBP/EYLRg3LDq8VQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(56012099006)(18002099003)(22082099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NwXWaw6xAEJupyhHHfgX5edWxlDm6PBOqtSTXvdzlNLIePrgdhkGINn3hhxd0CCz3IWPUHKUq9QqObamp2FHUqEkln3la5GRoHgzEx31whAzJ5QU6vDaSiqiuZ9gYNulTYBs6pBEZCqo1pjmbRSyUmwAjoUA3shi3c7wkXc0tegLO8tsuIFkEyfHmZ6Is1x5K6YRBuVOVf4HSwv7EVMUWjKw67ovlDELE33vvFDg3iU5Qk5hjpDTuChVQsWGPJYJbsetegcJ2zui3cNfuQcpHd2rEpRFBB5QFpigBFQeuRqJT/AuaDASs+jgFkjjtEEg+DRhy38nytOvpwFCpsaG4ePwh4YhqKnU8XlnVDiVlTT9XP0m/hdDxjT0iTnFkcA36a//ESziKcjU3FoGcIewOeecHAuJHfvu95oCOctyJkJGdhwBQWhLrmxWFBF/qLSz
X-Exchange-RoutingPolicyChecked: 
	K4YIAsuxjtYjz8IdO6gt2wJthp+4o8j06ADaHmGCPpHtr3h8xdpyISSIHneGF17Kw2CnCqIj0HZgGbTeFb3nnHaXdWukUVf2/wMkL94W1y8V1sLmIhDqCYFppel2NnA6sm6oo/Gm8QzZNiklgNB6Y3//JaJxBkHF7nSHEHTSNHLPtH5KLoY5XNJTfHZr0N3XncnoWzbdy+jCH2Jo3jy6Nhg2lJSsBCZRjH0nfaYbl2KNSqLEJ8r4mzHLC6AfKl8nq1kBwKfcCEbg9xlByO/gW+hczLQhcrxbTvofnXiCcw9faaKmniulHRV+Gcp8QiSKwDabEiX0zWWB0dIZSJ/p/Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 06:11:28.3439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bee0f469-4b99-42ab-2edc-08df2827a73b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY7PEPF000000EF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4511
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX0su67NK4DZnW
 mcGn0sK9atVUWVxsf+V19lJBXLSYSFz7cOqLi5qNe9kFdt8eV7YHAyHn+uuiySCaJWvyUXYI+R7
 V3rLh/zBv3NmI4lfpxvQF2VQlEmuB+s=
X-Authority-Analysis: v=2.4 cv=bPWDs/+Z c=1 sm=1 tr=0 ts=6acc7a13 cx=c_pps
 a=RzNzSA3Xhmsnv5027CV2rw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=Cvb1NxdP5Dqzaw-GtgwA:9
X-Proofpoint-GUID: M3jCagleAy4sOQfRzbwqwBV7a0QmjQuM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfXxQ3DrIGe+Xgx
 7k22clwUsmt0ymQ34U4aPK39D668OlcAo9HkiiP1feWufx0Mu1tji8Cp0dGD4a1oCYSXf7GkDkm
 JEuk7O9RJJ6vt2gVHdU5ybDZfrpftK8yL5p1adU4FHf4FH76fHOhviAiTowMq9B2rELFme4Qh+0
 5MJ9INRtY3Ru3R8dM9cZ8U5F2V5dP/CbV9GyQy4hYUw7+l+XFoZ4zgpWGoxhHJKzuS5qwDy99pk
 rV+Kn0e457B5i7Er8fVabSfBi0f1lFA2z5KnFVYgPQSEBjcGmPxlqVpvOsf9cqREjJigiM9S8cX
 F+jeoqwIXxfwXtD3w+EMWXJsx+c7fB4noNv1NYWChMXjb07VWpHQ9oeVrYxjf7JupxfGYodhEm6
 jxJU4pXcXlNnJHLrxyCgh1Or4vhFxV+XIGERz0Gb/6SomC4XcZXKtiHmf1h84+vZCLPPzvtfRPZ
 1q0YbfU9/5iKQxy9D3w==
X-Proofpoint-ORIG-GUID: M3jCagleAy4sOQfRzbwqwBV7a0QmjQuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120024
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Oct 2026 06:11:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20452

meta-ti / na / 20261012054756.1561142-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.10
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 12 Oct 2026 00:47:56 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 943ae21271f2c2dd065a52e57762a924da18070d

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




