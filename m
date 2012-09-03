Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5828AE01460
	for <meta-ti@yoctoproject.org>; Mon,  3 Sep 2012 12:28:43 -0700 (PDT)
Received: by obbtb18 with SMTP id tb18so12367675obb.35
	for <meta-ti@yoctoproject.org>; Mon, 03 Sep 2012 12:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yx6JP8nRpsAhjpqIIqv1A1ORGkugN6WlQAszyeQs5v0=;
	b=UmD5+nQZu46j0elYY2vBw2woK5MVXEUWg2NSkTs1bNZD7frqQmcTY5R72sLwuRn2uC
	YAHXxyOzEjPXq2af1HJ5MnedgJadh4klgez6EfePbgtpcjbDNSw2nRjf8JHE9St+M/Sw
	gGkcGv+5KtCCfqMXiU9Mt8SSRZchZyCVYgChrqkLPHKVKvJk1yNbf8VH3UazL8kSrliy
	CcLrkze8DTghZjbVpH1+VFQG8FWEZOl7+Kxb49oJiNY8XgpY/s5da8z9QqJIAtHYFtaY
	u+Cp+pbPNoW7oZhD/khEVapTKBc+C72NwXzdJcmWGuLaP6wN8dZPn/fuSUKIt363WXSZ
	sbUA==
Received: by 10.60.29.229 with SMTP id n5mr14354736oeh.103.1346700522709;
	Mon, 03 Sep 2012 12:28:42 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a9sm12367791obp.14.2012.09.03.12.28.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 12:28:42 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  3 Sep 2012 14:45:07 -0500
Message-Id: <1346701507-7636-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [PATCH v2] libgles-omap3: Add new 4.06.00.02 version.
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
X-List-Received-Date: Mon, 03 Sep 2012 19:28:43 -0000

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
index 0000000..373064a
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
+           file://cputype \
+           file://rc.pvr \
+           file://sample.desktop \
+           file://99-bufferclass.rules  \
+"
+
+SRC_URI[md5sum] = "62f0c378e38f8d14e9f184c3836aea21"
+SRC_URI[sha256sum] = "71c8e154484304b3ce32d565557720a96c7ba762e72d7f1e93deeef9f3274402"
+
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
-- 
1.7.0.4


