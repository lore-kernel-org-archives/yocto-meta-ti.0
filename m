Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B84F7E00749
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 20:16:40 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id A03C652A52; Tue, 28 Feb 2012 04:16:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120228041639.A03C652A52@arago-project.org>
Date: Tue, 28 Feb 2012 04:16:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : README: describe the current dependency on Angstrom and future plans
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
X-List-Received-Date: Tue, 28 Feb 2012 04:16:40 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: cac9367c1a1f2cfc8b7cf78cd0faa9ab021da2e4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=cac9367c1a1f2cfc8b7cf78cd0faa9ab021da2e4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Feb 27 23:15:13 2012 -0500

README: describe the current dependency on Angstrom and future plans

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 README |   21 ++++++++++++++++-----
 1 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/README b/README
index c4c88ec..9bf6154 100644
--- a/README
+++ b/README
@@ -4,18 +4,29 @@ URI: git://git.openembedded.org/openembedded-core
 branch: master
 revision: HEAD
 
-URI: git://git.angstrom-distribution.org/meta-angstrom
+URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
 
-URI: git://git.openembedded.org/meta-openembedded
+URI: git://git.angstrom-distribution.org/meta-angstrom
 branch: master
 revision: HEAD
 
-It is recommended to follow the instructions at http://www.angstrom-distribution.org/building-angstrom
+Currently meta-ti only works with the Angstrom distribution and hence
+requires the meta-angstrom layer. There are known issues when using
+gcc-4.6 based toolchain from OpenEmbedded-Core, thus gcc-4.5 toolchain,
+provided by meta-openembedded, is needed. It is planned to fix these
+shortcomings in the near future and allow building the base BSP part
+of meta-ti with different distributions and layer stacks, such as:
+distro-less (only with OE-Core), with Yocto/Poky, with Angstrom or
+Arago.
+
+Due to the above, it is now recommended to follow the instructions at
+http://www.angstrom-distribution.org/building-angstrom
 
-This will set it up for the OpenEmbedded-core layout instead of the old
-OpenEmbedded-dev layout. You can optionally tweak sources/layers.txt and conf/bblayers.conf to (de)select BSP layers.
+This will set it up for the OpenEmbedded-core layout instead of the
+old "Classic" OpenEmbedded-dev layout. You can optionally tweak
+sources/layers.txt and conf/bblayers.conf to (de)select BSP layers.
 
 Send pull requests to meta-ti@yoctoproject.org
 


