Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA497E0144E
	for <meta-ti@yoctoproject.org>; Wed, 28 Aug 2013 07:53:46 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5464F52A61; Wed, 28 Aug 2013 14:53:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130828145343.5464F52A61@arago-project.org>
Date: Wed, 28 Aug 2013 14:53:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti43x: disable sgx for now
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
X-List-Received-Date: Wed, 28 Aug 2013 14:53:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: bbc9ae0c90f7f40b1775220892d6cd9cca9cb517
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bbc9ae0c90f7f40b1775220892d6cd9cca9cb517

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Aug 28 10:52:23 2013 -0400

ti43x: disable sgx for now

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti43x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index c9ce2bb..62da105 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -34,4 +34,4 @@ UBOOT_LOADADDRESS = "0x80008000"
 EXTRA_IMAGEDEPENDS += "u-boot"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet"


