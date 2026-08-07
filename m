Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FAFC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:39:06 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37816.1786088340457741867
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 00:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=PeUyiBGo;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MQDE1YDZ;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6777bAFP2372541;
	Fri, 7 Aug 2026 02:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TNSx7nEDeRpJsSGHVJrcBhxtRoYMVsTgxcedo0Mti
	ow=; b=PeUyiBGoRV7EluFx8KKujJCs23dFwr9Sf5Pparryba9g0zFHTC8WYDdFR
	307KwJmUeDg5k8p+r1ED7uTSEyE2MlAXZt3oOqeWg6tAbql4IXKGE1XxDWw8EDd2
	29WCJhOqeeBK8BtMOvCNBvy1DiUfOJBA8m6xNw5WoBeO1TclHJaHrN4petXIwOgP
	1PNUgbZjAQ/brtBFckdlN+isE7snugdQawQsFsimltRuixTbKkbcv11hNdYFyHLT
	BK+Sp0iF0Xug84EW21aOBS3EU2GnSJlT0WhFDv1YMfmwvpSgjYDbvuB8z+TUwk82
	CfS7kXNsZw5IrQIH94k38yKEtfJLw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fwb4rr0cf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 02:38:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbECN5cnKWcoT+r77y4GIQBwXjiKClR5pYCY/A7nqaRAieFf82UChrqFVjn0qloj4PfBfN/wkZxrfHElquEch5aFNuPbuxlkidMSzwLNqEDIkSH1pDFM4PIzeO4nlrbDipqCvbBoLCQAlnWq/53v0xs7MQcroRLR/QIVDNLjPRoD3ZPYTRNEGpmQDnx3b6kOoY/uFJtaOc96BM7z5DDqwI/AX080+E+Ty0DY/xsVSWB+i83LUp/9IcWILO1u5MVE15NhiZgM33w+qwM6SCXP9Nghk1RdKj4vMkgqAGkrszVsKYiEiCgBGCKdfjc5Q6W6hDHrJgqmKy/pxpXPjQoolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNSx7nEDeRpJsSGHVJrcBhxtRoYMVsTgxcedo0Mtiow=;
 b=rW/Dif00Z/vDMEfBd04CkCVHIDWTp2wbeYrFBVnvRS659+BiBqS2MvZ1Vb8abrFGYaLcIVH1c2McLkH+IZOeeyw2Ht1j5xENGk27QjauTo0mbkYMKmdRG1NDZg6sv8oXtQw1X5v2vOB6S10/DIbaKwTg4HjFuAc8jh2O2cZWVuYVNWA6Zl0baUeJvU0xIbgOh+Bj4/qKmhZ4cCxcOh2EWNgjnkE11HdYXKy4L7QCGrWRkXtdLqNfOt2lCeWQlveHOfRkb2gEf37beTRHP5bjvbgtDbVbxNrwwQNIzZCNEBxLKLObHy9STLpkSJNuoihkWRxyhJsI5WltzzWmuDUMYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNSx7nEDeRpJsSGHVJrcBhxtRoYMVsTgxcedo0Mtiow=;
 b=MQDE1YDZSvW9Elt0e/fZrDSkSOmi7PpMxj4AOdEfe0u2TwxuhqYtTINbFgvzcLjx9XalWnMZlZkTRgHw9Yj8UlNdgwlof75I2atC8UB4Gt5IzYeyhr0C5hA0kergDG6IXAXmT2RBjcxmR7H7IE8N720D/kj3WUNFwQLpBPfoeSY=
Received: from BN9PR03CA0927.namprd03.prod.outlook.com (2603:10b6:408:107::32)
 by SJ5PPF1D8DEF14F.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::791) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 07:38:53 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::10) by BN9PR03CA0927.outlook.office365.com
 (2603:10b6:408:107::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 07:38:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 07:38:53 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:38:52 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:38:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 02:38:52 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6777ccMu647375;
	Fri, 7 Aug 2026 02:38:50 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH v3 4/4] initramfs-module-netsetup: add j722s CPSW proxy-client kernel modules
Date: Fri, 7 Aug 2026 13:08:37 +0530
Message-ID: <20260807073837.1394655-5-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807073837.1394655-1-m-shah@ti.com>
References: <20260807073837.1394655-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|SJ5PPF1D8DEF14F:EE_
X-MS-Office365-Filtering-Correlation-Id: f43253c0-87f9-4984-08af-08def456ee04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Im5YiekLlnvS59DF0WQxKYh05zfx3wd1MUA5Myspu9oX3QHTryCGru3mIpGu+n0e/uzbKJAxbQn2XhD0WBpxIR6Btl6Y8Ry9vVYh/oGiPm0XkBd3ogCZb/684lp1A6KggxL415M9k2KyvcpUKa0f7KCgC7QYxsvpzt+JOYY5OSr/0cgC+I5pYYtbiEvwzWHt34S6lzSfQk8S4/yPpUho8ixkM6itT0VwVNnI6eGEaEp/FlTqdMezPHlvpOjY548KX1kg1u0MG3MqhrmExJYfDR/DqGsbobI4vT9Jb9Wk5fjwg7OPkJDoRK/St5ohdW0Xw6YWehOhbPFI4KDjB2p+gfEAK57tVhGq9WEQu+bNE5kLITUj6z9zg0bPJweut2fIJUkgFS5D4hInlIzrIBtPonkJR8BMqHjdtEBkyV5StWHLrbps3D+J46LrEXm4h9aA4tDUTWixDBXBT2PP8yC+I8HwwjPROfc2t0xhlmyE8NLGBA3hWj3iz40y/kn72ffCtXgQnbv7r0iTWb4E8teYv7XGugvVqcKN4p28ijgDjpLnC58teHR4BHi/gOOrCLZVjDMv7K9tXSdzdv0Tyk/5L7fFZUvywYNRQq2p7j7Fi0Arh9BpvQOQs7SjjoXvpBNK3ThGRm5ItGKUrC3lVMVPk4eL9L3BjSPmEm/USWxDBrS4gRu0hKMqnW0M7a36mG6EatLPhorDQI5tvb+0T/Au3w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TUdxYqRGqhtd/8f0rAv+CcCTa4wknMbzyZIM3xI7Orh+vVfBEPWn1cbyaRauwX1QmpbTHAhQWcTIV30oCt8THBsiPHnYrwPMDrjl1SRDt7yISnM3XzPWsLBU01fYsvU2qSQjh31eRSkBWnLalqQ0MCyWvlRBYeaV1EXXy2i2VCWi8yhBOFlXoE4UjVYzmQA8iu/9tRXZ0Q4x2CuOJmGDMWNqO4Hvts0iV5WPFIrMBtJKGOMwG0+9hPXuWes6zBvC2B5T0vLVTE0TcHB7mu6eGyn21hVOdz3O3eyaCDnkmIF/m6f50THz5bTk2d1QA/OTlXKFL794MDCViR4TteYcOYQkdERk69WpYz9ByHjsMJ7iZ0YYmt+42x4SQMthkBfQ2VqhkQi8m9EZpgF9ou1+fpU6iEda2GUr++LEiEN8tPfDYabCQxO6EG6NQ2OmkaTr
X-Exchange-RoutingPolicyChecked: 
	keiE51xaaktqKPBnVjPEJHCIWjF3YjCeuOJIOUJ4ULtzuGhRg4ChYgbewCjZUxgvepJGIysFvW8JYT6A088wXXwnRkZrOUclq6ThweHQA9l3ePVm5O90oS6biRZAG8YzTa9HB/KlPeeA27rMBilbx8I0FwgjPdJb95bfyBQNtvYl7FI+fE/ApCSRPrxAvN919Q+ry0UrnQTgBh3BP8nGjqVEeMykNrVrKRZwEtm10tmPzfMVeQ3ZXfb8yQ6neLQWT5G3j3BTYeHxBs6/bsSykaZuoCGFgt4ZB7Xiet/SHwHsez3EFY1Lz2HqOzbQbH0i+X2j3God5gstZ538qG9GpQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:38:53.0105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f43253c0-87f9-4984-08af-08def456ee04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1D8DEF14F
X-Authority-Analysis: v=2.4 cv=LI9WhpW9 c=1 sm=1 tr=0 ts=6a758b92 cx=c_pps
 a=UGDxSQ6JIm3CXF+tY3HRSA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=7Gtq72NAoEWf9HPsqPkA:9
X-Proofpoint-GUID: 44Cn1sAXlD0B1ftWInvscUbuAA6rlk84
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfX1oSrxkUAilVO
 7f+44H9NmLW3Y8IsnKjqF/5js/gXuhDroGd9v6QdQoVGaicIE86Y4ywlPAPxoj8DylPBe4aJ7LF
 mwLBmqiNd8r/7m08RIdmVdhBR3cv4W9xyecl/7RMiFVx1BhpUjTt0LpMD42q0C8F0XnML6tyulP
 cMsxSTSG+dKUtY0+cpxsTWEL3rOWCycw/9Gj8bfH356F4N/ShqOscRxsYIL/LTSqSO6yzQHeIF5
 FhgwTyC3OuZ5vVVZswqbpzYZUkhJxlxqQj7rZyCLtIGgHhiKgr1MFSwAwaIorc9r35A185HtWZD
 458d0/iUu7u/2UGCrYdoUsDnRVXbIcXf6+4uGXBN8tbvIhA/OPLVbhjBt+Fw6IcvS1JDzHleN7a
 nmktiW6lq9MR2ImT90L2bDv1dp72ODHO0/pI2l0ahrzleRoi0wGY1TuypJf+/8K6BXck1prpMNS
 vyOcmNq33pMfNAolVRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfXwPQGMdK8HDVk
 CP+sFJE1VyOu0OVh7tA0aa64NyIKZrNSPrVRf3XVYmPrPPawoglsbjWTNsCLxeIRhOm9fgE0rbK
 ylw9meu1CwSX8JaH5/8w3udBuaAPilM=
X-Proofpoint-ORIG-GUID: 44Cn1sAXlD0B1ftWInvscUbuAA6rlk84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 07:39:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20237

Add the CPSW proxy-client and remoteproc/rpmsg kernel modules needed
for NFS boot to work on j722s.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
v2: Simplified subject line and commit message

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


