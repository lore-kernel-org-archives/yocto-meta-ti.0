Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1843FE00939
	for <meta-ti@yoctoproject.org>; Tue, 25 Mar 2014 14:22:05 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B950352A32; Tue, 25 Mar 2014 21:22:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140325212204.B950352A32@arago-project.org>
Date: Tue, 25 Mar 2014 21:22:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : keystone-evm: Update NAND size to 512 MB
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
X-List-Received-Date: Tue, 25 Mar 2014 21:22:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 14858daa694a559b89881741ad9033acd925143c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=14858daa694a559b89881741ad9033acd925143c

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Sat Mar  8 03:53:22 2014 +0000

keystone-evm: Update NAND size to 512 MB

- The keystone-evm actually has 512 MB Nand
   ( Changing from previous size of 128 MB)
- LEB calculated with reserved 10 MB for boot and 20 MB
  for receovery image

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/keystone-evm.conf |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index c878d52..088e524 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -15,9 +15,8 @@ SYSVINIT_ENABLED_GETTYS = ""
 # UBI: smallest flash I/O unit:    2048
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
-# UBI device number 0, total 857 LEBs
-# MKUBIFS_ARGS = "-m 2048 -e 129024 -c 857"
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 857"
+# UBI device number 0, total 3856 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3856"
 
 # do ubiattach /dev/ubi_ctrl -m 4
 # from dmesg:


