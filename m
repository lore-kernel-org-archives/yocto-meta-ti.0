Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D25B4E00AF6; Mon, 19 Oct 2015 14:11:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7C1CE007C9
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:11:49 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 435E252ACA; Mon, 19 Oct 2015 21:11:48 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151019211148.435E252ACA@arago-project.org>
Date: Mon, 19 Oct 2015 21:11:48 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : engine-pkcs11: Update to new version 1.3.0.1
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
X-List-Received-Date: Mon, 19 Oct 2015 21:11:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4816b46a9681a9fdfd30fbdab9b11cc5b1775772
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4816b46a9681a9fdfd30fbdab9b11cc5b1775772

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 20 01:42:31 2015 +0000

engine-pkcs11: Update to new version 1.3.0.1

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/engine-pkcs11/engine-pkcs11_git.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
index 226beac..bd03449 100644
--- a/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
+++ b/recipes-ti/engine-pkcs11/engine-pkcs11_git.bb
@@ -7,10 +7,11 @@ inherit autotools pkgconfig
 
 DEPENDS = "openssl libtool libp11"
 
-PV = "1.3.0.0"
 BRANCH="master"
-# Commit corresponds to DEV.ENGINE_PKCS11-01.03.00.00
-SRCREV = "0b14500b0ea8b37453b6d93aac02278465e7e732"
+
+PV = "1.3.0.1"
+# Commit corresponds to DEV.ENGINE_PKCS11-01.03.00.01
+SRCREV = "56ac060e2245907a442376d586924af26ed7e478"
 
 SRC_URI = "git://git.ti.com/keystone-linux/engine-pkcs11.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"


