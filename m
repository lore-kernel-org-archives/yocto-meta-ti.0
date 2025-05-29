Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5391AC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 12:13:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.19605.1748520830171119135
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 29 May 2025 05:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IHKnyGlv;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: v-singh1@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TCDlgI3514913;
	Thu, 29 May 2025 07:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748520827;
	bh=1CyEXv8+FcTZ+5Pi0gRXYirAybWqj5Em7NaA2qM7Heo=;
	h=From:To:CC:Subject:Date;
	b=IHKnyGlvaQvOTRJO3PsmYmNKLYqvw+CuD3Y+ht3WecndfS6L4NkwMhRlfTPiTo7Hz
	 yVRyfOFjcO2zX1UJnJy141XyoWC1ScPOsi3npzXUs8f5mtj0QhTRexHYr2xrTpPDE1
	 8b97kxXCu6W41gCLrid/s+kVbg8P+Zry1BnUu3RY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TCDlV2135814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 07:13:47 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 07:13:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 07:13:47 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [172.24.227.153])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TCDi4P1519108;
	Thu, 29 May 2025 07:13:45 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [PATCH V2] Add rpmsg DMA library and simple DSP offload example
Date: Thu, 29 May 2025 17:43:44 +0530
Message-ID: <20250529121344.513885-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 29 May 2025 12:13:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18608

From: Vishnu Singh <v-singh1@ti.com>

1. rpmsg DMA library (meta-ti-bsp/recipes-ti/ipc):
	based on rpmsg & DMA Heap buffers. this includes librpmsg_dma.so shared library
	which provides apis for
		1. rpmsg interface initialization
		2. rpmsg based recv/send api for communication
		3. dma heap buffer management
		4. DSP firmware synamin load/unload

2. rpmsg DMA offload example (meta-ti-extras/recipes-ti/ipc):
	provides example foraudio offloading to DSP from linux using
	ti-rpmsg-dma library. Alsove provide Ethernet based control
	utility (host).

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 .../recipes-ti/ipc/ti-librpmsg-dma_1.0.bb     | 25 +++++++++++++++++
 .../ipc/ti-librpmsg-dma-example_1.0.bb        | 27 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
new file mode 100644
index 00000000..ad3f01f6
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "RPMsg DMA shared library"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
+
+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
+SRCREV = "1fce50101eeeebb595dcc07bf8d3ca2a8f9ffe2c"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "ti-rpmsg-char"
+
+EXTRA_OEMAKE = "lib"
+do_compile() {
+	oe_runmake ${EXTRA_OEMAKE}
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
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb b/meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
new file mode 100644
index 00000000..6dd614cd
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Audio Offload Example using RPMsg DMA"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
+
+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
+SRCREV = "1fce50101eeeebb595dcc07bf8d3ca2a8f9ffe2c"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "ti-librpmsg-dma fftw libsndfile1 alsa-lib"
+
+do_compile() {
+	oe_runmake -C example/audio_offload
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 example/audio_offload/bin/rpmsg_audio_offload_example ${D}${bindir}/
+
+	install -d ${D}${sysconfdir}
+	install -d ${D}/opt
+	install -m 0644 example/audio_offload/config/dsp_offload.cfg ${D}${sysconfdir}/dsp_offload.cfg
+	install -m 0644 example/audio_offload/audio_sample/sample_audio.wav ${D}/opt/sample_audio.wav
+}
+
+FILES:${PN} += "${sysconfdir}/dsp_offload.cfg"
+FILES:${PN} += "/opt/sample_audio.wav"
-- 
2.34.1


