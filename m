Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884BFC5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 20:18:45 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5363.1787170724014728386
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Aug 2026 13:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Qz27dG8J;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=jqExtwAh;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JHqZmN3082994;
	Wed, 19 Aug 2026 15:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=vuEd4dUcyDI4v
	KKIL0HqzxEh5qU1ju5Ww2EmLuz04dI=; b=Qz27dG8Jnq/MJP4rmvcDznZj9OISo
	KFw4PpltG916e5oHT/rzUwcnRiOZ7XFJ7KEgFjSIFNBED5/4dTYWwwudlVSMuFBY
	I6sUDir88sl6Ppnubzvdegt+n/C5ePKjRPTmw3fgJGY5YWOvMMuzd9c0bkBCNjmJ
	B3LsfaFQ6OF0b6iGyQjKS5Xpg3rpKjb1kJgkMA5+b/Q+MJpCWfB9euckEk3rbEfI
	x0YBXiNiO9LgcEaQo0NIwMO8udmpN3AJkw1T5gKkobADzhj+XU4k63//sYLbCBGV
	pG6Pj28AC9wyQou0nCKvR+YF1e9H8wXf4Lm2hKZF5mWtgSeI7Z7vycnrw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010035.outbound.protection.outlook.com [52.101.193.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g5dyqae2h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 15:18:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7i7nrPAhCmOy9Y3ufVCLaD0lVwjPB5Ih/cANT5BchlJW2bQVibcotsCEl8EzPE+SJag8UGthaCuzZXzGpCISRpEoaZD09UavCyHF9E8t63vr6xOzFkCHvjsQV83XHgB4H3xCuhlPUm49a3jnVTm5P/sSZASYsK9CdVObhSNfcye8rpKRpMgNqomlx3i+ObUsVpWb3HUncjjqlzMsUjC1HIf9CY9qyzhI/Q1r5qDmoIp/bIV8mTjoGGz1BZ08Yc7soH4CcaXroz0jsdfH54poZBAfoFXLWjKLYn5mSIh4sj3AHNdvaYyPYYFHn6HedlelyVs3WcbZXi9Q/m32uYanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuEd4dUcyDI4vKKIL0HqzxEh5qU1ju5Ww2EmLuz04dI=;
 b=tJBrmh3YPxNq2X9pH5mDhlUlChI7/hv3pFUXNYVElF2/cGzedS/M2sWjK7cmVWxm4J7Vn154WbrLz/xRLpn4NUQerx7nkJU+uvEwsYGDPR3/VZOEuUDQxgnm21gPTr99UgiesUGVifod5nZRZE6/JRZH5vLIfp4B+xlR9vqQkRosO4Vn7BIOrqnGfeEcLjdTtUIiBeOFomGuClfbTKOtvyNcv6Kq8jI8M5/i9Piswt5PRE2yIAcXo+C/2HsrixhNZXllnReJz0EvT8nfOi6ZOCG+LUXKysWB+A9CN7AkojwiLJ1hilNNLTAu3+ujZwyvX2NqSMqIVjx7dovTrL/hZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuEd4dUcyDI4vKKIL0HqzxEh5qU1ju5Ww2EmLuz04dI=;
 b=jqExtwAhfZamULyQ1AeLVXLVauMT/x7UDsU8GPlBM8SrMio1zLifATsEDwkgk+HcXdpTZ3GSx7fM/x3KQLLbJKPvHhlvHkw+orERHyZlsBL9Yx8YG8foTp+pVfqH/upjTqSk61VPq5v4ekxo/VJJA3szufRpp5vSGOB3qwWkTg8wkt+4dgmT1OBYy7Up9R+y/nfADFINRXP/UQh8BEqDvvnFLBDvvYu3xigEYZrXSKREw0PqB9kQD/gdaby5SadsCGc7UvjsvBohMEmECbZdoRpT697HqMDVVUXbhcBZCB23jiXSkPjkO5+828y7A9bJ9hfTG+YtYQhA1NCBoAfTWg==
Received: from SJ0PR03CA0341.namprd03.prod.outlook.com (2603:10b6:a03:39c::16)
 by LV3PR10MB7937.namprd10.prod.outlook.com (2603:10b6:408:21c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 20:18:40 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::15) by SJ0PR03CA0341.outlook.office365.com
 (2603:10b6:a03:39c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Wed,
 19 Aug 2026 20:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 20:18:38 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 15:18:30 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 15:18:30 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 15:18:30 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67JKIUD73185342;
	Wed, 19 Aug 2026 15:18:30 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 43DCF2A6E; Wed, 19 Aug 2026 15:18:30 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202608190946
Date: Wed, 19 Aug 2026 15:18:30 -0500
Message-ID: <20260819201830.2993277-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|LV3PR10MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 011217db-8132-4782-8d15-08defe2f0e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6hXGoF8xZB4bByt2z8H7xeII/BnOzS2Qr4x6Eqi5Cx+Av6yA21gmyzvzU3cMjq6hRDw7Pfu/jAR85K3+lagD3BvELuydpWob3DCuZvnrAA9ze9f1tXLoBsK5RH7smAjjKpDYGx0knxY5vUckwtl86hZxogZ2592SExLvyp8pXn6CQ7vS0gX0THMw3HrN9bXjrmW9/jAMVN+44dsuTcv4odQpKk2Ra55Z8MEt+vU8wUY4jlDP9EK20IFwEIDmy7u/vWosep3XXEUKJKXcbFXvTUEakpKAhThS2E6+kicKE1D4SjDKicqOBpkQli0kXvl1W3yJDR/cI2nLFsKI+RASrjIY2J1R2pNLnJ1lTRK6228qAfp//iVBaT3VllXlSO/S8xVt0YEG3y9Sq3TtmrIU5ZGRz0qBwH5Rw48D46vpBQGL3MHvB9qWAA0N/deJ2QrSwASGVM/Ir1miDo7rCJ0b3SybTarHW8JafbIw4zNcJR4x22AW+5rIQ0Pe3acw1lUBVkMAytxd2oszrA25ZkKaUr0VlrA9zxsROxYSFK9fRcLMKQosrQVkPONVYu/z3HJVWvLDa8remCKJUBMxtzKA/WeywQ6W5GVo6jZKe8vlbvg4OLLe94VNKMTTvOgJvBVvxfRUPVhrq4rDy9fJ7mshEhNOPZxvYhoHA7h1DAeo7waPRteZFCbt+eHcb7aBfJB2OoO+8O+18q2DoJz8I6iIrg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GfbW5G7cnqXnDrrdKoiNcIRh+i/sK4LRGg+h3cknoZGJNfkXBEZ3jXwgNaxEn3m7v/b38lD/vYRcgVD7HlAbUna+5fRmCUOaMb/vBpkviEbXNRRHf9tj6YKP8QTe59CNYYd1M7CRx4oEJfxdMENHcV7aUd2Ojqlqd3f1IT/3fn4mKfudzh39ejSP2HsqNrMVJHD+JJKX6Cmfkt0whds60RBUERoqlFOy1Rk1Keio4RjwKjQTKBDpsL76xhzWGJpe1u8iS1oyaHFzuBUoar3SdFyTlEeE27ZvWGVZMeNFDiYxAZz/kTrvFd/7gqQMmgczFLheol5+eDs5IimH75bF5sVlgjg8YEtmP5eUXM3GImd4ApI9j/0UxD7apierbWw67VnK6pmLWy4IsOyWg09xLS32yaG/jaVoZk3uqKV8avUaLMQ3P1qvmNZ6ziCP8UHu
X-Exchange-RoutingPolicyChecked: 
	cthV0SFoGgaLQ8dYMQC6/nOU2ZmzCDp9FYbiKoPs/gQKg0wlF18fz/MiMWgPTvrpQC3T4bgFi8RR2Rh7j8Q0nmQ0+m+gA4+nDZSorgCfACPEadpVHmakqhofdWNuFWfuUH/XTQ5FVJEo+fFgFlAUuxx9uBo89AyoHtZPt0X8Vh3oyuBpAZ40S+ewpmiXl2irNp6+U7wLcj2tlQ/0Cp3UYy4qklw/0nPOpbBis3oyhNInsn3BX3er3TcxvmiDRd1WP5OlknQdrYi6dFyitp2ZZIx/tCJ7rCDtKJ3c0TnlMcvL/USGMYnACsglGqvkNGqXIJKmaDiZMkr1ZP9fSD1GRA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 20:18:38.4462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 011217db-8132-4782-8d15-08defe2f0e0a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7937
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDE1NiBTYWx0ZWRfX8n1WD8gKV3tV
 w5iHmCI2kn1VeoNAVNEA50S27NKPCPkEYv6eVUDVLdwRO1Z6Jlz1IndXMV86mFgTGZKutBa7KAR
 WvjGtFnu7+08904jj8TcbZbDukUZ4d4=
X-Proofpoint-ORIG-GUID: jEAJGKA1lxm8euR-EKTRA0KGjKYFViTU
X-Proofpoint-GUID: jEAJGKA1lxm8euR-EKTRA0KGjKYFViTU
X-Authority-Analysis: v=2.4 cv=RJaD2Yi+ c=1 sm=1 tr=0 ts=6a860fa2 cx=c_pps
 a=lqu9J6zwYwW4kQ66rv+4KA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=TxZtDXCYx-MS9eWnIJcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDE1NiBTYWx0ZWRfX/9rcWekb8VFr
 tDdIivSAfsAd5raf6LQ61w3aHn5JVzaW8doPUV2/uhbNKzLOUoDrYzPpAnxoVvKV78VHQGGd8AN
 17+rfiRGRXrdpiofTu6tP79A2S3zQfInX05AufrSjuQ1Z0lE42JablUeUOLZSw72OBR0uj3p+VE
 OihkWltv+Pgixa/rBA1lRK72Zzjw+icP//tvnLO1rTHf2jOottdNLWayxhvD2P+sQzMpajdKMfv
 6HjBqQIuAUklr0YwP2F2zY3Gqci3FX/J373z0S8FNZtTcbXK4UbpXiGQFFQA7FSv6LKP8KRZ8d1
 z8vbgw+FJroMz9CuS6UV4E7+6PRWkNCYW/bz/RRq+BhJWC0n2pwGiFpwrxZwQqOMza9eSBzSbK1
 aAaitABddpc8DUqI6kENpPfadpk7ukfmmcseAdO/bumOhj7xevuB4Y2y7nrC+52RAKaWdTSsGcI
 H8SVAI0bKo+i34OjkHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_05,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190156
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Aug 2026 20:18:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20279

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=98d73c5cc3a1b001f95c6e35194d2918bc0605bd..639e8ed77b8c51071537ec9353fdc6200371235e

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index f115425b..c32240fc 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -22,7 +22,7 @@ TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "98d73c5cc3a1b001f95c6e35194d2918bc0605bd"
+TI_LINUX_FW_SRCREV ?= "639e8ed77b8c51071537ec9353fdc6200371235e"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware-6.12.y"
-- 
2.43.5


