Return-Path: <s-joshi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC97CD4851
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 06:28:46 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29347.1778826518238402179
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 May 2026 23:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=X1BWzTWy;
 spf=pass (domain: ti.com, ip: 52.101.201.26, mailfrom: s-joshi@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDAP083otqXihSRs6yrlcMn/bFQ0fdxfrvAiEJqlBarjh+aTek4MvH5Cs6KNZGh6sleITKzlOl4ZiJ0fDiDAF0L0YNT0tPjpHojKGQw88EmUV+ajUdHncIhZ3R8PzjC3c4ALVz9GVx/54+vr7wjrhkc5SA1fAFz4aH2M26vIpjMs18VibBRhEvQpiKmTgdTYw8kz3i+tjXAsID+baoGIQXHuktWLSPsfSkEFmaAAJwfXUcpH2sU4NyV/rNKHuKDfkdWVtXhcopGrARAjQY3FRjBbhRYVWPdbsmKhvGvAmUS3fmWTjHrWHo9QmK0aeD1of0izClY9LIpyNNkcLoW67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOX9WVZsYe42K0qOfankh3hyB8NKUsqmYb0Q9yqMS4Q=;
 b=hG3n9wJmnj587QUhVSecnQaDMgAV49E4qnzucyB+RJ9gU5W6scaJFjAPcfYAOgY8i4uomAl/rjX6JTPEQS0v377fyEtaWGsj8Irb99HuzHbhcYoLyenfbL1/spjYWUABbL+2XAOWtpCS5yxKbUCtcIrXw6cKapU0zdUtM8mQhG3+kTAbDCbVKG5mfty+LPvHIn8NGz2sPyxh9Kdd1O/oZ9iYq3bu/shgaX9Q+QTX2jt0pAHkA2mzlSVwP4uNsdzUIKIcIKBq98T+W4JPsjTJVS8jnV3HwcGgkF74FxjxwXHcoH7vBx+El1f1dLrpAhWSNLCmqqaNBb9n7jxnHxYWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOX9WVZsYe42K0qOfankh3hyB8NKUsqmYb0Q9yqMS4Q=;
 b=X1BWzTWyGZISnpiJvzbeZHwDGBE8mN5wkrLna4Th720DW8RbY6S2EIyfCD1SdxELuxY3rs7TRT7voN3AvpQm/0vOiWf6hfap88+0SBwKDwo22jegqW61SWzAkoYNPdVwrJOtay+5B+0GSKtEN4ffKS9D1iznCZm3UGueVBJ9SBM=
Received: from PH8PR02CA0003.namprd02.prod.outlook.com (2603:10b6:510:2d0::29)
 by IA3PR10MB8043.namprd10.prod.outlook.com (2603:10b6:208:511::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 06:28:36 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::4f) by PH8PR02CA0003.outlook.office365.com
 (2603:10b6:510:2d0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Fri, 15
 May 2026 06:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 06:28:33 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 01:28:31 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 01:28:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 01:28:30 -0500
Received: from localhost (ula0507357.dhcp.ti.com [172.24.233.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64F6STx83863765;
	Fri, 15 May 2026 01:28:30 -0500
From: Suhaas Joshi <s-joshi@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <kamlesh@ti.com>, <k-malarvizhi@ti.com>, <s-tripathi1@ti.com>,
	<praneeth@ti.com>, <m-chawdhry@ti.com>, <vishalm@ti.com>
Subject: [meta-ti][master][PATCH] meta-ti: optee: Update to 4.10.0 tag
Date: Fri, 15 May 2026 11:58:18 +0530
Message-ID: <20260515062818.1468076-1-s-joshi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|IA3PR10MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: 41bd81ee-3cd1-4cbe-913d-08deb24b3068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	mVaBMghFUZjzUpbmFY/KTlNmj9F2PHLQmY+7Z4iXzaf4mcJEBWZqObrEWVeqjuXnNJ+bzbTEg/CJVXkqIgmjmOZnmPDwCv782BDHKRi3irK/Bj+EXix7CHzbeH1d5QImnYPHsa7uWvj79OQ1STqy6z4tioRKn92gg0gG4bF/45yw1M02xNtTJcIb0ua984FIk0XHXpf0tpjIWzV63LRlIqtaC9RLN1CIAQrCHGgkKJKC5bMSPkJnsdgCr7f7s8M2kAeop89gIlWaOAeflIb+HKylF2gnBfM8wtLvxb8Q4bRY8sYm1WgcfEx3m9pFVZl08o4odq/KbumEPvMYOmpL8P5z5FAZu4t8O8zAVqJTsnb1uilR9yiRp0pPpAachFie743z4kuPLzlQGVBReLkscDQ4Iyalaf01cURqNQSfrv8qEzEr9im/n3AsWAWP7/lFmLj+VpYZLlpGeCde8LTRTzL7tqLmXNO5+xOV9vANmKTvYrFcQGHmxAvie+Coznu/FOo9DuMuMtA+7Svo12sl6RVuu8uyG7l28Xbko3CIw5V82JtPtDEonOAMM93fdn7u98giXja/XFBFopF3+p9A+A3tteg66PZCX8unXarNf/SyzD5wokE4mr0lfPplqxFYGxFw5s8y8XtjDA54GFptRZZ+x8noR6hLw7cA0J8w2ags2R5RJgrkAv75xgjIJU9w7J7jn4NlhQO0v4SrSCkyU9lW+bw6oLsHcjs7U9S0piE=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/nUkelfM+9AetPS86Mj5bSsgzzL/kcS7SoPQiQkB4Rd2rLG/5ELwVnuFQOuiprE4JrhEPJrF+X+Saz2/UW8Eq2fTR/MQfoJ49flIf6ja4z6RJqOa1Xn7OU3WeswWcOQ+NIovRU3SJaASrPVuuR6V6SpVQPRlW/oEfteiBKAhdIom0H7BhwmzxIfX3NUUBJXPet2D8sSszhx+gqaofvCtrdu1LP0Lf13M7aw6c+9XaDhEs/29vUgl3kPRg/Ex0cmR6lO5t3AMzBzH6GR+9BjUTwh4MCwbwUm2XHHghWwDs0DCyW0Y2u9NCggHouxWq1BPVjtv4QGf8g+kxYiugoCITlJKs6QsZq6zN1Y90oDed9vqKSmJaBcL8dvm7E58yDcy9vyEduZOB+0vVy/t7hWkbeiW5EHsqrqo7/odJNIhS/K3uNMUy59c8uWNF4V5d1Kf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 06:28:33.7342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bd81ee-3cd1-4cbe-913d-08deb24b3068
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8043
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 May 2026 06:28:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19933

Update optee_os, optee_test, optee_client, optee_examples and optee_ftpm to
4.10.0 tag.

Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
---
Tested this on AM62L using `xtest`.
---
 .../recipes-security/optee/optee-client-ti-version.inc        | 2 +-
 .../recipes-security/optee/optee-examples-ti-version.inc      | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc  | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc=
 b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 68b6b262..7968f3fb 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV =3D "4.9.0+git"
+PV =3D "4.10.0+git"
 SRCREV =3D "9f5e90918093c1d1cd264d8149081b64ab7ba672"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.i=
nc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 6ec2a83d..eea7762f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV =3D "4.9.0+git"
+PV =3D "4.10.0+git"
 SRCREV =3D "934c7edb74a26e90f68024cf441073528444177f"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b=
/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
index 350eb9c9..b961c70f 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
@@ -1,3 +1,3 @@
-PV =3D "4.9.0+git"
+PV =3D "4.10.0+git"
 OPTEE_TA_GIT_TAG =3D "${@'branch=3Dmaster' if d.getVar('PV') =3D=3D 'git' =
or d.getVar('PV').endswith('+git') else 'tag=3D%s;nobranch=3D1' % d.getVar(=
'PV')}"
 SRCREV_optee-ta =3D "a09269b15de635e1816fe832e26adfbfb44c5455"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/m=
eta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index db18c696..473c5282 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,2 +1,2 @@
-PV =3D "4.9.0+git"
-SRCREV =3D "f2a7ad0638aeff5243593b33cc56ad064cae7615"
+PV =3D "4.10.0+git"
+SRCREV =3D "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b=
/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 15b43063..8a8e9ac8 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,4 +1,4 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/optee-test:"
=20
-PV =3D "4.9.0+git"
-SRCREV =3D "b27648ea8472cceceb8dda368a965c709066f7aa"
+PV =3D "4.10.0+git"
+SRCREV =3D "88c93e87a5c172363ee986ded036a25cafcc9d2c"
--=20
2.34.1


