Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4AA9BE00B87; Thu, 10 Aug 2017 05:47:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.196 listed in dnsbl.sorbs.net]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 480EDE00B6F
	for <meta-ti@yoctoproject.org>; Thu, 10 Aug 2017 05:47:55 -0700 (PDT)
Received: by mail-pf0-f196.google.com with SMTP id t83so592864pfj.3
	for <meta-ti@yoctoproject.org>; Thu, 10 Aug 2017 05:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DiByHYX9VldWyGwW6QjJ8LT53tUn2HlErKXZ93JH66I=;
	b=nPgjHxvF9obr/AWqYd5MhAtudn6n5EfK4c3V0ca7GPfLwKOMXnTwjxP41hrKZvU4nn
	JwEKxyMR5G7hfcXhAEC8MABYTxyvXMuUN+9cf/djGU8+lRUogvJUoNHeUpIWqzjC+ccm
	3snjBZmxi57CWb2i//RvvTbpmGLhzn+97Y2do850LbG4vETV10yHODpzDzNCWtKIWFHh
	6l9+R67YuwiKlqiZ6iOOFfxwQxSUvEITxVNRddiZEc7x18eZy/RdI6509uGaCloKwQdx
	NJREDqsKuqhA/cvYIaMwqXKLBMYktQtaiP9FEfveMsbTqrDTI9AUFvBe9gywQmE42a7l
	kwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DiByHYX9VldWyGwW6QjJ8LT53tUn2HlErKXZ93JH66I=;
	b=WUGF2TkR7o8uvunX5+R8PLvpWYap354GFrscaX4ep3gcuD5oZ7R9OJDuXtM3E/UuDs
	zPYyTjpTLOy1Mvy3HVyRwmNJItd7+jX/DR64wNxksFvwrlj1pW0QljwL6YfhXJ9e1mS4
	cHKHi6W/q9wh4oltYka+QgSTb677p0DzR1RwwkwRxTcZwBKLglwBrfQSQr4epRZhkzx/
	C+fcGm6Br3mfCxgxoqtrNf1GDOREtC1gSBnXngSv5SxWZaaFjsFvdyp2dTjj8Sxgv8//
	7g5DLJlFqYBgLorYqhUg5KELicTCxr9Z129CGzHNHfvpgPMWUPa8Km44HbQCEeBSlthj
	VRVw==
X-Gm-Message-State: AHYfb5hPehWRtgTU0e/gQwCNGrDOdnAD8rTOZzv28BXjS4UUzt2rh8Xx
	Zi5e5yFlhMETIs9/
X-Received: by 10.99.181.29 with SMTP id y29mr11379353pge.135.1502369274918;
	Thu, 10 Aug 2017 05:47:54 -0700 (PDT)
Received: from localhost.localdomain (103-224-128-49.flip.co.nz.
	[103.224.128.49]) by smtp.gmail.com with ESMTPSA id
	z83sm12604019pfd.10.2017.08.10.05.47.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Aug 2017 05:47:53 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 11 Aug 2017 00:47:24 +1200
Message-Id: <1502369244-9597-1-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: ti-sgx-ddk-um_1.14.3699939: check for wayland in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 10 Aug 2017 12:47:57 -0000

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index 60f63aa..593e405 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -34,8 +34,9 @@ inherit update-rc.d
 PR = "r26"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
-DEPENDS += "libdrm udev libgbm wayland libffi"
-RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
+WAYLAND = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
+DEPENDS += "libdrm udev libgbm ${WAYLAND} libffi"
+RDEPENDS_${PN} += "libdrm libudev libgbm ${WAYLAND} libffi libdrm-omap"
 
 RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
 RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
@@ -63,7 +64,7 @@ FILES_${PN} +=  "${includedir}/*"
 FILES_${PN} +=  "${sysconfdir}/*"
 
 PACKAGES =+ "${PN}-plugins"
-FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
+FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${libdir}/libpvrws_WAYLAND.so', '', d)}"
 RDEPENDS_${PN} += "${PN}-plugins"
 
 ALLOW_EMPTY_${PN}-plugins = "1"
-- 
2.7.4


