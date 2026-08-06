Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E460AC56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 14:10:17 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20719.1786025412888244546
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 07:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=h4zc0CCk;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=n6Gqp83Y;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 676BpH2f4152874;
	Thu, 6 Aug 2026 09:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ggsc3pZmOx84b
	LIhouFbpTS8dX2vSTePvp7lMlsY2Qo=; b=h4zc0CCkw1mTDnImdLX4zev08ldy2
	gIcfx14czVZtHGxRyDOWVl4Sp13PNnxucStuLuLBkAj+VLtwZiil/GVk6yzvumnE
	DHtzKToGbQ8+ZfqdF3BNYGkqzaAQeIFqYbSw3FHUNm0e31mRFFp9FMhGLRFKhQfy
	jnL7BCYApdrxYPfmsdy2nDTrIJl0si22spgW09OPA6ud6i0KC4goHHQo1pRMdqfz
	DeBapl7ALIU+v5LkBcdYkZrWmkvFlMAjwfD4DWLsM2y5kTv/UixMNJlN0GJTA91e
	HFkDQF0eZmC6K0if/kXV21ZxuJAyHCQ8UBrn90N+n7ONHRTJFlU/xK7Dw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011031.outbound.protection.outlook.com [52.101.57.31])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fvsrus0up-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 09:10:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDo8yq1LHQ+t0TfTWSWBTmfQmJUh8qyhPSX8VRJvljQxhqi1zHnFz/qFpahOTdMtfiCa6VUnNkryildDimXQxI0ME1Blmj5XXAE+g0LpgsTmfFO/cyf5P93L+uFz4rVhoHhKlrzqklflR6e9dh1StBeG+3YqnEKvdwRrymEAoonCsmYtgKbyNhGGkYeEowd2SpbHpLN7qnJLeQNTHnDiO/ksU3okLkeiI0tI/zmVFkk8+gChaOf/sKKvTYM1ZlQlxJQCEsUQrQ8gcMNXiQccgcgnlHKroZsR21vMaoTY3pLtFbyQwFXQUMtEWYLJsRs93hcr/0q/N8s678vyvIYX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggsc3pZmOx84bLIhouFbpTS8dX2vSTePvp7lMlsY2Qo=;
 b=nypFWBL9f18RhzXdzp0Xz5pdGe5YCzL/oAFYs0d3RQaYfhm+HFZZGZLRivJjX4MuspJqHp4DEA8gN6edvwVBH6uPTCRaRFVcXpoZfAYZRxAm5fCvpJVZVc1in5UyC3EvzHe9Y2pUpo0PwdpJjOy9LYdxW/mGIpOov0DrFoiG7wKFZMqIksxqq0DY4/Dgh1qfHJsVRR7qqKH55hykxsCZJp8oekBzS3oEYgXUV97QB6fcvSEn1cXrigPyK94h1uyPU/MYlbDyRVXYhh43FqJpTC+SQu4KeaISAhUC1GnLLMdDJw0zW2UHdAICi2SUWZvwHKe9Lw35p/3UWyapPQbC6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggsc3pZmOx84bLIhouFbpTS8dX2vSTePvp7lMlsY2Qo=;
 b=n6Gqp83Y7h70luZ66ZOnsEml1jO2RCs23ixxoWL00urFUOMcJtp5AZ2BZTHao2PYXSUjFZ7Tw8iASPCiAlxCL8zyZwse2p7OMlCPhn7nG9OprUIBtMSoXr/pFzkxyTMwdhWwhb6zob8ZZQE9AJhgZeXT0FOwNpclW/P1mjQN6SQ=
Received: from CH0PR03CA0353.namprd03.prod.outlook.com (2603:10b6:610:11a::15)
 by LV8PR10MB7773.namprd10.prod.outlook.com (2603:10b6:408:1e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 14:10:06 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::1c) by CH0PR03CA0353.outlook.office365.com
 (2603:10b6:610:11a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Thu, 6
 Aug 2026 14:10:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 14:10:04 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 09:10:03 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 09:10:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 09:10:03 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 676EA3Ra3450017;
	Thu, 6 Aug 2026 09:10:03 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wrynL-0000000BeCY-2PlW;
	Thu, 06 Aug 2026 09:10:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 1/3] kernel_legacyhs: Adapt to recent changes in oe-core
Date: Thu, 6 Aug 2026 09:10:01 -0500
Message-ID: <20260806141003.2776131-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|LV8PR10MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac622ce-5732-4cf3-b9a9-08def3c469eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	c/wVXKGlVs2hizJABkO2PErtVusc6Tr3na5FMfjtuybVu5EHdGPKZl+3epR4wjVrQyqpzh+4fBO2Cfo36hxY8EcPYMpYrlP2KU1RBJ0fl6aBb0WlSBlfHDVs9W6RdNL6HFjNhGffzOfgQ/qq7/ZQZAvNkPBuNGGYRjpNuSagHB33dG7ClX3Zf8BuznPmTjEeRcFpF5dRjJgCYo7bF/glmTBSjEGOk0wWWhplhk2hnwNUYHU9X4W6DkY0aEug5SYgE/DPfg4up0NFDfufiqmt8gdMq7WbuRDB5fXqOeaf59MIsCiTxC4r0xpXuTt86/kwfUSixE67mPb+e6wh6gaFRbFWXQ7fUMkIgeR3ZfiOoPPD+/ZJjPfU3uMjIpTasp6D+8mdZVc6YDVJuklMXHOuDi+2qY+vSGD5zLfHu/uI9+fJCBzyjEBk5geReJQtjaSe7TW5GNHPtGe9IsjSTBBZB0zWdNXYfTQKIez/6EBmVeXUZFpVfcqDurPwhE9POEpksol3iiuMevb4jNsmtrjVcHHnKCisU9xsH7oIeC3+iAnk+H1BV6C0lTSsJWqfcfYSsC6GR64/GdTGPuIdgxF/SmEwlaGoY0gZHKh+Td9U5rDQzRLvJB62CiYQ0aZFZ/wQSVgz+ZnhIwV0Xpy0hJPqA9E5GKxqmMRQil8qX1PKaXCCbFm9AsrVDUt06gpd+6LbKs9fRC3IFhkoWJRV3cccBQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	g6gLVyDNW3XX1JSfIdDmSjemk2lRlHFVsotevdrgcfstRvuxDuSU0Z3WKvaQP+d4BCp7h4+PU95ph261PE+xococCUmbBfgz37yld1N85KeOuNDpnLQI1vFl0hFxmjlCVviNoauPsplvF56WApub95VLKucmo0PERp/7r4g3r0dZMwmitEzHOG+/f/by3V76rbzh3JFBYCuTBQjrKimAKBNfkIGYD0ATwPiRI3VrMhB+CThylRKe1pvYkIM/V1czBG4/OVfWkRRE/pa6He0i4NUcf1n5nq8cmYi5NW0j7U1qggf2teh6QMFz+svMTxgHD0ezgvIPIktU5LbtMpHmfZwr7kqdvhaF88fxhOFz/d4O4EOMqQscWzOR8fPgUEyOOLxDiERulo9rUFbXnuDTsViE2obc9Bc7Lr9hp/sZNIkj0DasKlcMssKmIrFEO9GI
X-Exchange-RoutingPolicyChecked: 
	iNfcaguBc2ILJ9dTGxOyaBZKcb3ehtyorVWdDloY0ClkLy+ZfTSWot0GAxx9zbq5BZ1u+5YqOjH4VsWmSIv6f/6PJHXQMXtAerTaR8iTCYyl6wOouAU2sn20lom8tVEN4pPw0d/Ep56uGSMB+z+/ReRMdfFs/8c04N/iLP2gYhCVpsOKbsHZT9Et6d3MdO/nlsE1EkaHazQDm0+D2+VGswoffnWTJVjUgJeSMQYRLKWN31uvdaDSKxaHadu0QWPccoR0idhgRZBMg2e82aaMcEQzCT6PVRsXnLsbVh192KTaisr1FDk/XIgWfjBuUOfShVO/mpkHoEjbx1/gxFlUXA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 14:10:04.8682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac622ce-5732-4cf3-b9a9-08def3c469eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7773
X-Proofpoint-GUID: sLpc6j346704oCfs6ro4IOPrl-BROMqk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExMSBTYWx0ZWRfX9IRkEuGN1ylQ
 H7DQSJpTm7q0mBwIkcfECkxxO0kfYXQ8OuMsIOUNZFR9bBm1vsGtWS/VYmlhw9tN2oEAVn2Bg+y
 gWonL/nIAegfg3yr1hZnZ5T9ZPPXXCM=
X-Proofpoint-ORIG-GUID: sLpc6j346704oCfs6ro4IOPrl-BROMqk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExMSBTYWx0ZWRfXzf1HQnQREJgJ
 klwERCaXW4oayvwtVpLmJvjV8IBr7CUOXoNC4+C42z4vYBilsvA/jTNMPmH+0/5zMF5QvcRBXfr
 VFSQFse3SnA9rc82u/PfpgHnwh/RXIRarG+9BFL+1SMtCSC3zOwcpRXWM4dlB7P+Kj+URhBgEyj
 Ruy+mTLg9crkYLr8LIC40jP2Hjcf8lRxNGap/rUkPM5crcjJYJ8ZwyEDuW6yJxfxzyBjmwn1pgB
 AMezqvxkr1SW4CNQh0N9vk2C4uZ51LhmFD13oO1JvQ6atZ06FAGnxf2zwOsDzr669wNH0DO2H/Z
 x6fdnw1sm4rE2RCoipEPug2gO1azkReM3ms+vaEL56aTPAr9cpyGRTYJH3LiFlhZ+/UqlvNnn6q
 9ka2gqnV80exok7v0NFnpMtZy5iEK3YeiNK2S6h6dAdd22/ndq++4dYK4jiLY03lVkMKbaFSs27
 oENYxuVZQnepGOZXtzw==
X-Authority-Analysis: v=2.4 cv=GdcnWwXL c=1 sm=1 tr=0 ts=6a7495c2 cx=c_pps
 a=r1suf/lb2duQPz5POPReZg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=VBIRw330hYp_GVHZU5cA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060111
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Aug 2026 14:10:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20219

Three recent changes in oe-core [1], [2] and [3] have moved around
various things with the kernel classes.  Since we have our own copy
of the old kernel class we need to adapt to the changes.

[1] https://git.openembedded.org/openembedded-core/commit/?id=945f3faa4909b226996eff62bf55fa586a5279fa
[2] https://git.openembedded.org/openembedded-core/commit/?id=635f85b7b8ffe4bfd5f282a98bdf640aa037cde1
[3] https://git.openembedded.org/openembedded-core/commit/?id=06057ac24f74ce5de74dfc7b479a1e2c796bcdcd

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Some additional changes from testing and further looking at the
    upstream patch series changes.

 meta-ti-bsp/classes/kernel_legacyhs.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/classes/kernel_legacyhs.bbclass b/meta-ti-bsp/classes/kernel_legacyhs.bbclass
index f2b79b1a..6655ed02 100644
--- a/meta-ti-bsp/classes/kernel_legacyhs.bbclass
+++ b/meta-ti-bsp/classes/kernel_legacyhs.bbclass
@@ -4,7 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit linux-kernel-base kernel-module-split
+inherit kernel-arch kernel-module-split
+
+ARCH = "${@oe.kernel.map_kernel_arch(d)}"
 
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


