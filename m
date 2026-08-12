Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BF2C5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 21:49:44 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6230.1786571374789490355
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Aug 2026 14:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Usedbkeb;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=GB9V2AQW;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CK0Kfp1217849;
	Wed, 12 Aug 2026 16:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wK+GOXlF26HJqIYiqz+jjZhNx+X8nFcdJnW4YwlzC
	DA=; b=UsedbkebJ9xM7hbvsQEwSlgcMfh2foDy+DmUVzp2f0jMnnof3CtUwxz/y
	bdBL8tbqTBU01oSEPGXzCrTnLrRRlSjTzCdBpkvhN/YI2I9bADRwuD9aWS2VMpF/
	EepD426QkCLX1pO1wQObWiZIpN6ZNDd6+EBOkpPBfefZBornTHGbkcqWeoOQXttQ
	IDSEJTy+7Wo+0ZwY0FVh/FOieprsRzL7Dymud5WvUNHySE39cUxaqky14qgbK794
	aF47Neil6jYL/jgtgDnydICBliRLDndRRDPkMLTucjBlVYGDOg4vHPDuAvgVt8ye
	gCXcgdXQ/HeZOt80qN+JZX9uaPMlg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g0mun4u95-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 16:49:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miURq24NFtTP98NE15jIDZJyACnvkvy6U9dmhxyduxiFNRQ9/jfBeB9VFS5kwo3vutWiVUvnkVz7J1mCaQHcKL9xVT5Ij1/d/y8LRANQ93nbRHOQTE51VotNRHvgWBBKdSiX5/qhPqTFKbMx20NbfAPaPVgljnPet78Af9u7Bsu7gY5b2D3BbE6wi6QTGSsBe/4hXO26fC8aDKFf9zcL+GLECt/isJHRCiuRbrNx8dBSSxS0kVu+/XfpcmsbZC569+GpEqQ6awSbnzc+30LMfLyBWPI7TXuA8TQsfX8IbiMIRlXXv32JUo05sLeMKOm2ZzOCG9rKD/kjq4S132tQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK+GOXlF26HJqIYiqz+jjZhNx+X8nFcdJnW4YwlzCDA=;
 b=QsDTdllgfhzFhU2pC/FiMDgvcnGGxUPNjII8as/Hje4xPGyqkIlFfvA0BFTBu42b/1fhcD5SqKvC6E1ORBFo5MfdgeLMsX1XSA52vD7RJwaFzH/LzCxS3ZoN8bZ8iV53qmpi3o31VDFiKMUHh/739Zb/xIN5NAynVZL9jv43Cs+GmFiVA4Ea24BwcvkV9o3kLGsTTZhBuDRZTinL7etx/xuPrmVunS6Mk/2SowVoCWkh1t325jKJzet5F9s221nyaEBxh+kbsB58LxY7ac230i1heoySiMyPIEIkwXLOfh0NPC/s2G0FPV+1Hr6Gf8UVspRn4/teuRx0vhZzLJyDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK+GOXlF26HJqIYiqz+jjZhNx+X8nFcdJnW4YwlzCDA=;
 b=GB9V2AQWvUn9Nk1qvH1BW4Af4ozfHrCPHcQNf/mFMUQUCP9H2hIKDLCNsI+/0XLWWOnhlwb29FB1tc/Qt0bLqhEw1sJwtUUeWFSZbUr74r9TTIJz1S7oeXmNghWD7A/ovkUPng5tdGQG2NcVkDql2NofrAmC6PrnOMUTSMv8IUQ=
Received: from MW4PR04CA0200.namprd04.prod.outlook.com (2603:10b6:303:86::25)
 by BY5PR10MB4372.namprd10.prod.outlook.com (2603:10b6:a03:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 21:49:30 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::4) by MW4PR04CA0200.outlook.office365.com
 (2603:10b6:303:86::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Wed,
 12 Aug 2026 21:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 12 Aug 2026 21:49:28 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 16:49:21 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 16:49:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 12 Aug 2026 16:49:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67CLnKZs3846995;
	Wed, 12 Aug 2026 16:49:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wuGp6-0000000FGv1-2b18;
	Wed, 12 Aug 2026 16:49:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 2/3] kernel-uboot-legacyhs: Set ARCH and UBOOT_ARCH directly
Date: Wed, 12 Aug 2026 16:49:19 -0500
Message-ID: <20260812214920.3639941-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812214920.3639941-1-reatmon@ti.com>
References: <20260812214920.3639941-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|BY5PR10MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: 14355a99-c3ed-4442-c1bf-08def8bb9599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|56012099006|10067099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bMTMxVtMcY39sgkYKX08TYTUNBNhfYy5HQnuXlAUmxCemmK6UKhJ9BePXGmBv5uBYv2NScBhtfTGC66wQFW2/WE2sP5n+/qHIFtbMr+qCK5WFEVXGbzN5r/XgBjOCLqF0w6Mz/Pe6uXhW+OUnz+pYJZq+8lsVRqyJFhQWOAC7fkkRkkf9qRGDXWProdfC3NA0+l2K0pSMoiFRz/0suqEByT1cAgnsJklnbDdMDyhicWjlqOQshNQ9+pAMnuuX4f3xPfKla3e5c7oSykPd9zCe2cHE7pByAavjmbzkqzy+vlPddTnQ6g8s/+OKSOqSvFNXFX4HjNEdy1pYb2xppfyyxy2kMHyURdKb6syBIZed38bWH+fVIoOzAHlpPWms6r9ysq4PlPiVaZFGSwl0wFrH1LOrN7aXVzMsMUmqO/oFGFcKxoT7heAMn97MsBFhz+JF2GKsjqChK+flJtRyF2LgH+m9Ysz82xmpT1uyeB+nemF5m0DQbKoWRmqXCKXRIrSMEKfjNUGf5SF2kZ4kGSxavhrfqDbd4fwqOSbjnU64m34lwG6I6gYzc5U3xYTFCOJM6C792XArybWkBGGVIUV0nVCpMyDXB/nYf/akvWKMjy7omTD48BnwAaDDq+VHixD31AXkOoz7/QPdEqYpn5BlOB8ThdDbEqqbNKhWdZkDYfdMfDlSA9JVLO0ZrgdlmeQgqazONJZaboNtKmYCMtv2Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(56012099006)(10067099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1PXW1IKs02hmefL7eYku1s97Z+Icjs0LbRR+1tgwnkXdHcS0nzKsi66VjrSUoicBKVcHmEHdFQba2uKa8gvlL/6ueGYmjoSuenzx3AYr31px3rwMJ9+eDJCcsYYcxQE9U82dPhjrf3oR3qpLjkxYeIRsNhcJjnVUQ0qGt1NSNEI/s+8K30u8ZvwIUQOH7LbkMyr6sz7O35JbXvQ+WaMfRTEPzDQNB8qmy84JJS8ldZf4eIMV3HdzMSHrfFOdNoXOQmYj0ERGpQC0XKlr9eF/uX7erthAw++H3lzaKMhyVkS/Gkj/b2ogDChCgyWP6IhHI+q0+IFJMfGtCILcc+qijVSCyubufipH8bsRIRrYhY33VWUslz98lZOZ65grB92i4etEEOX3hMXZARQI/wmUPpJudsVC9Ku37MoD5QyxanCIed2+/9dkTu53iXo5RATr
X-Exchange-RoutingPolicyChecked: 
	sZSU3N8rCRsPw/v7Keg3w/PpKbpaBlnXJSRaKpCEaE3ZfGgzxK4ttxIOTuvssXC4HVfQCcYVds69nKhr5q/XGmSGK83iKv+NbvCw8TQDq4GnZ1sZqCCa1uLWDWx562c2GQrF9AOwGiGiIHrqDMcZRrxmn18g5WJFAgQ/5okl+F1MrE85A3wPANBLkYIhF2g9dvdwW7w0EYTz7VHEVuIXBACwJOFHd7d7pVbWj2N7IGtil9WQ6h4DaAK/dW68edJWKybN871UAIpIECMSTTAs117sxX7M92R67kkkQJi+NeKSMmOohVVX7UaelnXPSxtSMU616+3nXI/4wE+KgliJAw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 21:49:28.4318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14355a99-c3ed-4442-c1bf-08def8bb9599
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4372
X-Authority-Analysis: v=2.4 cv=JPQLdcKb c=1 sm=1 tr=0 ts=6a7cea6d cx=c_pps
 a=1ZuumbNKwQvJCYYZUadJFg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=XsU9Jn77uds3pkW7mnEA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE3NSBTYWx0ZWRfX1c1105xYqZHy
 Kozab/Aj6gwF4pApzzpOxrB4rF+UWMg3OLCV0N69su/kN1xMDh1PB/hFGYAWARwKyydDazoSb/V
 o8kd8Pz2gU1PtZjGqEAqOPd3Crtg+Rw=
X-Proofpoint-GUID: J7N-ZcmjEhscUq0A966226TXN30K_A0g
X-Proofpoint-ORIG-GUID: J7N-ZcmjEhscUq0A966226TXN30K_A0g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE3NSBTYWx0ZWRfX+pu8YvbLX5PU
 nEGrdh662XaaL488Uny0Rd1/u3xxAqEfEUAfIpM6r919soL3De11td9BxbOB5oRTNk+74Zr8dXb
 MW9mPt5R7/b49weZkQ40rBO1iwbJzetg7NVWNwK+0DVPyRb23XKDQOZMAsAj9q2rhr8RsNmafd5
 p7UYrGFaHLuhPABPI4gPXYCYvNLwj4FVBDsIj3HfrYUkcDPOSz+s0cw452KvQ+39UcmCdBww5Hx
 d4dy2scGEOBFQnajxGmvDPYBfiHGT+ITJLrQ4uhV3GEMSl2vYYw1wDyu5FHl/yBeO6SG86VJNfp
 OxkK0qX9HNSNBcR7dDrfI0BwmBfIfHBZY21JhBsAK7YHvWw+aAR5XvUFP/9RZPNAqkPbMXRP7rj
 btMfM0wroCWKtW098xwpXTQjmGdJRZsPVvfQ0hbbJFWNBq5jmxsbfpJPUcuZP9SUrdxfyPaOtvU
 0JQ21+RUx+5VqRtknKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120175
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Aug 2026 21:49:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20258

A per changes in oe-core [1][2], it is preferable to set ARCH and
UBOOT_ARCH directly instead of relying on a class.

[1] https://git.openembedded.org/openembedded-core/commit/?id=635f85b7b8ffe4bfd5f282a98bdf640aa037cde1
[2] https://git.openembedded.org/openembedded-core/commit/?id=bdcd04bbc5e205df16c0779388521db4041e7841

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes
v2: New patch

 meta-ti-bsp/classes/kernel-uboot-legacyhs.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/classes/kernel-uboot-legacyhs.bbclass b/meta-ti-bsp/classes/kernel-uboot-legacyhs.bbclass
index 6d4aff6b..a2940845 100644
--- a/meta-ti-bsp/classes/kernel-uboot-legacyhs.bbclass
+++ b/meta-ti-bsp/classes/kernel-uboot-legacyhs.bbclass
@@ -4,6 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
+ARCH = "${@oe.kernel.map_kernel_arch(d)}"
+UBOOT_ARCH = "${@oe.kernel.map_uboot_arch(d)}"
+
 # fitImage kernel compression algorithm
 FIT_KERNEL_COMP_ALG ?= "gzip"
 FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
-- 
2.43.0


