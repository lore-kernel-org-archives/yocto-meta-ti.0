Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98BCAE00C89; Tue, 18 Jul 2017 16:05:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAF79E00C95
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:05:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4o4V001309
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419090;
	bh=wceQyd1fjycaP5GeLGVX5UPpVyMqG4rMv5dpIN4sfXw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tqWcP+4oonv+lS6kj2UFVAumgEFGSMBRgelZxjAZwS3R42g3eurx6lcTUrbhdizih
	xzELAGtCkP/MxyhW3wEWG4b4r+R1PA+TL+ynCSP+prB+BIW7M9exvUfO+QljVLbQJl
	g7/zwRhs4cX2PupxlYsQYiDdDw3ZEVpQOawuCjXo=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4j0V032384
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:45 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hv000997;	Tue, 18 Jul 2017 18:04:45 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:35 -0400
Message-ID: <1500419028-3361-24-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 24/37] usb-lld-rtos: Added rtos recipe for usb-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:05:09 -0000
Content-Type: text/plain

Upstreaming RTOS low level driver for USB interface
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary & merged in to a single recipe

 recipes-bsp/usb-lld/usb-lld-rtos_git.bb | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 recipes-bsp/usb-lld/usb-lld-rtos_git.bb

diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
new file mode 100644
index 0000000..a227981
--- /dev/null
+++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
@@ -0,0 +1,36 @@
+SUMMARY = "TI RTOS USB low level driver"
+
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


