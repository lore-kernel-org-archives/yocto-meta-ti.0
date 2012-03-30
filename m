Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A34FFE013D6
	for <meta-ti@yoctoproject.org>; Thu, 29 Mar 2012 22:57:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2BABA52A78; Fri, 30 Mar 2012 05:57:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120330055709.2BABA52A78@arago-project.org>
Date: Fri, 30 Mar 2012 05:57:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Tom Rini : am37x-evm.conf: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 30 Mar 2012 05:57:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2b300f08cae35d065f27c0b3e4c285b61740a6a6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2b300f08cae35d065f27c0b3e4c285b61740a6a6

Author: Tom Rini <trini@ti.com>
Date:   Thu Mar 29 10:18:15 2012 -0700

am37x-evm.conf: Use '+=' not '?=' in IMAGE_FSTYPES

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/020053.html
a machine conf file should use '+=' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am37x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index e4170f4..ddb54e8 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -16,7 +16,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES += "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"


