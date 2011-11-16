Return-Path: <jkridner@beagleboard.org>
Received: from mail-iy0-f176.google.com (mail-iy0-f176.google.com
	[209.85.210.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62491E00307
	for <meta-ti@yoctoproject.org>; Wed, 16 Nov 2011 07:42:43 -0800 (PST)
Received: by iakh37 with SMTP id h37so973329iak.35
	for <meta-ti@yoctoproject.org>; Wed, 16 Nov 2011 07:42:42 -0800 (PST)
Received: by 10.231.68.20 with SMTP id t20mr7521465ibi.18.1321458162706;
	Wed, 16 Nov 2011 07:42:42 -0800 (PST)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com. [75.101.156.174])
	by mx.google.com with ESMTPS id e2sm45760662ibe.0.2011.11.16.07.42.35
	(version=SSLv3 cipher=OTHER); Wed, 16 Nov 2011 07:42:36 -0800 (PST)
From: Jason Kridner <jkridner@beagleboard.org>
To: meta-ti@yoctoproject.org
Date: Wed, 16 Nov 2011 09:42:30 -0600
Message-Id: <1321458150-5388-1-git-send-email-jdk@ti.com>
X-Mailer: git-send-email 1.7.0.2.276.g60daf
Cc: k-kooi@ti.com
Subject: [PATCH] bonescript: run on startup
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
X-List-Received-Date: Wed, 16 Nov 2011 15:42:43 -0000

---
 recipes-misc/payload/bonescript.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes-misc/payload/bonescript.bb b/recipes-misc/payload/bonescript.bb
index dc515f6..f2aef27 100644
--- a/recipes-misc/payload/bonescript.bb
+++ b/recipes-misc/payload/bonescript.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Scripting tools for the BeagleBoard and BeagleBone"
 
-PR = "r10"
+PR = "r11"
 
 inherit allarch systemd
 
@@ -27,6 +27,11 @@ do_install() {
 
 	install -d ${D}${base_libdir}/systemd/system
 	install -m 0644 ${WORKDIR}/bone101.service ${D}${base_libdir}/systemd/system
+
+	for i in ${WORKDIR}/bone101.service ; do
+		install -m 0644 $i ${D}${base_libdir}/systemd/system
+		ln -sf ../$(basename $i) ${D}${base_libdir}/systemd/system/basic.target.wants/
+	done
 }
 
 SYSTEMD_PACKAGES = "${PN}"
-- 
1.7.0.2.276.g60daf


