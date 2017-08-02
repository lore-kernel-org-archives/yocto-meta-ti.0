Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC39BE00C31; Wed,  2 Aug 2017 08:33:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E048E00B28
	for <meta-ti@yoctoproject.org>; Wed,  2 Aug 2017 08:33:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v72FXSD3016130
	for <meta-ti@yoctoproject.org>; Wed, 2 Aug 2017 10:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501688008;
	bh=qCwa+q6rHHTvMIzv+Oa3t8cQh2PwIjY+ksOo7klGW4M=;
	h=From:To:CC:Subject:Date;
	b=pJy+QYjeBHlZHRPtads2dIGD/hWULmEXgs2d89Z8ZkBNx4DNDLpsbMJhNOgwfIpGA
	5+2v4rVJvu7A2bnY7FcB16eYgAuYk/zmpHAEssS13IhMZdnlF402/aMrJNvXBFgJZH
	WFA5hrKJL1ufAInZFBgVEkCMQm7eKCDpFLwqDNjM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v72FXS76015568
	for <meta-ti@yoctoproject.org>; Wed, 2 Aug 2017 10:33:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 2 Aug 2017 10:33:28 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 2 Aug 2017 10:33:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 2 Aug 2017 10:33:28 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v72FXS57019463;
	Wed, 2 Aug 2017 10:33:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 2 Aug 2017 11:33:25 -0400
Message-ID: <1501688005-39245-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3] uart-lld-rtos: Added rtos recipe for uart-lld
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
X-List-Received-Date: Wed, 02 Aug 2017 15:33:31 -0000
Content-Type: text/plain

Upstreaming RTOS PDK driver for UART module

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v3 - Added summary
v2 - Adding description & merging in to a single recipe

 recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 recipes-bsp/uart-lld/uart-lld-rtos_git.bb

diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
new file mode 100644
index 0000000..e8510b6
--- /dev/null
+++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
@@ -0,0 +1,42 @@
+SUMMARY = "TI RTOS low level driver for UART"
+DESCRIPTION = "TI RTOS low level driver for Universal Asynchronous Receiver/Transmitter (UART) module "
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://UART.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+UART_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/uart-lld.git"
+UART_LLD_GIT_PROTOCOL = "git"
+UART_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.07A"
+UART_LLD_SRCREV = "884e340f5d2f004de99e44f014fedb781f1fb975"
+
+BRANCH = "${UART_LLD_GIT_BRANCH}"
+SRC_URI = "${UART_LLD_GIT_URI};protocol=${UART_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${UART_LLD_SRCREV}"
+PV = "01.00.00.07A"
+PR = "r0"
+
+DEPENDS_append = " edma3-lld-rtos \
+                   osal-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti43x = " starterware-rtos"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_UART_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
+XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "UART LLD"
-- 
1.9.1


