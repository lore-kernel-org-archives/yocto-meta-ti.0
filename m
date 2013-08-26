Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5117FE01548
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2013 07:36:34 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D399B52A19; Mon, 26 Aug 2013 14:36:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130826143632.D399B52A19@arago-project.org>
Date: Mon, 26 Aug 2013 14:36:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: add the latest integration tree in prep for 2013.10 release
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
X-List-Received-Date: Mon, 26 Aug 2013 14:36:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 66df71869c092e341a0e32099ddb6a5a457084e0
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=66df71869c092e341a0e32099ddb6a5a457084e0

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Aug 23 15:47:15 2013 -0400

u-boot-ti-staging: add the latest integration tree in prep for 2013.10 release

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_git.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
new file mode 100644
index 0000000..8d96aee
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
@@ -0,0 +1,19 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for TI devices"
+
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=6bc50ecab884fce80cd3ef3da8852b08"
+
+PV = "2013.07+2013.10-rc1"
+PR = "r0+gitr${SRCPV}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "master"
+
+SRCREV = "39bc12ddc36c9e30199471da0f3a929b178a04b2"
+
+SPL_BINARY = "MLO"
+SPL_UART_BINARY = "u-boot-spl.bin"


