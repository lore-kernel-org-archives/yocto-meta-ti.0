Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A64C79FA0
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:28:51 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3139.1788859725479696352
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 02:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NPcovRUI;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=s2H8Go2G;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6886PNbJ3415076
	for <meta-ti@lists.yoctoproject.org>; Tue, 8 Sep 2026 04:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=7syOdIP0CEpbE
	EnlS0Ty370Eu7SXYt3mX4tyLfMGc0U=; b=NPcovRUIPmgfJQQeQpFBRBlXvH4ex
	NAtTCr0CtAWMcFoH8vQGE4xQSCFKDDLSYxM+RMDZ9NDfx8cJjOKDwcKyXDLiKAp7
	5TTmnO534wGe6jt7Rqxa5sJv7PorlFsIYjq8farNJWkGv8AaDSh/t/2LowwW/Jps
	gjaERLB3TSm/S/yliNJ5uOa+3yJgsVZcLIOkGiW9jBOeWawVHmEBZvWrGs+BC1+z
	2RWBKlFGzrwwixllEPUp1dG5lpPF+GRzZw7yU6Mb/Vv6+g7FpeV9vOfSa808IchD
	82dqDikOL+RmOlokJNwLs21jMggD/rtQLDld1vqTpcpLTRxdil0NPDgvA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011037.outbound.protection.outlook.com [52.101.62.37])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ght65ppy6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 04:28:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaqnrmP6YZwsUd1PCvTGr2sQG+xUKFVbucp7/aHbNvHJvwTxYysgT2QZGHjtMD8cE/LOJb1TsZa7NXyfaht6YDpbFr8eEIbMVOvqkUSasJV+016iOhE9fEx6epj7t8lnWj28u+8vyjq7AYZSgLo/fn/rQiFbBIvVYsTwNmNoMNfPnViSucUYG+Slie2rpF+3jLfHo1icpSvfTz9fkYnvF1aaC+otGLVvvZ6/Bf5X/M2zvQUcrx9mNj7+F2YGbrNfZGZRUvUdCnXli3OStqVeRH1gcftRVildIxkGpjgbKu41KomljG29lBjnAeiFe/cZSTVXfb7V6edi5YL50KvSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7syOdIP0CEpbEEnlS0Ty370Eu7SXYt3mX4tyLfMGc0U=;
 b=A6iPGdd0oeDyDH21X6xosjDltnAEfioC9xb33uGJxnxc0rPf7K7cuwHIEYnfN1xCIeeyjcwp09JtGVEoy62aRB2ujJVhH89sH2YVNzT3G5a6rKZxOlgipzxoUU1hQYD5yuA0te57Yj2KvQt5TEPhbb7IFtTe7ovUmv8fffvdXUfQeQOziSQ/9t1Xj9YdfIvomYn1r8wUTJ8oyZbPg3AEVcXctelY/LpXqHZ864x4XcKhDc6CIttYikk+t5y223ggm5AT6WhN33vHOiWzJFFROSP8LwNbIGK0ZcXZJ9y0WxXW+sJx53xF/MAJ0eVr9Tq6+3xWEPQQd/YAb2LUsUbKtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7syOdIP0CEpbEEnlS0Ty370Eu7SXYt3mX4tyLfMGc0U=;
 b=s2H8Go2GqqLfgydJKr/qabDwsHAGANw8BbR8c5wjLMU+1MHiC7G0SNGmT8UE8SfW4H1v9BFHq1Q+TyihwzvmAo/vygRHxoAt4D/93pFbASpZrX3Dd90IOWaWZnWBZOzcJ/RNpaLV1IKaCCIgi81rSuPu4p4dSJZ+Y7HMJcFAEfo=
Received: from PH2PEPF0000385D.namprd17.prod.outlook.com (2603:10b6:518:1::6b)
 by SA1PR10MB5886.namprd10.prod.outlook.com (2603:10b6:806:232::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 09:28:39 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2a01:111:f403:c903::2) by PH2PEPF0000385D.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Tue, 8
 Sep 2026 09:28:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.1 via Frontend Transport; Tue, 8 Sep 2026 09:28:38 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 04:27:51 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 04:27:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 04:27:50 -0500
Received: from lalit-ti-241.dhcp.ti.com (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6889Rmwr2200400;
	Tue, 8 Sep 2026 04:27:48 -0500
From: Atharv Dubey <a-dubey@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <denys@ti.com>, <m-shah@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>,
        <a-dubey@ti.com>
Subject: [meta-ti][master][PATCH v3 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Tue, 8 Sep 2026 14:57:45 +0530
Message-ID: <20260908092747.4047556-1-a-dubey@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|SA1PR10MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c7f8f3-8942-4d49-ee88-08df0d8b9044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|18002099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ZMIqTrKeCgtlRbn3oezFZFHimFJFSlsMHCxINcm4GR52pXhItZQC8ddpQY79zhreWJ9jvoJWHtW3bVVPUXeajdL8+YvrWaE6KC2d3Wr8lRZQlqTjFv3kl0D/eN7CxYC/55NztGfQbK+8TdkNwhDoXocg4CPzSpOdVr+Cvys7hF9HMyxqtOl05JKJgLDB6vBxIyQXhzEvMIo1WhBU9/Uy+uQ8CqSBHP6lhAOuqTMW+x/qLFiQjP5++dNnnu+u1+TQrGIwIqKy2TxzUTUxCkTtuSng2CffpVWACWKuSY1BOPxrrPgeBjwyBNW2IhKUIgKzsjSgMqBxbOMjKf2AoRNNJWuZf7vOXvIHQAHZRm8F0VYzqTxirp+LB5U/r4/b37hBRCrDvb6RmuqXbPGTbi+TImK8Bd7vMvgVlpAxX380HHEiPCKLg577s7+Jikd/f4kfl22fGMR5qPJye5ihivG/NNpKw4+tEVJBsbklNvYoGfQFpjDsRQKQ1H3HxfBQ6Ys23xiJ75qnWt21QX3tr7IB81G1TnUd7oatr4wI5eTPBsEY8qCJ272VeO01oIq1T1Z0ce8tL4N7fn5XRyPS4HQNVGk799CuXPrxVzumlEKUgh0JpETf+7pRCZKmNO+ui8hwuqUUqUWVudmUVG/NeDeKAjRFUPD8+7tL1n9m19TxN1Whb1mN9VYslMnrwpFrWwaqYxImxGVFG4KS9Xp2eiCVeA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(18002099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wSy3rS6Bcwi+dFBOH3VtKXzPO45A1BtO27GD/UERsVIgkh0wBQoS18wo/RRGQeVYUW86cirWUUIsbWNbCuKYrvg/DZKYbBMTycPQ1eIsxRVSkSEvAgtS+0Yqk5m4gr0h1ZYiDUGPSFpVxlgIYT/gITykHE6IZlT+dzk5341IAsT6Ni6zMUqIl+Vhp6f+KeQfLxqoVEXvwU/eAn2HtMIF/4aOktFLO2eg1rrBoB7/fG6ENfbHT/+iWEWwBz4SDUKqFWFeO587jyYfnxPHG+6bfdtmcxWrwL2lf8livvrLAj1A+MbNkjNib+BjRTWfR8E0NY4wttzoKhGwDIyN8vPfUa2K/dXsLm2RFjX0uE5M1SBWDN8dEqFFmPlynBkeEX37vXUwirmkeaT2B4ET93Ps7w8HtPxtz7E0EXlOrbu/NEPPm4DLW1D3yGUppJRjlgI2
X-Exchange-RoutingPolicyChecked: 
	jxOVymWNs/p/stx+lYO3BcZpSH04Sjp99ZyqALOB+AHzCa/mnq7VpJID8a7P2ANXEFOvo41bquKiqL9n5/hlcYIVczpR6CHyC2QdZhR/gdTfKHCndmlvs0lbH+GXQ/S6oId8b1MuvpTy/FnG7MJf2E4Izo7lx8O5VftUvwOUGqpa64JHd6a84W11GeyEtWtOP58IZ8Jxlk4g/GZxq3iCIr35jLBmID04Zb6lKt0Cq9RGClk69qLhQSxpe2YKnPjP6f4j4CBqw1aX5ykmmV2OUZQtwiUm31QadOdpsu4pjFdqJnSOdXltOE+R7uRkfIOk6IP0PXAJWZ6n4/wqK3+uhA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:28:38.0575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c7f8f3-8942-4d49-ee88-08df0d8b9044
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5886
X-Proofpoint-GUID: 6kybMzVG3OXEDiMHQKReWvIL9dtxYefz
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a9fd54c cx=c_pps
 a=S2IqtmjrQAXuShkhhqPLog==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=cee2eanH1dOXLrEn6j4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX8KtOyx72Zyhm
 u7dN0X8bo8GPg3qg7Xn2qbPsXUeocWrxdXGwPh7aVjPaNTPVeZfJ+HavRhi7RhRDliASgbbp8qW
 TvtIHOk8sH8v1tJeeLhAmVdNVuJi84WaelnHSunHCWE/oUOaF7sz64bDdXQmaBSE1TpNLKWMU55
 MxLthWQWMZk7RQ5hr0ifrP/tj9/TkLDT6j2QD69qvPh2TwTtu4/xSdE1Ps2HBvdc8FxTKXtedXe
 uPr+1vD8aPfv9WFEw4SegATylj1mAJlCEne/q5CV8U6artNw4aKvKmo+hG3jxnSJ6qZ6ZxvlAmJ
 ez5h0mRPT0t9XcFgJzzBC67yPuNmcrM8IvBtIv7iDY9Cdqbhr3CCW0xsAReHkQVmWjLIokaYeEH
 vB+NJTm1I3udzvNf9/rnUk8KNUxGpu17EpPsF9f+iB54TjfUvUajh58Q4M399m1XLPN8JyiBTzi
 TWNrsRoLUnWkk5ko9Zg==
X-Proofpoint-ORIG-GUID: 6kybMzVG3OXEDiMHQKReWvIL9dtxYefz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5OSBTYWx0ZWRfX9RDVWm2cLlED
 gf5IKGQz0IZCPHbF6rxFzY0o1amO4qikyFhzUZvXej58eIjLcaLIeoXxeM/HT9kBQqmB7NGqlan
 yvkUk7zN2hjJAWOExXdQTUM5A7YdkBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080099
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 09:28:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20345

Add an optional dynamic layer enabling dm-verity block-level integrity
verification of the root filesystem for TI K3 platforms, using
meta-security's stock dm-verity mechanism as-is.

dm-verity hashes the rootfs at build time; at boot, a dedicated
initramfs loads the root hash and the kernel checks every block read
against it. Wires DM_VERITY_IMAGE/WKS_FILE for the K3 boot chain,
hooking do_image_wic instead of INITRAMFS_IMAGE to avoid a 3-way
circular dependency through kernel-fit-image.bbclass.

DM_VERITY_IMAGE selects which image recipe gets verity-enabled
(default arago-base-image, overridable in local.conf); all effects are
scoped to PN == DM_VERITY_IMAGE, so building any other image type is
unaffected. Only active when the "security" layer and dm-verity-upstream
feature are enabled.

Signed-off-by: Atharv Dubey <a-dubey@ti.com>

--- 
v3: 
 - Disabled the automount rules from udev-aragoconf,  
   so don't need the ignorelist for dm-verity.
v2:
 - Replaced hardcoded /dev/mmcblk1p2 with a PARTUUID  
---
 meta-ti-bsp/conf/machine/include/k3.inc       | 10 +++++++
 .../conf/include/dm-verity-upstream.inc       | 26 +++++++++++++++++++
 .../udev/udev-aragoconf_%.bbappend            |  5 ++++
 .../udev/udev-extraconf_%.bbappend            |  6 +++++
 meta-ti-bsp/files/wic/k3-verity.wks.in        |  5 ++++
 5 files changed, 52 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
 create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 2ebbfb9e..e23e0ead 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -64,3 +64,13 @@ FALCON_INCLUDE = ""
 FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"
 
 require ${FALCON_INCLUDE}
+
+# Upstream dm-verity path: meta-security's own dm-verity-img.bbclass +
+# dm-verity-image-initramfs, used as-is (build-time hashing). Only active
+# when the security layer is present and this feature is explicitly
+# requested -- see dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
+DISTRO_FEATURES[validitems] += "dm-verity-upstream"
+
+DM_VERITY_UPSTREAM_INCLUDE = "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc', '', d)}"
+
+require ${DM_VERITY_UPSTREAM_INCLUDE}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
new file mode 100644
index 00000000..fa0e86bc
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
@@ -0,0 +1,26 @@
+# Enables dm-verity to check the rootfs for tampering on TI K3 boards.
+DM_VERITY_IMAGE ?= "arago-base-image"
+DM_VERITY_IMAGE_TYPE = "ext4"
+IMAGE_CLASSES += "dm-verity-img"
+
+DM_VERITY_INITRAMFS_IMAGE = "dm-verity-image-initramfs"
+
+# Derive the root partition's UUID from MACHINE so everyone computes the same one.
+python () {
+    import uuid
+
+    if not d.getVar('DM_VERITY_ROOT_PARTUUID'):
+        d.setVar('DM_VERITY_ROOT_PARTUUID',
+                 str(uuid.uuid5(uuid.NAMESPACE_DNS, 'dm-verity-root-%s' % d.getVar('MACHINE'))))
+}
+
+python () {
+    if d.getVar('PN') != d.getVar('DM_VERITY_IMAGE'):
+        return
+
+    d.setVar('WKS_FILE', 'k3-verity.wks.in')
+    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
+    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE IMAGE_NAME_SUFFIX IMGDEPLOYDIR DM_VERITY_ROOT_PARTUUID')
+    d.appendVarFlag('do_image_wic', 'depends', ' %s:do_image_complete' % d.getVar('DM_VERITY_INITRAMFS_IMAGE'))
+    d.appendVar('IMAGE_BOOT_FILES', ' %s-%s.cpio.gz' % (d.getVar('DM_VERITY_INITRAMFS_IMAGE'), d.getVar('MACHINE')))
+}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend
new file mode 100644
index 00000000..d42d028e
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend
@@ -0,0 +1,5 @@
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'true', 'false', d)}; then
+        : > ${D}${libdir}/udev/rules.d/50-arago.rules
+    fi
+}
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
new file mode 100644
index 00000000..b8de76f8
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
@@ -0,0 +1,6 @@
+# Nothing should ever get auto-mounted under dm-verity, so just kill the automounter.
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'true', 'false', d)}; then
+        : > ${D}${sysconfdir}/udev/rules.d/automount.rules
+    fi
+}
diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/wic/k3-verity.wks.in
new file mode 100644
index 00000000..600a978f
--- /dev/null
+++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
@@ -0,0 +1,5 @@
+# Disk layout for a board that boots with dm-verity enabled.
+
+bootloader --timeout=3 --append="rootfstype=ext4 root=PARTUUID=${DM_VERITY_ROOT_PARTUUID} ${TI_WKS_BOOTLOADER_APPEND}"
+part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER},initrd=${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+part / --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" --align 1024 --uuid ${DM_VERITY_ROOT_PARTUUID}
-- 
2.34.1


