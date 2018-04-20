Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64B01E00B65; Fri, 20 Apr 2018 12:29:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D885BE00A0C
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2018 12:29:35 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 055CF20BBF;
	Fri, 20 Apr 2018 19:29:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6t9dBGqVRcoN; Fri, 20 Apr 2018 19:29:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B762820AF8;
	Fri, 20 Apr 2018 19:29:33 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5343916343C;
	Fri, 20 Apr 2018 15:29:33 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Apr 2018 15:29:31 -0400
Message-Id: <1524252572-1667-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524252572-1667-1-git-send-email-denys@ti.com>
References: <1524252572-1667-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/3] sa-lld-test, multiprocmgr: suppress no GNU_HASH warnings
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
X-List-Received-Date: Fri, 20 Apr 2018 19:29:37 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/sa-lld/sa-lld-test_git.bb       | 2 ++
 recipes-ti/multiprocmgr/multiprocmgr_git.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
index bae64b1..07d6467 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -37,3 +37,5 @@ do_install () {
 		make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} DEVICE="$device" SA_SRC_DIR=${S} INSTALL_BIN_BASE_DIR=${D}${bindir}
 	done
 }
+
+INSANE_SKIP_${PN} = "ldflags"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index b37c332..053a04e 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -44,3 +44,5 @@ do_install() {
 	cp -a ${S}/lib/* ${D}${libdir}/
 	chown -R root:root ${D}${libdir}/
 }
+
+INSANE_SKIP_${PN} = "ldflags"
-- 
2.7.4


