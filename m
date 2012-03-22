Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B224E013CB
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 13:58:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C671252A5F; Thu, 22 Mar 2012 20:58:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120322205826.C671252A5F@arago-project.org>
Date: Thu, 22 Mar 2012 20:58:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : README: update with the latest info
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
X-List-Received-Date: Thu, 22 Mar 2012 20:58:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 62ad4edfca78151a0f2327699bfb30f164e4d0a4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=62ad4edfca78151a0f2327699bfb30f164e4d0a4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Mar 22 16:52:48 2012 -0400

README: update with the latest info

With distro-less fixes in OE-Core, no distro dependencies are required.
Better explain toolchain requirements and setup specific versions.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 README |   40 ++++++++++++++++++----------------------
 1 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/README b/README
index 9c3e5ff..9e91f8d 100644
--- a/README
+++ b/README
@@ -1,36 +1,32 @@
-This layer hard depends on:
+The official OpenEmbedded/Yocto BSP layer for Texas Instruments platforms.
+
+This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
+layers: meta
 branch: master
 revision: HEAD
 
 URI: git://git.openembedded.org/meta-openembedded
+layers: meta-oe
 branch: master
 revision: HEAD
 
-And optionally depends on:
-
-URI: git://git.angstrom-distribution.org/meta-angstrom
-branch: master
-revision: HEAD
+There are known issues when using a toolchain with gcc-4.6 and binutils-2.22
+from OpenEmbedded-Core, thus it is recommended to use meta-openembedded layer
+with gcc-4.5 + Linaro patches and binutils-2.20.1.
 
-Currently meta-ti only works with the Angstrom distribution and hence
-requires the meta-angstrom layer. There are known issues when using
-gcc-4.6 based toolchain from OpenEmbedded-Core, thus gcc-4.5 toolchain,
-provided by meta-openembedded, is needed. It is planned to fix these
-shortcomings in the near future and allow building the base BSP part
-of meta-ti with different distributions and layer stacks, such as:
-distro-less (only with OE-Core), with Yocto/Poky, with Angstrom or
-Arago.
+The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
+distributions and layer stacks, such as:
+distro-less (only with OE-Core), with Yocto/Poky, with Angstrom or Arago.
 
-Due to the above, it is now recommended to follow the instructions at
-http://www.angstrom-distribution.org/building-angstrom
+Please follow the recommended setup procedures of your OE distribution. When
+using in a distro-less configuration, please add to your local.conf:
 
-This will set it up for the OpenEmbedded-core ('yocto') layout instead
-of the old "Classic" OpenEmbedded-dev layout. You can optionally tweak
-sources/layers.txt and conf/bblayers.conf to (de)select BSP layers.
+GCCVERSION = "4.5%"
+BINUVERSION = "2.20.1"
 
-Send pull requests to meta-ti@yoctoproject.org
+Send pull requests, patches, comments or questions to meta-ti@yoctoproject.org
 
-Main layer maintainers: Denys Dmytriyenko <denys@ti.com>
-                        Koen Kooi <k-kooi@ti.com>
+Maintainers: Denys Dmytriyenko <denys@ti.com>
+             Koen Kooi <koen@dominion.thruhere.net>


