Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BCB6E015B5
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 10:23:21 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5CHNJAg017349
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 12:23:20 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5CHNHWg005003
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 12:23:18 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE73.ent.ti.com
	(172.24.171.98) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 13 Jun 2013 01:23:17 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5CHMsO8027868;
	Wed, 12 Jun 2013 22:53:17 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 12 Jun 2013 22:52:40 +0530
Message-ID: <1371057762-17055-8-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <Prabindh Sundareson <prabu@ti.com>
References: <Prabindh Sundareson <prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] libgles-omap3: Package files with right permission
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
X-List-Received-Date: Wed, 12 Jun 2013 17:23:21 -0000
Content-Type: text/plain

This patch adds correct permissions for startup script pvr-init.

This is part of a clean up of the Graphics recipe starting from
4.09.00.01 version of the Graphics SDK.

Signed-off-by: Prabindh Sundareson <prabu at ti.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 8e5dad6..0ddf6eb 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -139,6 +139,7 @@ do_install () {
 	
 	install -d ${D}${sysconfdir}/init.d/
 	cp -pP ${WORKDIR}/rc.pvr ${D}${sysconfdir}/init.d/pvr-init
+	chmod +x ${D}${sysconfdir}/init.d/pvr-init
 
 	install -d ${D}${sysconfdir}
 	echo "[default]" > ${D}${sysconfdir}/powervr.ini
-- 
1.7.1


