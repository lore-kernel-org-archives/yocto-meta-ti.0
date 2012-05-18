Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 443C3E01422
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 20:39:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5CDE852A6F; Fri, 18 May 2012 03:39:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120518033925.5CDE852A6F@arago-project.org>
Date: Fri, 18 May 2012 03:39:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : README: no longer depend on toolchain-layer, remove references to older gcc/binutils
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
X-List-Received-Date: Fri, 18 May 2012 03:39:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 297460c124fbe5542272720202a538e3fb286ced
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=297460c124fbe5542272720202a538e3fb286ced

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 17 23:36:52 2012 -0400

README: no longer depend on toolchain-layer, remove references to older gcc/binutils

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 README |   18 +++++-------------
 1 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/README b/README
index 352cb2e..b376695 100644
--- a/README
+++ b/README
@@ -1,30 +1,22 @@
 The official OpenEmbedded/Yocto BSP layer for Texas Instruments platforms.
 
+It is hosted on http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/ with the
+source repository at git://git.yoctoproject.org/meta-ti
+
+
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
 branch: master
-revision: HEAD
-
-URI: git://git.openembedded.org/meta-openembedded
-layers: toolchain-layer
-branch: master
-revision: HEAD
 
-There are known issues when using a toolchain with gcc-4.6 and binutils-2.22
-from OpenEmbedded-Core, thus it is recommended to use toolchain-layer from
-meta-openembedded with gcc-4.5 + Linaro patches and binutils-2.20.1.
 
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
 distributions and layer stacks, such as:
 distro-less (only with OE-Core), with Yocto/Poky, with Angstrom or Arago.
 
-Please follow the recommended setup procedures of your OE distribution. When
-using in a distro-less configuration, please add to your local.conf:
+Please follow the recommended setup procedures of your OE distribution.
 
-GCCVERSION = "4.5%"
-BINUVERSION = "2.20.1"
 
 Send pull requests, patches, comments or questions to meta-ti@yoctoproject.org
 


