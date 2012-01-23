Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10ED5E0137D
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:18:53 -0800 (PST)
Received: by mail-we0-f181.google.com with SMTP id b10so2486358wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:18:53 -0800 (PST)
Received: by 10.216.138.206 with SMTP id a56mr3679571wej.29.1327328333738;
	Mon, 23 Jan 2012 06:18:53 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id t15sm13186874wiv.6.2012.01.23.06.18.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 06:18:53 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 23 Jan 2012 15:18:29 +0100
Message-Id: <1327328309-15956-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
References: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
Subject: [PATCH 7/7] libgles-omap3: add 4.05.00.03
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
X-List-Received-Date: Mon, 23 Jan 2012 14:18:54 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...3_4.03.00.02.bb => libgles-omap3_4.05.00.03.bb} |   14 +++++---------
 1 files changed, 5 insertions(+), 9 deletions(-)
 copy recipes-graphics/libgles/{libgles-omap3_4.03.00.02.bb => libgles-omap3_4.05.00.03.bb} (68%)

diff --git a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
similarity index 68%
copy from recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
copy to recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
index f605ec0..0092221 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.03.00.02.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
@@ -1,10 +1,6 @@
 BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
-
-ES2LOCATION = "${S}/gfx_rel_es2.x"
-ES3LOCATION = "${S}/gfx_rel_es3.x"
-ES5LOCATION = "${S}/gfx_rel_es5.x"
-ES6LOCATION = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
 
 require libgles-omap3.inc
 
@@ -12,8 +8,8 @@ require libgles-omap3.inc
 # http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
 # see libgles-omap3.inc for detailed installation instructions
 
-SGXPV = "4_03_00_02"
-IMGPV = "1.6.16.3977"
+SGXPV = "4_05_00_03"
+IMGPV = "1.6.16.4117"
 BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
@@ -23,8 +19,8 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
                    file://99-bufferclass.rules  \
 "
 
-SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
-SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
+SRC_URI[md5sum] = "0e651eaa92bb91760f0b40a17697a7dc"
+SRC_URI[sha256sum] = "bfe764a8959556195545d6fff76f63a489642f345c105bbbc309a3f243c2dd0e"
 
 S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
 
-- 
1.7.2.5


