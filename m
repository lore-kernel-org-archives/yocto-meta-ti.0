Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD49CD13D9
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:23:43 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14125.1777476218058768989
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 08:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=A14JOVxC;
 spf=pass (domain: ti.com, ip: 52.101.57.3, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8AeYXziQMD+ePqj382imG0kjfPor0eas+HbraoHn4lRhjmjf55ezSwTXD1uUgIBQEmeeMWBz2S6WyhPul7hBoY0uA0QNBD6Xl83Ky+moeseJbJ78g+odhphEG8nF7RH/mcZQaQaOD1HCc+9Zs/Fm4QGPCtnePZl+qWBGrrhe3oUbPyu/MmXCKi8uAy5QM0hc9ImGW0nFSD0wPenWlZnxyXthUPGiB3n8/J6XZwLl/KX9tcJm50mDt1vA7/DTwUWhNrwlyR68U/ddA2Vvw/MydT/vIyMVU7+ipUX3E3TvNr5p+RcBjrIVDut0HAKQojiqpufObWf3zXPq8boMirh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7dKRlWQ1jy7s1yLRo8Lg1eRbWMKqIKOYlqiJB1x07M=;
 b=dUFAOvitAWUR4l9ngbnXfNPb8eohCY/6+rss9VJFOT8O9oakLBAbqZ2Jefdp6QrdlSlHRqvn4n/Twn0ZjdjfwQCajrDKV9J8RkvRHn52HcC2Bu/Nzbwut7L5IhC7I2fZ7lSU7uSfLkgtbASUAf1PWyvqxKqSH1Rj87fBP9Vk66E+z6VnlCOtky1Aa5JRs8gbQ1HLtmqcuF8skmGVXGi7nO426nZwvEka2kg3tgA77UYzxI6Ir5aSd2DVEyAM/2uP97e3tT1XZ9G6HwqoGHcSgkFErFgkYCQ5hGphF0sDgLwExLgp007UDYVFGFi64ShfJqEAnx8P+CVnac+O7egxwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7dKRlWQ1jy7s1yLRo8Lg1eRbWMKqIKOYlqiJB1x07M=;
 b=A14JOVxChhrsjkC6bMlrnpNQvQkmUcfa/7hEjaS+jHpjio6EzvmmF8NClpwVNXj3Zv+EFrcYw+iWCFdDGDN9ItR6nzfOVfjo+H15YHzKRdgAMb2+V3WLdTT20eiFS2qd/C/7Qeve/Pv/znaHy5p2naWaLY3mRZ2QEo+PYyEOuYk=
Received: from BYAPR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:40::16)
 by SJ0PR10MB5670.namprd10.prod.outlook.com (2603:10b6:a03:3ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 15:23:35 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:40:cafe::1) by BYAPR04CA0003.outlook.office365.com
 (2603:10b6:a03:40::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 15:23:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 15:23:34 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:01 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 10:23:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 10:23:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TFN0cG3585469;
	Wed, 29 Apr 2026 10:23:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI6ke-000000046se-32ku;
	Wed, 29 Apr 2026 10:23:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 11/12] meta-ti-test: Import the ti-test packagegroup
Date: Wed, 29 Apr 2026 10:22:59 -0500
Message-ID: <20260429152300.979685-11-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429152300.979685-1-reatmon@ti.com>
References: <20260429152300.979685-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|SJ0PR10MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: 251713b1-8b4d-4a64-7eaa-08dea6034739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	gNppfQgtY4qA7MVV6c6+6YdnXHbdi5A4E3F9dB1msPH22JHIxb6UIlx0EpUI2C5wKTdTWq/QcVTqjqDeT34ynAVzrZciImcBt1guaNPlZQjsgYrB2rpIaU6qCgNQ9n6ym6n2fGjw0Tqpigpp5T72CzUQYcMc83ZRBNyklRmzkW9K/AcTQN9V4PcnGZiCj9pZbrNwNtQSYiFYSJ/n8XwI9G63Fa424cx1xm+8dF57ToQuntYw7PxQ/dQmPBMCWr5HlYix6Tvi+bDAre6wfFoC+s8EbTWOi1jCif04z7bFos3n46povzXixtvnHc8EEhyM0X5OCRZIgp0fwe/IvBHcFiKjrBPxiAZeAXvxeDw6zD+dEAiWnYavJyq0Xu+KcmHr0LvYY0Idrdf8DrkpNAfmUTEtvdrI6OTAcio4MR3V8PIJuGVErU/QVrz7ijChiqXyCLXZg/f9jz/Nx3v3J6Md2iNY4x0qqiXk22NQbRUMIIpg7QrBWFq6p7B+B28VMhxI5HXP8tuMpurv3EKntiaZOA1LxEVd/UmkV2bgfSBptn4ypb/pJRvLoKDMP3G9V0E5kpfmTH9KU1UYbJYYa6YGSpXC3c9EICiT9uUsNMkguCF8otzMVxmZfJpF56JvPrvkdQ8ZCGtV3wsW1VaWr750mp2vGrf8i7S5Zqd6QVggKkgTyiqhAfjQIyeRti4Ts2L4lmeEn++9VX1N/LoA3p77rpckM2V1av4nnYIwI1Pq6x7LchSlMRbnGYt7RRBneTPA95cypd728zp6U+3klrNeUg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KxOCIG63YUeZJQ8yF83JGIqGstbmeJWzhEg2b3QtutthBLHyG6PGZS5aWXt0BjQihQI/Kvyi5oL0VXQTGrQyXeeEuxXfXXWxgkFNyrSwV3iMk22bOm4GkruPyvfGg8M/X75i2BONx3Qq0QB/NlJtRPDJH2o3YRvkGIVVBiC02HuqXQ+8vNklzl9GWSVVbI/bNUbsipRgTwBh1RMFmMswqIGOWVGtBfn1EzdVxMN+p9Zw9GtFm8+YbRCNrbVlSH/kpUy4Qhf6mLDFmJFPl0VdMaxIhI+KqilPjeQOiZeRwHngRPgCu8qqCQpdI3NfRwvnxIhLk/qEdxmx24teUOg+8wGeKgdFx6b/uXUp6SwPJUPMA6mEufqyDUF4neoJgIUdYTetxhL3hVsZLZXXep/L30OynYo48oVjtukuJrFb5vQ87/umsDUk9XnGszqk6Pw2
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 15:23:34.1974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 251713b1-8b4d-4a64-7eaa-08dea6034739
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5670
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 15:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19903

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports the ti-test packagegroup that uses all of the previous commits..

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: No changes.

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


