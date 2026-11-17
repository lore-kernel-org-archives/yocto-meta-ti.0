Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84.1794929002929026455
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Nov 2026 07:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=qQK+oOw9;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=oUr3MecL;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHEFgwL3869498;
	Tue, 17 Nov 2026 09:23:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5Ar3PNGiC8NJ4k+nqCZ+3gsHW4Cn4PLowvdaRRPYB
	L4=; b=qQK+oOw9uGyG6u7f+yfJ+La2CEm9pq11lXUTdcmg2qJ/8B6P9dkj5t8sO
	8yCumgsBjURQWQy1TA8DeA9m8bMGoq0exDxiNdfiXcb3sipDkN6ir8vWbTV9FZRe
	dQX1CWQFwR5j7emLHtXs1QBkINclqM9MXihmPttRoJ6XP752hu0YLMYDgbJf7trc
	s2+TgQ6BIGEf6LPCKnL/Kqk4t4xmV16EAosDGn5IXPAMDs9TK6seC0ihzqMACeoL
	eCYasM8TDzc/afH/c5CyKA3OemOu41dU8ZpvxKvtSAa8Ol1Yi8f2al+FfAzuxGyR
	ovU6dfMpdh9yyIJVz8IFH4Z09TThQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011046.outbound.protection.outlook.com [52.101.52.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j0cbjcn02-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 09:23:20 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M768dStEVDnaFwPQ8OSo9OEdX3KOoqnmVnrsX8rv2j1vR2WRqKz92Iq8EIY4xn6DcM2GZot10rGFyowHfqtoVxhezXpMgd2Y5feke9ImW6Vod+voGs0j24ELtBxQFgTj38rsWCuKtCvWaqRmXVObYYKe2IurYixx3f7J1n1pTeaFQ7HJFD2o1IgraPzFqA4+MvdFPN42sEZDRYB+ckAnnc2nKmI3rtrEquFzF1sUaFs28KsVc8v2GWPw6eBpLCXYdZzAQhYwAz6j0zpxr5JWVbQ6QiNqIgeY9Di6MaXKkFrbDGylUVy+hPIP1oDNu3kkjirCMk37palubyMzUB1q9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ar3PNGiC8NJ4k+nqCZ+3gsHW4Cn4PLowvdaRRPYBL4=;
 b=TYwjkWTSE2hFiYRmkJVawgMQx6Kyn69iQnjDM5MoxpfjYL3ydeH+cftx+f8yVsHoim9SWaDVmMFzeMf00XKcOoITuJMG2qdJm8YPBIqe+/ME+2fLao4DKnzBoGfMkbAWECPiNz6UMJr27KpAjkamYmtUmBznw1VvJDy2Ho1O8AvT2jBHdOfrLxmdXqaWBOSJ/mJXn/LTlvzZwMXOl/XALRB2PJWXMWrElTD/vAoPWaEqGz2WJNJP2LiIQQ4EHbZvEKLBQPp49z/tSiLC16ojDXJNVZSy9fEofZsedegU6HciE/QJHzoputVRsyXj/cF8o+hWt0ZCqB4gYZTs69Cz7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Ar3PNGiC8NJ4k+nqCZ+3gsHW4Cn4PLowvdaRRPYBL4=;
 b=oUr3MecLkawHMIyvTRdzU4fuA+JO+ycfQbaQUnGJziDDQbOmKg1I9yzwZcQTsgcajDzsKTMv09s3VbDZ6zdbW2qkHiGulYvyv0sPP8TfGfLB9AItQapgox3G2x+oW9DyiNA/MEQGmUyThH7gm2VdRZ8KpqtYoDkrFTAIWoy924KyIU1Nc5N+3ml6eE98midvPeqWlKLUsmwAhZv8eUWvNKPoR0vqppND56eEFQwnWuSW8bKJyjvvEZqWa7JbAXhTZxRn0KStYtYnr0eHV5QILHo7U6OWJF3+fTQ80y48o3I/5NvTXUaFNc6Bms8uqoBV/Jr/FMGKeILrmcWybMAfTw==
Received: from CH0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:610:b0::19)
 by DS5PR10MB714629.namprd10.prod.outlook.com (2603:10b6:8:47c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 15:23:19 +0000
Received: from MN1PEPF000793FF.namprd05.prod.outlook.com
 (2603:10b6:610:b0:cafe::3d) by CH0PR03CA0014.outlook.office365.com
 (2603:10b6:610:b0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Tue,
 17 Nov 2026 15:23:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF000793FF.mail.protection.outlook.com (10.167.249.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 15:23:18 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 09:22:50 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 09:22:50 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 17 Nov 2026 09:22:50 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AHFMoNU3018051;
	Tue, 17 Nov 2026 09:22:50 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 86ACF9A9C3; Tue, 17 Nov 2026 09:22:49 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] meta-ti-bsp: layer.conf: Add guard to fix yocto-check-layer
Date: Tue, 17 Nov 2026 09:22:49 -0600
Message-ID: <20261117152249.1854620-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261117150904.710778-1-reatmon@ti.com>
References: <20261117150904.710778-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FF:EE_|DS5PR10MB714629:EE_
X-MS-Office365-Filtering-Correlation-Id: 879f1542-555f-406e-c90e-08df44beb54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|261009223027099003|56012099006|261028144727099003|261026140227099003|261022105027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: yJdrv9vyVo6G2GvG1UdCNEQgH0FmzKqC5lnypLrTxRNSl4wJPV83zM7AwDqcO86/ZLXRCfybCU2qyVImCiRd7pQo2U2u93g6QJYOF9bjWT4PfTpL2q+LXC1BKHABlmj//7vzcW1lNr7b5F7hk8hxWMP/xN+PIoO2dTbWDqTAvsptUrnSjAoY4qRDGixy7dxVtgU7W0EaiOiHWk0Ca1f6M17j98v5nl+G7eQ+ENht87b/kAsPcCqp8VTrDhW2lHaoI6sfmKYin/mk7OMMYKModQON8nLj9Fy0cOhMDooNmZC+J39pwYd3+g7yLDWPl47i+tGlOffDrgJF8CiCTJiT4ZzyVxkNEr7X9PLj8/m7wX5dNaLoDflExrLoOJSpd/Mf89tZen6idmPUtXjUb7kYEKXohwpLAS5MShWA9RitH/flKOZjMUqwQlbuYM45uUQ78jNOSKq30uDfiTjLnMANNOjYFrzasCpVTp1b0ouAVhUrFUrD1e6FHCnf8daGMtKapRyVI493J8Z8ObytokWlyUoI+HD/+JSRm7KuQJo7wLbVOtwCDCVtw1nFhbtX77SndBEnsmBFIXfeb5uQaIlc3YlrrAi7xdbqHrJGrn5QWBjb7a/JDMidm1N/i9Um5ELJECQ51Q6P4Mrn2hePUffLcg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /Ee3p5ejqehj2fXl+CtGvqTmfhJqZr8Beos+S6D7PZ5Z8K2hfqhrLqNR1J9W45xO6vUcXtBM8tpK8FkSUGr8rDG7GIcxikJSeU/qq1l7sffYAiKy4Q5djlmZreYfF16wtGWFaXtjjWgGrsduTnEjhGVxjamHrHuLKxqNouhXu8qSw05Fw8XjPvHLhFQeL1vvr4sA4w2+O/ShJopO4iAr6t2+/WO6k2iaLTXKP0zvhKALd7C0xJj7qLPbOI0Lztd3/mbH/1bZHgFoJrh3eOLIrjpBoipDErjTw8ZpnUEMZTsdCXCueFyuDGTAhKk4PEIAhhqyg2ik8bkmVWNdKJ1aZ0/p/EfD/oK+0N0qKwiruomQYK4lQ6UKSRqi1nagAIpBKWQfBZOf7/6HASiO1hnHx5CoLljIJ2OsTGXKr/PIS2U8FqIxGZYx88FGbWv2lGn5
X-Exchange-RoutingPolicyChecked: gwkWXlFWjUj7GhGSflECiC5NXe4sKMo9uf5UrSRMagCsvmTyQe0h+88U6j1w9o2GZjSYPDkp/5lgCt3v9Tg+lRTGi7R1wi5dGN+4KTyDzT2gcshFUp9hFPGF5oVsdGgLKx3LWwV549qtj09HriC29bmGt/tjApLwdoiHTRqNyGe2g2BUnCq7vF++pMM6MHBasawryQzIC+E83sMSNVQINSP5H5BjWcwNX6r/zkpuKa67A3u0q6BN+bjdqXSBMRCuPEvpzqO1tT4vrS8zlMrm3TQp5zMp6hJPlhpcGZeqLKC8SybWqxAlUPuDf27xMyA4GBQLn7pB9yEbNA0XU4b7mQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:23:18.5057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 879f1542-555f-406e-c90e-08df44beb54e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF000793FF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PR10MB714629
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfXwgwV6tdgF+aZ
 JCiHvoUEn9alW4BvWSppXKt6YpJE1DnTWcyy7PBk6m+97BkzCk1FRrsxpRFERGRWoZOM7PYjIQ1
 sxbE+CQkHz4rvJ+xsigRZstkPY9nJw8UhhWxr423ICeh/s77PdU1XNao2wR6jxGuensBNpVMkTh
 oRi1nx1OwVhUP+BErZmsAOot0IBmGCJuAxMf91CQ5kjcxTsaP8H+bFwvLp2DULRxOreENmHHCMA
 fN/3bFetEeksNZ3DjQhm4kn3p7Ouhyzdymte3bcyV7FEQ/3zSn21xPGH6B3ZjHOshJaRHQd8EAC
 7VUGJH96gEa/SeYI76i+B9m3W7Crha7t8K2pRoaIj1//79cnQdPcxQjrTkJl/39auqIfBIf1pCO
 AD9xsl3E1f9P6ArYqOmgZ/iSWyz7fS6GYrP6Upg0qD9FArbENKmvPH9uKDLCkdiEX1PCmXHRejW
 4PLJIjvrhtk7XkoWsuw==
X-Proofpoint-GUID: UxZCgAcDVXjS9pLKIlTtySWzzMausNqF
X-Proofpoint-ORIG-GUID: UxZCgAcDVXjS9pLKIlTtySWzzMausNqF
X-Authority-Analysis: v=2.4 cv=F7fC5ahN c=1 sm=1 tr=0 ts=6afc7169 cx=c_pps
 a=bbY6CEmM+CWjO+hqT4zsvA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=QItF3yS3M_TzpeYzg74A:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX0h17rGSuvAid
 SKuH7HkDQaWRWl1mHKR8od+z8rX396rTbf2108yafVK6amMR0nuMzEAysKlCBwuLXV4s9TFfZm/
 ILjMDv//y5rb3vFoKqXyNm61ux+hJhU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170061
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Tue, 17 Nov 2026 15:23:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20556
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261117150904.710778-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] meta-ti-bsp: layer.conf: Add guard to fix yocto-check-layer
    WARN: Commit message should not include directory path to recipe: meta-ti-bsp: layer.conf: Add guard to fix yocto-check-layer.
              meta-ti-bsp (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] meta-ti-bsp: layer.conf: Add guard to fix yocto-check-layer
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Nov 2026 09:09:04 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: cdc38869d3fc7852f2f835bb61bbd62bccf8cca2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: ti-sgx-ddk-*: version bump to support wrynose
- Commit SHA: 4be6f0fe140682db9e50282dbbc66655b2a36ce6

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



