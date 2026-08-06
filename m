Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001CAC55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:10:17 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20229.1786025413881817922
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 07:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DxPO2ZpA;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=xHTGSBwU;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676BoQKc166568;
	Thu, 6 Aug 2026 09:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4XCu0dSB5s0yjVU7IRdPKib9XDDNAy8FJLmVI4cz4
	Ww=; b=DxPO2ZpA6KzwQJ1Hj50MgFSgQG9SpNwJPDPpE7sZyHU+c+ioV1V8czZ/E
	9gWu6RtOZb3LhPTW56O83k+kPUF/mffglFbMJqKyFaLSYZhAtbdVTCCaT6ouq82x
	Q9KCHRoPse4D7ncG0h1ppVIUDEoMW531AkQ1Mncal99qiG+6p8KrbOThVoBIvG80
	Til7nAxAI87FM3YrHfN6dV/X9FCvBkfNU3hdtn9hm3FlHsUhAYFuXT7gzYap0jDt
	JNL08iWSEvl5COxmbghftb3CKF8CMfzz1EzkOegwLUxG++MIUYFe0PRpAseG7+6A
	WZ/jxERmy+Ujbta86d2OQSnqe8FOQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvsrf0wy0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 09:10:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hdgx+LRri6YD5FzYItsVc5o9EAw0vlnbywtPVQckEXauibYMmhMSE6ra3w/3xWiNZDuEnRtQOH3bS73EFs8tQSL76gUIExa5iLUXXd3fWZx1hLyraIKedlaiwCxciYcADPBDx/D32WayfkXnLfvJHCGXWr9bfishg7d/RlQqR4zmv50TgqK4W+4UGzNZpFYIptv1rd9FvX3P+B5E73rww0qeSZXbGlTXmViJ0fB2xQgcFGOVGLjdAmh11MJjAM/+YdHcGMek8VHo9OJOYeJZCl4J+eYYGrOAGe/XwdZ6oPVwo1glweqtonDvlr/hcAVYEIolUDjE/ulbV2cw6dGRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XCu0dSB5s0yjVU7IRdPKib9XDDNAy8FJLmVI4cz4Ww=;
 b=b6N4xYSi4Muu2l8nHq51wUiCHtFrD3gnFS60KGO11WbYS0y+JtskGDx460BDuhdWhMeFMK56wgGvH5SD90l3B8bVcHY0FJ1VOoEwcwKn2OkfFvU9QS3r3pBcSzM71drwM8lYAHcWDF9Pb+0rBAEQKMrBJXWfcngDi7uDCK/kQWLAlIqMK+TZLbFG9vi9XDxydOvb29E+Bfq053WvpLSAhF4gzDSOPbRMlNGoHA8WUFfmLbJ1Q2kYPPfsWSTCeG9Xkm2CgGXnThCOZx0Rq4ZyxK+9hXDSYrpUKlnQWg0h6xtI4qSR2QK16V66osXbnLVq0RSMihZw3sCTtHSn4JJSug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XCu0dSB5s0yjVU7IRdPKib9XDDNAy8FJLmVI4cz4Ww=;
 b=xHTGSBwUOH5eRbcBoahJg+BDoRWlQfQZQkVBfV7kz3EcqxPlgCVVCwi+CADQQtgQd017Yft6ym3T0QKTqb9d3n1bjh5g6eG/AYhD4HHBBiBx0sOJ7sRjRNDxGidRcY0xjyCpUMl5MKuFa6qYUP9eNR4ONmz+HCo6C8sMMssp32k=
Received: from SJ0PR05CA0088.namprd05.prod.outlook.com (2603:10b6:a03:332::33)
 by SA1PR10MB997605.namprd10.prod.outlook.com (2603:10b6:806:4b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 14:10:08 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::1e) by SJ0PR05CA0088.outlook.office365.com
 (2603:10b6:a03:332::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.8 via Frontend Transport; Thu, 6
 Aug 2026 14:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 14:10:08 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 09:10:03 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 09:10:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 09:10:03 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676EA30S3450019;
	Thu, 6 Aug 2026 09:10:03 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wrynL-0000000BeCd-2VWA;
	Thu, 06 Aug 2026 09:10:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 2/3] kernel-uboot-legacyhs: Set ARCH and UBOOT_ARCH directly
Date: Thu, 6 Aug 2026 09:10:02 -0500
Message-ID: <20260806141003.2776131-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806141003.2776131-1-reatmon@ti.com>
References: <20260806141003.2776131-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|SA1PR10MB997605:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c15865-9296-4cac-8f80-08def3c46be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|13003099007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EvvG5uOL0G6pktcedoLL4Tx1HbuPoZhqOJBoGzYafDq8a1ra6W4AbjneRDVCxcQI74qy1QAZZ2PCDX/DuCEsGadIrB/QxO+s2BI3TvpUJ5KLn6eVNJeiYtr1EcGFP86yqNlt89NTpdG0YUMAMq2jeqbwtN69rVvSJbwzAEeSk3vKynfg1G7GzGDpQVT2R/13qJ3sTa+5ZmpeB6j6aAN1bp2JK0ds1v4DdrPE/l0s+HoKNYHl6yl+0H1ps9uUUZBZPnTodzUZCRsUiGqOIt7m1QE5eyeEwHmPdxEiz9azTUNnsu8SppcffNQLIOLV+2BPZJoO0DKAmVM189xgZO1CSTDHcK10MZHOL4OZVzXAofeG6sg+2fKbml8IBZndlVfpNN6iTwvFFtUkGJDN6JAr5tdCwhCBmlQ2IIzJsr1pWpLz5W19CXUrgp+8WKrWDuk58NeQEhWDbuPH9zIv8P3RrpPummhLnpFpQXTvgCO+3u0Z71db6N7MTc7cd58P8bd/CULewWY7jv2+DIzKmpKla4NcAKrPHzJYBCeS9kI53lH7shQDSw9gLiF1TJlERPB+yCFtbVNl3Gi50ejlaUInMUhIRAKrIc59qQWB+/gBZkmM3eoYu5Tv8CCwRlr07d9zRLcTu2FA8xiIxcfqMUWP5c/Y3BD6e5AOMwS6pXpxf5PWYYKy8nOQ4nQeWyqPjBlvLrjzw/hEKD3NLpZhnZEs/w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vh0U0547MJd2nCuNJhuUGASX3JRbXI08sCyNaFr23QlDFkTl1h0aS4jLf8GaEhxxPQq5bgeYn8N5wJE3j1M6RTmGj65n/kV3eqKAw1nFo+JJE8rU3eMRvpoEro3cn1eOBG12MiVTUTbv+2dD3xGFsFGFnmMV5y060+8GoiQ8goid9sKJV0mal24PPlT09VBTTIfKzaJBucycpqJhpj2Ar1qB/x8UT8+khwbHjpcKifkRshkegrVpqopcXwZ2DIEbVVpWwMXFYyyXUmqf+sXtW8dzIYW8Ov1T0Rn1gRayue3QAwdFiTL5+twNhh11ODdwktiibCHQyyd4rl+ajhrbEuExFFmPd4gjYYhx+T8iM+FvXalOqB6oOk1sR42eGWAi8gzuS6gJB+T3YM8Wv5Bz1mNWCJB12MNqOQR8XKsWOHL00/u56F1oBx/txJM+mNNr
X-Exchange-RoutingPolicyChecked: 
	VR8MSmp2kXZ42FVvDXsFYXt/7buz2Yb2wtc+SyiuWEZAw//rpzVF4w11fqkgidjU1yvgzJFJROuLLkFn1qbs8e1M5SgsG75og30nGbKCk39ixYZOHNzVhtlFXO3hAbd8L71sBnem8t+HxC9w3SpggL1lUZCb+opfyuGhCkHFob1uLsGL93pZYaX9lXpwwpSCsnPDRWTazVIO+pmezMX3fi9FJNR43+JVdv80kP4CakJ9/XEKU+vfaoo97UpiSXlTA10tnY4xWsENJCWf+tjM/OGvQgD9N/inciKmAWceitew3i+BJHg60xxG1Vrc9vpGlFj3C1k+f0WBAZCg8pUgqA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:10:08.0940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c15865-9296-4cac-8f80-08def3c46be1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997605
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExMSBTYWx0ZWRfXwGxGWf8OtIsn
 xoN5RrImZRXlbBRKevcw5yhVtMGlTnIK5I62qnr7zyeqIKzIWv2hBS8N15dCEzAhAA9AGzVB+Mx
 yRYUX/WItr5yhKIKV/ZoGu/eyd/+NCmB+Hr+gpfoQixV9dwYSHZrkzBOOhr2iLovqid1Y4gQaoX
 F8wvZKdtBZG+egI9s99g/Cq0bbXVlpCKoozI5CR2EotgsrDoHlYgr8N/Zz8a4mE7H4uOCPBtWSH
 ZWAvadkNIQLicnlFMHwM/S2U4Ho6yPdUAWP/s8KJG6/pFZjbWBxAL81/cUJNu8SK6Pxb+v6NWwQ
 0GbPVyxCCLakg3Dgmsh0WPKFSZyWLjjm0vekaIx7RrSxq+hcI24uJE5qZ4raFzQDkHh4uQzCcTP
 aD1RCp4JAF4Q/wiXUFS0P1Vw8/TN1fajYskaWqQrqtIat2xXwnkYP9LFk44dTVeeO6HGYOUyao5
 w5X+0fD6z/5FffeazaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExMSBTYWx0ZWRfX7QHY35o+Bpr5
 VVJfjSXPbiDK6riwFHkVIFqPWl1nP9Vq0PC43rejDioOgRnTiiPkCjs4onENbnJuEYpxSkxoz4X
 yU7Rm4k1aqnpKz/BeGo/worhjtrdc5c=
X-Proofpoint-GUID: tGGRRXiOFWnxT0nssQBdyYisdNN-KShw
X-Proofpoint-ORIG-GUID: tGGRRXiOFWnxT0nssQBdyYisdNN-KShw
X-Authority-Analysis: v=2.4 cv=C+rZDwP+ c=1 sm=1 tr=0 ts=6a7495c3 cx=c_pps
 a=48c6PaPq82/B1OY+thwv9A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=XsU9Jn77uds3pkW7mnEA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060111
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Aug 2026 14:10:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20221

A per changes in oe-core [1][2], it is preferable to set ARCH and
UBOOT_ARCH directly instead of relying on a class.

[1] https://git.openembedded.org/openembedded-core/commit/?id=635f85b7b8ffe4bfd5f282a98bdf640aa037cde1
[2] https://git.openembedded.org/openembedded-core/commit/?id=bdcd04bbc5e205df16c0779388521db4041e7841

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


