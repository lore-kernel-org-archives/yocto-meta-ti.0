Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACE0EE00D17; Fri, 15 Dec 2017 12:36:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B911E00B48
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 12:36:57 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFKavDp014090
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 14:36:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513370217;
	bh=6Yz1GLZEhSWLFOe/rYHcTdkXuxMCZt3gP+11RXxQVPU=;
	h=From:To:Subject:Date;
	b=fqKc41TKblLdKNnj91RKN12iC6SgGZkBe59ryccmLMlbbv78lfXXdZ4D2HyaN23Ix
	PuQLW/11NXRB4F7KkVQb+vN46P3pCkwckG99sdJNWvMjhBfth3/dCxzGFzelp9wejM
	9WttWiOZ6FIcB6AjDnfE0o1SvAQxY1raLun5894s=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFKavlr018381
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 14:36:57 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 14:36:57 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 14:36:57 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFKauaD019656
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 14:36:57 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Dec 2017 15:36:53 -0500
Message-ID: <1513370213-15801-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] usb-lld-rtos: Update to version 1.0.0.12B & added omapl1 support
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
X-List-Received-Date: Fri, 15 Dec 2017 20:36:59 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
index a227981..441741b 100644
--- a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
+++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
@@ -5,21 +5,21 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://USBver.h;beginline=16;endline=46;md5=5394fa32763383d2c8e2aca5a1c67805"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 USB_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/usb.git"
 USB_LLD_GIT_PROTOCOL = "git"
 USB_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.09"
-USB_LLD_SRCREV = "6c2b21e5f6f8b34313f8d30a1de9b3e2fc301a73"
+# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.12B"
+USB_LLD_SRCREV = "c055edbc2e6bf6aad95aa6e83e46a9ff03ee026b"
 
 BRANCH = "${USB_LLD_GIT_BRANCH}"
 SRC_URI = "${USB_LLD_GIT_URI};protocol=${USB_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${USB_LLD_SRCREV}"
-PV = "01.00.00.09"
+PV = "01.00.00.12B"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos"
-- 
1.9.1


