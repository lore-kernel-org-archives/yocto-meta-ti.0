Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AF65E00874
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 09:47:38 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1644252A52; Fri, 17 Jan 2014 17:47:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140117174738.1644252A52@arago-project.org>
Date: Fri, 17 Jan 2014 17:47:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Samuli Piippo : libgles-omap3: add missing INSANE_SKIP for es9
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
X-List-Received-Date: Fri, 17 Jan 2014 17:47:38 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 007d3ff11b81ec7962e6731c8d17c029c0b84aa9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=007d3ff11b81ec7962e6731c8d17c029c0b84aa9

Author: Samuli Piippo <samuli.piippo@digia.com>
Date:   Fri Jan 17 16:02:58 2014 +0200

libgles-omap3: add missing INSANE_SKIP for es9

es9 package was missing INSANE_SKIP used for other esX packages.

Signed-off-by: Samuli Piippo <samuli.piippo@digia.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 3df0fdc..60bcad5 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -283,6 +283,7 @@ INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
+INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev"
 INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths"
 INSANE_SKIP_${PN}-blitwsegl = "ldflags"
 INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags"


