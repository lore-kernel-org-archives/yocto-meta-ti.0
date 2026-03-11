Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A406B112586B
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:06:22 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4400.1773255979622827359
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 12:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HA3OkvT7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.6, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ol2uii2t8JWKEuPLdzUwSzgck0iRaxhxduCPKVa01xS1Mildqf9HTYNoCDwCl7G8JxtppnMFIyAkbxtZfq+nwdS3/NL0DuWHvly2RL7UqmoqnbMCLnuXz7aDwxpufoL6QiexBAcjXvi9kh6UHETCbHDfHwThqzWIQa1CZjME9IF8ys7beNQYbLbxx5idj1T4y+XeYOTfrxS7YXcRrQCWpOJF5p+CxbspH9Oi0t877J26THHOMfD9jTpmnlVmCVxeNYZechGT+HnCASofXRjUdXwFoydoQ0Sy2OxuEi+gOw7aj7QiqyzG2Q4rpASM/Qbds7FN1Cl+l49c1BkGZStD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5+BY08wRog6r93A1y05rewaQu1jBDKfROvIBdUmAVk=;
 b=foya3FgJHS93LE2izuMdI9XeEK6pREPAZ0zUfJ71P7SVEm9yfVtPtRWOzQJzNmxDdimC2R/H+CDHT1iDePKeKd5ygdLNVMMEY0aVmg3XUMj+bKmqybkqjF2Sc5MjGPs+Rb99hGkGy1TDolm1rdp4n1XHKPIJPQONgzYwXvNyWE44rl5LAvUNiMTeFhRsfQvECap5NKpTMo1UYEJGejyR6xNcmEm8Kdf+QHvX1nIZdLvSU1bsJPzOgLlyOyAELCroTPaBVoVrUbPeBckQMHl8HKyTDMxBeTC2WLuPo8f2G6QfjXRjuX8ibITEcbjejRS/4wNnS1Taq3vpcZ2Bw3S9tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5+BY08wRog6r93A1y05rewaQu1jBDKfROvIBdUmAVk=;
 b=HA3OkvT7C0kz5bW/CL/BPCmdCdQyRMus4h7N+Lvl02oH2eNTTnfLeXwytGUtp71qT+rK98BXPl40OoxIv35JOGWjt3iBjvd2XS2x5rK7desr9TuRKTtQsry/uu7uQPkO/B+NHARSBwe0fY6sBb3Scc9/34wbhicKRFSpVOAJ89g=
Received: from BN9PR03CA0574.namprd03.prod.outlook.com (2603:10b6:408:10d::9)
 by PH7PR10MB6601.namprd10.prod.outlook.com (2603:10b6:510:205::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 19:06:15 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:10d:cafe::a6) by BN9PR03CA0574.outlook.office365.com
 (2603:10b6:408:10d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 19:06:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Wed, 11 Mar 2026 19:06:14 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 14:06:12 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 14:06:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 14:06:12 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BJ5kpx896192;
	Wed, 11 Mar 2026 14:06:11 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v4 3/3] ti-jailhouse: Fix buildpaths QA warning and cleanup
Date: Thu, 12 Mar 2026 00:35:37 +0530
Message-ID: <20260311190537.3340422-4-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311190537.3340422-1-s-sadik@ti.com>
References: <20260311190537.3340422-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|PH7PR10MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b8e141-2842-4001-2a41-08de7fa1440e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	KapSE3xN3BQvoztxIPdpa72EAPxyWRVdqRZQgeZxWMU+o05rMrLFIROdSJKJTsrJC9gD5ITJLolFiRMWM8UZXo63cXfPsGRAR+HnM91qtKlpPw99wRkEVQGMU/h216uiwxzrkvgA7m4owxsA3EhItnZbfLmYXFiZPEDoCF5hYdmdGNpmMHfQwcxuWcmvj0dhy7PPWllIZ8FiNNw5QiuAZMZuo4AMuf3Z57kCKkD2AkNkXdobojxkjlzHNkCdFqapM8G/t2RPF3IxreRrmiUQXCcTU5jBBm9qswIxbdBpZzKKd++yNPlGmWVVBX0uDnlfErIR0ioYrdgbzvkNCwOG3gVZO2Ub4qu7eToiTeBTrzWhK25G/tv0DSeAfLgpwaz+EG+jZYdrpsfEM9+i3NES8bViOfupY2QpK8dA/GWD7/vyk7lJPDcf090MSBg2tg0O3h0ZkQoWDbfv4Ma8Kj7eeBJA2SsXDojJGfp/e4HdtC0pKH8AahqKBcUU3aSxd+T4rJm981Po9pRd9otDapFBVT9vD9dXW7gRA/ou5Alun6zDgYFLKI7FXEazWLDCv5OKMdHbqaDGdYbmCG4Kt2Iekz+ohQFvu0Y9oLAdJ0mCM1VhlFdiSa+g87Bgfc9s8+YwmeB4in7KzJWKZgDtQzPv4J+zuA8Sd/zcoRwsCgZ+ie97UqU1wjRdSkD22XRPf7OxnSlZnN8s3Um+uorikCRHfpE0ckClQOvgUm8gN6sSY5JsQIGb1ZZ3u425urontHcowwqIHUPZLBpZDahOlAuWUg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VRtRV7gaRcH1okbCx0Zhn+4vVHJyeBxOxl+56YWlGr/eo0eKNowJaeNlhNcopFkO7/gZ2kAlrjrWLuYxcDmmqZ3V6oZlw0CVYGPLVcmI8NEkYhk8mOQdlHCuusy8g1m2nnOoJf9PqPTCKB+nUY1byfStsOjZ8tYZtJZ2FMb95LzhgQbZQZ5k8ODSofpTGBVqndTmj4ntotpPUWqdL8CQpxx+03wX6EAAmFCkulseTX5g81uPZ+br72RzBPtp2Fv/vydm363H/XtHvCME2w5zNU9z6UOUxlyQ9VZzMy1Jjiw8g7+gG9VXpzMcf+PADlxaqix7RmmegEBavVCn369l7qQxw6+uIaZP+YV7e9/BgE+zyNC3/ivp64SUKW6SZ+1Hh5OItMWWuKThZQUv/Te3/yMQuMdp01BA1DS5KZdKbLgVjfuWSSn6DKK5T+3uAoJa
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:06:14.0249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b8e141-2842-4001-2a41-08de7fa1440e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6601
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 19:06:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19707

Add -ffile-prefix-map flags to KCFLAGS to remove build path
references from kernel module compilation, ensuring reproducible
builds and preventing absolute path leakage in binaries.

inherit module-base kernel-module-split for building kernel modules

move V=3D1 into EXTRA_OEMAKE and remove overriding do_compile()

This resolves buildpaths QA warnings during packaging.

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 .../recipes-ti/jailhouse/ti-jailhouse.inc     | 36 +++++++++++--------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti=
-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index 91076c9e..08c2814e 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -47,7 +47,7 @@ B =3D "${S}"
=20
 DEPENDS =3D "virtual/kernel dtc-native python3-mako-native python3-mako ma=
ke-native"
=20
-inherit module python3native bash-completion deploy setuptools3
+inherit module-base kernel-module-split python3native bash-completion depl=
oy
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "(ti-soc)"
@@ -66,22 +66,28 @@ JH_SYSCONFIG_CELL:am62lxx ?=3D "k3-am62l3-evm.cell"
 JH_SYSCONFIG_CELL:j7 ?=3D "k3-j721e-evm.cell"
 JH_SYSCONFIG_CELL:j7200-evm ?=3D "k3-j7200-evm.cell"
=20
-do_configure() {
-        if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
-        then
-            cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
-        fi
-}
+EXTRA_OEMAKE =3D "\
+    V=3D1 \
+    ARCH=3D${JH_ARCH} \
+    CROSS_COMPILE=3D${TARGET_PREFIX} \
+    CC=3D"${CC}" \
+    KDIR=3D${STAGING_KERNEL_BUILDDIR} \
+    KCFLAGS=3D'-ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}/=3D \
+             -ffile-prefix-map=3D${STAGING_KERNEL_DIR}/=3D' \
+"
=20
-USER_SPACE_CFLAGS =3D '${CFLAGS} -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
-                    -DJAILHOUSE_VERSION=3D\\\"$JAILHOUSE_VERSION\\\" \
-                    -Wall -Wextra -Wmissing-declarations -Wmissing-prototy=
pes -Werror \
-                    -I../driver'
+USER_SPACE_CFLAGS =3D "\
+    ${CFLAGS} \
+    -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
+    -DJAILHOUSE_VERSION=3D\\\"$JAILHOUSE_VERSION\\\" \
+    -Wall -Wextra -Wmissing-declarations -Wmissing-prototypes -Werror \
+    -I../driver \
+"
=20
 TOOLS_SRC_DIR =3D "${S}/tools"
=20
-EXTRA_OEMAKE =3D "ARCH=3D${JH_ARCH} CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D=
"${CC}" KDIR=3D${STAGING_KERNEL_BUILDDIR}"
-
-do_compile() {
-        oe_runmake V=3D1
+do_configure() {
+    if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ]; then
+        cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
+    fi
 }
--=20
2.34.1


