Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17D8E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 20:47:51 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1561.1736542062369656015
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 12:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=InCm03y+;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AKleDe3467029
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 14:47:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736542060;
	bh=43tEkDL0YA2hnwmwuHS+h5BDjf8eKbcux6Pr9tKHrfI=;
	h=From:To:Subject:Date;
	b=InCm03y+hdwRhIugs5vRN1HsUGXkYaPd7sYs+bdihEBDg6cwhB2ups7jiKMsf9gNa
	 KCpFZXeNnxjIdVXcJTFlrE+UjVTEB3ObGuAidro9eJMBXTr47i4z0G/mvE2/BYPy5w
	 MUTCPzFPsuMURvoJy70YytnX9+3jM3Kdvzd+zLrc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AKle7f020090
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 14:47:40 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 14:47:39 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 14:47:39 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AKld0R013849;
	Fri, 10 Jan 2025 14:47:39 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tWLut-0003mQ-Jy; Fri, 10 Jan 2025 14:47:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-ipc-rtos: Move to update-alternatives class
Date: Fri, 10 Jan 2025 14:47:39 -0600
Message-ID: <20250110204739.14161-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2025 20:47:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18185

There were some errors related to ipk postinst.  The issues were fixed
by going to the update-alternatives class instead of trying to create
the steps directly in the recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-ti/ipc/ti-ipc-rtos_git.bb         | 40 +++++++++----------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 7d845d39..853fa117 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -3,6 +3,7 @@ require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
 inherit deploy
+inherit update-alternatives
 
 DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
 
@@ -80,27 +81,24 @@ KFPLAT = ""
 
 ALTERNATIVE_PRIORITY = "5"
 
-pkg_postinst:${PN}-fw:omap-a15 () {
-  update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66 ${ALTERNATIVE_PRIORITY}
-  update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66 ${ALTERNATIVE_PRIORITY}
-  update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${ALTERNATIVE_PRIORITY}
-  update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4 ${ALTERNATIVE_PRIORITY}
-}
-
-pkg_postrm:${PN}-fw:omap-a15 () {
-  update-alternatives --remove dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
-  update-alternatives --remove dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
-  update-alternatives --remove dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
-  update-alternatives --remove dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
-}
-
-pkg_postinst:${PN}-fw:omapl138 () {
-  update-alternatives --install /lib/firmware/rproc-dsp-fw rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674 ${ALTERNATIVE_PRIORITY}
-}
-
-pkg_postrm:${PN}-fw:omapl138 () {
-  update-alternatives --remove rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674
-}
+ALTERNATIVE:${PN}-fw:omapl138 = "rproc-dsp-fw"
+ALTERNATIVE:${PN}-fw:omap-a15 = "dra7-dsp1-fw.xe66 \
+                                 dra7-dsp2-fw.xe66 \
+                                 dra7-ipu1-fw.xem4 \
+                                 dra7-ipu2-fw.xem4 \
+                                "
+
+ALTERNATIVE_LINK_NAME[rproc-dsp-fw] = "${nonarch_base_libdir}/firmware/rproc-dsp-fw"
+ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${nonarch_base_libdir}/firmware/dra7-dsp1-fw.xe66"
+ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "${nonarch_base_libdir}/firmware/dra7-dsp2-fw.xe66"
+ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] = "${nonarch_base_libdir}/firmware/dra7-ipu1-fw.xem4"
+ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/dra7-ipu2-fw.xem4"
+
+ALTERNATIVE_TARGET[rproc-dsp-fw] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674"
+ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66"
+ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66"
+ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4"
+ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4"
 
 do_deploy() {
   install -d ${DEPLOYDIR}
-- 
2.17.1


