Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D93A8E0150D
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2013 11:54:33 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 679D852A95; Fri, 21 Jun 2013 18:54:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130621185433.679D852A95@arago-project.org>
Date: Fri, 21 Jun 2013 18:54:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Prabindh Sundareson : libgles-omap3: Package files with right permission
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
X-List-Received-Date: Fri, 21 Jun 2013 18:54:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 60b90439f775fc0d16c98d9d9c8df3c3e0ae7b29
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=60b90439f775fc0d16c98d9d9c8df3c3e0ae7b29

Author: Prabindh Sundareson <prabu@ti.com>
Date:   Wed Jun 12 23:10:40 2013 +0530

libgles-omap3: Package files with right permission

This patch adds correct permissions for startup script pvr-init.

This is part of a clean up of the Graphics recipe starting from
4.09.00.01 version of the Graphics SDK.

Signed-off-by: Prabindh Sundareson <prabu at ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3-no-x.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 9569350..6d79bf6 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -139,6 +139,7 @@ do_install () {
 	
 	install -d ${D}${sysconfdir}/init.d/
 	cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
+	chmod +x ${D}${sysconfdir}/init.d/pvr-init
 
 	install -d ${D}${sysconfdir}
 	echo "[default]" > ${D}${sysconfdir}/powervr.ini


