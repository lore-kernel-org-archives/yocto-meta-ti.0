Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F91CD3420
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:44:47 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.828.1777481081101349528
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Apr 2026 09:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=TuOPjC72;
 spf=pass (domain: ti.com, ip: 52.101.52.70, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLbgS/mRHD/uLIZhkIMbgTvGerqji3/dpCVRelyV53kX2ZnVAuPTfQwtkiSHRKylQpljqZ6JaNOH6pFqr/5gp3CNvUPR2Uaya0q3yIn5MSTJLAPeTb29xvqGQpFKwlXhg4q/VDUetotHDfsmm0lEnniHbTkNTDev9xO6MdBnVUoep5pLDI9CCYV958zswujx39K43KPTeQWSH3jsOFOhb79hLMSYjV3GqeGvERBN5+FGyeQrurdTx64EvJS2IoR7RuTd/1KUJNW1svQC+bo0F0p4b2rp/74tUYIp4Y17ouRLDVgxTrfIb6e4dSfkb5gQVJCgUABnPJvUfQ2rVzXHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQOIl8rQIa3KbpTywUl9iQSlsihguG9FrZ2OShYQQyQ=;
 b=ebF8ara4B9//h78ok7JrdX6XYosFXPLGU7BRnYvjYHTUNSVXYl+3eHbmX7nnDAI41z9hHKQs4kVElc4iby6aZ59eADQVCZ5FWB3qJvR4DnIFaGnyrkNsB0o650yYlk/uztV99HTf0p/JWX3Tda6wB8+Wecd6egiArXR8wZUHuwEbkS7lbp2MHY3szOFELufjGGbuqBNHdymp2X+1xQ60UJqpEM8gOKXoy/8eqlKbfZ+s9NrseCtXdlUqpa1BX6UcadS/t9jrgh7ecv2AcznovJC/Ceg61DlDSASSN0YB5LIuwX6mkwReIMx4sweg29DTznhxZLo31FC3DPCM6upxgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQOIl8rQIa3KbpTywUl9iQSlsihguG9FrZ2OShYQQyQ=;
 b=TuOPjC72zR3XtpSNNj7oAdSqbQFwmH2yxv5vbJmNQ5OnhtPDgmpY2CSnf50kPtnMJsJAhMrBmUFUo5KSo6HUnsiNkA/DD2iMA3PAL/3jwb4D/P3iHw5OgT3kAzRzlvL9DiQqK9Yeii6d0t+W+RzfqYyF4tD5Q0PXEI0VMzWd+HA=
Received: from BN9PR03CA0732.namprd03.prod.outlook.com (2603:10b6:408:110::17)
 by CH0PR10MB5017.namprd10.prod.outlook.com (2603:10b6:610:c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 16:44:36 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:110:cafe::6d) by BN9PR03CA0732.outlook.office365.com
 (2603:10b6:408:110::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 16:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:44:36 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:33 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 11:44:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 11:44:32 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63TGiW3S3487252;
	Wed, 29 Apr 2026 11:44:32 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wI81Y-00000006oOI-3QpU;
	Wed, 29 Apr 2026 11:44:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 11/12] meta-ti-test: Import the ti-test packagegroup
Date: Wed, 29 Apr 2026 11:44:31 -0500
Message-ID: <20260429164432.1623594-11-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164432.1623594-1-reatmon@ti.com>
References: <20260429164432.1623594-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|CH0PR10MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 3370c1ff-747d-4f97-dcf5-08dea60e9953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	yNwDBg1GwsJPBvbc3QJX0I05cnerh4bnIOJ0TAsfWxWsR+PFBrz04GIpwlvfQD/KEc2i1psTPijkT2rRz43Kaxv9WhFiK0PUaFYSZ4F97qSJ7+XELQ1OaLQ/zQG9ITtsJg2UCvisW0waN2wTUSpnzRqe9xD/Sx26DEtj/vas0K8QdfHH8Mo7yBT4fZ5YukFDFRdoD8QF9SeFE8p9pwFctOWL/rahjM/xvFQ9fmD0QH3S9+pmAhonQPH2pz/2PrdnLpXytBUp0pXd/15RB4rCgk+Oj939y2/YW2Iy06lxoIxvCvQ1xS5cAvZzsCZbIhE8u6rZDsKn1Wal0w12O5ppDt9ObUOGmvdFy6nRnHfuFPGPCOzOFgdS/EMMrKOjQVDsB4N+XypAUDOWGWgxW1XKZSbf55yBBXrbYQaw2Oo8pPfBjxaAs/qbNQemj9M8D93hjT5VDIdy0RD293K9jEhVngGF8CLuWabN7AKA7qZq6xF6mYZpB9FPCa0NNmeRF4FUa1QEOxoHZM9xsgUCaAkJMIsAqRLh6EijUc9yUzm3Zcq/FtjmuRH/15wocTnPMuVCAkqNJ1dBIDAYcuCgKgMxamrxJg46WSFx3AsNxpmtDRC9Md3G9v4UvFuhNkkBjzoe5kbd9or1219/2inqGzpt4JNdu7OL1C2fxqv5PShmBjNgNCGcauyYbwX9beaiZXbF3/wssu4qy8jxndFu5ZYP7g9njz/jDYvo3RjAA7lmqF8ciSufBpHWNaNxu/jL3tKdrZGyOtlRFWumeCNoM8Czyg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	d93KX63rQ0hmFAJHwqjQEAywE4pPiVP1isW233L85vtEQxEtAQ2OqsrAd9NJcQ5m/cAdX9MqTJAyT5B0pjnPM+gIPZ01aIAv7JMvvgCOAwA22id92b84ckXAmxN3dYMAfCnAFRAIWvkejIJemUEAm+N2UA9i6SnMcj4yTplGkofnumcImT5+d/vv479b10ERokA1r3D5tY25Fi4KDn7psADL4pZ4WEPlkcH1IjUqcWjRuVF6KLMHTY4GbubGuvh4acE3rGqBMArrreG+tnjHwcvZk9Clm4LRPJFP7wwkLe/vDG+nWFQTDEHItBc4/Mr2qLRkM1gOkcSa3uX4gKb+I9UH4OhPUFS7urSS2b3zWwJ5zimq0jbxR58HNM82x/EVyOREKaoe+XqgJdPwvZu99n3vJS6DZoGBbp+RkFAndvSMm3T2CfF/v30RDYq+hHgI
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:44:36.4156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3370c1ff-747d-4f97-dcf5-08dea60e9953
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5017
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Apr 2026 16:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19909

We are moving the meta-arago-test layer to meta-ti-test.  This commit
imports the ti-test packagegroup that uses all of the previous commits..

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes.
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


