Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC71112583F
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 15:01:26 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23784.1773241285536396336
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 08:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=UNDYSSsn;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.38, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3XbDdm3f0cWITgljjMl+NWftD/Mn7fPj1CMPnxOnsQjI+lwB/AcGXWJz2aEnlU98oVb+ChoOxdqzqSUMDjB91tO8i1Si4s7zML6rRwso+Yrjt4EKBu/vvZS0cEVCRzn+7/ZkiTMLF6ZSipUdIbN9zuc5K6ZXR1k2AtGu2881tOw4AaN6btzRa4n8vpV7ulOqk1VFfOdYUwiihpSdSg2pZykVJHvJ6aJ573UdkHu2L3OK6rpVfFAHMWIxSIzv3yw26Ohf+0LceGIw4oPpm7ZlT9kYy05aaRHeosg4Lsk0AjK/9PESyqq8KjgsG2HOoAKLH0Jqa1+E8dLxr1yw7GBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bXZICuO9+r+TdQJL57pb5TESiRzYPO7y/6lGXOGXAQ=;
 b=DqtD1ZLM6F1GDuSoikkg1XFOZyA8ey5joy+Ps4V5M5tdPOAvlXqQDjBtT0s4weSQSUsOx8y1W/IqBWyglM6Nnb4UmeKj5GgIrtKfbWWflFUzqTmsWcaLnHQq/nrM8LzfLrQUaqjX07u+D51JfIm/EwquU82UIeZNBH9Xepe890z0mXkuMQY4yl8aDh6AdPstBU+VWc+nF5ya+ACdUC12ZCU7lvOV4o3HqgDDRPyIqDb0M8/BeKwHJbNXvksghjVzec/fhzgx7FvrTVfHDIAc42KT5CzJoCyjkz/TP0bOfTZdijY6ZFyrWF+qInMZ5Uai1tdxH2MKZcsm3ggu9LYkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bXZICuO9+r+TdQJL57pb5TESiRzYPO7y/6lGXOGXAQ=;
 b=UNDYSSsnSTJzen9gdmt+5mg4DSM0y3nJjo4blWlKPr9Z6la3unuxCkPqEt/m1Bzpg84kXt5P0k1UAawinA7rTeUyQsyKE1nfRJCbD3pgIVdn2T1Y2xEcK2scyfNZeUPbOjErIgUGXQmABDGHHR344mGBlSGN5KP9WPShhe/iv+0=
Received: from BY5PR16CA0013.namprd16.prod.outlook.com (2603:10b6:a03:1a0::26)
 by CH2PR10MB4182.namprd10.prod.outlook.com (2603:10b6:610:7a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.14; Wed, 11 Mar
 2026 15:01:22 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::8e) by BY5PR16CA0013.outlook.office365.com
 (2603:10b6:a03:1a0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 15:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 15:01:21 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:01:16 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 10:01:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 10:01:15 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BF137k534375;
	Wed, 11 Mar 2026 10:01:14 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v3 3/3] ti-jailhouse: Fix buildpaths QA warning and cleanup
Date: Wed, 11 Mar 2026 20:31:00 +0530
Message-ID: <20260311150100.3275513-4-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260311150100.3275513-1-s-sadik@ti.com>
References: <20260311150100.3275513-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|CH2PR10MB4182:EE_
X-MS-Office365-Filtering-Correlation-Id: f15f30cd-38f5-4f99-39b5-08de7f7f0e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	rDobpdrLq/AZf0+g5nkCjwS4xkcYgAC3JGytrMtGiVlTNKaiv79Jp5irPWSGSkAZWx6FFk1B52XSnUuCxBB58uZQBULt8xpL4V4WM4ECFGvdh5gYD9SOVZyYYJe4T4PWeAE3/7N67VjznO9hoKGmCHMcmNaZtA495overUBl7UTL0Rms3zCAJRWCsHAhtFOxFCs+eLrgDJdBf1W+pwhnRt8wjejECfG9gFob08X6ujT0KJiIak53Cobgdl8kW7vsDanhKQLcaylcfdCjuYq+x2irFc8kM0ePiqYoggIJh4abjNINNMZJA5MdQf/HEsVDNrhz8/PI3AKq3Qy06OeSrsYe2pyrlZY6HirSiaJ3yZ+FdUe/VDX5TU5AeSqyZEc2YEZz13MK+GXmEmErRVc0T3A6ToydL+N8FFZQJJmhBb91zVP/VLdtmUcFhsAvg9PYPfFlLta+h4/fFn1t0FG26MyvAwZo0m4aVA8vjto5MwlA4eqHiCWss1WxPBtCAzWpuTMQYrfc1RSS8WW/bkHdNR6LOq9PffxG5cbrwmNDauyKwL+DJ2pnO5e0VwHtGcZuwUOshlpxy1xVPhM4783izvwKlZ1iC2KhvVUnEaTxb/wfpdhc9MyhIITzjkpC4cwBwIKB7MarE3Oc/MzjzpwVr2OCokcOibmsq8lUH7Swm7ZFvJkblsjAmtUm9uDGCcllifTgNxfZaLVltkU+USNVxFL2DTMzH8u0zqh6zR6QqpqfhwPGH8JtzeKMUSTR/SY4srGRUEoyR3oFCEWcxX3H7w==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Nmef/DyxE0Nd1t7kKxd1ZJ+Lz37RJiXqNVupA8i0961+vAu5H360qcUTrTzcBH6oBUnoEwBTd5LqwX3lv+XFeIRKjkluZ2itQEXx2ifVfytLmMSVnebmNFmJtXU4egKqS58xtgMfneMz307/Tt6IE1Xi+56fPr6jB7f4X1lVLGR6A0VcfyBq/uFc63E+EJgIChZAkCequXHD+q+q1ET9QLEBzUlDN2dH6ybQfeUNG3yC0XZSrziHB5Pef9BJ6hD83MyKLLT9SQX1fNrbJ0dYpBnOxTfhCYpo0yfSpgPYGINfHf6eMg/560/LE2scbIJSYlXrJ2MnbO8s0VSqxV0fcMn4udekQbkBQMkTQGxvqg9MzRrl5KwV5Di/BXZO26xWap4WvyuGtwGBqNQpP3u1KnNpf9lZs6VYYaVskiU+i65J7gtPeWbOaHJq+42S4QqV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:01:21.3990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f15f30cd-38f5-4f99-39b5-08de7f7f0e92
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4182
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 15:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19700

Add -ffile-prefix-map flags to KCFLAGS to remove build path
references from kernel module compilation, ensuring reproducible
builds and preventing absolute path leakage in binaries.

inherit module-base kernel-module-split for building kernel modules

move V=3D1 into EXTRA_OEMAKE and remove overriding do_compile()

This resolves buildpaths QA warnings during packaging.

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 .../recipes-ti/jailhouse/ti-jailhouse.inc     | 32 ++++++++++---------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti=
-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index 91076c9e..58603dac 100644
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
@@ -66,22 +66,24 @@ JH_SYSCONFIG_CELL:am62lxx ?=3D "k3-am62l3-evm.cell"
 JH_SYSCONFIG_CELL:j7 ?=3D "k3-j721e-evm.cell"
 JH_SYSCONFIG_CELL:j7200-evm ?=3D "k3-j7200-evm.cell"
=20
-do_configure() {
-        if [ -d ${STAGING_DIR_HOST}/${CELLCONF_DIR} ];
-        then
-            cp ${STAGING_DIR_HOST}/${CELLCONF_DIR}/*.c ${S}/configs/
-        fi
-}
+EXTRA_OEMAKE =3D "V=3D1 \
+    ARCH=3D${JH_ARCH} \
+    CROSS_COMPILE=3D${TARGET_PREFIX} \
+    CC=3D"${CC}" \
+    KDIR=3D${STAGING_KERNEL_BUILDDIR} \
+    KCFLAGS=3D'-ffile-prefix-map=3D${STAGING_KERNEL_BUILDDIR}/=3D \
+             -ffile-prefix-map=3D${STAGING_KERNEL_DIR}/=3D'"
=20
-USER_SPACE_CFLAGS =3D '${CFLAGS} -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
-                    -DJAILHOUSE_VERSION=3D\\\"$JAILHOUSE_VERSION\\\" \
-                    -Wall -Wextra -Wmissing-declarations -Wmissing-prototy=
pes -Werror \
-                    -I../driver'
+USER_SPACE_CFLAGS =3D '${CFLAGS} \
+    -DLIBEXECDIR=3D\\\"${libexecdir}\\\" \
+    -DJAILHOUSE_VERSION=3D\\\"$JAILHOUSE_VERSION\\\" \
+    -Wall -Wextra -Wmissing-declarations -Wmissing-prototypes -Werror \
+    -I../driver'
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


