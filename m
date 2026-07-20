Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7C2C4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 22:18:00 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9965.1784585877457427014
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 15:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=adyyWRbQ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=xYqVk39J;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66KJQE5G1099095;
	Mon, 20 Jul 2026 17:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=f9VKuLhsUu8MXZr03uhC+KovT5ESJx0eZ0KRm04no
	TE=; b=adyyWRbQRMht1giWewC4ZZl6eMb8qMZYqhd8MaeuyOw5F7eBdCYWI1c1T
	6d4EfVA1mdIxq2XCmomyLA6qKhaOWsdisjwNbi5H/CqNFe/PTgMmwRuWfH0GpAvI
	Xksjwk/Dh5KovqT4BuyR6bHK/TOJp708e3uQitpbDIC3vmDsSC+trpyj2kLwLh0h
	farmwz8PLvgG6uWzrmBqBUbkUylcjFiH8J7LD+q1L5offFn2btX45o5+vZbnaCkB
	KNj79/e1wUhcddY41I46FR2EF1H4qRspawUGW8w/VUVzqrQec6ZV/5JUMCu+XlEd
	aKKKE7R7XV6dA299/ZainGsyeavWQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010053.outbound.protection.outlook.com [52.101.201.53])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fhk0y3ydh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 17:17:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRXPW40paI2U02PAQuz4zXLnmNKFqGJ4Gx+zSDQUc+cvWvV/jTo/dvflheffNQ1jmYn1O66w7jfQs9LUMTJHZDCIXS2SPxjOcfZ6N8BEGriS7mFpVUrMzyLngzKn0cOib3Q/6uqqtJx2scc7+GjdTmFkqGyF7Sk3Gj4rCSFd5fuDEfCm6CpUf0zzJc5HKdEQpl9vMZ0XyX0ts7dLxdyqB7evOuWefcbuiN3eCd4mDI3CmlhdD3IkL2P/JAYYugNOQuznMJkKQdZiXPQTMySWqtZPvL1Y29lgS/1Pmguo78ZQQK+Jbj4A/s8uk4S08ZP3k3VHqKJ6XnIiIKGyeuCH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9VKuLhsUu8MXZr03uhC+KovT5ESJx0eZ0KRm04noTE=;
 b=Nfzydi8hCU4+bd918fsGbtwC+m4aYKypFoQXYPM9AUpyD+b6ngisFV6KLUwf0I1IQ6A0XW92KN4OxmV0/WCWnWmXcxtAF4ibiVnaWhVK9Ri1GlTUmvVY+nydenpNpCSc2PquVRfuATDKgi1g6Xz/01/J8u2HCKv5bZ9WeLXQEiQtYWX+vLQGCJKHBd7iFOp6TkQolex/5P+1YdNDKypeJJp+CeT4VKrs2fEbtWs1SU6IjuXLyfKYMHLwOkpzsnPDJtwfviddVlQrk+A53u5t6+2nEj2qSEyoUs1k0y/w8In+BvmQdBTm8tnnAHjnu0Vfah6/+tvNWMCc8GIuiPPRlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9VKuLhsUu8MXZr03uhC+KovT5ESJx0eZ0KRm04noTE=;
 b=xYqVk39JoP4BFXyxuWhiubaJc+cMziNWwXUjVStJjmiGn/GdpDrKzYDatnwTsvXcCfvN5QZAXskNEQCbjz4ogyrkDbam6Tb1vn0raE68EunrQ81zw8wE+akYwAVZ96slfXWNnGYfBxC9sbC358HZWm8b/zblzeBUE1sJ4FYS4yVavjWEJiqX8wajYCKZEOtbZy8lpW78th+ix5RE7u10fJ75qEurVi/wGMNzPyL8F2AdxgjkPWwhQtsOmDffyWIj87bLIsNlFFFeqwJp0KIoqtTZG0TgT/pVjOSANigSRC5kkkWsBo+3ChhTeOm15P9Jbe7aduuMpolMlnjwl4r7nw==
Received: from BN0PR02CA0031.namprd02.prod.outlook.com (2603:10b6:408:e5::6)
 by SN7PR10MB7073.namprd10.prod.outlook.com (2603:10b6:806:34e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 22:17:54 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:e5:cafe::79) by BN0PR02CA0031.outlook.office365.com
 (2603:10b6:408:e5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 22:17:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Mon, 20 Jul 2026 22:17:53 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 17:17:53 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 17:17:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 17:17:53 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66KMHrI83404040;
	Mon, 20 Jul 2026 17:17:53 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0AAF72A53; Mon, 20 Jul 2026 17:17:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-ti][master][PATCH] ti-bsp: ti-img-encode-decode: Update SRCREV
Date: Mon, 20 Jul 2026 17:17:53 -0500
Message-ID: <20260720221753.3848875-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260720215920.663363-1-b-brnich@ti.com>
References: <20260720215920.663363-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|SN7PR10MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: d723335e-6f04-4aac-a293-08dee6acbe82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|18002099003|22082099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	Euq1O6ELnieNHWVA3L46MbvNSV2W2vAExZmxf7X6Jg4WkfLPRRhpzH3Q1DujyCgHqBuh892NThhy0r6ybIRFKWsNlAk1kcuA5bdI82V02SvJvUhRss1R1EcPpfFFr8A/phyF52Njq3kZ02WUbLpAtZ+Yo4PMDfDNM+dZN+GwgOH0h0dfIiLrX7h733L7sY9UMFnxda66AASFtucokuQLdZn9AyuvvMJmMXH10x4NDAK21IZMdHzP1GsmEpodcO0DBZE9J+luAPRi8aYnLpU3WQTUGD8XAhUwlf1XwvORWEtYiyVZh23R25BBmSJO5Ka2U8mLdk5KjaxRUmiyXSPkKf1Jx+saVFozP3ZmnwGIao/+RXlMxhWK4N0/UFQMhQsbGUs+bTThfRpfj4vt8XTw6qo99WlpELJJXy/JF7SGuzuqdRHlg/y8XzXIDGbhhbyINuc2BiKTfPOh5/z5iHUNh06rejHt9XnEecS+Zo752hs0dTX/dvdba3a5LAHMjfRmKHcf0Let0cnsirFXHE0/v6zvdu7sO+gU8ZwWVkZCJpvh2T8ATOM+sdigI+u6gLKylAp00E7RGP9tDfvhJnMIW3JjW09PNVBQNMMLFbno3Vq8qaD/itW+3FwlHoMCWoxEpDKmBV3zw+5kWGVhnYAt5Axe3EhZkwzPdcdEJx7M+HJhPBeETR7KFwkjQ3j8qWGqOd0CPAi13J3rsb0tk+kAuQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rTQ0xt8frxfJd/RELfRHr7ZXAwTne2hxhMbBQtZjrUPwMDJVER77bLrImyS9+tE0Sm44Y801wg6Ac/fNq3Vx7CDQNwmmLd8KHV87o4V3rX0eVVzwg0rSaCiIl2XW0jp7dN8hi9xn+55wyed0DQLkB0HG+u6rTDRO+UQB5YP+X2/8vXtENoopceXJjt4NHT6W5800RrQs22qpK1tvaysaVGYg5H1gqj+kvCmwNnkvAZxRlH+Pjrsus5slgWQET66VeK1ijTsgQQNkkLI14qbVIuurv0PwaZZ7Z5pqyMVK6BBM3R3Am3ZLfEgcN+AGWA9u3oUp6TDJ/LVyCC33r29hKhOY3/4X7Oac6x6mJN0H+x7bh6Q6xHPlFWT26U7b4yVUcBTJ991McciS3PuKm9+Ja8VP2nGH2KfEqB+HEtzLCMW0UsJGgA+oJwcGyYGnyke7
X-Exchange-RoutingPolicyChecked: 
	AjHxZjzMlO7+VGgkiAEDfFksHQKgZIZV0/0qsVUDPeg58h4fVklx2z+NoFSDuAzwT9lKispP1Vkt0hlOomY4XP6+U9jMLMyVnvQBDR6uPiUYPeKep9XJ9JWPqgdaLgSALO2qb8CKt8C54ppEUCQSkqJ1eca83ERY6V3HHHVCqpe8/FHfVkeNEBNn6kUtM0sPf7HdIiW7VpWoPb6EdiQPJ+1+9GpKDt4aUaq/Wnkw2txH4ZNAx7XH4M9cTeUgzNXDhHI5XMsjsTDILBRKnMtbFvDtyEq6rj+aDxtTkcytW6mtbH2jqfb/FyvesnOfSNU6Ltn+mOtohVBDoQiUD1iFGQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 22:17:53.7032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d723335e-6f04-4aac-a293-08dee6acbe82
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7073
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDI0MiBTYWx0ZWRfX2CBRlo/KNrqq
 hQvJA14/mHk0+KFT8n6gcKxLQlkVDFYwwyw63OZqxSMZQW96Jua+JrH/3ZHKVrYZ2ePbJbSK5Sy
 3bVUVfl93sssvJnd+G3GysA8svn3cGS8JxU2AUYHrIV8nexJqihdYRa7su9qZ584t6iqPJzB7//
 qotTNqCBPgZCEP5av8Zc0iXlF2ZJR4gTML4BxsJwZ0pUYBeoj/9foERsRw6BiqDiVxb+RHcDTZA
 zmNmm5903xwVQIWm03hLerBDcCkKK/M36n3NHW2TMnAq3Qz3pJQVfEqD+rhS7yolmwcEIk+pdkU
 TdwUbbqJzSm8Q6mtuIIDInUEqdA1CyFkjB1jKe5ntnwgk5wTB43uSDNh7WA4AqpwyzgzerzYDbB
 ZUMeaw53515LPuXxdgX9pY8ueipE6su8AUDPQJxO+MaHic26qiZXiCjTmQ1kH4J3rz9eEZ49PTQ
 vKMZIASCtKxQ2CwygZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDI0MiBTYWx0ZWRfX7FXwC/WFc4xn
 lzYIiRLR8dwTCy49ZVfwFIcc9GVfvPQNR2rvbI+r5WybfkOzRoCWSusYv97W4Jdt+AvlWVwlLgI
 DnweAiBg8amGVIfd1YIP2LHxYajPnkM=
X-Proofpoint-ORIG-GUID: c1j0DrkCWAbqBW6qObSlLj9_q56oXKFY
X-Proofpoint-GUID: c1j0DrkCWAbqBW6qObSlLj9_q56oXKFY
X-Authority-Analysis: v=2.4 cv=J8KaKgnS c=1 sm=1 tr=0 ts=6a5e9e93 cx=c_pps
 a=0vJwjWeN+wUybMchBBml3A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=RYXK0iacwZ35w1eztAoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200242
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Jul 2026 22:18:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20170

meta-ti / na / 20260720215920.663363-1-b-brnich

PRC Results: FAIL

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
- Patch Series: [meta-ti][master][PATCH] ti-bsp: ti-img-encode-decode: Update SRCREV
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
- Date: Date: Mon, 20 Jul 2026 16:59:20 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 55cac4d5ec1aa508a6b7008e104f5cde5aab2974

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 7f8fa3541f8d80865067315b4963ad711027c4ce

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
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================
ERROR: <build-dir>/sources/meta-ti/meta-ti-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb: QA Issue: ti-cgt470: LICENSE contains a reference to license(s) LicenseRef-TI for which no generic license was found [license-format]




