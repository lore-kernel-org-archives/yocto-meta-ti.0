Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A079E01584
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 11:55:39 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KItdPp008169
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 13:55:39 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KItdq1013676
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 13:55:39 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 13:55:39 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7KItV99003588;
	Tue, 20 Aug 2013 13:55:37 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 20 Aug 2013 14:26:46 -0500
Message-ID: <1377026806-5651-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1377026806-5651-1-git-send-email-fcooper@ti.com>
References: <1377026806-5651-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [dylan][PATCH 2/2] kernel.bbclass: Pull in tweaks from oe-core patch to local copy
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
X-List-Received-Date: Tue, 20 Aug 2013 18:55:41 -0000
Content-Type: text/plain

The below patch has been submitted to oe-core. Modify local copy of
kernel.bbclass to mimic this patch until patch is upstreamed.

kernel.bbclass: Create symbolic link to add ${KERNEL_IMAGETYPE} to boot package
* By default for some platforms U-boot assumes the kernel image is located in
  the boot directory of the root filesystem.
* The kernel.bbclass already includes the kernel image in the /boot directory
  but adds a version number to the file name.
* Create a symbolic link that names the kernel image in the exact way that
  U-boot expects.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 3320747..1211911 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -109,6 +109,7 @@ kernel_do_install() {
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
 	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
+	ln      -sf ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
-- 
1.7.0.4


