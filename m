Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B23FB5EA3
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 01:42:26 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67144.1773711738072443234
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 18:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=JBhvZwsi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.14, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxYmrf94XcaPMc7AoBWpeq/7ccI0R8/aMPw/brJt/LmOIWERl5XU5JGjXN29d++UulysUk9bceXg/4v/wZEu19x9bSNIvewW31cQPEtSWxdEgAPWtDPfMFhfF2lxPL7O+DtKs1WXvBhpuyqgXfWjSoFjW2eqFZ+t/xSS9Sg7f0JiNx734kebp+ASl2JaOA3N9lOz1qienBqJgBIcMOqfE4SO1stVmOekHXsvVfP2WnXcgu8v7Wj8jvqpf9l4vsHBe2chGfWlAv0wda5m7x5UsQs3MYjyfXifDSQug9rQ+qii1lOisC7r1Alovv9bn2xt9h9rSbilFcYDKr8ITwXTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge6MDBfYNT01ThOid+M0obYC1H2HKLzrDJbdP4QYeWA=;
 b=BGRiHPxuyGPSnDG5d84wqqFhIjdRzH7Jm6iVOTDKYPEn9IHFdI+6T3LBsJw2xRjJoaJanTdme/F/zgYsiQl4CP6sYraBCBpvanHe/MGtCgB7JwStaShEe2QXZUDeqV30KWx5UH25v0TI5bL2hSt7sxGx4Lrbm8HhlznQ/jEZIuBSrrVe7doHHhuzzbsEFwcOIW3EM2aBamYTeR6eWUKqsnc6OWhRuDGbCa9booat7l8xAj970S/krA/8avcwQGSZq2O7SRIDt1UthER50bB7cNWnryp1A8oIQzus7kW7Xx6o3jrMOQV3/huHrP1AQ61ZZw28sAit4vrKR2eYxaIWog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ge6MDBfYNT01ThOid+M0obYC1H2HKLzrDJbdP4QYeWA=;
 b=JBhvZwsiO5vyNM/4fhDZ1LTTX3dhMwmEMpwkK252fWvcmWDy0lUKk4nFXScXhtiONLAttlE7ihXBYtwVlFYX7JiR6HiYJCO9Itj/ReR4CJV5sNUcoTYnV4wQIr7pjf6e+ZAY+rR1su96GetDkXcTOyCyq39h2Co9ssoi1T1GatA=
Received: from BL0PR02CA0058.namprd02.prod.outlook.com (2603:10b6:207:3d::35)
 by MW4PR10MB6510.namprd10.prod.outlook.com (2603:10b6:303:224::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 01:42:14 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::fa) by BL0PR02CA0058.outlook.office365.com
 (2603:10b6:207:3d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 01:42:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 01:42:13 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 20:42:13 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 20:42:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 20:42:13 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62H1gBEY1798687;
	Mon, 16 Mar 2026 20:42:11 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>
Subject: [meta-ti][master][PATCH] ti-extras: Update SRCREV for Jailhouse
Date: Tue, 17 Mar 2026 07:11:55 +0530
Message-ID: <20260317014155.2776707-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|MW4PR10MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: df8205d2-8510-4dae-8b83-08de83c66a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Z5pJecTdWOKigBiMG8lsoGFNaDvlYjnutTTBydLVdUeqzTIrBH3igvs+P6Yiv+7MyLQoEQ2LoOmMyKTXZ5uSxfMBw7YL8b6XXk0lIxgsWoKKGao4aAtK/l8l22YCOnq6bJ5cN4nXMNUiJq0baKn0rT9JTFvmfzeZqXdJpyeATihpEif7BdKhAt/4+2KNionPEh3Jszp46B7Pc045tGNNjwy5o3Tz2OfG5PUp1fTq0H+XJaPuVh5A1eC/c3HmiaVqT48Hsht9Kk2z9+8tyALydgd/F30Pmksi6Nl6mxwiOunZIa8qAMhJ5HysAiJvt/qxyKudD+AF7P03tNsFBy++ku0HMuqBoDCN/Uez7d6nW6H7sk4iyzreHoKTnXtRjoJZfkw8wuZyeI7QLTmOKw6idPRcpbo3B/wEaofjdTAWW9t2Y9Tk6Zse8D9qDRx3pT72+VRLT2hL9l0BeoWm2Z9K4OewmZhKP8uQyS4TChSrBXZ83D04lc7szdvjca34WHIWY7DY5wGD0x4KJZKM+fiYQholjlo4gjOgpuCw3lJE64GPmDdYUduVYFk6kMNgQs44/dKkvuSCcStIX06jlLd7q4nQlfl+jj2VFJAGWDBCQ8J8zk7ZMHoZhvX4272/JWq3Y0kRnf4Ik0268/f1yGxL1lvdN1grHg7091oJGLkwayR+cvE3kNg3J55dlNByhGUPVMrnc0efFy/i10aVO2fdc2R5AtKRvlk+I8oiQ8kLyznxTtkMKL2LC+e82cFYR08V/LbIt4mnjTej5DQfsiJhDw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kCFHL2a30nOJvN6WTYex2ihppYSvibRyXwA0wUOaCmiKi39w84T9aCMb5uJCdZ42GoYRoHfSlSI56Cpr+JQJLPVEbm67lDXkaaIwPBw9BqQJwsHv+FcDU8ND3h/0kkq4apENF941YT0mH+qWU+mNT6o63TKoBttzAz3ubSgDoGKZxN02t4O73wTfavGJ4phb5oOksyo9MUqY9TwMN27nVA0KpWuynzCWS1OFr7MvHtHi01MPjdYB3JhW68IsR/WNQN63s9WE6L92f6GZIxAM4ZfT/a+YasaQjXH1EO8BDSlj2ia+C1LZcLhC3mdzQ6VKQnIi3t4JWe61d+TT50YHN4b3UlUAeRXYIZciBhiQBKA9qZng8qJrFNZN67gXtNhATuhtSTc6G3mlsHvWHDg+QxQAjvRrzV2q4Kz1y/EokU4G0vptWRVJCI9zNe1qVppN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 01:42:13.8699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df8205d2-8510-4dae-8b83-08de83c66a16
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6510
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 01:42:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19726

Update SRCREV for Jailhouse-enabled U-Boot and Linux kernel
and ti-jailhouse for the bsp-ti-6_18

Changes include:
- u-boot/ti-extras.inc: Update to latest SRCREV
- linux/ti-extras.inc: Update to latest SRCREV
- linux/ti-extras-rt.inc: Update to latest SRCREV
- jailhouse/ti-jailhouse: Update to latest SRCREV

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc         | 2 +-
 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc       | 2 +-
 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/ti-extras.inc
index a793a3e7..2160e1ec 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -7,6 +7,6 @@ BRANCH:tie-jailhouse:bsp-ti-6_12 =3D "ti-u-boot-2025.01-jai=
lhouse"
 BRANCH:tie-jailhouse:bsp-ti-6_18 =3D "ti-u-boot-2026.01-jailhouse"
=20
 SRCREV_uboot:tie-jailhouse:bsp-ti-6_12 =3D "e718bbcec3ebf663c021839753034a=
224be4cc53"
-SRCREV_uboot:tie-jailhouse:bsp-ti-6_18 =3D "257704a4a690f221064e0210028e89=
86a4b4ccae"
+SRCREV_uboot:tie-jailhouse:bsp-ti-6_18 =3D "cfac87057b6fed15c4be4f1d35bf0c=
4001807484"
=20
 UBOOT_GIT_URI:tie-jailhouse =3D "git://git.ti.com/git/processor-sdk/u-boot=
.git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-bs=
p/recipes-kernel/linux/ti-extras-rt.inc
index 907fbbbc..10e5988c 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
@@ -5,4 +5,4 @@ BRANCH:tie-jailhouse:bsp-ti-6_12 =3D "ti-linux-6.12.y-jailh=
ouse"
 BRANCH:tie-jailhouse:bsp-ti-6_18 =3D "ti-linux-6.18.y-jailhouse"
=20
 SRCREV:tie-jailhouse:bsp-ti-6_12 =3D "229a48602ad1557612a4ffabec6a3cbcdd74=
5f87"
-SRCREV:tie-jailhouse:bsp-ti-6_18 =3D "e9ebc825175636714e0ffa113133ef038797=
48df"
+SRCREV:tie-jailhouse:bsp-ti-6_18 =3D "e80c3501e727c8c01454594ca5b10555377d=
fd60"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/r=
ecipes-kernel/linux/ti-extras.inc
index f38336e9..515db47d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
@@ -9,6 +9,6 @@ BRANCH:tie-jailhouse:bsp-ti-6_12 =3D "ti-linux-6.12.y-jailh=
ouse"
 BRANCH:tie-jailhouse:bsp-ti-6_18 =3D "ti-linux-6.18.y-jailhouse"
=20
 SRCREV:tie-jailhouse:bsp-ti-6_12 =3D "229a48602ad1557612a4ffabec6a3cbcdd74=
5f87"
-SRCREV:tie-jailhouse:bsp-ti-6_18 =3D "e9ebc825175636714e0ffa113133ef038797=
48df"
+SRCREV:tie-jailhouse:bsp-ti-6_18 =3D "e80c3501e727c8c01454594ca5b10555377d=
fd60"
=20
 KERNEL_GIT_URI:tie-jailhouse =3D "git://git.ti.com/git/processor-sdk/linux=
.git"
diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti=
-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index e8374201..44408192 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D " \
 COMPATIBLE_MACHINE =3D "am62xx|am62pxx|am62lxx"
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
 PV =3D "0.12+git"
-SRCREV =3D "ef512f9591febed854d8f07ad8c1fa731c2d3c69"
+SRCREV =3D "b44c3548252bb3818b0dd0815728ca210d8fac2b"
 BRANCH =3D "master"
 SRC_URI =3D " \
     git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=3Dhttps;branc=
h=3D${BRANCH} \
--=20
2.34.1


