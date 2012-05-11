Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 992FEE01402
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 19:41:46 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3U00KN47H3X8C0@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 10 May 2012 21:41:28 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 79B3920043; Thu,
	10 May 2012 22:41:27 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 22:41:20 -0400
Message-id: <1336704080-23643-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.8.6
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] linux-ti33x-psp 3.2: avoid gold linker for Thumb2 kernel
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
X-List-Received-Date: Fri, 11 May 2012 02:41:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

BeagleBone kernel is required to be built in Thumb2 mode for fast boot.
Gold linker is not yet perfect for this, giving an internal error:

| arm-linux-gnueabi-ld: internal error in thumb_branch_common, at .../binutils-cross-2.22-r6/binutils-2.22/gold/arm.cc:4149

While this fix can be put in generic linux.inc for all the kernels, it's
better to test the Gold linker out as much as possible and only disable it
for known issues, like this one (until it gets fixed, of course).

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index d1dfaaf..0f44a95 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -22,6 +22,8 @@ SRC_URI += "git://arago-project.org/git/projects/linux-am33x.git;protocol=http;b
 
 SRC_URI_append_beaglebone = " file://logo_linux_clut224.ppm"
 
+KERNEL_LDSUFFIX_beaglebone = "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '.bfd', '', d)}"
+
 do_compile_prepend() {
 	cp ${WORKDIR}/am335x-pm-firmware.bin ${S}/firmware/
 }
-- 
1.7.7


