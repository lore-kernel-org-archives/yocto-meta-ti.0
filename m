Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65051E00723
	for <meta-ti@yoctoproject.org>; Fri, 11 May 2012 10:24:02 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 779F952A60; Fri, 11 May 2012 17:23:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511172400.779F952A60@arago-project.org>
Date: Fri, 11 May 2012 17:23:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti33x-psp 3.2: avoid gold linker for Thumb2 kernel
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
X-List-Received-Date: Fri, 11 May 2012 17:24:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a623c766f2ea8e022d216d281301919ee0cdd3fb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a623c766f2ea8e022d216d281301919ee0cdd3fb

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 10 21:55:15 2012 -0400

linux-ti33x-psp 3.2: avoid gold linker for Thumb2 kernel

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


