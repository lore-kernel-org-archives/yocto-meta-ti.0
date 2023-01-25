Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EC4C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 18:11:28 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.52884.1674670280774172091
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 10:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JPxtV8B+;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id q5so13256453wrv.0
        for <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 10:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6e4OVY7xqwtBjlcIioilWO6IHTxf8d57dRlK6X0NGRU=;
        b=JPxtV8B+CD3GuFHeJSLLwMTIKIzXcj3z1g37QnzASUmaEKq+adC0t9lreZBA/H2pBu
         vZKxn/0nX1DlXzixXUNqfj5eOnDGS9Fhr7xqSTfBPQXC4fnfBB0BKdYKIfgkJFOvrJQB
         wIUcYrt2mETwJYHS0JU1qKXtTuC1jXsJ/s7Aku3RMJYBpyw2D2s0YkWYqV1Ap9Kdd+tM
         6NfmBA+f16euDYpVwdywQoXStVpxCwgWv/h+6udiBvImIiKHSVttmxLuPtur/I/DTSL/
         /3sqCM/qKaEgyeMDaw8lyy8kXxa8ujqEqbiDRyDSsZSG1ywAmDWd+b6gYbMPyxIQmzFA
         7Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6e4OVY7xqwtBjlcIioilWO6IHTxf8d57dRlK6X0NGRU=;
        b=U9uDqbTWs2TomU8d7ko2zv84MHMkq/pm1AOZIjDkkUXGKS0oj5j+x03ShUEA56RF+t
         vjPgL95MSH67ZJ7ZUoVN26yAGiovb6CJgrQWFMUDraNE7OTDxPnQma0uxipK4+Ckd3lO
         bi8esxUC26YbmkhqJ1dtO6IgE+jzAvKxNink5cpzmV0FgO9smuk46hWYkcxRnn82kyQz
         dX2+FPj5bp+T/zJWqnvF0crOSBoD+byzVb+46sUmaBlGBc++jzzDX1+YbaPsZuudEUCQ
         Sybpb4lHiMLeJe6BGcpdAR28FezfG2PDdyiFpFXkhndK47uIBxoXv8B0BqdY46x2RPjR
         9+cA==
X-Gm-Message-State: AFqh2kppsb/OKOpx4xHf7Ym5gkmyZosuxIOauyNTGD7Ra7NORKiYyaxE
	1N3PtmAMPu8natLUxPKzjPugjmkHJM4=
X-Google-Smtp-Source: AMrXdXu4mRCus0/uQTLEx7jjSscYHoRJMGvB7kBQlSSmSQ9LozaUarBiV+Kp1MBJGzxazIG5bFvXSA==
X-Received: by 2002:a5d:6b07:0:b0:236:695b:82d4 with SMTP id v7-20020a5d6b07000000b00236695b82d4mr26302105wrw.30.1674670278815;
        Wed, 25 Jan 2023 10:11:18 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600001c900b002bdf8dd6a8bsm5003002wrx.80.2023.01.25.10.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 10:11:18 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-ti@lists.yoctoproject.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-ti][master/kirkstone][PATCH] ti-img-rogue-umlibs: handling the firmware installation with usrmerge
Date: Wed, 25 Jan 2023 18:11:00 +0000
Message-Id: <20230125181100.297826-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 18:11:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15654

The ti-img-rogue-umlibs package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...kefile-handle-firmware-with-usrmerge.patch | 33 +++++++++++++++++++
 .../ti-img-rogue-umlibs_1.15.6133109.bb       | 11 +++++--
 2 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch
new file mode 100644
index 00000000..ca06f88a
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs/0001-Makefile-handle-firmware-with-usrmerge.patch
@@ -0,0 +1,33 @@
+From 3a696a3eb2c23da1d4abcda3d3e3b6aca65a9f9b Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <jose.quaresma@foundries.io>
+Date: Tue, 24 Jan 2023 12:39:30 +0000
+Subject: [PATCH] Makefile: handle firmware with usrmerge
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ Makefile | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 48f9b9c..04b4154 100755
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,5 @@
+ DESTDIR ?= ${DISCIMAGE}
++FWDIR ?= lib
+ TARGET_PRODUCT ?= j721e_linux
+ BUILD ?= release
+ WINDOW_SYSTEM ?= nulldrmws
+@@ -13,7 +14,7 @@ all:
+ install:
+ 	mkdir -p ${DESTDIR}/${etcdir}
+ 	mkdir -p ${DESTDIR}/${usrdir}
+-	mkdir -p ${DESTDIR}/${fwdir}
++	mkdir -p ${DESTDIR}/${FWDIR}
+ 	cp -ar ${SRCDIR}/${etcdir}/* ${DESTDIR}/${etcdir}
+ 	cp -ar ${SRCDIR}/${usrdir}/* ${DESTDIR}/${usrdir}
+-	cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${fwdir}
++	cp -ar ${SRCDIR}/${fwdir}/* ${DESTDIR}/${FWDIR}
+-- 
+2.34.1
+
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index a665c614..cb3f0056 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -10,11 +10,15 @@ REQUIRED_MACHINE_FEATURES = "gpu"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|am62xx"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
 
-SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
+SRC_URI = " \
+	git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH} \
+	file://0001-Makefile-handle-firmware-with-usrmerge.patch \
+"
+
 SRCREV = "5977e82b96028f783d39c7219f016c1faf8dc5f5"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
@@ -52,7 +56,8 @@ RRECOMMENDS:${PN} += "ti-img-rogue-driver"
 S = "${WORKDIR}/git"
 
 do_install () {
-    oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
+    oe_runmake install DESTDIR=${D} FWDIR=${nonarch_base_libdir} \
+	TARGET_PRODUCT=${TARGET_PRODUCT} BUILD=${PVR_BUILD} WINDOW_SYSTEM=${PVR_WS}
     chown -R root:root ${D}
 }
 
-- 
2.34.1


