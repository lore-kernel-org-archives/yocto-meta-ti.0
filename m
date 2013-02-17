Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 587A8E0144A
	for <meta-ti@yoctoproject.org>; Sun, 17 Feb 2013 13:23:45 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 16E7652A1D; Sun, 17 Feb 2013 21:23:45 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130217212345.16E7652A1D@arago-project.org>
Date: Sun, 17 Feb 2013 21:23:45 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : am335x-evm: Increase UBI max size to 500MB
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
X-List-Received-Date: Sun, 17 Feb 2013 21:23:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3c67c9357c8d6803d137534c6ee036cb6557c41e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3c67c9357c8d6803d137534c6ee036cb6557c41e

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Fri Nov 16 10:53:55 2012 -0600

am335x-evm: Increase UBI max size to 500MB

* Based on the EVM and beaglebone + NAND memory cape we can
  increase the base file system size to 500MB since by default
  there is about 504MB of space allocated to the file system
  partition in the NAND.
* The max size in LEBs was determined using the formula at
  http://processors.wiki.ti.com/index.php/UBIFS_Support

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am335x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 762f787..cd30594 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -28,7 +28,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 1988"
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:


