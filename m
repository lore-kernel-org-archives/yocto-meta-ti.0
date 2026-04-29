Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B44CD13DD
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:47 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13792.1777475384527425520
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PwnrkuSK;
 spf=pass (domain: ti.com, ip: 40.107.200.26, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cex9AsAJiFk6lmQO3CVkb8ZdNTWQUB6kTrkceHpsEeIr04xtEUsbHbU+5h3SjEjB039N25jcYnIQD7IXsO1lHXMLKuqGU9O7iHuwNySJ75yhKZAZbJtdT9Gu984UGvZPS6YI4vZ3HMbv7MLKdNzogURfe5zbfJED1F1YYaqPrRCoilEcoOVUrOI87O5gmkMhqPAZtfo6bwtv0dEPvjUg4Z4ss+8H4jy6fAPHQOOZZbyLGfGh3jb4Wzv0RF5p2X9sZDzqLJFZmE3d4vITzTJXpLqkj4T8KxY45ARYXhIohLDqDo6wyIxB2GOFPjzwBR5zrn1yBG6x9+a/7Hq4062AgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWt5hIiDjsOw1gcuIj5GjlSB0Nwycd97LW4vBqFJSi0=;
 b=SDEEOtjUGfu2KIj5z9aPLEWqMJchYq+UXZOvvFVtVjURHmMo2c9J/V0w2z80UJC8ErxvHCS3tabmJvkZ5RaMG5nXkAMfbUXm/AB2c9Zsq/mJ3fJzPs6F3YGcJMa0PBpjwd8N1+aA+ifxRa7ynwX0fzpYfpYsaIgy16Jotw50pYL2fP11i8AgZtkLUdJA0rEpqx96BckKc8VjS29Fb84KJoiMjgNNpx1Zm3aAIcFynY0PxGBEpAkfi+gdyxJ15UH0GdaaDzPArkoBV7o7pCQd0XmRxBWfNvmmtItEJuWO07StcMWGIaSRr+iWYI60hB+T6oowkAZLDXHgEXs5XnFgbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWt5hIiDjsOw1gcuIj5GjlSB0Nwycd97LW4vBqFJSi0=;
 b=PwnrkuSKw01NStVXLTWL3KuxAUwA1m/QAc/VKQsfkhWT8PqvNVsU/gvlsjE9vzXUJZ05H75XWlUJ5r0PANnLiNlfnrdYulRCnSPj0k6MOVPUmZ8C5PPINMJvfqbKI39OWynL34X/GpDnLnKw8px9+zL5KQhR3Xu4lfyWOMLLETY=
Received: from SJ0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:a03:333::15)
 by DS0PR10MB6199.namprd10.prod.outlook.com (2603:10b6:8:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 15:09:41 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::23) by SJ0PR03CA0100.outlook.office365.com
 (2603:10b6:a03:333::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Wed,
 29 Apr 2026 15:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:09:40 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:09:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:09:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TF9K1p3565170;
	Wed, 29 Apr 2026 10:09:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6XQ-000000046Vj-21w3;
	Wed, 29 Apr 2026 10:09:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 11/12] meta-ti-test: Import the ti-test packagegroup
Date: Wed, 29 Apr 2026 10:09:19 -0500
Message-ID: <20260429150920.978263-11-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429150920.978263-1-reatmon@ti.com>
References: <20260429150920.978263-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|DS0PR10MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 6759f626-be8c-4b69-87a1-08dea6015627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jxicIbZekK9QXRQuYdXdJ2OjqLt6a4Z6lY0RjRgJT7yGfeDT4iU+Of12GvttRDORREWS0CFNlYOVcTgUKVEjLeIgkip7miQUsSz8NJbQOLzh1jai3xMzLeGoOMdmpcms2Fx74ldRzz7GDXMLNEtaKBomS3LxSC1y2svY9Y++5CzUizwxeF737C99A1fIY8VdNn8USX7n0wSeCKKwiSQ7OCEqsHtKtN784C/DTLJw9/jr8I6zQWgpGfIKH4/oaibzskvZ90+hjm/Qmk+4zPsfstdDhB9Z3LTnIzl6ZwVw4Mohivr88MqSMJLGrCfpeIkn4brIfK1480RK0V2DmCyNFELNaJh8KXHrYashgTK/1KprwfDAyGXowF57h6J02QE4TgwA+7yHId8GqOC8PufamaTmcMVrg4z7aXRIo8wTLCkJqw0aSPgONoRz9NDdBkAUonRDVoPRB8o+tIUoMi4M4dDrkh996/IXT5s8BpsT3Bj1cnmYFf42F606SOL5cveUXJFbDrGq/A6fTPYupd6gaChSZRiKwiu6tdTmJEhLpJPge5ebQXCOnoIA5vLGnRzRxZkQVQkXBqNKZONUt67zmcFWefuBIwIYOkF2VyK6IfHNkvc3lUZHAdrR/fs70hVEmPCNuBLG8Gd+N/u0VnrJ5w7SLt7uJT1j6tco1QYtvu9P8QrQYLA/ZywlmdMfUFnQDxK5/okRo+yzU2O/4PMho2Esg5tkjOD0OOZCyaFoMrys2IfCsjT1+sQl4Nbj2q7IC/Rkb2J79q2KsI3gfYy/mw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	es5EXnm1WHeBVMK4t6HVDsPArM5EnJ2SFnnzPP21HwFRrEbZL9ApTLqlntm8tGENvm4vIVfmUCyjYF+imdFiDxbn73aqc7SOu2HTURos3pd+1CtcpHXi7UiTEZhOu+L3dQ+9OBWg5BMGaxJEVE2yOW10zzan6Ow8qaBUeHznjOE4/f02+87HvJuHy3lUNiXZyxV235K22Unm/OXuGxxr4T93Fx4IPiyfwZp/TL/RyD0EsD9WU2ZZBeK24IinrbbE7xY0JoL8AgSwwhSq94Bc0aTYciTjE/Plp4gkmB9/4ccl7MdM8oYZtC9rqjerheec82A5ckOeIpUYsbBF+vdhJMNM+pU0Epq7ACC8EytZcc+buz4s4ffDCciUmcFLXxMeVY+C6P0YJ6uRKDH3+AQzqc20VYPw3o2paqO1ATupOlcPR3n+itXHh0t15FzACL/Q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:09:40.2398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6759f626-be8c-4b69-87a1-08dea6015627
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6199
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:09:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19890

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports the ti-test packagegroup that uses all of the previous commits..

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb     | 227 ++++++++++++++++++
 1 file changed, 227 insertions(+)
 create mode 100644 meta-ti-test/recipes-core/packagegroups/ti-test.bb

diff --git a/meta-ti-test/recipes-core/packagegroups/ti-test.bb b/meta-ti-t=
est/recipes-core/packagegroups/ti-test.bb
new file mode 100644
index 00000000..8a348c26
--- /dev/null
+++ b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
@@ -0,0 +1,227 @@
+SUMMARY =3D "TI Testing packagegroup"
+LICENSE =3D "MIT"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+PACKAGES +=3D " \
+    ${PN}-audio \
+    ${PN}-extras \
+    ${PN}-graphics \
+    ${PN}-multimedia \
+    ${PN}-networking \
+    ${PN}-storage \
+    ${PN}-ti-tools \
+"
+
+TI_TEST_BASE =3D "\
+    bc \
+    bonnie++ \
+    cryptodev-tests \
+    devmem2 \
+    dma-heap-tests \
+    evtest \
+    git \
+    i2c-tools \
+    kernel-modules \
+    kernel-selftest \
+    kmsxx \
+    kmsxx-python \
+    libdrm-tests \
+    linuxptp \
+    lmbench \
+    lsof \
+    media-ctl \
+    memtester \
+    nbench-byte \
+    openntpd \
+    ${@"optee-test" if d.getVar('OPTEEMACHINE') else ""} \
+    pcitest \
+    pciutils \
+    perf \
+    powertop \
+    procps \
+    rng-tools \
+    rt-tests \
+    rwmem \
+    smcroute \
+    stream \
+    stress \
+    stress-ng \
+"
+
+TI_TEST_BASE:remove:bsp-ti-6_18 =3D "pcitest"
+
+TI_TEST_BASE:append:armv7a =3D " \
+    cpuburn-neon \
+"
+
+TI_TEST_BASE:append:armv7ve =3D " \
+    cpuburn-neon \
+"
+
+TI_TEST_AUDIO =3D "\
+    alsa-utils \
+    pulseaudio-misc \
+"
+
+TI_TEST_EXTRAS_OPENCL =3D " \
+    opencl-cts \
+"
+
+TI_TEST_EXTRAS =3D " \
+    python3-pillow \
+    pytesseract \
+    python3-numpy \
+    python3-requests \
+    python3-websocket-client \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opencl', '${TI_TEST_EXTRAS_OP=
ENCL}', '', d)} \
+"
+
+TI_TEST_EXTRAS:append:ti-soc =3D " \
+    libsdl2-tests \
+"
+
+TI_TEST_GRAPHICS_OPENGL =3D " \
+    piglit \
+    offscreendemo \
+"
+
+TI_TEST_GRAPHICS =3D " \
+    wayland-utils \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${TI_TEST_GRAPHICS_=
OPENGL}', '', d)} \
+"
+
+TI_TEST_MULTIMEDIA =3D "\
+    gst-devtools \
+    v4l-utils \
+    yavta \
+"
+
+TI_TEST_MULTIMEDIA:append:ti-soc =3D " \
+    mpv \
+    ffmpeg \
+"
+
+TI_TEST_NETWORKING =3D "\
+    bridge-utils \
+    ethtool \
+    iperf3 \
+    iproute2-bridge \
+    iproute2-devlink \
+    iproute2-tc \
+    lldpd \
+    mstpd \
+    netperf \
+    strongswan \
+    tcpdump \
+    xdp-tools-ti \
+"
+
+TI_TEST_STORAGE =3D "\
+    dosfstools \
+    fio \
+    hdparm \
+    iozone3 \
+    mtd-utils \
+    mtd-utils-ubifs \
+"
+
+TI_TEST_STORAGE:append:ti-soc =3D " \
+    mtd-utils-ubifs-tests \
+"
+
+TI_TEST_TI_TOOLS =3D " \
+    arm-benchmarks \
+    arm-ddr-bandwidth \
+    coremark \
+    hwspinlocktest \
+    input-utils \
+    ltp-ddt \
+    openssl-perf \
+    uvc-gadget \
+"
+
+TI_TEST_TI_TOOLS:append:ti33x =3D " \
+    omapconf \
+    pru-icss \
+    switch-config \
+"
+
+TI_TEST_TI_TOOLS:append:ti43x =3D " \
+    omapconf \
+    pru-icss \
+    switch-config \
+"
+
+TI_TEST_TI_TOOLS:append:am57xx =3D " \
+    omapconf \
+    pru-icss \
+    switch-config \
+    ti-ipc-test \
+"
+
+TI_TEST_TI_TOOLS:append:k3 =3D " \
+    k3conf \
+    switch-config \
+    ti-rtos-echo-test-fw \
+    ti-rpmsg-char \
+    ti-rpmsg-char-examples \
+"
+
+TI_TEST_TI_TOOLS:append:am62xx   =3D " \
+    pru-icss \
+"
+
+TI_TEST_TI_TOOLS:append:am64xx   =3D " \
+    pru-icss \
+"
+
+TI_TEST_TI_TOOLS:append:am65xx   =3D " \
+    pru-icss \
+"
+
+# Disable due to breakage
+#    viddec-test-app=20
+TI_TEST_TI_TOOLS:append:j721e =3D " \
+    pru-icss \
+    ufs-utils \
+    videnc-test-app \
+"
+
+TI_TEST_TI_TOOLS:append:j784s4 =3D " \
+    ufs-utils \
+"
+
+TI_TEST_TI_TOOLS:append:j742s2 =3D " \
+    ufs-utils \
+"
+
+TI_TEST_TI_TOOLS:append:omapl138 =3D " \
+    ti-ipc-test \
+"
+
+TI_TEST_TI_TOOLS:remove:bsp-mainline =3D "ti-ipc-test"
+TI_TEST_TI_TOOLS:remove:bsp-next =3D "ti-ipc-test"
+
+RDEPENDS:${PN}-audio =3D "${TI_TEST_AUDIO}"
+RDEPENDS:${PN}-extras =3D "${TI_TEST_EXTRAS}"
+RDEPENDS:${PN}-graphics =3D "${TI_TEST_GRAPHICS}"
+RDEPENDS:${PN}-multimedia =3D "${TI_TEST_MULTIMEDIA}"
+RDEPENDS:${PN}-networking =3D "${TI_TEST_NETWORKING}"
+RDEPENDS:${PN}-storage =3D "${TI_TEST_STORAGE}"
+RDEPENDS:${PN}-ti-tools =3D "${TI_TEST_TI_TOOLS}"
+
+RDEPENDS:${PN} =3D "\
+    ${TI_TEST_BASE} \
+    ${PN}-networking \
+    ${PN}-storage \
+    ${PN}-ti-tools \
+"
+
+RDEPENDS:${PN}-extras +=3D "\
+    ${PN}-audio \
+    ${PN}-graphics \
+    ${PN}-multimedia \
+"
--=20
2.43.0


