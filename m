Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391EAC79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 01:55:09 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4272.1789005308210935730
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 18:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=j1LRPaSQ;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=TG2op2iZ;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1jhD82100000;
	Wed, 9 Sep 2026 20:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EpXTQ3Dvy1fR0jh6yE8JkF6ybJ3ItNpqS7kXjV7mh
	Wg=; b=j1LRPaSQDYc/INmmExPNcgxwjq3oOtn7NKu0YfMMAeEwIChgtQ45Rcfce
	53ahqDDzrkscLkSdun9kGBgqZXrUD0weB/qwqfKnWov4G+sMk+4shHuIcy6tdGdv
	6ovw7WK0lsi+3/PStAwo2gwBYd/1464e02HKpgulaNAZGEezyBtXEdjiW9yzwMLy
	GtU8EfmKQPfOLZcc5xAYiOuqytRBm4Ye7oilJqChWhpSuC7eG1/6AMRhzcnCnPy9
	iRWQWvSvcQdBn3XWGFP6mqavSIe/GIPMC2Flk6uwixg4dG3T7Q2i1HzrytGVCs+V
	UswbVL65xQut4DoNY9fifHBgmVTMA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxg2jed-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 20:55:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYTdLYEqEdMlNlt6XQtwUVeMaT4QxseeU04pu+1IyhhPKsOrjgDCyzIzKHvDl7HpBrnB5va8faxiNv1UxpdPJbZ8jUAOy1c58UvJNKA4yTPmTC203zaQ4IwFhjUmag/VNmoPjw5juh4ag9ZC63MzGsj1fS7a4wBcuSmlmAe5WFHm7vgEJ9/c0lAJTQT3oPwjuqtSGrLtk7llb7Bss9AhSpy8AMZ3KeIKhntXTvQjR0+H2kX0bwTj2TBmUFeGDuHOZOVvoKmKgWjaHwlAHBgoRG6wWw/q7zH9KeiVGgihCZ13SKq8DY4dnrdj0ObOSYe87qY60qkqjmdDs17YDLD4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpXTQ3Dvy1fR0jh6yE8JkF6ybJ3ItNpqS7kXjV7mhWg=;
 b=ZG/uMqSVaLsfWiEUyGz9kO9juiuxErohlNNHRVhnbDyqJoiH7d9C4pI4x85M/AeKXkTgZaZzox0of2t2EOOp68b7GW50ZXkTuZJGXL/u1Fz/fJVEDQy+DvyLAAW2l6gMJwvw4ojGutR8VBOx5FsZMCE7Yq9OoOMF0RbIdv9NaiYY47L49/5LjtaKXxzUBa+qDfL5k9IPX+fCyf483XjAFyCGgFI4+nBO/gIlPKigS9CPBR71AVt7M2bfkjNK/rwXgw2c8Xzkj7SMMTh/PqQ/ya5tleO0kf4BrkPScTAeG6knlU6YFUDPC4bqq/GkMXbBUJeIPyy135dwCLhPjGAz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpXTQ3Dvy1fR0jh6yE8JkF6ybJ3ItNpqS7kXjV7mhWg=;
 b=TG2op2iZ8EYb0aY8gIUDTCMQhhvYjtTq3G8jDhfxPpo/t/cYMhV7eTDzuGm5LAFSfi6o77gt7J4asRHmLCgyjcFwxO2vzS2e2CrI3xcxAxWius7JWeYsjAhMob8JOlQ1TKx1SmHhscJinbdgvf5xemUK3ybz2ZMvHi5yKIRYAXw=
Received: from SJ0PR03CA0109.namprd03.prod.outlook.com (2603:10b6:a03:333::24)
 by SJ0PR10MB6375.namprd10.prod.outlook.com (2603:10b6:a03:484::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.5; Thu, 10 Sep
 2026 01:55:02 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:333:cafe::57) by SJ0PR03CA0109.outlook.office365.com
 (2603:10b6:a03:333::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 01:55:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Thu, 10 Sep 2026 01:55:02 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:54:54 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:54:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 20:54:54 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A1ss3E2381560;
	Wed, 9 Sep 2026 20:54:54 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4U06-0000000CJbe-1sph;
	Wed, 09 Sep 2026 20:54:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 5/5] mesa-pvr: Fix for building with new LLVM version
Date: Wed, 9 Sep 2026 20:54:52 -0500
Message-ID: <20260910015454.2933250-5-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910015454.2933250-1-reatmon@ti.com>
References: <20260910015454.2933250-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|SJ0PR10MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: d121191b-d16c-44eb-734e-08df0ede8734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|10067099003|3023799007|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	dxCVrYlRT4v/9w19iJjaRzx+u/VXlgXwjOO3KVRzxx7Rj/9Yf89GU6ygEBLYGklJHSfiMxfRW7qyVglHymBdGW8sSCBF96OQjQWH3V/ScZqFZRsx08oDGym981kZUQ45WxY5xGuLcyFLokv5qoPWT7cbuBwkQdJBjep2Ks/i5Y5VHswofRJBJ72o4X+WiV8SSyhkRbOfz9tbN3kOgjh4SzYTVe9T6Vzd3Nrj5WRGmbqaW09KsVNFKgC4wmkD9DA7WwYqpm2Ev20uPwa53I4FYokxGUlwOJqSDohJTcKEQcPZyxClXmoY1AeN8C2LCt/v4dhUCMWaXKo6Fj0cqaMiANuYxDzyuCrZQGhVKMSPh8p/TOv+bj2hMc7UrhJdM9/jF7iCGqLP7Mrb8r9mApw0OcMRcIzPf9NHBrI9TYa9nllKyegJv+KaXArOS39c2IxYymWnnSlJlJUA2hwli3KP5DNMCaRqkvIv2+IHIx6EZXZdNAQAhtD/0I93WCxg5dAauU1ulAWWBSgiqbKrqUe6MNhrS3DaplGYXQn+qD22xfkGaxny8hEpVn8f8AceY7YbT8Pk00Bra3xCF7a0ICqil3sbNKbSEiouw/jUjJaKhJ8npi/IJ8Jm/BBsMXPY1ZG7MMROCYjLLGv/IQilSwPyFA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Rdn0O/YeFuu8bMdRsGyJixiQoouNcDBKuSrHhnrrKLwrLAhogoTRY8nzPjXE8vIYe/d65ufeHLdTIVTUElkAPK/BNc1wuPb9Zf9KxaKs24g6akhZE8CduXof3spFfvAWahrdw0i+YBxwT4RW9IneibCWIsoKZx0/cicWO8jHm8b19IwkPwSNpbuDVnAtER9rqorEZpo6k0znMp/1T1eMO1hSll2aScSWNGjw7FPX7y8pw9O4SO/hJXcacmnbEshXo0kj1BE+eiWQHsD3RTuDYbD9vdWsGDM+9YvPEy21KLedMVPRI2HcIVegpqNKNk5Y7/vYsXPLiwMuJiFdwrjG8XBrJrsd35PspBx9XYEMtwaRdMB2AYlQgHVmIOyWshIhDaTlHyMp4znqL7pIg54hQdKdBcIclU0A0lZC51zyzzG9S0xrfUOoXgNNe4QERvrG
X-Exchange-RoutingPolicyChecked: 
	pAbZUWhFD5ZujYnqYkW7RWcMcjCGRIJfZp02khoX0WP6Io1FO/H7h6dyeHRxSX3O5DGsb5xNcRSzCllp+UiMTU/G72TIzsYRA9oNeRE8EKkYZD7tbfwYEjAaxlWNDHEN84Igdi2owdU1cLeRXzigeqjOgcpr4pBT8sb44OITxya1ukNUffAaHbRE7yOT1KAq68oLpF6lfz/+VSKzbt64Dc/iBZlwWZySZxyQgNt92ymWiFpzRjwfP/uAa3bsEt0e2ID0Owk6o68WJQqAnZEOF3PLGGVmDG8OXqOaV5Ur8x3cM9C3/h/TWHU23b3VUVMVC3Po/nhXsjN/cQ5Ko8gEig==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:55:02.2488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d121191b-d16c-44eb-734e-08df0ede8734
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6375
X-Authority-Analysis: v=2.4 cv=MpPHeGae c=1 sm=1 tr=0 ts=6aa20dfa cx=c_pps
 a=pKtxidU6TXaQx3FGc3VI+g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=n7Gf2nL6AAAA:8 a=bYn3EmMyiyyb5WVhYGQA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=mHLeZRWHYWOIOYBL6xkx:22
X-Proofpoint-ORIG-GUID: UEtf5jqF-aYV3jIahkUahpMl5btgo0NB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX1kNAtFoCJKRZ
 K1a9EEI/KliCC3sLw2B359jKQVeKzbEAlqVJr0XiZ3eg+ClomPZtYRxby3CuKBUS1xfPsMehJrI
 4SzxXX73uD8OyiAST79wP3zpr/iVl6s=
X-Proofpoint-GUID: UEtf5jqF-aYV3jIahkUahpMl5btgo0NB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfX5vwLabRh69mn
 BpXq3JK5C2KaZiUKr9rbIPNtbykb9BtbvbQcL9C8EaeKbNGYhFKGTJ/7shkCEQuYNc35z+o+lKH
 R9x5IkMSaigNsiazfkaMA2mlcb0Ks6aO1cDN6JBuBS7DKS7hXo4/n5v3glicx/U84mK0uw+pTcH
 3jKYDamBUe/pEQtAzF28yyk6RAOk6YRlvKa6vIVhZzYltsf49cC12T+cKgfEesXrTOALoZl+Mz9
 E/pEjsBUQY2Zc045C3rbKd4xahCyUufJzNyYNmkAOmwP2CE4LzRIYjb7U21xggJJoP05T98B6Ro
 LMmKF+y0SdI+PXUHlh2C2CWIbYQ9p7jQ6S5YIWRabkBzpNeJt59gLAZR9BVLrTZz8WV3im0PP4g
 c8hQpLNaNPX7eL4w5XEjSxkFAzUoncT6F3sGMphFwLiBf0BdOZioqgKT42DH5tFTv6O6ji0aaey
 nfl0rtX3QM5Kbt9mZ1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100018
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 01:55:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20356

A recnet version change [1] caused a build failure.  Backport a patch
from the mesa repo to address it [2].

[1] https://git.openembedded.org/openembedded-core/commit/?id=d1575787a815fbe1ca60b20664665f92a95b2264
[2] https://gitlab.freedesktop.org/mesa/mesa/-/commit/f958ad11955638758c19170d9df4d67bf1ff8bcb

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2; No change.

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


