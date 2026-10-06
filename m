Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD73DCA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 16:48:48 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.757.1791305324795045619
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Oct 2026 09:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=bNTik0EZ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=W2RdnlzZ;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 696GCCVK2969920;
	Tue, 6 Oct 2026 11:48:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=D6GzqM5ZdON+KXaem0gqsAfvhQMsnOtxHowxCxCyC
	X0=; b=bNTik0EZ+QLRDDA8NWJ17wPiwaXYcniQjqIc2IzzCnSt5vzSifPsVGRAY
	K0TgAHu5lro1xjyF9B9uuzBvI6lGFduoV6XSUppIHQXR3a3H3Ry3XZK0DEl/t/23
	xWBCYhdR4rAsLyYbfaWTRzFWHLuBRtvfT/D6ktw6Zejob3mVFnckiuHtWxcQKsz5
	+25VJi5oKVk8oc8/ISjjPvH1HlrGDPKg+Lp6a2tWDTiTVlARdJpN03chHpA7JsUB
	lokJceSY5Iv+MylA5f7E7erIH4sh+qK5O+q0E/7yj1PpYGaZ4NRrivvTQsR1d9a1
	+yXL/dZCYBwyK0Xlg6J7yPtaKnd5Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h54a6r94f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 11:48:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is5c4VOu8erRZhjy4Y0Ud7Pvyio+8J3eTYJyGo9qKNZx6tv+5FutEc/Adj3xqTAe8ab+PQW2NJ9f0XpoLPLvtOPW4mZkLd9aKIocSN6nPNvhQx63vHCR6Yeefhhiam0qlGME6cq/hQy7GDeRKMJH/tmeqNOqlgrRVJkq+Smz0zrqrVPDToYvfZeHBBcx9GItH2CtvH6Jv6baKHZrhq+OHHwWxS1UmQhm0bYDGTTCKUjLXjlVgGGnonNMRcwx66iMZQe1QxGych8pFT0NJSRE43BPKJ9tFFHEaXlsmAErKZfsjiMRXnz1OAm4fPPOIz2CxYOQWBlcDUwM+DacYJLMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6GzqM5ZdON+KXaem0gqsAfvhQMsnOtxHowxCxCyCX0=;
 b=jSHjtAuK0dJM5MdGICPP2jisxRkJuZ9DZU2NGDkHuFYaIsvIgkC+ttqI6QrWz/4xfE/d0CovnY5UdGOewjt+8yJZtC1CG2Ei0KdL2otSB5NtPyuI3L+0x59PxDRTFqfwk3wIzqb9jsX5G89UzWLxVZ3obcHFGBt0k9HNyN6PNTsFcbfRjg5btMVPf8tevzr/CQRdZ0KbWqyqTWgeGk7+rXlsYD2ix+P9EHsKNlsEUCgYAl1XXtd/Rx4xNp6OTpjz3dMiecLqdvG8qttuQfFpooAkqSvZhrNpqonNwpVuosmfE+RgF+056f2VKGW5FlUmRpUq6moRwVJgPjrNk4u7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6GzqM5ZdON+KXaem0gqsAfvhQMsnOtxHowxCxCyCX0=;
 b=W2RdnlzZmpCQlFQ/jU0xrDJZiGJ+8yR+ey1zuoke1F3cGXCP2qW90VgizdcIhwajGOFSO31PAhz1htSipD5xCkHSH+Y3OAEDMkUpb74p3djARcbSY5PHPherIqiMPkmfA3LNsd8pOtsvajloBZ/cgQN2Ehdr3+kkjyvRbwaK9jBzrGG0gNvtEWA8KAN2UnN/KTyeufYQPYf6XvJ0OOoMt3jb831nGHHrbrvs2cBVThg0eAsGYwicT/Yy6JtZn5hHnGz+PbBoFzlZ22Mu9ht/hutGl/i5Hb6ezmBdOLMVBNd4NcidA+Wl0J5iSc5sFHYaMvGLnf0jVh1bpHajggbbnQ==
Received: from DS7PR03CA0360.namprd03.prod.outlook.com (2603:10b6:8:55::33) by
 DM4PR10MB7452.namprd10.prod.outlook.com (2603:10b6:8:18d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.7; Tue, 6 Oct 2026 16:47:43 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::90) by DS7PR03CA0360.outlook.office365.com
 (2603:10b6:8:55::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 16:47:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 16:47:39 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 6 Oct
 2026 11:46:52 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 6 Oct
 2026 11:46:52 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 6 Oct 2026 11:46:52 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 696GkqrJ1821648;
	Tue, 6 Oct 2026 11:46:52 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B097A9A9C4; Tue,  6 Oct 2026 11:46:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202610060906
Date: Tue, 6 Oct 2026 11:46:51 -0500
Message-ID: <20261006164651.1102002-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261006162929.329848-1-lcpdbld@list.ti.com>
References: <20261006162929.329848-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|DM4PR10MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cde1877-7700-41fb-0e24-08df23c98890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|10067099003|6133799003|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	aEqO71c6Txod/bRtk+UBySSBu6ce+0SlbJ+aqaMb0zeE+13qiR/Hjgt6lgzj16wCoLdiej3gKG1RlxPcvYGd4RMZDqmtMCLDvUW2dqq2uKFYNvnSCh1aH9ybGurZQ/Hi0W9BdhtVgthPvXwOoS/8d3RofXIoee7qUOBZwjy1P49iyy6rR2BQsZQGEwB90JZuTvBPuPpIV/dlDj9HAARB5DSCAHIHWUxmC9apQL8wSnPikOrJQn2NJzYbaYBt+n6YCPpIb4MBDOnFWt6rTNPxJSUCL1kVG1V6H2Jjji3u/CDp/NW1HvnZWM0oZeD0HafQPXANLIvr/PP+G6+VbkL01Azb5IsxzKoWWm5BGbNBqJpH6++RlKdQQGYhZl/5axYm/ktedDLBFKDZhYwC8yX7myrRCNrCYsiIGsSobjhIa+nkHrZWRVMJTceChCyy+jOl18koY3s7g9lFMH3nzOrdZ8/g6Z98XRglRCc6QB6FQlLZ1kM4+XIDvp74GGFnme6RJznmDAWhz9P67hhnG6GsEKfYi1GtTrtEYp4aER1aKSqBSG0hk3nfDca/YAAUTfqSux0QvrisJ079z7jc/yiyK9qcyLAuOnjWciN+0owfgoGyk2LIelTwMMerI7XRgJGyrnqmCWzu++dKf9q6RE3w6rA8c+RfcrI3t028Js88g0VN/atQWYvQ/3YwqZtNNzb+sjX4ItHQyyO+7UthRy4Qhw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(10067099003)(6133799003)(56012099006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hGX2dhyDjHL/l1VLOWN5Q4flrt3BnUXpTtD8QlQP4zaiNEYNbNrizJ7Hw3VVjZJmKv96Ph0hg7pOeq5jBz8OFYvEfC355EXThgtJdUWZHOvMqqCjOQyePlZ7Dnk0mRYkko/rP6UJb5SdVPucOjFBjO5l8S3sXhD8iJKK8e7UtoWe/mvFOeHb4JvFHleMruDaMa/uoDlvv9P2mAMzuFuAVo1NcyZ4Kvx7vhe8Ob8NRBnLJtSykMJ7s8qsK2KKRwN9csszHz8TCCTO2QLKHsVwC06rrzKcCULJjjzk+ViBmqDjwS2Dblz7Q3SGOnQGxiPOz0lU/dk2vgpu1TyWt5DonqY2URW7gSVkc2RvUEHZ+xpTvOc/E5NqDWZwgVlFfjuETcqPrGthhBou/+Fzu6wA2dSpLbN3MZ6Ntw5CgOxcwuIj6OF/gGk4sAfhMrj0AWBJ
X-Exchange-RoutingPolicyChecked: 
	iQhLyLMBmsqnIklxe7ASG5g8IKbJT67PPDvkfRLX2x5SwUi+wkJB47DMCdeVKDSe0o/FqSTXP011oCgn71fOLAlsQeQ0DQe7sUW2IPK9oeF9EkQ7GUyNBNv4S/6lkOZ4Okr+KZV8+mPntandXRd5cQD+oaYitYQoaD+mx27g1VGJ1QWBN2X99XGhw/JxhtQ0TkOvqd9bPnJ47qDykhsRkt2NBzLYCYDR1ZbFCaieTXjX+G0gcbFLD9WSgtCH7tFGoAeMBbndltgj6ww9cEfTCNH6/4myVSfPnIrLzeS9GBcjKpwuXZlSv+ktBY96JBsgqRaM9wsRc//4ZcEHgtgkQw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 16:47:39.5525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cde1877-7700-41fb-0e24-08df23c98890
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7452
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA2NiBTYWx0ZWRfX4awvXlDIsWdU
 Y03JKfxkdTll5O/wonNSuDZNP5q915k4LA4eI+5ZiTjL8F09dDPhGsZ+/7x8SfCD38Posxv2Q25
 xZyGAt6ThmVoFTIMeRwD4JgqzInMnKLmnEWwD30aA5l61Dl+O+oW9Mags+Jp/OQDuGPs6M3ug9I
 7XBMZC8RK/GF+XhGLrca7RN1L4oUqw62obAVCkszpAuD8Eq6Knv8Uh9Jzf2m40YKI3uN+BSYUgg
 zC/vsWrNiDH8d+3kjeLEwH2G7U2gm+Hni/sE5aGK/JT5+0UvEr4U0qCiUgsNhXAL7BEFJf+0L7p
 MN2HPbxLBy+0WlFMiqaFGf9jcRufh0q4wmDNHcps0+77pTtQocVwuVZ78NgHb02Ib9+mh68O7Xy
 BWe6nDtaZ21SqLTGuTNdSVJ0LL7PqwXvZzbQzwaepQ2Pbi29EFKbG4SVpO1M/nFi4GKOyhnwKI3
 prgsvY/oTTj1PMr/qiQ==
X-Proofpoint-ORIG-GUID: UqIBm-wpxGX0_kmrq03Vu1ewAyosVbIZ
X-Authority-Analysis: v=2.4 cv=U88Hnuru c=1 sm=1 tr=0 ts=6ac5266b cx=c_pps
 a=eebb4ZtE0r8msBY2xobl+w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=GyV-Zatm1NBZ49CiBggA:9
X-Proofpoint-GUID: UqIBm-wpxGX0_kmrq03Vu1ewAyosVbIZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA2NiBTYWx0ZWRfX2+zgE+LYQ7yw
 ISmUY3GKzMDnk1jlXLAsfQ0MTpafqvgjsIRxVu5jOcYqPWPnRAxkYmwoLb+nA7Y+uW8bmLJweWa
 QIK7CvLx6u+G5/3/ZynxkbPhJVNFWZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_04,2026-10-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060066
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Oct 2026 16:48:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20439

meta-ti / na / 20261006162929.329848-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202610060906
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 6 Oct 2026 11:29:29 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 593b441f892bef2eac0820c9c7f499825140de66

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 4725b898d1ecdca3a9ac535baa0377439a306008

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
ERROR: Nothing PROVIDES 'python3-pytz-native' (but <build-dir>/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-python-xmp-toolkit_2.1.0.bb DEPENDS on or otherwise requires it). Close matches:
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.




