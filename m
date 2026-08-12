Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55FAC5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 21:49:54 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6203.1786571389770357824
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Aug 2026 14:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EyaHfgTL;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=DJbEQBQg;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67CJxa371049335;
	Wed, 12 Aug 2026 16:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=8GL6NnxzoodEO
	A/SUwo2sCV/fpPb9+1U/CgwP5oDntY=; b=EyaHfgTLK54xuGV1kz4UlgiCLPoNP
	YrP8iG06sdxqUCIQLq23re/jqqP6fKQj45hqdX+LYLuACzWcf03O/lyvl9X3ZVsv
	FgBzT3jZBYToFTJyPfAJd7nhRDeBj7/s6bx8TLu52Z5XmW8w/rfA7UTG9L0XknVM
	3d5dG5ZgDEzYFIvKyrh8DWso60u1OWWKVUWuRlsWnYurgLgNYXBu9lY8Jl2jNy3W
	lxEMbqSvdifMwqCqO9dpwEigddPhGc2mTUamX8gbQVWpMEnG2ULcZkS7rI+Z4BD3
	xc9+Vdr2d5tpbb0OjmOP/fYgPAc4Z9UTs1WtRcSr0rb5sXx36Nh76I0YQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g0d0cqc81-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 16:49:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6F2i41U4utfmKdYI2HLnuHs4uSIVPCiHbn1Y2uqCho4dNjCPJYw2B1wfg645t9feOHJRitHIEUS7Qxw/cIEk5vgEE4nRDQNZh3KAADkmlZfHWaxZTQhM8dY5O83Zn9lDhXCjJTCLdhDYWCI/0y7Hb9mWwjAiMSoqOlI+3Lm/bY0/sEmnuZ1cr+C9SGU9vErmX1FBW6LgXXq2sntW8p/08QNY+DMdLh1vvvUL6v+P1ROahWT7sbpnHA1YcIabUnWYJEo9ecLoBl3DIMiixlFfAcAnUhNwrlqXss5RuvGKj7WMmQXvgZBwzzBgXPc4FaOKSRJt1YPH48wKxkqR2Y7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GL6NnxzoodEOA/SUwo2sCV/fpPb9+1U/CgwP5oDntY=;
 b=zWhSJwykz0NZ6MoNbguAaEBH7JJaQ+kNWZz8rgmM4E+VI4xps/lD4LAc8eevPA2x/Ino80BnKnzp8KcpxId9sUGF4ZrPOG5wcvbXtIpVgA0Fs669k8LBzchLn6uslxlKDfc1ZkrrqKRUffBp7SHkSzxA08rDT11I9snZXc9lnv5pEJiN2tmBRhL4WM17PdK9vp0jAA664L3xCBep2dVHzluWkTn0JhNqjhRy/nEcNb9Xq0RsBdzgC0N83cZjq3jWoJG0YLkVdFcVaJJtJfZaxQAHhkVSrRvpLa/fznEcWr4pzdonNDcjCaVQ+QcVZ2+ezp4T8SPyWLF1x2Il4JVbxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GL6NnxzoodEOA/SUwo2sCV/fpPb9+1U/CgwP5oDntY=;
 b=DJbEQBQgmTwgi6MR51OG0z0imNM2QdyNcCWdf0BPHMUF+5TPcOiSMtTKAAw70Ny92CcAivnKNMhsZkCt6GnHlv5c6h6EZf1WNX54eeLtNfs7juQfLggVroSxTFVKjUpw5BpKjSS/vMObpmOWzgZ2FqyjzHzn7Hx+bXckcdfqa3I=
Received: from BN9PR03CA0591.namprd03.prod.outlook.com (2603:10b6:408:10d::26)
 by DS0PR10MB7432.namprd10.prod.outlook.com (2603:10b6:8:155::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 21:49:43 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::24) by BN9PR03CA0591.outlook.office365.com
 (2603:10b6:408:10d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Wed,
 12 Aug 2026 21:49:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 12 Aug 2026 21:49:42 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 16:49:21 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 12 Aug
 2026 16:49:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 12 Aug 2026 16:49:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67CLnKwv2824865;
	Wed, 12 Aug 2026 16:49:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wuGp6-0000000FGuy-2V3Y;
	Wed, 12 Aug 2026 16:49:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 1/3] kernel_legacyhs: Adapt to recent changes in oe-core
Date: Wed, 12 Aug 2026 16:49:18 -0500
Message-ID: <20260812214920.3639941-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|DS0PR10MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: de715f8d-f70e-4eeb-4d0d-08def8bb9daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|18002099003|13003099007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	f74/WUXFYjS05LVlk4JkTszybwoIiO0ODB2Ma00huP8HYpmaScGRKAuqiVUGQAi/eZOYLT1lYyXC0o/h1xQT9xN69wze9vjqnt1XeED2yn9by2aSq8oCkihi7CdiOTpYYuR+2JZC714HtgoNK+NLEPFUhRceAILHnyt08uyeNP6LkBIukYUOJIGRSV20LUCQ9Lsm2GNdG+80LzYMko7pZ2P1EWFKmS86S7nx+9fsbjzZ3+6+7/1Wipha7Gxw6YoNbT+6iGcPxyR1SUC0Pr2nZIt40CEzwaFOhXBRQdLLnX6zvqnGn9ZwT8J6Q/61VBYVqIoyCOvGYlc2lXJA/EtS8HBKaxMjs4G22Zc2oeLVg8QQ43Iky7C4UxDeZQs9HL+c4R41uSa+3MvI6KKJd3yaWeYeg/tSH8EmwTt3ml4jAX05R5tCwtCuu9QLp1AEmlLKMLdJ4a3mVOr2J8uvdk+di/x+fXjaFhrhNHFuBb76WAu3xNkLEWRkCnnVZcPww7c29gc2PnZr0G3AYKe2MwZCwkF64ZN93M36rV+BU9OYlAHHASQzPHMj1pzwESQzrTkDwuNiCkNKLyON2lx/RwWdiNmkRSnJi2U8ZdCm4TCwJczE1FjhDCjcMy1yAQVXxRZDIJRqAccM4A+ZN7BfoqGBceM4YPAV+DNdQeyrB4Dv5bl8dbdX9AbOIeaMnjG4S3FEogpqXytKwKYGJVYTvNBp/A==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(18002099003)(13003099007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	f6mayr+DNwoIyjd0CqKhr3R+tto7Phswb/sA2UIIg4pG3wTxeslFZgWxiRqg/cNwCa8r3itSb5Iw1MpuQAGW4pInMWnJKAkTXbVGB90p+zUtcvFFehmVIvK5GA8FzpL8AZW/NBKvVTJd48AokdWAZ8fMmOZ1ANpZgvtDWrsfDQbfUO554ZnkHF3I7W56GJSV+6Xnk4oCbJnW7RiGFAAQBiJ5OAFzYBlljmNey4vmUJsoxMpDHc9CMp70aiOYgu78IdY97xSO3uUT1YzzPZz1ErcbeCC9jaNg6bZIEj3fG+xCHiVTMudfrhyj4L2Zy1EZL0Z309tzp7Fh08jImxszI76Y2Z7fVPZyz0CCfUjRyeNBNKA/dh8E/EI3x3jI5KMgyK+nG6JZ9QHgK9AtMlTDvEO4iICYZ9pAEFnQLXHAeimZyABg1mhI/19k76wl9ekL
X-Exchange-RoutingPolicyChecked: 
	KNGNbviUv1EFJTLWTPqEnhB6SlhPCMGZBliTUG06WNV2fK8pmTziXcTtC/21YGgiSIWrS8sK1k5v3FXQDH6SH5OPogaJ5E+t0FtuZal1fUJ/VD7ri8Q3OmV3gG7SYUOcbwrldi5KfT9O5wMTOeg1vr5o2rkIH1A15n3xwSvWtKhHweR4UlT0CtmwZiIi9JcG8vGdF6mL7F/FYZXOItAKCCYUsXJHXFhkdkxJOiPx8NuRquuFNdLeBabWDHXomOekLoG/5i8vIBZurba3jmQwKxLooZXeAE/Qo5B8e4NWXcsDQVQX71+CIuxdjMDZvKfA8CSgltuXJTvPsN2WbSldxQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 21:49:42.0029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de715f8d-f70e-4eeb-4d0d-08def8bb9daf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7432
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE3NiBTYWx0ZWRfX3GIXFr9eXdJN
 QXcFo0J2022m5O9SVWvEyf2qhnYb3gx1un1v1KxvVGbNe3ZJxZzm9JFZ8idBHuPqfKqPhoEA544
 5wBKf+xYYSwwo03Skl/E7wji/qCUSiA=
X-Proofpoint-ORIG-GUID: N7spLi3am41oq8ejr5SIyWb86nrRTFmr
X-Proofpoint-GUID: N7spLi3am41oq8ejr5SIyWb86nrRTFmr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE3NiBTYWx0ZWRfXw7yCNeFC1x/l
 lS24iiN5Fxz9xnBaonelIRXhmD0R6kncJaTb891ile882/uBmzq5lCABg2apXCQe34MPg1fDjwq
 qek/ZNxzieYsLgktNMTwAvIQFIRPw5ouaDBJiAbY5CcsRr+jbCTc19HfLqYFZ9lAgjPOr+fIPYF
 U8rczbdPGsy7eXM3KuTATfkLaVD0kIA1G8UGAAx2EIg5sHw+iaRJthOZxelVUidtzyfI1dG408W
 +d3o35WNayvtD359+YtI5CmwkPYTSaLQyvloBXLjm3qQJ7qDXY6ETQeWVCTe+58jDwWX0NpQlEy
 2x/sVwY822zladQp9Ca4ypx66sddOrEw2W3s8hJqw6zqDDLRK0nJYl/RACF870VbR1b9v9x4Ng1
 6gerFrnrkMu7Hzn3/gNwALP++jfne5tQK+u0SHJg3r9MK1gNYDIYJmNn0syddL0HF78T+5umQKP
 f2PgjzSfDq4lE/ou3Mg==
X-Authority-Analysis: v=2.4 cv=Y+DIdBeN c=1 sm=1 tr=0 ts=6a7cea7c cx=c_pps
 a=Y7Q6ByIND0QZLGHO7LoGYQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=VBIRw330hYp_GVHZU5cA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120176
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Aug 2026 21:49:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20259

Three recent changes in oe-core [1], [2] and [3] have moved around
various things with the kernel classes.  Since we have our own copy
of the old kernel class we need to adapt to the changes.

[1] https://git.openembedded.org/openembedded-core/commit/?id=945f3faa4909b226996eff62bf55fa586a5279fa
[2] https://git.openembedded.org/openembedded-core/commit/?id=635f85b7b8ffe4bfd5f282a98bdf640aa037cde1
[3] https://git.openembedded.org/openembedded-core/commit/?id=06057ac24f74ce5de74dfc7b479a1e2c796bcdcd

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Add export to the ARCH = assignment.
v2: Some additional changes from testing and further looking at the
    upstream patch series changes.

 meta-ti-bsp/classes/kernel_legacyhs.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/classes/kernel_legacyhs.bbclass b/meta-ti-bsp/classes/kernel_legacyhs.bbclass
index f2b79b1a..56130047 100644
--- a/meta-ti-bsp/classes/kernel_legacyhs.bbclass
+++ b/meta-ti-bsp/classes/kernel_legacyhs.bbclass
@@ -4,7 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit linux-kernel-base kernel-module-split
+inherit kernel-arch kernel-module-split
+
+export ARCH = "${@oe.kernel.map_kernel_arch(d)}"
 
 COMPATIBLE_HOST = ".*-linux"
 
@@ -227,7 +229,7 @@ KERNEL_DTBVENDORED ?= "0"
 #
 # configuration
 #
-KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
+KERNEL_VERSION = "${@oe.kernel.get_version_headers('${B}')}"
 
 # kernels are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -660,7 +662,7 @@ KERNEL_LOCALVERSION ??= ""
 #
 # Note: This class saves the value of localversion to a file
 # so other recipes like make-mod-scripts can restore it via the
-# helper function get_kernellocalversion_file
+# helper function oe.kernel.get_localversion_file
 export LOCALVERSION = "${KERNEL_LOCALVERSION}"
 
 kernel_legacyhs_do_configure() {
-- 
2.43.0


