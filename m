Return-Path: <joelagnel@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 602FBE005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 17:29:26 -0700 (PDT)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9Q0TOWO017849
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 19:29:25 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9Q0TOiB025826
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 19:29:24 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9Q0TOok018633
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 19:29:24 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 25 Oct 2011 19:29:24 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p9Q0TMo1022907;	Tue, 25 Oct 2011 19:29:23 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 25 Oct 2011 19:13:14 -0500
Message-ID: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>, jdk@ti.com
Subject: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable usb-to-serial drivers
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Oct 2011 00:29:26 -0000
Content-Type: text/plain

Enable the PL2303 usb-to-serial driver required for serial output
from the beaglebone tester.

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig |    3 ++-
 recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb  |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
index 4b3c21d..478ec3e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/beaglebone/defconfig
@@ -2558,7 +2558,8 @@ CONFIG_USB_LIBUSUAL=y
 # USB port drivers
 #
 # CONFIG_USB_USS720 is not set
-# CONFIG_USB_SERIAL is not set
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_PL2303=y
 
 #
 # USB Miscellaneous drivers
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
index bffebea..fbee01f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "master"
 SRCREV = "1955a86594526e18f03c8d62db81119ffc4ccf0f"
-MACHINE_KERNEL_PR_append = "k+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.0.4


