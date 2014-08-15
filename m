Return-Path: <aymeric.dumaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44A32E00566; Fri, 15 Aug 2014 12:02:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (aymeric.dumaz[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7351E0054C
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 12:02:41 -0700 (PDT)
Received: by mail-wg0-f42.google.com with SMTP id l18so2606892wgh.25
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 12:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=3PzVZK6vQO79V2iIFtBSYdWooftzLANfSxYmSffBdL0=;
	b=HILlU9owVmFWROrUiMWr+r1b4pl/KVnZbaTL6o6kPGRKg4Ayp97zQ2C7CWsmWk3QTp
	EgZ7UkyoTAqhl3T9JTar4nDRujlxxDWVu3EI3BYpSOxLPZlaTLFKuVg80VobHQGuH4Lt
	rMjmmP9bedZFZXnVTnPTzJaa/Z+jk6jynWbjhLWdzJt2IBoI1EYvlTXApzfbrmxrKbRS
	jN6mai4X3LyST3w22AXDw6MTB1sW5PGGdPzgCpSIUsevZ8jlJxdYvoK1r/2GDQ+KtXwn
	+SGz35rn0Gx/tpJK/BssWZ9X+Vb+mY+X2IbuqOTRHFCZ2jmuMX+5eyR+x61BtG3cqaqH
	ocrw==
X-Received: by 10.180.7.163 with SMTP id k3mr8572888wia.0.1408129360921;
	Fri, 15 Aug 2014 12:02:40 -0700 (PDT)
Received: from localhost.localdomain (136.217.123.78.rev.sfr.net.
	[78.123.217.136])
	by mx.google.com with ESMTPSA id f16sm9318907wic.7.2014.08.15.12.02.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Aug 2014 12:02:40 -0700 (PDT)
Sender: Aymeric Dumaz <aymericdumaz@gmail.com>
From: Aymeric Dumaz <aymeric.dumaz@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 15 Aug 2014 21:02:33 +0200
Message-Id: <1408129353-14747-1-git-send-email-aymeric.dumaz@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [master][PATCH v2] libgles-omap3-5.01.01.01: add .list file
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
X-List-Received-Date: Fri, 15 Aug 2014 19:02:45 -0000

When libraries don't have a SONAME in their section, their name aren't added in
the .list file generated during do_package.
Other recipes are able to build against them but are not able to find them
afterwards, leading to missing dependencies.

This patch add the file that would be created if the SONAME was present.

The version 2 of this patch add the -f to the copy command.

Signed-off-by: Aymeric Dumaz <aymeric.dumaz@gmail.com>
---
 .../libgles/libgles-omap3-5.01.01.01/libgles-omap3.list          | 9 +++++++++
 recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb             | 7 +++++++
 2 files changed, 16 insertions(+)
 create mode 100644 recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list

diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list
new file mode 100644
index 0000000..a59d7f5
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list
@@ -0,0 +1,9 @@
+libEGL.so:/usr/lib:5.01.01.01
+libGLES_CM.so:/usr/lib:5.01.01.01
+libsrv_init.so:/usr/lib:5.01.01.01
+libusc.so:/usr/lib:5.01.01.01
+libsrv_um.so:/usr/lib:5.01.01.01
+libglslcompiler.so:/usr/lib:5.01.01.01
+libpvr2d.so:/usr/lib:5.01.01.01
+libGLESv2.so:/usr/lib:5.01.01.01
+libIMGegl.so:/usr/lib:5.01.01.01
diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
index 0b1b8ca..353fe2f 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports
            file://cputype \
            file://rc.pvr \
            file://99-bufferclass.rules  \
+           file://${PN}.list \
 "
 
 SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
@@ -48,3 +49,9 @@ SRC_URI[sha256sum] := "${SHA256SUM_HARDFP}"
 S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
 
 LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_FRONTWSEGL.so.1"
+
+# HACK! The libraries don't have a SONAME, so other packages will link to them
+# but Yocto won't be able to find this package as a dependency afterwards.
+package_do_shlibs_append () {
+    os.system("cp -f ${WORKDIR}/${PN}.list ${SHLIBSWORKDIR}")
+}
-- 
1.9.1


