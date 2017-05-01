Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60104E00B05; Mon,  1 May 2017 12:02:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44A63E0083D
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 12:02:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41J1w3E021224
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493665318;
	bh=vUkzaky90I4NeiNh5XRm28kgISSRwH+zjvk3e1IkQ+w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kXcffQbEgFmwpW7dNIg4zATZn1WOeyl42DbVdX2Rwk5dQFTj8ALSy2xwnbrwZaQ0o
	RfCuF8fF8DrDFxSY7l53OewF6b17sqjg/hgYIrH1UFb8Csyzpt9ZZ1dDo1RqVI/b8z
	rcglh2nOZoNjtlTVM9B5cmAhqN+enZq4JIHS+gP8=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41J1rou018520
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:01:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 14:01:52 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v41J1rYW024476;	Mon, 1 May 2017 14:01:53 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.109.252])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v41J1q300539; Mon, 1 May 2017 14:01:52 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 1 May 2017 14:01:50 -0500
Message-ID: <20170501190150.4110-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170501190150.4110-1-dmurphy@ti.com>
References: <20170501190150.4110-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [v2 PATCH 4/4] boot-monitor: update to ti2017.01-rc2 tag
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
X-List-Received-Date: Mon, 01 May 2017 19:02:21 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - No changes

 recipes-bsp/boot-monitor/boot-monitor_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index e4ea67f6..1b6f3206 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -8,7 +8,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "u-boot-mkimage-native"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
-SRC_URI += "file://0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch"
 
 PV = "4.0+git${SRCPV}"
 
@@ -16,7 +15,7 @@ BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "d7b2bbd419400228da621f445526e519b56aef93"
+SRCREV = "e1f885ab6dc544884728e333cc6e396f7eb08286"
 
 BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
 
-- 
2.12.2


