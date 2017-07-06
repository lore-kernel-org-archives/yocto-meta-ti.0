Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E6ECE00BD5; Thu,  6 Jul 2017 16:01:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E72CEE00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 16:01:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66N0soP009549
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 18:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499382054;
	bh=C8SdtCxKq6udQr3KO/wDDyJdJ1J2HPcoJKwmOJ1x1mc=;
	h=From:To:CC:Subject:Date;
	b=n1uoSz6zkA+GRMblZ0rqVGuGcQryMACVjK1PbpXNlJU+2tiPWAMycXNqkXUwNir9S
	vSO/93v3MViWNREnWIi/GO/O1CKN386aWHz48YB7zg14iu0cx+YNNCMwe/MnTAyMVb
	wnj1WoQLcWkKbVoVXalG1HwBsL5xtQC+bZPSGKrw=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66N0nqY019040
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 18:00:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 18:00:49 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66N0na5027756;	Thu, 6 Jul 2017 18:00:49 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 19:00:47 -0400
Message-ID: <1499382047-61233-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] usb-lld-rtos: Added rtos recipe for usb-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 23:01:08 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-bsp/usb-lld/usb-lld-rtos_git.bb

diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
new file mode 100644
index 0000000..e7d6975
--- /dev/null
+++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
@@ -0,0 +1,34 @@
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://USBver.h;beginline=16;endline=46;md5=5394fa32763383d2c8e2aca5a1c67805"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+USB_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/usb.git"
+USB_LLD_GIT_PROTOCOL = "git"
+USB_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.09"
+USB_LLD_SRCREV = "6c2b21e5f6f8b34313f8d30a1de9b3e2fc301a73"
+
+BRANCH = "${USB_LLD_GIT_BRANCH}"
+SRC_URI = "${USB_LLD_GIT_URI};protocol=${USB_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${USB_LLD_SRCREV}"
+PV = "01.00.00.09"
+PR = "r0"
+
+DEPENDS_append = " osal-rtos"
+DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti43x = " starterware-rtos"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_USB_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "USB LLD"
-- 
1.9.1


