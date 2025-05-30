Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA085C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 07:02:03 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1166.1748588518068202215
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 May 2025 00:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k9qAKMvq;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: v-singh1@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54U71t8n3808953;
	Fri, 30 May 2025 02:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748588515;
	bh=id1mB1jvxdEe7uFKLFehzcFTUifGoTi+kevRd6Kbu8s=;
	h=From:To:CC:Subject:Date;
	b=k9qAKMvqzbwSJFMhdU9r2u4A9uEGCgXRxzod5WPoSXPyPjb6A7rba6ESMIVykrYQx
	 7CKTLmBTrVw7Chjuq1znVpuCZSE3uwuYMpx2kAZ/UMKi+D1DHIzYYs7g6WqAMUq/m9
	 JjjlLWezM74deBtIKt32p4FHWGqRBh/Fe7W/2WVo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54U71t3W647262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 30 May 2025 02:01:55 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 30
 May 2025 02:01:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 30 May 2025 02:01:54 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [172.24.227.153])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54U71q9m2697864;
	Fri, 30 May 2025 02:01:52 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [PATCH V3] Add rpmsg DMA library and simple DSP offload example
Date: Fri, 30 May 2025 12:31:51 +0530
Message-ID: <20250530070151.537124-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 30 May 2025 07:02:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18614

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
index 00000000..0461ac46
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "RPMsg DMA shared library"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
+
+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
+SRCREV = "cd18ced927aa2b916708d611758caab25a795feb"
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
index 00000000..0806cccd
--- /dev/null
+++ b/meta-ti-extras/recipes-ti/ipc/ti-librpmsg-dma-example_1.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Audio Offload Example using RPMsg DMA"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
+
+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
+SRCREV = "cd18ced927aa2b916708d611758caab25a795feb"
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


