Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA2B3E0044D
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:47:55 -0700 (PDT)
Received: by wibhr14 with SMTP id hr14so489410wib.11
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=ldXONVkaiaNCKgpQwPZIJ2wDj0wmb3eUELNUyL988CQ=;
	b=IXXppUoZJEsPqGhfiu05fm99OEpldsblsQWUqAuSeBPAbt9w/NJrTImftXR5RtRwMI
	5pzSJHKxKqrc6nYBttGZxTDg9ssz0L0Ywp1wLRhsiAiH0xk45IYB+oKc6dtShsZBGwWT
	GBBRKcm861FqspsJmBk7UsU5O3+5BHX8arIHTKS7elQMwT4FrLJa0rWrw5qhaVJ+ZWRY
	mv6wDdNqTQ2MyvX0WE1vTzuiZ1tQPEhYTGkg+yWlFa85HJVebWde/0x/eU2YBxOhy5rr
	OyrxwkyHPAdDfk/Yez68Ek+VsAMH2X8gy5Zmv7cX3Td4Eg7/EOzRnlbEj5Bs/ODjzd+E
	ETwQ==
Received: by 10.180.79.72 with SMTP id h8mr7028966wix.1.1334666874855;
	Tue, 17 Apr 2012 05:47:54 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id u9sm26741228wix.0.2012.04.17.05.47.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 05:47:54 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Tue, 17 Apr 2012 14:47:41 +0200
Message-Id: <1334666866-24955-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
References: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlIoBaeIBYd2q4go5+TgC/9CpPadJSuJAcic1uVikctBwki1FEUpG5JS9wVmeB6xVT8V3De
Cc: denys@ti.com
Subject: [PATCH v2 2/7] libgles-omap3: fix RRECOMMENDS
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 12:47:56 -0000

The modules assignment overwrote the previous ones, leading to missing libraries.

Before:
	 Package: libgles-omap3
	 Recommends: omap3-sgx-modules
After:
	 Package: libgles-omap3
	 Recommends: omap3-sgx-modules, libgles-omap3-es8, libgles-omap3-es6, libgles-omap3-es5, libgles-omap3-es3, libgles-omap3-es2

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-graphics/libgles/libgles-omap3.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 69254c1..fbd931f 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r25"
+PR = "r26"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -320,7 +320,7 @@ FILES_${PN}-x11trainingcourses = "${bindir}/SGX/trainingcourses/X11/*"
 RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-x11wsegl"
 
 # The libs need the kernel-modules
-RRECOMMENDS_${PN} = "omap3-sgx-modules"
+RRECOMMENDS_${PN} += "omap3-sgx-modules"
 
 # The initscript calls fbset, cputype calls devmem2
 RDEPENDS_${PN} += "fbset devmem2"
-- 
1.7.2.5


