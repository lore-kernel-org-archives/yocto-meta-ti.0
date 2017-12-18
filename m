Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40470E00D6E; Mon, 18 Dec 2017 08:38:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jpewhacker[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.193 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15C96E00CFF
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 08:37:59 -0800 (PST)
Received: by mail-io0-f193.google.com with SMTP id h12so10441589iof.6
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 08:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UI6MYP7AfaXD5vgs01mDzb9akudMmx9P12mAMXOx7u0=;
	b=IAOnmv9F3fRemquhPj3CkXrzmFqJREdb/r6Nb42jsp+ApLXrsYC0isoJ4Y7pAxlUrX
	grjDAaKMu3KFmi/TXNiL+pU/may/O013bvZ/DOVRsyMCin4Jr1wFamTNadIc7zl1xPLi
	kw8GB5HdL1lcBgd5LcyfchlFii1coVMpIDM+1ZnS0i6vfVL0aXBhvs5VwKDghCojOY+G
	JjSGn4pUDQ7b1kiJyAsgZg0QfSaTc8d70gYM1MlqhRY6MabwBZFJKuht9dqdJjHLcDOi
	rMg5YdFbzsYVwy+QuGqWdAVVQo4OuhjHBVMP+KQD10Gx65PJmagCkFQvagcXrm6GNy7D
	zf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UI6MYP7AfaXD5vgs01mDzb9akudMmx9P12mAMXOx7u0=;
	b=tKrRTsIik+ZuuceeKK3qkhW6ti3TiCkO1hm6DZxPlyd58kwg8f2Q/gHDG+g25TiI66
	rFpd8S1DFCQRFA4I9jQZkH8E1iPxzz/fu15uR5Cn/4It3BnZJ2V0wxww5afl44eZx4VS
	nOhcrGpzcnOLw64sYUYNVdPBy2hgLzmNiSRT72UAKr5a8KEjuRFr1tGuIY8EB7fcWfQS
	RP5kafnzIFhFrHBwTpEDj+RVdLtrUibQfCLMKT6/IJXFo70guZb9h8hneJGLH6NuJWKe
	uKW9EzZeoxp4kgGnSx94xtQlt1HfuJDWrnxUa8Z/8D0vUv6Uy/DmdDpYeUUeWI14eTIu
	2P9Q==
X-Gm-Message-State: AKGB3mKJcnsTFWRT8mTyhgmaSMwHxtnS+jKovzJWyDbGx4KppZ3cYRIa
	ZBZw9dof+O2p486eBU5djCKzy26G
X-Google-Smtp-Source: ACJfBovfNnvGpiiX+dpuhXMyC/OhBSr8ZrFP2Dq3GaxUfsx45p6ERYVLPBMNwaTihcGebPBfZeOEMA==
X-Received: by 10.107.17.198 with SMTP id 67mr449420ior.292.1513615079267;
	Mon, 18 Dec 2017 08:37:59 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	12sm7209355itm.41.2017.12.18.08.37.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 08:37:58 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-ti@yoctoproject.org,
	Denys Dmytriyenko <denys@ti.com>
Date: Mon, 18 Dec 2017 10:32:52 -0600
Message-Id: <20171218163252.9516-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [morty/master][PATCH] ti-sgx-ddk-um: Include libGLES_CM.so in plugins
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
X-List-Received-Date: Mon, 18 Dec 2017 16:38:03 -0000

The plugins package must include libGLES_CM.so in order for libEGL to
support GLESv1

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index e950d91d..d6d97712 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -64,7 +64,7 @@ FILES_${PN} +=  "${includedir}/*"
 FILES_${PN} +=  "${sysconfdir}/*"
 
 PACKAGES =+ "${PN}-plugins"
-FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
+FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libGLES_CM.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
 RDEPENDS_${PN} += "${PN}-plugins"
 
 ALLOW_EMPTY_${PN}-plugins = "1"
-- 
2.14.3


