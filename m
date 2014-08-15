Return-Path: <aymeric.dumaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 82A4FE00566; Fri, 15 Aug 2014 09:15:42 -0700 (PDT)
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
	*      [74.125.82.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5E55E0054C
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 09:15:37 -0700 (PDT)
Received: by mail-we0-f175.google.com with SMTP id t60so2543490wes.34
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=3i+cRxIExq0XyEuX9M3Icz1VQikA59ah0ORromkr3h8=;
	b=mvh7yffF/ejYzJqcYpAgBsXWB+O6kGEsfUnHmbIWwv2AOIaT1Bs86rwkyZGHULOUwo
	s7/jtPBZCUZ/ViPwaz5q7meoVvg7QWz7oqYEqAu2IRmcxWV84u98xpYLx+Xn1W2j5qR2
	cS2VetScWvDEau3zssMFG8cGJ8bgAEH8M6YzDdaJGcWIuKd5blW8Kx5/dGVBBfvqiJ5l
	VxUF5damIKg3avhmr6XNH5ohvCQTrWbVFaNXlQIoLSVtTSsoXtegc2FNt9wmZ+Dd6eoE
	0hs6n7QdpmQF3M9yWEF7UPr2b7VaBkq0mIpm4H1eE4AUEz8TZ4A/ejyJB7gUH8w62ze/
	HMsQ==
X-Received: by 10.194.237.5 with SMTP id uy5mr20107687wjc.98.1408119336106;
	Fri, 15 Aug 2014 09:15:36 -0700 (PDT)
Received: from localhost.localdomain (136.217.123.78.rev.sfr.net.
	[78.123.217.136])
	by mx.google.com with ESMTPSA id f3sm8118884wiz.0.2014.08.15.09.15.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Aug 2014 09:15:35 -0700 (PDT)
Sender: Aymeric Dumaz <aymericdumaz@gmail.com>
From: Aymeric Dumaz <aymeric.dumaz@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 15 Aug 2014 18:15:28 +0200
Message-Id: <1408119328-13159-1-git-send-email-aymeric.dumaz@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [master][PATCH] libgles-omap3-5.01.01.01: add .list file
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
X-List-Received-Date: Fri, 15 Aug 2014 16:15:42 -0000

When libraries don't have a SONAME in their section, their name aren't added in
the .list file generated during do_package.
Other recipes are able to build against them but are not able to find them
afterwards, leading to missing dependencies.

This patch add the file that would be created if the SONAME was present.

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
index 0b1b8ca..0ee3489 100644
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
+    os.system("cp ${WORKDIR}/${PN}.list ${SHLIBSWORKDIR}")
+}
-- 
1.9.1


