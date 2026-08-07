Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A8FC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:02:22 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36923.1786082540071694564
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EFpWKDCv;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ioh5g0TQ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6770FxhY1467155;
	Fri, 7 Aug 2026 01:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zruCWt09cbABJ+oQdg5iykRhpEdxwFrbFIJc3nPzl
	zU=; b=EFpWKDCvceXvnKWYWFc57hJVpRgkj2lr+tIfricRanaPhLSkkUiBD6kkZ
	6lLV2kpu2ppLeIwgxQKrPSHxHAME089AUp26GSqiRuG3to5BVe59FH7zEpEGcn1K
	FnLAhs7TQcDaaQSCNilFXdaC2Kh5DKI08aJjgxu6JUDM06x9D/4rvWQxYfcI3KfA
	s4w56BkUw5M1FLCrzjOsnmQwuLUTTS4Ddf/sbw1yI0b6fbMdhb09hLz9QobbvhJi
	GWSQ5dt/n9tKWxMrCEldsHAqEMYb2jTbTHCcK73cScJIZEar0obBbGPYTMBlmLDA
	3LjoXbIQ68CZYDcGcwSLTMx69Kynw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010040.outbound.protection.outlook.com [52.101.201.40])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fvsruyenj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:02:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMR4JwJAepxTj3Xs6EzMLt3WiAq4OCoNMVG3Ss1jkqNQL/OEqtRjky0zs48KlORTkPuKbSZsqtb3oYy7hE64KtfxhhDzBF1Z6nSz1z54ME1uwr/Vcm/w8ifCAmdYc258zULF4ouKy92rnT5lITbVXQmvuyDnpT6hlewvKeJSn1vQLE2lzSknCBoxEC4wCFlfFeMAdLTgHiyOZLWqpLP2tsgXatDh/YCSc3ToocSVtIFihnG7T2Jrbo32SrisJlVtIQWSUK0FgecsOU9f2+3h1WkPl7ud+BWm5Zln35IjWOAc8+hNBXYSlIJ+yX6tOdoRCMmzrVZ8C6vYY7mBhBDKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zruCWt09cbABJ+oQdg5iykRhpEdxwFrbFIJc3nPzlzU=;
 b=u0qisTC58KOChWtdeTSY//wN51eJ8iWals/FExV6z8s6lS0cwKTnpJqwSeNiBtX2gREAC0q/2uCQSk7LzHZ4ODGG9UaAsLsUhd+bvkYy0R74wwLN84m0Kis/eu1I2uqnMjblcfEn6cNFs8o+AGxjex+r0V07ZhG2jfoU1qdb6Yfba8lpgsC5t4Bf2z3Vbd6owVfILFjdfhszBYs4fDfSnNZSOSS9eBxnviXavXlxDER/3yQe0udFX823051xR1culTfcCuBQxA30tcfGg4uVbiny+SA+IS/5TAKp/pXT/d7fE+0SkNrM/bApJ5cM6dnqC9S7aVBSDrbsmG65qk9a5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zruCWt09cbABJ+oQdg5iykRhpEdxwFrbFIJc3nPzlzU=;
 b=ioh5g0TQjuP9qfqPYeXpTl6e6bJRXaquziyjD0G89V7VvWJhDcl6fnez3D363phZQAo6izxzyLveU32+5S29kagbfAVfXV8XwmqQQal/6JYCobOQa2bfjUpHgR4BmLaMhBLgSCkYM5ggU36+gI3a9y1//5OZm9MqeYL0XjQqcX0=
Received: from CH0PR03CA0051.namprd03.prod.outlook.com (2603:10b6:610:b3::26)
 by SA1PR10MB6448.namprd10.prod.outlook.com (2603:10b6:806:29e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 06:02:14 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::8c) by CH0PR03CA0051.outlook.office365.com
 (2603:10b6:610:b3::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 06:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:02:14 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:02:12 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:02:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:02:12 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67761uDq508776;
	Fri, 7 Aug 2026 01:02:09 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH 4/4] recipes-ti: initramfs: add j722s CPSW proxy-client kernel modules to netsetup
Date: Fri, 7 Aug 2026 11:31:55 +0530
Message-ID: <20260807060155.1381364-5-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807060155.1381364-1-m-shah@ti.com>
References: <20260807060155.1381364-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|SA1PR10MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: cab74164-657e-4d1f-3dfb-08def4496dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	xlSavE+1Aujprvqc3j0nZJaaUKi4DsXPJfBO8dSb8kw1er7Lx0mNGeZwnNWwaWuUwpLEpiof+9LsSv+7O6VzlPQUQEF1oVwh+QySxgdFMQWEmACCUC5wyE796VbqepKimME0DaDO6GtgFikl+40nVnSXMla9k4wx1jqV+daaID4obUn/BtYv++0hjsHLcNjAU8SQYreOFkaax7Ikh2Bk0NQIWNaE6KIOWvjl2DxukGzNsnVbcJSpPq097RND4J133aLwyKCDl2shv190S+o+K+HM8J/hz0exqAqFmR63DYOMG9xnKC3VMS71NoQqC9mWgT8qcCGhboOSZ3j044uEsvdVbAImJFS5XcnbtiqxtLS4WqWwhZYojNfvpg0SiWhGDDFaThoKO29ACUweTA8wDt5jJUJdqOVvpUueghJ2ulK+R8B6Pv5ujjhCBc9C/NN08BcVbmN39z3faCgLLG34culOU2KhwloLY5wgskuGm4/S52yoeRbicLAW1JdwjgXXso9EFPwGI35/7i1x0Md0A5yTzOkptFvnaaQqc8b6efjpMjzkWj7j1YNw2zZqfLfyCY7+Wjh4Mn8AtFBxB+aWY1w8ydauWGo3f18SpmcqzZ2DQ2uhyJvSoXyWjQpcc8DWOvFDAOfUYjB0pz9G8AaaHYNfcY7erRxgK25Gc8MTWqxBJ/F7F8/7o8jg6EQ6uc8cizekC+zn8q7Lz9KebdgVDA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	P1vm5dLnHn9jrh58WMWQDQHuCyt21j5xsSA/8Csr8dsnhNz8+msg3n3n1GlsPgBVgk7R1oeMiCF8Jl4aW2W7x1NiqNZL5qq5OzLTfNsnMZiVJHFMTGdJcEU20n3CfAxdJS52Z9c47U0MdafMpOA8JqdzdF+2o6d8C1kp5osRQcVChGWXiD5zlcJ6HQ9yB2pJlc05Q0iVE/HnWbMPnegHzm1It3pC8/eURqQi2iNHBIWbvYIFcgPzA8ce4UELwpqKzEojAWTCtKB2lW+0zPAXRDTtty9GQfa+8ZOzNG/W5eeB91ZRH8fPnNWvZfGgIeA0ARd821MXtNulZC9sv0t9+ucDTYxBZhkBhLPfm2TziiK6NdzKiu/e0r/cKwjhVa7expoWlT5AYpPte966luhRmKTNVc1uhZJorC/RKOk1nutes8pssGLy45CcQ9ZK7v/T
X-Exchange-RoutingPolicyChecked: 
	WtXrZi2VOFLuqkQKDlW3CuqRAsQ/F4JhvFbWLoVU2WaetUQoRRl6aAVlJKBwDqlfwOJl8RnhqTUHRWdRQ8BXZGrc1GE9PZ7K0gG7+E/+xXlhz+b7wnBecNei2rD6y/sz21dYVRHv856DcYOEtT+2/jVZ2W0TUuxJL8wvYrA7/fdbuFohyM8AdjbhKJ7RTnwH2POJTjnOHd7mpEyPspmx10PN/HyKlQzqfhVv7OfI0hzRlI/m0wHY6t935CQj1dea3533vQkw1PpdoQj9ghaMwOLhcf2+LsDRveGibNnD172qf67CTxEk0cxbSqo7po+i8OHuTjAtXzmL5yW3dIFUqA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:02:14.3952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab74164-657e-4d1f-3dfb-08def4496dcb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6448
X-Proofpoint-GUID: H_s6umKG5FfvFGNPy_jhbl6Qc_JQktOu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0MiBTYWx0ZWRfXxIMeGnb2ycwy
 5QjjmsEf5NZo3p3NLiPEUYygYHWww9h6ibSZY1G8y6SPWJ4Z6h8fzYTlltnXfx6BTwCniCrj3f+
 t8XFKuM3RlKDtDhUmJu6mojE57Ap0tE=
X-Proofpoint-ORIG-GUID: H_s6umKG5FfvFGNPy_jhbl6Qc_JQktOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0MiBTYWx0ZWRfXwVpAAtU9ktB8
 1VVs7OyztjrFdqJUFvukUAVve6cKBQJ5PMW47M4Swblil6NPf16KMsa2DwVgocvK+s3STF9M2IP
 IvExktoIxcGXEIelOU8UW1dPA+hVaSfeIibPgI+CO1IGIvsxR4xhpqILUwrVJi4y3jIvUXuN+Zx
 h0YHGlJtKKRhzStV+D6PAsV16a4r/hRFZps07Xix3Fm2hWPNcI8gXldtOzGG3LwSi7FWso6E4YC
 mxVS5n/Houqc/lcmygycH5R3ckxrkRm4kyBOF4RBDw5niP9zoCYWKtEklNlX+FgJmzgpC2lOZJJ
 o9bAXeRskYKlVSQ9V4feoqD8VMEHC3USlsOqFn3u+I78BrolaUhd+nKC39R0lSLHJTcCc7Xqe7S
 GPAXWK0h3+Lp3l2lJqfsdqQkwPcwlxbt1Ms0JPTOOuRVQZus9mSD307oMz2OWSrSLrPn/3leL/G
 aaoTNXiKr+ewALcErfA==
X-Authority-Analysis: v=2.4 cv=GdcnWwXL c=1 sm=1 tr=0 ts=6a7574e9 cx=c_pps
 a=TO2QspbEOyvqwnNCDF3LgQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=7Gtq72NAoEWf9HPsqPkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070042
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:02:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20225

Add the CPSW proxy-client and remoteproc/rpmsg kernel modules needed
for NFS boot to work on j722s.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../initramfs/initramfs-module-netsetup_1.0.bb    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
index 6b465462..a10d98fa 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
@@ -28,3 +28,18 @@ RDEPENDS:${PN}:append:bsp-next = " \
     kernel-module-mdio-bitbang \
     kernel-module-phy-gmii-sel \
 "
+
+# CPSW proxy-client path: CPSW is owned by a remote core, Linux talks to it
+# over rpmsg/mailbox instead of driving the switch directly. Scoped to the
+# j722s SoC family specifically (not the bsp-ti-6_12 kernel branding) since
+# this is a chip-level hardware architecture, not something every K3 SoC on
+# this kernel necessarily builds modules for.
+RDEPENDS:${PN}:append:j722s = " \
+    kernel-module-ti-cpsw-proxy-client \
+    kernel-module-omap-mailbox \
+    kernel-module-ti-k3-dsp-remoteproc \
+    kernel-module-ti-k3-m4-remoteproc \
+    kernel-module-ti-k3-r5-remoteproc \
+    kernel-module-rpmsg-char \
+    kernel-module-rpmsg-ctrl \
+"
--
2.34.1


