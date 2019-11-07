Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99039E00E35; Thu,  7 Nov 2019 10:10:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F74AE00BA1
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:58 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9v5N106953
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150197;
	bh=b293X7q6PKJtK8CsJGL5bnvDZx2jqJVEkVuFlfbhgb8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ycL6HDoIn9sADCSRlqUKoQJrxNH27u60jsBwroX/uJZ4WMyIle4b+z0YJPUZcxwe1
	Pz74yl6Zie6qwBM6cJFZSREIja5WBTdCbDY7rb71+SgEc6ES7oI8ooIAh8eYQ9uDxs
	T338faHU4eB8GQsBZQmS+nq4D0waxo0DNIkyFIsU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9vWs121358
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:57 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:57 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:41 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIh067418;
	Thu, 7 Nov 2019 12:09:57 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:32 -0500
Message-ID: <1573149037-762-38-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 37/42] usb-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:10:04 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bb | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
index 6a212e3..3a0f5ee 100644
--- a/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
+++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS USB low level driver"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://USBver.h;beginline=16;endline=46;md5=5394fa32763383d2c8e2aca5a1c67805"
@@ -8,18 +9,6 @@ LIC_FILES_CHKSUM = "file://USBver.h;beginline=16;endline=46;md5=5394fa32763383d2
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-USB_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/usb.git"
-USB_LLD_GIT_PROTOCOL = "git"
-USB_LLD_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.19"
-USB_LLD_SRCREV = "1304fbdc7e0d67dd3722ac1a450a547a5d82d20a"
-
-BRANCH = "${USB_LLD_GIT_BRANCH}"
-SRC_URI = "${USB_LLD_GIT_URI};protocol=${USB_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${USB_LLD_SRCREV}"
-PV = "01.00.00.19"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos"
@@ -35,3 +24,4 @@ export DEST_ROOT="${S}"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "USB LLD"
+TI_PDK_COMP = "ti.drv.usb"
-- 
2.7.4


