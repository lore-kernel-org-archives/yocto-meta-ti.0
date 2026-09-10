Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EEDC79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 00:58:58 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3429.1789001933153621918
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 17:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Fgv0OSQN;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=GFUZhXCB;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689M9scl1486130;
	Wed, 9 Sep 2026 19:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=o8vu4JBfts3/6SclRbDII5buAmv/IgfOtBv4dwNzx
	sk=; b=Fgv0OSQNt7YIISVxrAfKryMXXO5pctJVHSX6y82pNK8CTW0XYzc+WwUtV
	ehm+loi9trmi0r8Dc0JK1zBLAjTX58VZp7b5RYhKBxq05ZS3o+JAESrvK3DFT/bm
	h0VKz2OFa6MqTMrpy831MAd4n/GMhGIpWF3KRdW+NUcPjCzWd3nk+xyhX+ADYqOz
	Iq0KSqnIdmBjs253TWSPfhwl9eWDDQ66xcSNiLyF78YXhlR5uUczf6khyu6nwS8H
	QAHuYuf6qJ0FFbNRjW/D6tTJyP6Y97pSXUzyIjG4bIYUIlThiLYYg+Ijvam/qqfb
	5jYzM+t1l3TrH+wczih1JOEUQhU0A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkcxesyp3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 19:58:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5Osf/wS8kwYqmAgJUQDFdJlgel9YlLEX6hktg2Jzx10ptHUnrw8wuEq0Q2H8i2PYVSvAOBwLulD8ymcrrBDtQoxUzd2d4smFCre8JoPZgiIKRPPMHlN7Bmpeia3GffCfjdJXrdRDg4G8I5XD2pwj3xKIKwe1MHIOSUmdkjTBrWrVWzpe/OwcBCp3sS6Bi0vDfgNF42ZyXn5IE7MyQJ18Xluex4+PF4sxDCSeXKRkKReYblwZG0t5+IT1CNjxGAKOjkZmUMuvMu7OI0EusHTw9iRcz0/sK0rvxT2PYCo6Ciw+4M27bHQCZNZkO8IQYmtIhL/n/4iOFnDTVLFd3s1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8vu4JBfts3/6SclRbDII5buAmv/IgfOtBv4dwNzxsk=;
 b=q74lSV9/qqfziYKjvGL/NF6q/jEjia8PxVuNSixiZoqTC41q5BDGCA3Aeo4lraJRjQfJwGT+rUs42FaFt5VZnXmTPSpXSk894PvkJt24iEZBWy+2kOcGUUG1gPyqPjdbMsCyqabYe9qoBuC913akEPaAeyyyu7H/O4hJxiOLJZydnm4lIXMThJtgX+WxMno7dbrULF4M3Cv4Hmlju9JO12t2cHRstZpvnfIwPSSSBxCMH2uKFtVp2yHvejoDMY9ncM6KSk+8p7NtoLcv4ipBp/oj3lZih0pVrVH2ITuo8hsrNwMtsWRMZzpmPq+k6oQ3JjCL9q4q82hXsV75Op2UJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8vu4JBfts3/6SclRbDII5buAmv/IgfOtBv4dwNzxsk=;
 b=GFUZhXCB3redEAJQ42d3Aj2qujJ67zDoR4sCV9XIePAwNp4TRvjZbbLTXqAS9dQhVhA6QpKU3veKbAtVODCqxaDRQfe21jRkj8MeoEKEJpMhWnPhLibUnMS2KeLAYUBXzSAfb3x7AtFNlYut130zYtjXpJ5fSFCeBcKoUWOjYUY=
Received: from BN9PR03CA0899.namprd03.prod.outlook.com (2603:10b6:408:13c::34)
 by DS0PR10MB7272.namprd10.prod.outlook.com (2603:10b6:8:f7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.5; Thu, 10 Sep 2026 00:58:44 +0000
Received: from BN3PEPF00022BBD.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::a7) by BN9PR03CA0899.outlook.office365.com
 (2603:10b6:408:13c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 00:58:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BBD.mail.protection.outlook.com (10.167.248.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 00:58:43 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:22 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 19:58:22 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A0wMnK2306722;
	Wed, 9 Sep 2026 19:58:22 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4T7O-0000000GEx0-0iB1;
	Wed, 09 Sep 2026 19:58:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 5/5] mesa-pvr: Fix for building with new LLVM version
Date: Wed, 9 Sep 2026 19:58:20 -0500
Message-ID: <20260910005822.3867633-5-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910005822.3867633-1-reatmon@ti.com>
References: <20260910005822.3867633-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBD:EE_|DS0PR10MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 310ff5b0-3ad4-44d8-a91c-08df0ed6a98c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|56012099006|13003099007|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ugb16BKco8or66CcooVKkbGPmoaZklarr5pWeXsTWEYSRccjmISIf5nSNCrYyM8eNIuV92cB6pYxrBlA20E9KEqVp1y6L+bN/KXYcFZpscTsIkOh1HNzl8X/yBK/56Os2qqcnuKRdq/bMu7OXr63knCxGuKan+ICtR1TlaIxAWuPw8bTF2Xamnjwqhj+zeyDDqn2+V8BwLx9GUxgJlmKOx0kPHjxAaG+J5pACdE0SA2g6Lz/7zqNbuSDBZHCQEfQiKEoosDMS0HvSrkONNRD+C1aPA5b1ZkbGXPTQ/tx0eVJ2jsUpludXLJaj6FXZ8eq9uGlx1t+8siqhHhUtQQrdJvXfDK7DZmL69Ziv77zK27cvafonbGBJ7v29Jq4AEt0uiGTRKxMP+NydTDGTtgxZERGjd6am6khdjoln+bM4FYQIbHewLZPINaSvrHWBKSmnQT7L9isgCy/cDuND6DG01N524IiDbFkR6UYOeCljNwVbh0NXySTAlUjsM46OBioscaJ+UhH0dLsrSTcIsWuft6dBH+SDxGObnoY0ow8mo/b6QEXzW4jVNP1dPqoMy3XdasxOVhmRXxFs7Bc5z1aQkUCWcLclaFRY9AjSqjzOn0VZJd5VMaG8RCpxhGP1z7Gl2IJJdNi68Fjnvk4eGV2XQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(13003099007)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ImRjFKAPtWFJfeGOzDxgjeRES+TZNSvhrXrvnNHIKNYQXVm3eJAyQM28feGgU7YYkRABYxhK6wsxbSZYGYQyDpnLyy4sGgIYmQdOA5agLjpEkyTMzWOKbpDfk15epn7H5rqxuP/lsgsAcy8/JVSckLYQaOzyTNTVe28vrpnJKwiiA5U65Zay2ikBN0JHrq54wJeCs+FJjJ6n1XUz0CwrpMZvr3YSFBJk/eOHP3sl0dv/hQ8XgMXZLnyaF+fGB5c7m3/YiMnNzGWCroNI1YX7LfW0TjJhijfV9qf8DCs87WksW27IkAz/1dNjzyxH9X98AbxogefZIRuGMsKtEu78HCX9dw7JgitM5Z+m0i6e1V6CVi8958iCCEn55ehyX+mGfWR8TS6kPbIsxk7Lnlnzv+tFHz+JFN6WwVOpV4Lwv0LYJMfOeFonEUuDyzXuNurc
X-Exchange-RoutingPolicyChecked: 
	kJ1CVhByaQ0RlJFwAvix00XzC/78+2iGhNgvbv30WrEmOwrFL2/PBtHuke9+TU0OV4jX0TDr6KY3u05VCHTUReL3rPx6fhsqtJ3U2ECq7E2TEG0L12PcPtcxBmWx89iAs4m9Rp6m9qxGzaLP99g8YnOGHUniyljUn3tKiXwviZzO1WnNVTJPuVFBLlcXSoq2wqh0dikAcvQtw8vKY5y8HCks4VCcYGbeQ4K/W+SpiYjyw/QMVmaz9crQLZEUpS+xY5uQ7Fe3jP5ojFRHN0Jc6pso0FXqo7dpy/+mqveDWaMRSmKX0Umz9mf7VAbzYEczNhbxPVU5CLJfo67+MWjaeA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:58:43.9045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 310ff5b0-3ad4-44d8-a91c-08df0ed6a98c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7272
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAwOCBTYWx0ZWRfX57rFVb81Mpoo
 dBwtDPD9+3Ram3Yg9QrDXJRTmsy7Wh33hCAbl3y8IQ4VMniRclUCGyAOXHkEUNCMYQTeufS7Oeo
 FOPUIx+htx8/cOuXGejw5mrHe8jIkZw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAwOCBTYWx0ZWRfX39eZqzaQJrzP
 G/5He8MEHHin+nf+OR43haZWG7+XvaJFD+acDiKbHtotEg1JG8RRdYbcLcE0+CKuQWphYWlf8Qv
 pDOoKA3maubg9OcEkNe3wo7t+eZh+NBtGuT5GjZZialwKhORnSoC9/DYz7Kdoa5xUskZCrp9kS4
 hf8oBMd0bEqNaQ6HxXYX8ZXSEBFENupWgvQrvulDAvDqjRr4BBPHCFRiMvFArMK2RsI+W4oIue1
 MjdII8eE1q8MWuToCM/GYBrVe48A0/pbaN5Kw/GQjDGfyE4aPQVkyQekeaByZMdpV6j/tRByU8y
 xfgtpdbWExrPDLEztznYyRkaCUPp2mogQmHUrlnCEitm7Tr4Dx5PSTyan3OQHccFdjW3MJIdE5a
 caoAPBJCQXpO/Qjco3m8Zr0v2jjgWIMft/0LQRM1JrrC28TThxrgcn7YAtAksZlzsWXhnqPNAOK
 VCOcfAZzd20zFlHyXhw==
X-Proofpoint-GUID: eQMymqNjSY8EohaD1Aiut2J9FudUgeE3
X-Authority-Analysis: v=2.4 cv=F8fC5ahN c=1 sm=1 tr=0 ts=6aa200cb cx=c_pps
 a=/qs4bcqls8FpsUBDM29/qQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=Q4-j1AaZAAAA:8 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=n7Gf2nL6AAAA:8 a=bYn3EmMyiyyb5WVhYGQA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=mHLeZRWHYWOIOYBL6xkx:22
X-Proofpoint-ORIG-GUID: eQMymqNjSY8EohaD1Aiut2J9FudUgeE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100008
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 00:58:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20350

A recnet version change [1] caused a build failure.  Backport a patch
from the mesa repo to address it [2].

[1] https://git.openembedded.org/openembedded-core/commit/?id=d1575787a815fbe1ca60b20664665f92a95b2264
[2] https://gitlab.freedesktop.org/mesa/mesa/-/commit/f958ad11955638758c19170d9df4d67bf1ff8bcb

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-clc-fix-build-with-LLVM13.patch      | 45 +++++++++++++++++++
 .../recipes-graphics/mesa/mesa-pvr_25.2.8.bb  |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-clc-fix-build-with-LLVM13.patch

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-clc-fix-build-with-LLVM13.patch b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-clc-fix-build-with-LLVM13.patch
new file mode 100644
index 00000000..77bd993a
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.2.8/0001-clc-fix-build-with-LLVM13.patch
@@ -0,0 +1,45 @@
+From f958ad11955638758c19170d9df4d67bf1ff8bcb Mon Sep 17 00:00:00 2001
+From: Lone_Wolf <lone_wolf@klaas-de-kat.nl>
+Date: Wed, 13 May 2026 22:54:45 +0200
+Subject: [PATCH] clc: fix build with LLVM23 (TargetRegistry::lookupTarget)
+
+See https://github.com/llvm/llvm-project/commit/d50631faad3003e73589528c83d3bbbad7ba72f1
+
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/work_items/15471
+Cc: mesa-stable
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41558>
+
+Upstream-Status: Inappropriate [OE-specific]
+
+---
+ src/compiler/clc/clc_helpers.cpp | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/src/compiler/clc/clc_helpers.cpp b/src/compiler/clc/clc_helpers.cpp
+index 66d4af43a36a..e5c3d158b290 100644
+--- a/src/compiler/clc/clc_helpers.cpp
++++ b/src/compiler/clc/clc_helpers.cpp
+@@ -1186,15 +1186,14 @@ llvm_mod_to_spirv(std::unique_ptr<::llvm::Module> mod,
+    if (args->use_llvm_spirv_target) {
+       const char *triple = args->address_bits == 32 ? "spirv-unknown-unknown" : "spirv64-unknown-unknown";
+       std::string error_msg("");
+-      auto target = TargetRegistry::lookupTarget(triple, error_msg);
+-      if (target) {
+-         auto TM = target->createTargetMachine(
+ #if LLVM_VERSION_MAJOR >= 21
+-            llvm::Triple(triple),
++      auto temp_triple = llvm::Triple(triple);
+ #else
+-            triple,
++      auto temp_triple = triple;
+ #endif
+-            "", "", {}, std::nullopt, std::nullopt,
++      auto target = TargetRegistry::lookupTarget(temp_triple, error_msg);
++      if (target) {
++         auto TM = target->createTargetMachine(temp_triple, "", "", {}, std::nullopt, std::nullopt,
+ #if LLVM_VERSION_MAJOR >= 18
+             ::llvm::CodeGenOptLevel::None
+ #else
+-- 
+GitLab
+
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
index 03b0b9bf..cd622864 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=ffe678546d4337b732cfd12262e6af11
 BRANCH = "powervr/${PV}"
 
 SRC_URI = "git://github.com/TexasInstruments/mesa.git;protocol=https;branch=${BRANCH} \
-           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch"
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           file://0001-clc-fix-build-with-LLVM13.patch \
+           "
 
 SRCREV = "7b6e8de7b0acdaff684f1109c6acb575644a93ea"
 PV = "25.2.8"
-- 
2.43.0


