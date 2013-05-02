Return-Path: <prabu@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2F51E0153B
	for <meta-ti@yoctoproject.org>; Thu,  2 May 2013 06:40:39 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42DecPQ028542
	for <meta-ti@yoctoproject.org>; Thu, 2 May 2013 08:40:38 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42DeWr9028449
	for <meta-ti@yoctoproject.org>; Thu, 2 May 2013 08:40:36 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE73.ent.ti.com
	(172.24.171.98) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 21:40:33 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r42De1MO016387;
	Thu, 2 May 2013 19:10:33 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 2 May 2013 19:09:24 +0530
Message-ID: <1367501964-6294-10-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1367501964-6294-1-git-send-email-prabu@ti.com>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] libgles-omap3: Packge init with right permissions
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
X-List-Received-Date: Thu, 02 May 2013 13:40:39 -0000
Content-Type: text/plain

pvr-init is not packaged in the rootfs with +x permissions,
causing init to fail.

Signed-off-by: Prabindh Sundareson <prabu@ti.com>
---
 recipes-graphics/libgles/libgles-omap3.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index ae69e69..602a798 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -139,6 +139,7 @@ do_install () {
 	
 	install -d ${D}${sysconfdir}/init.d/
 	cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
+	chmod +x ${D}${sysconfdir}/init.d/pvr-init
 
 	install -d ${D}${sysconfdir}
 	echo "[default]" > ${D}${sysconfdir}/powervr.ini
-- 
1.7.1


