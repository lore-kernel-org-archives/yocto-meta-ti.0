Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1450E00496
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2013 11:55:46 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 44DCE52A28; Tue, 12 Feb 2013 19:55:45 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130212195546.44DCE52A28@arago-project.org>
Date: Tue, 12 Feb 2013 19:55:45 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : machine config: Correct SERIAL_CONSOLE variable for am3517-evm and am37x-evm
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
X-List-Received-Date: Tue, 12 Feb 2013 19:55:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 567d65c34db85384c8e0cda9477b1d88d3f09d74
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=567d65c34db85384c8e0cda9477b1d88d3f09d74

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Feb 11 19:04:36 2013 -0600

machine config: Correct SERIAL_CONSOLE variable for am3517-evm and am37x-evm

* When testing on am37x-evm I noticed that no prompt to login was ever shown
  when connected via serial port.
* I finally noticed that the SERIAL_CONSOLE variable was set incorrectly and
  didn't match the value in the old Arago layer.
* After using the values specific in the machine file in the Arago layer I was
  able to login via serial port.
* This has been verified on both the am37x-evm and am3517-evm.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am3517-evm.conf |    2 +-
 conf/machine/am37x-evm.conf  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index e817069..536d337 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -19,7 +19,7 @@ require conf/machine/include/omap3.inc
 IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLE = "115200 ttyO2"
 USE_VT = "2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index 9a1acb4..866abc5 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -19,7 +19,7 @@ require conf/machine/include/omap3.inc
 IMAGE_FSTYPES += "ubi tar.gz"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLE = "115200 ttyO0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 


