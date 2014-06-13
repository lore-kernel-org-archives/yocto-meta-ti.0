Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34CB7E00BB3; Fri, 13 Jun 2014 15:34:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ashcharles[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.49 listed in list.dnswl.org]
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4995E00BB3
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:48 -0700 (PDT)
Received: by mail-pb0-f49.google.com with SMTP id jt11so2520587pbb.8
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q5hWC64KiJMMe6Jx1G/f21kFEyaTmxCx4KJ0ynP3gfc=;
	b=Rjng9e+1A6FUxpYzmHE75JN0FI1lAxDueVLT9DB4dOt0Ehim+SqEU5Ir57W8Rh7Gml
	WZRotJ46N0oWwycennPUBF5XNRD888NDikC4REptb0Txu5Dx7pez0BuTJReCFCwtZA1d
	h3gfuKS1fR1cq0v8g0mNEvSEgpU0PJ9qBWLYIGyjjPnm1wlADB0q9hNqazRI4xJiUXFz
	OvWweyO4VDVeihwf2g0G9HbLaM+w0de1KhOmNp9RYPEwiGgtVv1w4sDoLtaGMGjlcI3k
	iNd+Y8vE9fpZIznRXsbikv4Di8Cd67T0rJ6tPZN2WeBVPy5I4vi4heHHJGBfOxzQ3B1k
	YfWQ==
X-Received: by 10.69.25.69 with SMTP id io5mr6919192pbd.22.1402698888041;
	Fri, 13 Jun 2014 15:34:48 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	xk1sm27397061pac.21.2014.06.13.15.34.47 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Jun 2014 15:34:47 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 13 Jun 2014 15:34:04 -0700
Message-Id: <1402698848-13759-2-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
References: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
Subject: [PATCH 2/6] Set ${TOOLCHAIN_PATH} used by some recipes
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
X-List-Received-Date: Fri, 13 Jun 2014 22:34:51 -0000

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 recipes-ti/includes/ti-paths.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index 511b5ae..5c9b716 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -1,5 +1,6 @@
 installdir = "${datadir}/ti"
 
+export TOOLCHAIN_PATH = "${STAGING_DIR_NATIVE}${prefix_native}/bin/${TARGET_SYS}"
 # This is where do_install will put it
 export AUDIO_SOC_INSTALL_DIR_RECIPE  = "${installdir}/ti-audio-soc-example-tree"
 export BIOS_INSTALL_DIR_RECIPE       = "${installdir}/ti-dspbios-tree"
-- 
1.8.3.2


