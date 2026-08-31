Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BBAC61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 10:03:58 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26222.1788170629111673671
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 03:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KC6Xjee3;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=vmIvcGwT;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V80mtX614806;
	Mon, 31 Aug 2026 05:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jAMnCKT5glfEsiKAl7g2uFiRfe88+E7yAdmPOSC0j
	Wo=; b=KC6Xjee3DY5kNPa23l1rhxPga0wgHJIPe+p01QDphWb7aYIa7sV8+NqaH
	3BsfbrQ4vrVXVAQArE+kJ5+Xox+erjNUr38LeNIla2nyBTw2zDIZqM/Qp0xhlr4B
	6kHZ5h7XjNvSM93t/D9XVFAW2hxYCiYvHRMAQgbLNeHpTI9638rf7N63rKXn1IXJ
	7yp93Jpdi5bjs8FEWZkOWs8zt8j5ISul9pSXVFU1LDACDPjJA8iZIom9URVbRfgi
	kMrB6qtF92gTLy9AzO67CPPWQLGjX/O3oPOe6/7eMUSChJ2A855B5PapTQbUDw6Y
	Uedl/fXdDNkNs4B2Kk95s9exg7duA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010001.outbound.protection.outlook.com [52.101.193.1])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gcet453mq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 05:03:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKHZyRKFw1CZHYBpvotjhhUuySmIx3HsJpTmlQc4bgsZT0QwnlUnjSULHLcVjvWUrm9MaVVbJMHc7+dhJ98iszOKcIDriCeEpyTkin9GwQbcEMrRnmq1EkLP5GYhGDX3IzY1f3tz0m+bg3nmQm0dTpNODlU2PdSss+mrDLywzSE2kb4GlP37AbjqsAkj0vQReqbhmXSh+c0xg7hshcxw8EcoSfgBQpKqX1JyxrhriyNXcV2AYK9U7EZqH9gO1GeKWXvMgeC+NDLtzkWIHhWsgbU52EH9cPpEpt/gRxvkTgbcoR1UxALZWhL6nrQYjoFczgCvF2pRV/vRtz5wOd/Png==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAMnCKT5glfEsiKAl7g2uFiRfe88+E7yAdmPOSC0jWo=;
 b=AK6iAiZ0MEL1P/MChl93qmnbwFNDSNBcX65gxX53KKDWQmPmulO/5D88RRi2ZFqEnYKGcOzoQl5ljCI97W/wpwGaX+Qzu1Jp5M2mB6c/WfU74ZhNwEFUBDF3yYQZw5Qo84k43efzbWhgsb+DGNjrKjvpa31Vw3AnfYjdRvDEAjO4HeRkkVWgPsB0rKKQoYtf0yI7gIgcTUbB7M2Twu2zA5hL1pHLCoHiJUrU83W7kn4FRt/X/F2rPQ/+dqe2X9EHEnu3k1o3yl/FDAAwZTTbyoDUu7Y41EA5q2pof8mwmlK++wsZR1GvriTIex///AAU9dSwS4X+/KDufAjIQqDgVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAMnCKT5glfEsiKAl7g2uFiRfe88+E7yAdmPOSC0jWo=;
 b=vmIvcGwT2142Ymyv8frQ6X3vZ/xnJS1drA7dlWs88LWUxtCE/U3v09k8D6tZE1j0dhsjlhYO2gm+M6DzQRTj/qBeY4z2p6DtczRVu+6Rtje2q0YyHkQz+D8t9zPKtRA/vNmfLKnHOewnDxNyV1N3NmfH7OHYJe4Yjh3gEDl3XimNZGF7MTNOw5WRoDC3ExpfsxO7kCtoJfm7mdSvWKQtIyQhW/KMfdsQrVcSwWfwnNpOgJeh9qVPUHZoF21BiOX76v92+po6YBKXGKOUb180f+jxQFOrWfSUunP/6nzzuD2CmrMewRd2z6VtoWKGMDCMZ2pqsmJAnjfVtZVrfMISjQ==
Received: from SJ0PR05CA0119.namprd05.prod.outlook.com (2603:10b6:a03:334::34)
 by IA3PR10MB8396.namprd10.prod.outlook.com (2603:10b6:208:583::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 10:03:41 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::15) by SJ0PR05CA0119.outlook.office365.com
 (2603:10b6:a03:334::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Mon,
 31 Aug 2026 10:03:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 10:03:41 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 05:03:30 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 05:03:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 05:03:29 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VA3Tsv554810;
	Mon, 31 Aug 2026 05:03:29 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C59159ACF4; Mon, 31 Aug 2026 05:03:29 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>, <afd@ti.com>, <v-singh1@ti.com>, <p-deshmukh@ti.com>,
        <j-sahu@ti.com>, <c-shilwant@ti.com>, <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH v2] meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
Date: Mon, 31 Aug 2026 05:03:29 -0500
Message-ID: <20260831100329.3153368-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260831094438.2986368-1-p-bhagat@ti.com>
References: <20260831094438.2986368-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|IA3PR10MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: da4a9961-3832-4680-029a-08df074722ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|13003099007|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	hIWjgRUPNwCiwhCcsYXr3z0BMI0LwICS4eEehl7+icbMs1eS+LunH5w3ovb6YFDVYmHipV0bI4kjh/HrTSVuKlT4oohYDoEGmgKrOqdKju6qq0dWSlWDFUZ4dOTxZChQkQzXN+6I1/RhvmcrHdhIZb0WmJa7L4+CSAX/xKYZddNJp7HnXc5wX/NA6p8bxmLGaKbvT6wm/GbBWykk55+HRbXEmTSNj+tqfjOSZp+cX4bgOvgQTxI3gg/cQrYn9u2EikxtI3QeTrpdph/Rc5vW4NKz/g/1xqqOFl4cJPtXtZUora1hOBluIZxEvvYKbGz0IbO4XHy15PXiZMN9A/KfwhxtvRZfdgGOzCfefqT2GvxFFFzC4z6mG8mn670QMzEineNuKlyElqTsxqmXiEy+5VVOtHCFZAO1dmVjsNDAm1+poMfkmVmkDUJawHUFhHgmsvnkID0MIG4RbifFibErr1Ft0ITZreXU/3LPMGqYgCtjMKQ1fD+vhH+2j4ORXDjiKcmL3serfP2Ohogigd5v/AIZo54+EtbhWlYCfvD/WuDqnoeOnjX4ZVeVT2x+L0vRAb/tiHL13Oz110moriJG+RvFFVj4AOwujQLGlFabbc3tVHP1J2OpIZdTLQ3tpi8enOEENvBdkgf7CxvWAVLtFw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(13003099007)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4fm2L6WG7CZSZ6QtF8KrBrOwFnBZPoUOoYUaKrkiSNClOOC31FpXmfD19LOITSbvmfc7wab2viVrYT5GZWOupTVamiz20WltIC3r4TRytR6jilcyTzOurfrSA5aybMc6KTX3eelgVnTWyhPbs9n0QiJfmUgbGGSu5IZxmiiz4jSesPTYCVOI/ELUo4QW9TX+yu4B7Yn6Y/NfQFatigEjDYuAESyDN3YVTRLmoMAD85dcmo0CHOOqd6z+vetj1VPpdcOQ+nrb+D6CEgLV1bmrmpczslLuJJNVMt11o3qeFarr9laj/4FIdMLkeEGKpCS5I4tp0nDDe+aa+C0EsqT2c7xVGMWyb3ZYC3Y3nll5f9cEMD3I4hNGnG/02cSZ65lHVG2wZrKtg/5mgL1Q793edPvXl7PD2+uMcAEDO4rw7Rh+IRe55b9Oj/tBzzCiutWc
X-Exchange-RoutingPolicyChecked: 
	HXSAkFby6sfz8F3KIc2Io9QttLXsf4+2Iwjfm97npV6GB9bF7pSsNI8xw95G1p7+cbYfLpVvFy//fFaEY7CqAGgaajW7O86nOwoiebI0VvyXnM4wFAF11kLpWU6elawMZmuzhondOJyT8LYA1jzgY63G1Jak8t/QOy7XP41sl9kJZRVUaVJKDKupSo33NlveAJKiLeImVZaPzHNTkEkBgREa+EPlyoETYZJRxTywn9WKxpVxW2uYz9qFQ2SzeHy7wFKHEx8toWPB5lUGwAbvwpnm91uBa9AehT53w5TM6PoQmjGHY3v23vF+LmH6vxhoCh4BLcFaNhH1PlaaPwyMFQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 10:03:41.4384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da4a9961-3832-4680-029a-08df074722ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8396
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfXy9TPKjUnWuYf
 +r2+7wtleCX0xmowZi8i8rjCJXLYFjZRwlbpecDnqzs1rwN8T95jHayQoWs1F2QxRS6xQ0ON7Y2
 FjtrzDNyCjJtuFueXNnIvOlZ8YKN6nXG30VoZGbYFQo5poqBBYD1cdEDogzqLE7GOeR6/k3pRpp
 Bu/RyJ6ZSsPQg05aK3Z6ItD6K/DXjWSdQcHxf5/BNvnxMog65BEhBjskuFp89aPVHvA6DYMEvEu
 cGdw+d1vlxtONxV6sw2NrDf8+kvsPl4aIJPuvTd4cggXTBKj/Qpz4GRAS6/21lEOxOajMHcmr/W
 ukLRjrWzadbF5fHLN4Dq7MFFAJJ/k8zF4EYOW3ch+CsS3zCyP7qnuZzHx4HsqgIlwifwSBbOZVp
 /JXlmOet6u5qRtZhlIiJxJ2+HGtX7ci3AWYbilm2MsjxgHKEmysI8xiTOxRq1PgcS0iQl+JM6eu
 r9EZuS+eW06UiOZTRsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX0uApO6Cx/ZMZ
 rcXoBnieKMmujPDAGZEUmWdFDQI1FihTUyqxWdN1upkXppaBei77C1PdA8lC5ZYWqsY4DttkATG
 4NKkzx+bYh+WLjG9RxFIgVl6BR7vS5E=
X-Proofpoint-ORIG-GUID: H877BBbVDzajCop_XLw3-4Yg-FX9UIIh
X-Proofpoint-GUID: H877BBbVDzajCop_XLw3-4Yg-FX9UIIh
X-Authority-Analysis: v=2.4 cv=LrSiDHdc c=1 sm=1 tr=0 ts=6a955180 cx=c_pps
 a=DmgWn/vclFWqUiYYRim7xg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=urG6jNTBgjJyS8NQLEsA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 31 Aug 2026 10:03:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20316

meta-ti / na / 20260831094438.2986368-1-p-bhagat

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH v2] meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx.
              meta-ti-bsp (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v2] meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 31 Aug 2026 15:14:38 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 83ecedef6440dedf805cde0b499b2b033b4e9eac

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 4359f764bdd9c496fd7b4f2c1319bdc646a87b35

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v2] meta-ti-bsp: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 31 Aug 2026 15:14:38 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 83ecedef6440dedf805cde0b499b2b033b4e9eac

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-ti-staging-rt_6.18: Add ARM32 RT branch
- Commit SHA: d6f9a95ac6ae5b95c96294bb04e722f0d19ac960

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




