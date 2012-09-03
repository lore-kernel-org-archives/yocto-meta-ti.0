Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCE17E013A6
	for <meta-ti@yoctoproject.org>; Mon,  3 Sep 2012 02:25:22 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so11340348obb.35
	for <meta-ti@yoctoproject.org>; Mon, 03 Sep 2012 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gXgUdcCKVPjrtumr8eFk2LIVFzEVQxivR6/ER+g1hA0=;
	b=pp33wzQw4xjiQK5ZZsK+SsPehZ8bq5Pb+wL9LNGs+PT5gdJamiW53cRJLZ94BzDdNn
	H1JhSyzlw6zbJA3mMuO5HceqnvQLmc3UlynEPy0LRf5ONjcK7VZHs92yF2gJR2TeoWnj
	s9vLV+heTnswzBiLfcN+WebGqujXq+8i0XDkdjD1Ws9IH1+ab8N0TsOSyQtMsFJ7pzZw
	rLjGdpTDf/Nx3v1colE7hLt7pqpcTJ/TalufQVbGBw3oKKfRxkVKIuBbJpSr4qbAyYos
	q0BLPa2yJAPsdQ4eP0mBwFVk1uG1ouMQSC+nKA3dSNi/WPdddNhiQbgTgVN0o/VdYjpa
	07vw==
Received: by 10.60.5.129 with SMTP id s1mr13347574oes.85.1346664322454;
	Mon, 03 Sep 2012 02:25:22 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id g8sm11298022obz.16.2012.09.03.02.25.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 02:25:21 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  3 Sep 2012 04:41:49 -0500
Message-Id: <1346665309-10837-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [PATCH] libgles-omap3: Add new 4.06.00.02 version.
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
X-List-Received-Date: Mon, 03 Sep 2012 09:25:23 -0000

* Add a new version of the Graphics SDK. There are a few changes in the
  Graphics SDK that need to be investigated to determine if it impacts
  someone who is trying to use X11. This recipe should work fine
  for non X11 users. Therefore, the DEFAULT_PREFERENCE will be -1 until
  it is clear that X11 users arent negatively impacted and any needed
  changes in libgles-omap3.inc are made.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../libgles/libgles-omap3_4.06.00.02.bb            |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb

diff --git a/recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb b/recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb
new file mode 100644
index 0000000..6c450a3
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3_4.06.00.02.bb
@@ -0,0 +1,32 @@
+require libgles-omap3.inc
+
+# Xsgx and the OpenGL *X11WS* non longer exist. Graphcis team stated that X11WS is deprecated and DRIWSEGL should be used instead.
+# Setting the DEFAULT_PREFERENCE to -1 until it is determined if this change affects X11 base distros.
+DEFAULT_PREFERENCE = "-1"
+
+BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
+BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
+BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
+
+PLATFORM = "LinuxARMV7"
+
+# download required binary distribution from:
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+# see libgles-omap3.inc for detailed installation instructions
+
+SGXPV = "4_06_00_02"
+IMGPV = "1.7.867897"
+BINFILE = "Graphics_SDK_setuplinux_${SGXPV}.bin"
+TI_BIN_UNPK_WDEXT := "/Graphics_SDK_${SGXPV}"
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest//exports/${BINFILE} \
+		   file://cputype \
+		   file://rc.pvr \
+		   file://sample.desktop \
+		   file://99-bufferclass.rules  \
+"
+
+SRC_URI[md5sum] = "62f0c378e38f8d14e9f184c3836aea21"
+SRC_URI[sha256sum] = "71c8e154484304b3ce32d565557720a96c7ba762e72d7f1e93deeef9f3274402"
+
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
-- 
1.7.0.4


