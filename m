Return-Path: <aymeric.dumaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BB5C2E00769; Fri, 15 Aug 2014 09:14:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (aymeric.dumaz[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.82.45 listed in list.dnswl.org]
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2255E0054C
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 09:14:30 -0700 (PDT)
Received: by mail-wg0-f45.google.com with SMTP id x12so2556250wgg.16
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=5pjXkqK60oZ5KhOWWQTQjm14os9QYzXi35IyRlALsqI=;
	b=oBfMpEGkRIN7JBzJdD+eNghgLFNwTII4u4/J+wqZ71xWD4siAntGrPASHt1Ah3nkpO
	sgTkEJ4U2p/vz1CFhOmtuOnxYN7TXsO+DjLAvY+h7g+UDedEHOm6kuGIyR+axwH9hxKL
	XXsS+7Kc8SHdfGSLIfqx08hJckKn004zEzQupq2aquRtBMpMlDZuiGg0cFlCO9ThrGnj
	ex1onC6cBNryU+CuOSwUIiW/TAtUu37f6/+S9EKPNxRFuY0JXgWS9finkM6lFyIZvA4Y
	2sDQH6Tkpbwk+lO7BCqLrJkzGYAjTA3dDuZOURV9RPp3qikDzyf6NRgLEmWznyqm2siI
	0JnQ==
X-Received: by 10.180.106.6 with SMTP id gq6mr22302503wib.5.1408119268807;
	Fri, 15 Aug 2014 09:14:28 -0700 (PDT)
Received: from localhost.localdomain (136.217.123.78.rev.sfr.net.
	[78.123.217.136])
	by mx.google.com with ESMTPSA id kz6sm8470997wjb.47.2014.08.15.09.14.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Aug 2014 09:14:28 -0700 (PDT)
Sender: Aymeric Dumaz <aymericdumaz@gmail.com>
From: Aymeric Dumaz <aymeric.dumaz@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 15 Aug 2014 18:14:14 +0200
Message-Id: <1408119254-13052-1-git-send-email-aymeric.dumaz@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [dora/daisy][PATCH] libgles-omap3-5.01.01.01: add .ver and .list files
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
X-List-Received-Date: Fri, 15 Aug 2014 16:14:35 -0000

When libraries don't have a SONAME in their section, their name aren't added in
the .list/.ver files generated during do_package.
Other recipes are able to build against them but are not able to find them
afterwards, leading to missing dependencies.

This patch add the files that would be created if the SONAME was present.

Signed-off-by: Aymeric Dumaz <aymeric.dumaz@gmail.com>
---
 .../libgles/libgles-omap3-5.01.01.01/libgles-omap3.list          | 9 +++++++++
 .../libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver           | 1 +
 recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb             | 9 +++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list
 create mode 100644 recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver

diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list
new file mode 100644
index 0000000..7221e9a
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.list
@@ -0,0 +1,9 @@
+libEGL.so
+libGLES_CM.so
+libGLESv2.so
+libglslcompiler.so
+libIMGegl.so
+libpvr2d.so
+libsrv_init.so
+libsrv_um.so
+libusc.so
diff --git a/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver
new file mode 100644
index 0000000..e81ca08
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3-5.01.01.01/libgles-omap3.ver
@@ -0,0 +1 @@
+5.01.01.01
diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
index 0b1b8ca..26de4a6 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
@@ -40,6 +40,8 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/gfxsdk/${SGXPV}/exports
            file://cputype \
            file://rc.pvr \
            file://99-bufferclass.rules  \
+           file://${PN}.list \
+           file://${PN}.ver \
 "
 
 SRC_URI[md5sum] := "${MD5SUM_HARDFP}"
@@ -48,3 +50,10 @@ SRC_URI[sha256sum] := "${SHA256SUM_HARDFP}"
 S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
 
 LIBGLESWINDOWSYSTEM ?= "libpvrPVR2D_FRONTWSEGL.so.1"
+
+# HACK! The libraries don't have a SONAME, so other packages will link to them
+# but Yocto won't be able to find this package as a dependency afterwards.
+package_do_shlibs_append () {
+    base_filename = "${WORKDIR}/${PN}"
+    os.system("cp -f {0}.list {0}.ver ${SHLIBSWORKDIR}".format(base_filename))
+}
-- 
1.9.1


