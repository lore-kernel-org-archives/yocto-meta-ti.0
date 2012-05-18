Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79C1FE01422
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 20:49:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1E2A852A93; Fri, 18 May 2012 03:49:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120518034900.1E2A852A93@arago-project.org>
Date: Fri, 18 May 2012 03:49:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : README: by popular demand add comment on how to avoid systemd breakage
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
X-List-Received-Date: Fri, 18 May 2012 03:49:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: be837d63a43e61b9a1d183daee0cbd4ffe8a4130
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=be837d63a43e61b9a1d183daee0cbd4ffe8a4130

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 17 23:47:35 2012 -0400

README: by popular demand add comment on how to avoid systemd breakage

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 README |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/README b/README
index b376695..0df391f 100644
--- a/README
+++ b/README
@@ -11,6 +11,12 @@ layers: meta
 branch: master
 
 
+When not depending on meta-openembedded and not using systemd, you may need to
+mask few miscellaneous recipes requiring systemd, by adding this to local.conf:
+
+BBMASK = "meta-ti/recipes-misc"
+
+
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
 distributions and layer stacks, such as:
 distro-less (only with OE-Core), with Yocto/Poky, with Angstrom or Arago.


