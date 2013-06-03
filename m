Return-Path: <manishv.b@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1EDCFE004CF
	for <meta-ti@yoctoproject.org>; Sun,  2 Jun 2013 23:11:07 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r536B6JY022289
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 01:11:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r536B647015470
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 01:11:06 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 3 Jun 2013 01:11:06 -0500
Received: from ucmsshproxy.india.ext.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlelxv23.itg.ti.com (8.13.8/8.13.8) with SMTP id
	r536B4OJ021758;	Mon, 3 Jun 2013 01:11:05 -0500
Received: from symphony.india.ext.ti.com (unknown [192.168.247.13])	by
	ucmsshproxy.india.ext.ti.com (Postfix) with ESMTP	id 46B59158004;
	Mon,  3 Jun 2013 11:41:04 +0530 (IST)
Received: from ubuntu-psp-linux.india.ext.ti.com (ubuntu-psp-linux
	[192.168.247.46])	by symphony.india.ext.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id r536B4R12364;	Mon, 3 Jun 2013 11:41:04 +0530 (IST)
From: "Vishwanathrao Badarkhe, Manish" <manishv.b@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 3 Jun 2013 11:43:13 +0530
Message-ID: <1370239993-19633-3-git-send-email-manishv.b@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1370239993-19633-1-git-send-email-manishv.b@ti.com>
References: <1370239993-19633-1-git-send-email-manishv.b@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] u-boot-omapl138: add recipe for omapl138 devices
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
X-List-Received-Date: Mon, 03 Jun 2013 06:11:07 -0000
Content-Type: text/plain

This recipe supports omapl138 devices.

Signed-off-by: Vishwanathrao Badarkhe, Manish <manishv.b@ti.com>
---
:100644 100644 cff1565... 703fd93... M	conf/machine/am180x-evm.conf
:000000 100644 0000000... b9cb5b3... A	recipes-bsp/u-boot/u-boot-am180x_2012.04.01.bb
 conf/machine/am180x-evm.conf                   |    2 +-
 recipes-bsp/u-boot/u-boot-am180x_2012.04.01.bb |   17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index cff1565..703fd93 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -5,7 +5,7 @@
 require conf/machine/include/davinci.inc
 require conf/machine/include/omapl138.inc
 
-UBOOT_MACHINE = "da850evm_config"
+UBOOT_MACHINE = "da850sdi_config"
 UBOOT_ENTRYPOINT = "0xc0008000"
 UBOOT_LOADADDRESS = "0xc0008000"
 
diff --git a/recipes-bsp/u-boot/u-boot-am180x_2012.04.01.bb b/recipes-bsp/u-boot/u-boot-am180x_2012.04.01.bb
new file mode 100644
index 0000000..b9cb5b3
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-am180x_2012.04.01.bb
@@ -0,0 +1,17 @@
+equire u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for AM180x devices"
+
+COMPATIBLE_MACHINE = "am180x-evm"
+
+PR = "r0"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "master"
+
+# DEV_DAVINCIPSP_03.22.00.04
+SRCREV = "DEV_DAVINCIPSP_03.22.00.04"
+
+UBOOT_SUFFIX = "bin"
+
-- 
1.7.4.1


