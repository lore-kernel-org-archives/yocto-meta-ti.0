Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B969E0059A
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 16:11:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C0DCB52A9E; Fri, 30 Mar 2012 23:11:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120330231126.C0DCB52A9E@arago-project.org>
Date: Fri, 30 Mar 2012 23:11:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : README: refer to toolchain-layer in meta-openembedded
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
X-List-Received-Date: Fri, 30 Mar 2012 23:11:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f5135a2cb76535c179fa8e442c1f8d6cd336a64d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f5135a2cb76535c179fa8e442c1f8d6cd336a64d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Mar 30 19:08:35 2012 -0400

README: refer to toolchain-layer in meta-openembedded

Since gcc-4.5, binutils-2.20.1 and eglibc-2.12 are now in their own
toolchain-layer of meta-openembedded, adjust README accordingly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 README |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/README b/README
index 9e91f8d..352cb2e 100644
--- a/README
+++ b/README
@@ -8,13 +8,13 @@ branch: master
 revision: HEAD
 
 URI: git://git.openembedded.org/meta-openembedded
-layers: meta-oe
+layers: toolchain-layer
 branch: master
 revision: HEAD
 
 There are known issues when using a toolchain with gcc-4.6 and binutils-2.22
-from OpenEmbedded-Core, thus it is recommended to use meta-openembedded layer
-with gcc-4.5 + Linaro patches and binutils-2.20.1.
+from OpenEmbedded-Core, thus it is recommended to use toolchain-layer from
+meta-openembedded with gcc-4.5 + Linaro patches and binutils-2.20.1.
 
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
 distributions and layer stacks, such as:


