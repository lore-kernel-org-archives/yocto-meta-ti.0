Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3903CC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 10:27:17 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.12497.1748428031289848215
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 May 2025 03:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EzdqGwNA;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: p-bhagat@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54SAR91p2067818;
	Wed, 28 May 2025 05:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748428029;
	bh=uedcKi7XlRt7ibeO+TMIJz7VKstinTLuGWk6aKa0PgQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EzdqGwNAkZ2NlklwSKGs4wXsb7H8MGW6MgqfxbhteRbgt0gKhqCodDHwCoKnO2v2j
	 YEuNHtNCCySU6BuukAKVeai5KdYnTPvhXdU0/bfJq4FMPyU6w9hATXaxyEXCC4/Qzq
	 wBCeiaRmuVQe7snG/+otwRQTJXUsOfSmjdVJTK+A=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54SAR9IJ1396131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 28 May 2025 05:27:09 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 May 2025 05:27:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 May 2025 05:27:09 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54SAR8p5008352;
	Wed, 28 May 2025 05:27:09 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [scarthgap][PATCH 2/2] Add rpmsg DMA library and simple DSP offload example
Date: Wed, 28 May 2025 15:56:53 +0530
Message-ID: <20250528102653.323423-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528102653.323423-1-p-bhagat@ti.com>
References: <20250528102653.323423-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 28 May 2025 10:27:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18602

From: Vishnu Singh <v-singh1@ti.com>

Add rpmsg DMA library and simple DSP offload example, based on rpmsg & DMA Heap
buffers. This includes librpmsg_dma.so shared library used for real-time audio
offloading to DSP from Linux, Ethernet based control utility etc.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 .../ipc/ti-librpmsg-dma-example_1.0.bb        | 28 +++++++++++++++++++
 .../recipes-ti/ipc/ti-librpmsg-dma_1.0.bb     | 26 +++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
 create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
new file mode 100644
index 00000000..8b01fa46
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Audio Offload Example using RPMsg DMA"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
+
+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
+SRCREV = "b71b6a2690eaac4ec1619a18733f73e505023ff7"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "ti-librpmsg-dma fftw libsndfile1 alsa-lib ti-rpmsg-char"
+
+do_compile() {
+	oe_runmake -C example/audio_offload
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 example/audio_offload/bin/audio_offload ${D}${bindir}/
+
+	install -d ${D}${sysconfdir}
+	install -d ${D}/opt
+	install -m 0644 example/audio_offload/config/dsp_offload.cfg ${D}${sysconfdir}/dsp_offload.cfg
+	install -m 0644 example/audio_offload/audio_sample/sample_audio.wav ${D}/opt/sample_audio.wav
+}
+
+FILES:${PN} += "${sysconfdir}/dsp_offload.cfg"
+FILES:${PN} += "/opt"
+FILES:${PN} += "/opt/sample_audio.wav"
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
new file mode 100644
index 00000000..666439dd
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "RPMsg DMA shared library"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
+
+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
+SRCREV = "b71b6a2690eaac4ec1619a18733f73e505023ff7"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "fftw libsndfile1 alsa-lib ti-rpmsg-char"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	install -d ${D}${libdir}
+	install -m 0755 lib/librpmsg_dma.so.1.0 ${D}${libdir}/
+	ln -sf librpmsg_dma.so.1.0 ${D}${libdir}/librpmsg_dma.so.1
+	ln -sf librpmsg_dma.so.1 ${D}${libdir}/librpmsg_dma.so
+
+	install -d ${D}${includedir}/rpmsg_dma
+	install -m 0644 include/*.h ${D}${includedir}/rpmsg_dma/
+}
+
+INSANE_SKIP:${PN} += "dev-so"
-- 
2.34.1


