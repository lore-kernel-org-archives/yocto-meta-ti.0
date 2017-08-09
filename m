Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CFB6E00B87; Wed,  9 Aug 2017 12:22:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63EA9E00B65
	for <meta-ti@yoctoproject.org>; Wed,  9 Aug 2017 12:22:28 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8694820AC9;
	Wed,  9 Aug 2017 19:22:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8uTffu9Za062; Wed,  9 Aug 2017 19:22:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 66B2D2014D;
	Wed,  9 Aug 2017 19:22:26 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EA074162565;
	Wed,  9 Aug 2017 15:22:25 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  9 Aug 2017 15:22:24 -0400
Message-Id: <1502306544-82285-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] ti-ipc-rtos: add default symlinks for Keystone DSP firmware images
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Aug 2017 19:22:29 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 01ef7a0..f4eefa8 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -72,8 +72,35 @@ do_install() {
   cp ${CP_ARGS} ${S}/packages/ti/ipc/tests/bin/* ${D}${base_libdir}/firmware/ipc || true
 }
 
+KFDSPNUM = "0"
+KFDSPNUM_k2hk = "8"
+KFDSPNUM_k2l-evm = "4"
+KFDSPNUM_keystone = "1"
+
+KFPLAT = ""
+KFPLAT_k2hk = "TCI6638K2K"
+KFPLAT_k2l-evm = "TCI6630K2L"
+KFPLAT_k2e = "C66AK2E"
+KFPLAT_k2g = "TCI66AK2G02"
+
 ALTERNATIVE_PRIORITY = "5"
 
+pkg_postinst_${PN}-fw_keystone () {
+  i=0
+  while [ $i -lt ${KFDSPNUM} ]; do
+    update-alternatives --install /lib/firmware/keystone-dsp$i-fw keystone-dsp$i-fw ipc/ti_platforms_evm${KFPLAT}_core0/messageq_single.xe66 ${ALTERNATIVE_PRIORITY}
+    i=$(($i + 1))
+  done
+}
+
+pkg_postrm_${PN}-fw_keystone () {
+  i=0
+  while [ $i -lt ${KFDSPNUM} ]; do
+    update-alternatives --remove keystone-dsp$i-fw ipc/ti_platforms_evm${KFPLAT}_core0/messageq_single.xe66
+    i=$(($i + 1))
+  done
+}
+
 pkg_postinst_${PN}-fw_omap-a15 () {
   update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66 ${ALTERNATIVE_PRIORITY}
   update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66 ${ALTERNATIVE_PRIORITY}
-- 
2.7.4


