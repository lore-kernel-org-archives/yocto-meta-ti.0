Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E06EE00C35; Thu, 10 Aug 2017 23:46:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM, URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.195 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.195 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60702E00C2B
	for <meta-ti@yoctoproject.org>; Thu, 10 Aug 2017 23:46:07 -0700 (PDT)
Received: by mail-pf0-f195.google.com with SMTP id h75so2718724pfh.5
	for <meta-ti@yoctoproject.org>; Thu, 10 Aug 2017 23:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DiByHYX9VldWyGwW6QjJ8LT53tUn2HlErKXZ93JH66I=;
	b=DyCFXz8+jEmO2kKJUg0PwYeizReTj0Q62gtnPp/jSUbjts7AaIqQuB+vFbsB0bUj2w
	LThywSl0zsaJsNxWLo2vGM3c+1GFpGpNAZ7j8eQOgzGWBg/PKQA64VNs03lZquScT1KX
	lPUaZe9EHrdNQQD1NXg33/0TYB86kxKIrbkaqP9b4qbAGWFPMoxf3teYw3tO05IaIMEo
	Dc8h7nw6hTbGVVGi0vejPGHA7yLyUpQenEeuTOFIxinmAe4K1fGgy5+PKmyXILu/geV2
	U2J7waoPL0ewG4JIusdYbn+6DlPzCsUg4idltPiSJ2JxxHGQ4HJ6erYZeP5QRsG2BNzK
	c1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DiByHYX9VldWyGwW6QjJ8LT53tUn2HlErKXZ93JH66I=;
	b=JPIPnRHJvxXa86J9NqXhyIBbh+NFG9prixio3zElZxU3UDR6g26M7NRJii1HQmmGar
	SZfG2aXrjapFJtfzDRUjwhoeFWAZkLwREMqo55CELk/1K3E5tT/TrxMq57/yblG1s/zE
	fcOdInCVqdXsjFKIUrMGTKRMAyEQtRDzBDGKfkUOrrD/7vP/tthRN/BaHquSFLMEVPGF
	mcec3K9mM1towhxYiCMZdNARdMnjcs8wLNhXEMw6FND7wdqi07a5MNs0NX/Sgpb5Hb/O
	qSpHrbmPLe3EeLzIVd6v+qt3NhkVCoguejqTyqjEJjQeLnLMuYhtEfHTcD4GKcknWLNL
	ObTg==
X-Gm-Message-State: AHYfb5gm945mQn5NgbgC2Li2lgHPouWUcSqrOBTfBITRaQcKq+npd+7n
	vFh265TLYc0yQAtz
X-Received: by 10.99.120.9 with SMTP id t9mr14585564pgc.263.1502433966275;
	Thu, 10 Aug 2017 23:46:06 -0700 (PDT)
Received: from localhost.localdomain (103-224-128-96.flip.co.nz.
	[103.224.128.96])
	by smtp.gmail.com with ESMTPSA id j71sm582337pfj.44.2017.08.10.23.46.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Aug 2017 23:46:05 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 11 Aug 2017 18:45:48 +1200
Message-Id: <1502433948-13942-1-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [morty][PATCH] ti-sgx-ddk-um_1.14.3699939: check for wayland in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 11 Aug 2017 06:46:08 -0000

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


