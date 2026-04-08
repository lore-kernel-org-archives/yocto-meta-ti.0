Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF93110F9969
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 18:14:07 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.113115.1775672045753756312
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 11:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=thcNi/gf;
 spf=pass (domain: ti.com, ip: 52.101.46.71, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KS4Ad6hOhNVbR8MqDueGmOSLKvxpSGjFZNCbTX1XciDqAN3yEu/TyEsm7mf2C5/waKC+uow7KgoZUVhRgYmxnLWWeOy48ktaQMthMnull1SFSUsd9ZgaAhbU9DTAIITNiYZu9NWMcf0G6FGeC10Lu7raSidxLvZj+B7bsY/2gTx6Hr/0hRYoIgrdF4DvpXvQ+3FhyYAA536Gx/81vFoqS6cHv4aXOqvzLLL4TuyH1g1oMvg19WSpbfFeVYm77K6cz0Z6LKyoiWJ86wbb4TZ1blxmczDmTmS6RMXs3rzIcWeH0ETtafp9QDLfjLg6XgWXRRuP+xC3CtF38bpxBsZ7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iLJt7dzm+5W8F2SEW/jWxq6WG0smM27fmCmZq78nzI=;
 b=mu6iaDaCocstaWjNRydjY982qTV2hWj9K2aTRQ963YLUWR1L4deDGaQZa+0mHgWeQZXxQ7eUm/If6/iC3p4MXjYPXYnpqEq6rs7bJVs9DoIgz9QeLZT5/Jgk7bz8uCc/I3dPn2mOAMC/9h6lapvuP6ca5ct0CF/9ARdDjfkfz0MvTW33DavCu0WpcUQILsDEDssuhUu1kt/DRkbWD/X9X6IcNxq45UqI+mwM73HWekhMoaR4RNgdcIVFSK3KmVPRWaoFElYK8sLI3x1WGVa3xr/J5/wqgc8NzC4T+aKmswL6cAD3v2apAQF1SQgEqcV1IurOp7KPtt9NeHHilNGcdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iLJt7dzm+5W8F2SEW/jWxq6WG0smM27fmCmZq78nzI=;
 b=thcNi/gf4Erej3meR7OsFAQjkl2YybZC0riJ/+/wf91D7YzCqoE6TsEEwUwJklte8AKAnSnnpycNckZqT2xxqmWpGKoCU8pGUW6rr++XnA336rtpmdO6voBkNkkbnj6tMMfZTQxw9Kf3UB5ls49cRp1CTdAvuiq6xQyRWJvCmkw=
Received: from BYAPR21CA0023.namprd21.prod.outlook.com (2603:10b6:a03:114::33)
 by CH4PR10MB8228.namprd10.prod.outlook.com (2603:10b6:610:1f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 18:14:03 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::22) by BYAPR21CA0023.outlook.office365.com
 (2603:10b6:a03:114::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9818.11 via Frontend Transport; Wed,
 8 Apr 2026 18:14:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 18:14:03 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 13:14:02 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 13:14:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Apr 2026 13:14:02 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 638IE2Dw1187480;
	Wed, 8 Apr 2026 13:14:02 -0500
From: <a-christidis@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] mesa-pvr: Add patch for gallium fix due to LLVM 22
Date: Wed, 8 Apr 2026 13:14:02 -0500
Message-ID: <20260408181402.836793-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|CH4PR10MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ef1d5c-c694-4711-5ed1-08de959a9d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	uJtPvmCvz3W6/ZxVw/d4/IH0kpxiv2ZQ0dmhudt4Ab2L3p0IFs9CpBgjTg7wJl4uZRAYtpk4yn2P1XdFjqCHXCZpowY6IW3AZbDxYua7zlj/mZdDTmhC36nHHpdFi0WpZvv17Aker/sSDGsrbGiXoPI+8zHJTnWIQ7XZm4RJG4AIVYGyc2evz85tlDwwmLnqxeI7eYM95NO/GFP8g7cMK43HlkCguCAf3tvinfI7J6qtoTmXRcKagr7UprIdA88gAjNh/IpAr1VLCsgyGdw9+GLcj7mB6FIlv7QaalgGpME3+G9CehWG+p2V9ASS5JNN9z0oGW053v5iIr/gAWsecHrGm8r+M86nRDIwujycJqMkbSxMinA9wjTcBdgTjV94RknDw8Kc95fx0TpolsBcKTmS3MWKfAGgL6AZj7dFL1tT23BivC7t0jitTpPgJkdJ1jNhIFqp3b6zbN408ICAoLxUVagC+VzgBUsNZNMqbHwFxsZdAu1Y5jCrw0AJTJ5u33ogUKiUU4wf27jPPB1udvIhvQFS/X4DKbsBw42FqT3FwzPuSvJlpEj00TQwlZVvADiEScQ6lVJQzGMY9iJLFoWPWHNRyWADav4VJCUoH5SyAn769BCV1QW45f0Y+aUEKUbenAGI1q3qDJ+iDh7lvX2RukoUdY52QaUWJRIrjLM8SrTE8CVTHdcZQ3ejgy/+3/7swjFKCQOXVvdRIwAFwJseBk8s9iDDBz+LL2feshI=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W8whZ5CM2V2Y43xiJYH3/TGvzgmJEPuRDlMKoPgcCC8DeBfxUXUta0m5Zm8Ctviy7Ea+6yYIcSvz61MwdXfjK3Uz1jvroY0WNwDqfNbCkJJ1+l7H/GYvwkXj35SmXDmGSKQRBxRzT2wMLDunoDNqN0pny3dZQDDu2sShVwcKVF19sQuCJ85axDZrcC3gxxylU2JgLN4nA8uSJ9OBtfVg0iRZWonhFO/r6aYJujPGVxYG8UaNh266gp5WKfvoT+NlJv2H475SRPD+Gl6EDc5TCGu7VYawLnkoSxjCghQfxO1rncPrgPile0L8qwxVXq58nEy6bufI/q2IYatl4+K7EJlHhRURhruct1/6Tj1UzZCsqgWCyuSte3QknrMazxR5bD8IJE+hGMynWse3Rmd/BZyYRWjegYiAzfS60Z/URug9/CUghy74bMziDmrtCEl2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 18:14:03.1019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ef1d5c-c694-4711-5ed1-08de959a9d73
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8228
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Apr 2026 18:14:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19836

From: Antonios Christidis <a-christidis@ti.com>

Add patch for gallium fix due to LLVM 22.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 ...livm-Fix-armhf-build-against-LLVM-22.patch | 30 +++++++++++++++++++
 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-=
gallivm-Fix-armhf-build-against-LLVM-22.patch

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm=
-Fix-armhf-build-against-LLVM-22.patch b/meta-ti-bsp/recipes-graphics/mesa/=
mesa-pvr-24.0.1/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
new file mode 100644
index 00000000..dfa2e865
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.0.1/0001-gallivm-Fix-ar=
mhf-build-against-LLVM-22.patch
@@ -0,0 +1,30 @@
+From 973dc32026c164d0c13f7f5bef36c8d1c2375973 Mon Sep 17 00:00:00 2001
+From: Alessandro Astone <ales.astone@gmail.com>
+Date: Sun, 1 Mar 2026 18:14:09 +0100
+Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
+
+StringMapIterator<bool> became StringMapIterBase<bool, false /* IsConst */=
>;
+Use `auto` to handle either case.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/mer=
ge_requests/40161]
+Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
+---
+ src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/a=
uxiliary/gallivm/lp_bld_misc.cpp
+index d3ad342..c95d86e 100644
+--- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
++++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
+@@ -331,7 +331,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
+       llvm::sys::getHostCPUFeatures(features);
+    #endif
+=20
+-   for (llvm::StringMapIterator<bool> f =3D features.begin();
++   for (auto f =3D features.begin();
+         f !=3D features.end();
+         ++f) {
+       MAttrs.push_back(((*f).second ? "+" : "-") + (*f).first().str());
+--=20
+2.53.0
+
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti=
-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 0b48bc15..8ec06800 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -19,6 +19,7 @@ SRC_URI =3D " \
     file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
     file://0001-gallivm-Call-StringMapIterator-from-llvm-scope.patch \
     file://0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch \
+    file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
 "
=20
 SRCREV =3D "7c82c1eebc67f5a62a347a84d42fe795cf7f523b"
--=20
2.34.1


