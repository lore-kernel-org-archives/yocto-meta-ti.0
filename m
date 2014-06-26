Return-Path: <dev@codyps.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED869E00563; Thu, 26 Jun 2014 16:48:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59A3FE00563
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 16:48:15 -0700 (PDT)
Received: by mail-qa0-f49.google.com with SMTP id w8so3404475qac.8
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 16:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=y/3zeO7pSKL9PpKZiSY9BUQC5u3D0iswI66jrGnepTI=;
	b=ea6CQ4RTQI/Mc3h/VU4ll8GsfAgbdNvYtW6EdRCnluwN/fL/DQ7vB/3p/I0NvuHfO1
	6x2fPua65OTZRjwhAhrb+ylvUNZWs1xIAvzuutHxNAZ3DarM3HGTy1z2TcmqZbCZZS3R
	ExUEZg8S2EVgvJphG7GGJB3Xa7vEjQs9I8kMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y/3zeO7pSKL9PpKZiSY9BUQC5u3D0iswI66jrGnepTI=;
	b=FOhnobESXMV9z5379/DEetJVrRj0IaEKbi76VLHFRJgJaFEWz5ejh3L9C8fxc1nDVG
	FdxGNp3onQb3fIHS2JlrTIf7nnLDXwRhJ9TaRG21M8ynHevDKsxjmLoZ9BLNBqt3jJdE
	GCv725tmUYiCCRTM0KyIi2kEVVCa0Ga0mVEvRn/eEuo/zWDEjZ5kyv8QzgB5nEE3r5XV
	XK0jWBM8BRWG7qIbeCQMa3+7fpdGTOUYkBhwnPE8tmzKLAVni2YtVfj0HVHHM52tmxZ5
	zvzYdwq4KzBp7UAvjP+GygPr9u3h1W6qnzidXBjr/7Y2T8DiKmGMznRTH6WEpySJ8coj
	w63Q==
X-Gm-Message-State: ALoCoQnu9B6UzIQkZsEdY5zNOIOt2x4T/7R8NaQ2W8I8y4oaUiOwixVOrtNVFhNXzMRqvkgzzDxe
X-Received: by 10.140.93.2 with SMTP id c2mr24149293qge.53.1403826495621;
	Thu, 26 Jun 2014 16:48:15 -0700 (PDT)
Received: from localhost (96-39-66-162.static.oxfr.ma.charter.com.
	[96.39.66.162])
	by mx.google.com with ESMTPSA id 41sm5158122qgv.42.2014.06.26.16.48.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jun 2014 16:48:14 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: meta-ti@yoctoproject.org
Date: Thu, 26 Jun 2014 19:48:05 -0400
Message-Id: <1403826485-396-1-git-send-email-dev@codyps.com>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH] libgles-omap3: add already-stripped to INSANE_SKIP to fix build in poky
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
X-List-Received-Date: Thu, 26 Jun 2014 23:48:29 -0000

Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 recipes-graphics/libgles/libgles-omap3-no-x.inc | 64 ++++++++++----------
 recipes-graphics/libgles/libgles-omap3-x11.inc  | 44 +++++++-------
 recipes-graphics/libgles/libgles-omap3.inc      | 78 ++++++++++++-------------
 3 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc b/recipes-graphics/libgles/libgles-omap3-no-x.inc
index 7bb6cfb..13418ad 100644
--- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
+++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
@@ -268,38 +268,38 @@ RRECOMMENDS_${PN} += "omap3-sgx-modules"
 RDEPENDS_${PN} += "fbset devmem2"
 
 #HACK! These are binaries, so we can't guarantee that LDFLAGS match :(
-INSANE_SKIP_${PN} = "ldflags dev-so"
-INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths"
-INSANE_SKIP_${PN}-blitwsegl = "ldflags"
-INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags"
-INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags"
-INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags"
-INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags"
-INSANE_SKIP_${PN}-blitwsegl-es9 = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl-es9 = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl-es9 = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl-es9 = "ldflags"
-INSANE_SKIP_${PN}-tests = "ldflags"
+INSANE_SKIP_${PN} = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths already-stripped"
+INSANE_SKIP_${PN}-blitwsegl = "ldflags already-stripped"
+INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-blitwsegl-es9 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl-es9 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl-es9 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl-es9 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-tests = "ldflags already-stripped"
 
 # Quality control is really poor on these SDKs, so hack around the latest madness:
 FILES_${PN} += "${libdir}/*.so "
diff --git a/recipes-graphics/libgles/libgles-omap3-x11.inc b/recipes-graphics/libgles/libgles-omap3-x11.inc
index 76ef5b3..9aa596a 100644
--- a/recipes-graphics/libgles/libgles-omap3-x11.inc
+++ b/recipes-graphics/libgles/libgles-omap3-x11.inc
@@ -284,28 +284,28 @@ RRECOMMENDS_${PN} += "omap3-sgx-modules-x11"
 RDEPENDS_${PN} += "fbset devmem2"
 
 #HACK! These are binaries, so we can't guarantee that LDFLAGS match :(
-INSANE_SKIP_${PN} = "ldflags dev-so"
-INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths"
-INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es9 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es9 = "ldflags dev-so"
-INSANE_SKIP_${PN}-tests = "ldflags"
-INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
-INSANE_SKIP_${PN}-dev = "ldflags dev-so"
+INSANE_SKIP_${PN} = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es9 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths already-stripped"
+INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-x11wsegl-es9 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl-es9 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-tests = "ldflags already-stripped"
+INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags already-stripped"
+INSANE_SKIP_${PN}-dev = "ldflags dev-so already-stripped"
 
 inherit update-rc.d
 
diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index f417b8e..0b61946 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -352,45 +352,45 @@ RRECOMMENDS_${PN} += "omap3-sgx-modules"
 RDEPENDS_${PN} += "fbset devmem2"
 
 #HACK! These are binaries, so we can't guarantee that LDFLAGS match :(
-INSANE_SKIP_${PN} = "ldflags dev-so"
-INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev"
-INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths"
-INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths"
-INSANE_SKIP_${PN}-blitwsegl = "ldflags"
-INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags"
-INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags"
-INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags"
-INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags"
-INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags"
-INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
-INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
-INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so"
-INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so"
-INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so"
-INSANE_SKIP_${PN}-tests = "ldflags"
-INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags"
+INSANE_SKIP_${PN} = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-es3 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es5 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es6 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-es8 = "ldflags dev-so staticdev already-stripped"
+INSANE_SKIP_${PN}-rawdemos = "ldflags dev-so useless-rpaths already-stripped"
+INSANE_SKIP_${PN}-x11demos = "ldflags dev-so useless-rpaths already-stripped"
+INSANE_SKIP_${PN}-blitwsegl = "ldflags already-stripped"
+INSANE_SKIP_${PN}-blitwsegl-es3 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-blitwsegl-es5 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-blitwsegl-es6 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-blitwsegl-es8 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl-es3 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl-es5 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl-es6 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-flipwsegl-es8 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl-es3 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl-es5 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl-es6 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-frontwsegl-es8 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl-es3 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl-es5 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags already-stripped"
+INSANE_SKIP_${PN}-x11wsegl = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-x11wsegl-es3 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-x11wsegl-es5 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-x11wsegl-es6 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-x11wsegl-es8 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl-es3 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl-es5 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl-es6 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-driwsegl-es8 = "ldflags dev-so already-stripped"
+INSANE_SKIP_${PN}-tests = "ldflags already-stripped"
+INSANE_SKIP_xserver-kdrive-powervrsgx = "ldflags already-stripped"
 
 # Quality control is really poor on these SDKs, so hack around the latest madness:
 FILES_${PN} += "${libdir}/*.so "
-- 
2.0.0


