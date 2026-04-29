Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9985FFF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:33 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13931.1777476206612533154
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=bC2Q+A5E;
 spf=pass (domain: ti.com, ip: 52.101.56.26, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBU0wjCyfXly/EOZlm12sr/a+adiLhWeHww7jK8Cq6kcAa9AXYyz38Y/EcVIU8DzhUEdQZ770TEFlqF48+84NvN/ss1GxC1E4xCcdPeX6I0upX/3k3Ht4vw9IC0shPP3nbypFWmO+0uhPr0XAMWLLZIhw6i/XldYaPluVu9dgXGFzrqkWS2x7rF6BdDbOgw2fafcF9OlpuB2Ic64rqg94h+JYPWOsEWwOxMIus3lW7ET4lS63Sna1fGYHlx/66Cf2Bpbj0ilKJR4WLg1XMegcEmMT03uYnSfNzx/94QNaDrYu46I2ZlGQ/+hjs7CqxjQ7NlfZMrS3iA1/Z62Zs5qlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+NK5Xx3dNJhSfQHms7MI87s6869EsMbO8aXt99IziU=;
 b=mIeCwrgxmwl9FLDajx+0eLRMYqVee+kFqohowkjfGmd76BS8yAOLGJxK8rpCk8EzjTCO9QiT+uVmdmIpyX6DkTaF9GhJNFaT3K45xjtgV+P6hoGpPfUWF6JbFyY5ECrbc7kO9IBtchjnYnbqc/I14P0FbTza2PGkthZC5BI2dAA7+BAdMyTcEJusQhsUQ+WSTOvHGxCdkB3I5wxEjmiFjbfg1YiYgk99l8rCLAEOb8OXF8RLGbOjh6yS4OxVT57gjREqAcuWGcMQhWV4fd5vrdavIuMpaG1Mh/S/V1QWIRfiP/OxP3QS62hgpVWT8UlFCmZjDf/zVMTSAsGiSSJHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+NK5Xx3dNJhSfQHms7MI87s6869EsMbO8aXt99IziU=;
 b=bC2Q+A5ESmLpnt5219+E+rWXUiQSgrxswisGuQTP+sY/kiw3hsVJ6/Jh/tFbvjmDBU5Viv6ey6jKI04ddjKgUljrC//lbwJ3KReJ5ln845l4ZrwAnvadNlua41bFD5ghPbKVHsnXICpOEVtcW9DtLu//T8Gd9xfjiYJu5KBxhsE=
Received: from PH8P221CA0060.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::9)
 by LV8PR10MB7823.namprd10.prod.outlook.com (2603:10b6:408:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.29; Wed, 29 Apr
 2026 15:23:24 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:349:cafe::15) by PH8P221CA0060.outlook.office365.com
 (2603:10b6:510:349::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:23:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Wed, 29 Apr 2026 15:23:21 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0US3353813;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046rx-2F0h;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 02/12] meta-ti-test: Import the recipes-benchmark recipes
Date: Wed, 29 Apr 2026 10:22:50 -0500
Message-ID: <20260429152300.979685-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|LV8PR10MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 33eda1a8-89c9-4091-557f-08dea6033ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Da9qSbzl27HN65RFNqQMEhRqM+dm8gmsZgcYlgLcrFej7vjInLd3xPA/V7slkYVh7bXsC2bKs14yJ0xY89oCsSumo+z7fsOfLdutNIH/DOYo+hrOFUY3Y7XC+qwU/CjUSEnBbEZgCoFl46zUgYsczEQefrtyUPu2g9PgJCgZFE2AK3pAIwHrVyvqARUc6iLHqyWNnZ6QtDYIW29egX4A/pzhh6bvHPUuBdHzNfEV0RAouIoGBwGfKkqR9rF6tRJnTIrUFr0yN8Q19DTsfoGID+Lur3qD3Wk4Kxh89UbLdfA2W7YVrgYhc/slvAHeHErdt9xBtGd1etlD4sG+4DKnM1wvIm96Izau74YD3E+e/w1RNgrgnQt3f0KyOBAFkUka2EtWmKfK1cgPApwnQKlGj51npU8hh/SJ2mtDl9NpZGkGpJEFARbcsaCaH+qjxmxgUlNTJr81VzLqBJEOwrV8hkt/JcP3Y1GwI1Tt5pWfTB9cPmuIq9FUrCYUxVd4Q7LhZfYYGLcfBtDHLbN2tdCXLPVWOiKPLWqrec5jUuF/XmZxWyauaZZreZ20hopkVFdgJa1eVJtKpwoK0vbE3iZb0yAaaUUvxtgsnKaMYJzbfCI5idCW7GLTGsJsohUPH85tcAFGQabwmWyy7CVup5I/fpF7Vs0n0jbv96iTecxVg629lHkIDxKu7VzdjjUYkcJ1
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WNyj4CVMCx4VJPnwKYJ1b/q6wPVDk/SmiFAgTA7kwErgzOz0gw8cHV641+JtUui9+/rw9mefx+1bIuz19KC3gxzrPImZ2lqKRCSnbM+nK0R8l8S1DaFtb15TDStvgnb+BoUKviEVKTujwNturCwbjA1Lab/ECDZOBsuG44R9kj94xP8Kiv/qTpZkYOG38e+Dkm6/LbA+2RJR7+Dc6AZ+7Q0LmjSWmy70xlfEDJTAMhV4Dttbg8MaRRw29kXp3KCFYIpmvuLaTIRrCRm7hJ80Cbvjrl4tjkvx0Wg+XAmsfoWdWJxO1yfYbqURoMTNI8J7yRpBz6OqVweccn4TXq+6ZMLTsb/IDRAQSNq9vQKMRmx8POWEXTzqjcOJMgxM4Bpzvicqqd6C9+EfytYJfV1mZ5XYf2KE5qW7AwORflXhyxdAlIshpne+1KCTPvbgHQF/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:21.9640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33eda1a8-89c9-4091-557f-08dea6033ff0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7823
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19898

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports all of the recipes under recipes-benchmark.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No changes.

 .../licenses/Stream_Benchmark_License         | 34 +++++++++++++
 .../arm-benchmarks/arm-benchmarks_1.3.bb      | 23 +++++++++
 .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb    | 28 +++++++++++
 .../coremark/coremark-ti.inc                  |  3 ++
 ..._main-Remove-printing-compiler-flags.patch | 41 ++++++++++++++++
 .../coremark/coremark_%.bbappend              |  4 ++
 .../nbench-byte/nbench-byte-ti.inc            |  1 +
 .../nbench-byte/nbench-byte_%.bbappend        |  4 ++
 .../openssl-perf/openssl-perf.bb              | 49 +++++++++++++++++++
 .../stream/stream_%.bbappend                  | 13 +++++
 .../recipes-benchmark/stream/stream_5.10.bb   | 26 ++++++++++
 11 files changed, 226 insertions(+)
 create mode 100644 meta-ti-test/licenses/Stream_Benchmark_License
 create mode 100644 meta-ti-test/recipes-benchmark/arm-benchmarks/arm-bench=
marks_1.3.bb
 create mode 100644 meta-ti-test/recipes-benchmark/arm-ddr-bandwidth/arm-dd=
r-bandwidth.bb
 create mode 100644 meta-ti-test/recipes-benchmark/coremark/coremark-ti.inc
 create mode 100644 meta-ti-test/recipes-benchmark/coremark/coremark/0001-c=
ore_main-Remove-printing-compiler-flags.patch
 create mode 100644 meta-ti-test/recipes-benchmark/coremark/coremark_%.bbap=
pend
 create mode 100644 meta-ti-test/recipes-benchmark/nbench-byte/nbench-byte-=
ti.inc
 create mode 100644 meta-ti-test/recipes-benchmark/nbench-byte/nbench-byte_=
%.bbappend
 create mode 100644 meta-ti-test/recipes-benchmark/openssl-perf/openssl-per=
f.bb
 create mode 100644 meta-ti-test/recipes-benchmark/stream/stream_%.bbappend
 create mode 100644 meta-ti-test/recipes-benchmark/stream/stream_5.10.bb

diff --git a/meta-ti-test/licenses/Stream_Benchmark_License b/meta-ti-test/=
licenses/Stream_Benchmark_License
new file mode 100644
index 00000000..cf1c8e00
--- /dev/null
+++ b/meta-ti-test/licenses/Stream_Benchmark_License
@@ -0,0 +1,34 @@
+*=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+*-----------------------------------------------------------------------
+* Copyright 1991-2003: John D. McCalpin
+*-----------------------------------------------------------------------
+* License:
+*  1. You are free to use this program and/or to redistribute
+*     this program.
+*  2. You are free to modify this program for your own use,
+*     including commercial use, subject to the publication
+*     restrictions in item 3.
+*  3. You are free to publish results obtained from running this
+*     program, or from works that you derive from this program,
+*     with the following limitations:
+*     3a. In order to be referred to as "STREAM benchmark results",
+*         published results must be in conformance to the STREAM
+*         Run Rules, (briefly reviewed below) published at
+*         http://www.cs.virginia.edu/stream/ref.html
+*         and incorporated herein by reference.
+*         As the copyright holder, John McCalpin retains the
+*         right to determine conformity with the Run Rules.
+*     3b. Results based on modified source code or on runs not in
+*         accordance with the STREAM Run Rules must be clearly
+*         labelled whenever they are published.  Examples of
+*         proper labelling include:
+*         "tuned STREAM benchmark results"=20
+*         "based on a variant of the STREAM benchmark code"
+*         Other comparable, clear and reasonable labelling is
+*         acceptable.
+*     3c. Submission of results to the STREAM benchmark web site
+*         is encouraged, but not required.
+*  4. Use of this program or creation of derived works based on this
+*     program constitutes acceptance of these licensing restrictions.
+*  5. Absolutely no warranty is expressed or implied.
+*-----------------------------------------------------------------------
diff --git a/meta-ti-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1=
.3.bb b/meta-ti-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
new file mode 100644
index 00000000..8cdd1a6f
--- /dev/null
+++ b/meta-ti-test/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "ARM Benchmarks"
+HOMEPAGE =3D "https://gforge.ti.com/gf/project/am_benchmarks/"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7aefb5e1cffc7b6a3ef18b803f95792=
2"
+SECTION =3D "system"
+
+PR =3D "r13"
+
+BRANCH ?=3D "master"
+SRCREV =3D "fefaf9bdd6f36ab0cebaab8dbf34e5beb50f471c"
+
+SRC_URI =3D "git://git.ti.com/git/apps/arm_benchmarks.git;protocol=3Dhttps=
;branch=3D${BRANCH}"
+
+do_compile() {
+	export CROSS_COMPILE=3D${TARGET_PREFIX}
+	export CFLAGS=3D'${TARGET_CC_ARCH} -std=3Dgnu11'
+	# build the release version
+	oe_runmake release CC=3D"${CC}"
+}
+do_install() {
+
+	oe_runmake DESTDIR=3D${D} install
+}
diff --git a/meta-ti-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandw=
idth.bb b/meta-ti-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidt=
h.bb
new file mode 100644
index 00000000..29db78c3
--- /dev/null
+++ b/meta-ti-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandwidth.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "Benchmark for checking DDR bandwidth"
+HOMEPAGE =3D "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tre=
e/arm_apps/arm_ddr_bandwidth/runLmDDRBandwidth.sh"
+LICENSE =3D "CC-BY-SA-3.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa=
9"
+
+PV =3D "1.0"
+
+SRC_URI =3D " \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/arm_app=
s/arm_ddr_bandwidth/runLmDDRBandwidth.sh;name=3DrunLmDDRBandwidth \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE=
;name=3Dlicense \
+"
+SRC_URI[runLmDDRBandwidth.sha256sum] =3D "67997d721b351344d8788200a15bb364=
0093045bc25f2b5307dd331ebd1556a3"
+SRC_URI[license.sha256sum] =3D "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326=
695a0cc7074bd6c8d263e3"
+
+S =3D "${UNPACKDIR}"
+
+do_install() {
+    install -d ${D}${datadir}/matrix-gui-2.0/apps
+
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/runLmDDRBandwidth.sh ${D}${bindir}/runLmDDRBandwi=
dth.sh
+}
+
+FILES:${PN} =3D " \
+    ${datadir}/matrix-gui-2.0/apps \
+    ${bindir}/runLmDDRBandwidth.sh \
+"
+
diff --git a/meta-ti-test/recipes-benchmark/coremark/coremark-ti.inc b/meta=
-ti-test/recipes-benchmark/coremark/coremark-ti.inc
new file mode 100644
index 00000000..9a1d9b89
--- /dev/null
+++ b/meta-ti-test/recipes-benchmark/coremark/coremark-ti.inc
@@ -0,0 +1,3 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/coremark:"
+
+SRC_URI +=3D "file://0001-core_main-Remove-printing-compiler-flags.patch"
diff --git a/meta-ti-test/recipes-benchmark/coremark/coremark/0001-core_mai=
n-Remove-printing-compiler-flags.patch b/meta-ti-test/recipes-benchmark/cor=
emark/coremark/0001-core_main-Remove-printing-compiler-flags.patch
new file mode 100644
index 00000000..ef7c78b2
--- /dev/null
+++ b/meta-ti-test/recipes-benchmark/coremark/coremark/0001-core_main-Remov=
e-printing-compiler-flags.patch
@@ -0,0 +1,41 @@
+From 0af4e2298ccacc8afc0294b7a731f0e866155427 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Mon, 1 Dec 2025 12:21:23 -0600
+Subject: [PATCH] core_main: Remove printing compiler flags
+
+Reproducible builds do not like including anything that references the
+build environment on the host machine.  This would include printing out
+the COMPILER_FLAGS macro.  Substitute it with "".
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ core_main.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/core_main.c b/core_main.c
+index a4beeb6..f0ab87f 100644
+--- a/core_main.c
++++ b/core_main.c
+@@ -380,7 +380,7 @@ for (i =3D 0; i < MULTITHREAD; i++)
+     ee_printf("Iterations       : %lu\n",
+               (long unsigned)default_num_contexts * results[0].iterations=
);
+     ee_printf("Compiler version : %s\n", COMPILER_VERSION);
+-    ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
++    ee_printf("Compiler flags   : %s\n", ""); //Reproducible build fix: C=
OMPILER_FLAGS);
+ #if (MULTITHREAD > 1)
+     ee_printf("Parallel %s : %d\n", PARALLEL_METHOD, default_num_contexts=
);
+ #endif
+@@ -410,7 +410,7 @@ for (i =3D 0; i < MULTITHREAD; i++)
+                       default_num_contexts * results[0].iterations
+                           / time_in_secs(total_time),
+                       COMPILER_VERSION,
+-                      COMPILER_FLAGS);
++                      ""); //Reproducible build fix: COMPILER_FLAGS);
+ #if defined(MEM_LOCATION) && !defined(MEM_LOCATION_UNSPEC)
+             ee_printf(" / %s", MEM_LOCATION);
+ #else
+--=20
+2.43.0
+
diff --git a/meta-ti-test/recipes-benchmark/coremark/coremark_%.bbappend b/=
meta-ti-test/recipes-benchmark/coremark/coremark_%.bbappend
new file mode 100644
index 00000000..952d6e99
--- /dev/null
+++ b/meta-ti-test/recipes-benchmark/coremark/coremark_%.bbappend
@@ -0,0 +1,4 @@
+COREMARK_TI =3D ""
+COREMARK_TI:ti-soc =3D "coremark-ti.inc"
+
+require ${COREMARK_TI}
diff --git a/meta-ti-test/recipes-benchmark/nbench-byte/nbench-byte-ti.inc =
b/meta-ti-test/recipes-benchmark/nbench-byte/nbench-byte-ti.inc
new file mode 100644
index 00000000..f571f368
--- /dev/null
+++ b/meta-ti-test/recipes-benchmark/nbench-byte/nbench-byte-ti.inc
@@ -0,0 +1 @@
+ARM_INSTRUCTION_SET =3D "arm"
diff --git a/meta-ti-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbapp=
end b/meta-ti-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
new file mode 100644
index 00000000..dfe5ea96
--- /dev/null
+++ b/meta-ti-test/recipes-benchmark/nbench-byte/nbench-byte_%.bbappend
@@ -0,0 +1,4 @@
+NBENCH_BYTE_TI =3D ""
+NBENCH_BYTE_TI:ti-soc =3D "nbench-byte-ti.inc"
+
+require ${NBENCH_BYTE_TI}
diff --git a/meta-ti-test/recipes-benchmark/openssl-perf/openssl-perf.bb b/=
meta-ti-test/recipes-benchmark/openssl-perf/openssl-perf.bb
new file mode 100644
index 00000000..04a3fb79
--- /dev/null
+++ b/meta-ti-test/recipes-benchmark/openssl-perf/openssl-perf.bb
@@ -0,0 +1,49 @@
+SUMMARY =3D "Benchmarks for checking various OpenSSL performance functions=
"
+HOMEPAGE =3D "https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/tre=
e/cryptos_apps_scripts/"
+LICENSE =3D "CC-BY-SA-3.0"
+LIC_FILES_CHKSUM =3D "file://${UNPACKDIR}/LICENSE;md5=3D6e0ae7214f6c74c149=
cb25f373057fa9"
+
+PV =3D "1.0"
+
+SRC_URI =3D " \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_perf_scripts/openssl_perf.sh;name=3Dopenssl_perf \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_aes256_encdec_scripts/openssl_aes256_encdec.sh;name=
=3Dopenssl_aes256_encdec \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_display_cert_scripts/openssl_display_cert.sh;name=3Do=
penssl_display_cert \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_gen_cert_scripts/openssl_gen_cert.sh;name=3Dopenssl_g=
en_cert \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_gen_pubkey_scripts/openssl_gen_pubkey.sh;name=3Dopens=
sl_gen_pubkey \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_gen_sha1hash_scripts/openssl_gen_sha1hash.sh;name=3Do=
penssl_gen_sha1hash \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_start_server_scripts/openssl_start_server.sh;name=3Do=
penssl_start_server \
+    https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE=
;name=3Dlicense \
+"
+SRC_URI[openssl_perf.sha256sum] =3D "5769e841b977d6a858da38826c2cf47c288ed=
642614c5b6f802409cb3601ab29"
+SRC_URI[openssl_aes256_encdec.sha256sum] =3D "1a488e3ba98f6f2e5f73c14681b0=
452ba902aecbb174e4e74b524dda4c5eda7a"
+SRC_URI[openssl_display_cert.sha256sum] =3D "fbe80fe1afe29f777e346ecd86d89=
e1f27cedc1bb745a9a9bc5cd38f2d566a3e"
+SRC_URI[openssl_gen_cert.sha256sum] =3D "47bfc80b88edebcc4d82ee3816bc05b95=
ca0d42c42e7f3b83e74fa6f9c6c01ef"
+SRC_URI[openssl_gen_pubkey.sha256sum] =3D "4581e2329afeb814602c4874ffa038d=
95a4bcc8b23df24d7be25822d0dd6c433"
+SRC_URI[openssl_gen_sha1hash.sha256sum] =3D "f338f8c3067ebb1c5710b16b91e8b=
9e38685b05fcc072060ec0c62bd10cefd97"
+SRC_URI[openssl_start_server.sha256sum] =3D "e23499210f701ef831d39a8c732f3=
4f4b06fb3ba2d069c4a95ef25ae59f3c93e"
+SRC_URI[license.sha256sum] =3D "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f97326=
695a0cc7074bd6c8d263e3"
+
+S =3D "${UNPACKDIR}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/openssl_perf.sh ${D}${bindir}/openssl_perf.sh
+    install -m 0755 ${S}/openssl_aes256_encdec.sh ${D}${bindir}/openssl_ae=
s256_encdec.sh
+    install -m 0755 ${S}/openssl_display_cert.sh ${D}${bindir}/openssl_dis=
play_cert.sh
+    install -m 0755 ${S}/openssl_gen_cert.sh ${D}${bindir}/openssl_gen_cer=
t.sh
+    install -m 0755 ${S}/openssl_gen_pubkey.sh ${D}${bindir}/openssl_gen_p=
ubkey.sh
+    install -m 0755 ${S}/openssl_gen_sha1hash.sh ${D}${bindir}/openssl_gen=
_sha1hash.sh
+    install -m 0755 ${S}/openssl_start_server.sh ${D}${bindir}/openssl_sta=
rt_server.sh
+}
+
+FILES:${PN} =3D "\
+    ${bindir}/openssl_perf.sh \
+    ${bindir}/openssl_aes256_encdec.sh \
+    ${bindir}/openssl_display_cert.sh \
+    ${bindir}/openssl_gen_cert.sh \
+    ${bindir}/openssl_gen_pubkey.sh \
+    ${bindir}/openssl_gen_sha1hash.sh \
+    ${bindir}/openssl_start_server.sh \
+"
+
diff --git a/meta-ti-test/recipes-benchmark/stream/stream_%.bbappend b/meta=
-ti-test/recipes-benchmark/stream/stream_%.bbappend
new file mode 100644
index 00000000..97e0c6a0
--- /dev/null
+++ b/meta-ti-test/recipes-benchmark/stream/stream_%.bbappend
@@ -0,0 +1,13 @@
+INSANE_SKIP:${PN} +=3D "ldflags"
+INSANE_SKIP:${PN}-openmp +=3D "ldflags"
+
+PR:append =3D ".ti1"
+
+BRANCH =3D "sdk"
+SRCREV =3D "96156d407d9a4e5fac4513f3d3f60a414b3355cd"
+
+do_compile:prepend() {
+    #Explicitly clear some variables to insure no unexpected optimizations=
 are being passed in.
+    unset CFLAGS
+    unset LDFLAGS
+}
diff --git a/meta-ti-test/recipes-benchmark/stream/stream_5.10.bb b/meta-ti=
-test/recipes-benchmark/stream/stream_5.10.bb
new file mode 100644
index 00000000..484be34d
--- /dev/null
+++ b/meta-ti-test/recipes-benchmark/stream/stream_5.10.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "Stream Benchmark"
+HOMEPAGE =3D "http://www.cs.virginia.edu/stream/"
+LICENSE =3D "Stream_Benchmark_License"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbca8cbe07976fe64c8946378d08=
314b0"
+SECTION =3D "system"
+
+PR =3D "r0"
+
+BRANCH ?=3D "master"
+SRCREV =3D "b66f2bab5d6d0b35732ef8406ae03873725a3306"
+
+SRC_URI =3D "git://git.ti.com/git/arago-project-org/stream.git;protocol=3D=
https;branch=3D${BRANCH}"
+
+PACKAGES =3D+ "${PN}-openmp"
+
+do_compile() {
+	oe_runmake CC=3D"${CC}"
+}
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/stream_c ${D}/${bindir}/
+	install -m 0755 ${S}/stream_c_openmp ${D}/${bindir}/
+}
+
+FILES:${PN}-openmp =3D "${bindir}/stream_c_openmp"
--=20
2.43.0


