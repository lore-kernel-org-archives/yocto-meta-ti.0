Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1F18E006E7
	for <meta-ti@yoctoproject.org>; Fri, 22 Nov 2013 11:08:43 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A021C529ED; Fri, 22 Nov 2013 19:08:43 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131122190843.A021C529ED@arago-project.org>
Date: Fri, 22 Nov 2013 19:08:43 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : ti43x.inc: Add SGX as MACHINE_FEATURES
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
X-List-Received-Date: Fri, 22 Nov 2013 19:08:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 671713a344813637d8645ea537dc6500731b6c63
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=671713a344813637d8645ea537dc6500731b6c63

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Fri Nov 22 10:00:45 2013 -0600

ti43x.inc: Add SGX as MACHINE_FEATURES

* New Graphics SDK with am43x support has been added.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti43x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 12f569e..d9bfd25 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -38,4 +38,4 @@ UBI_VOLNAME = "rootfs"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"


