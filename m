Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B2D4E00A7E; Tue, 30 Jun 2015 12:09:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01677E009A7
	for <meta-ti@yoctoproject.org>; Tue, 30 Jun 2015 12:09:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E267152A99; Tue, 30 Jun 2015 19:09:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150630190902.E267152A99@arago-project.org>
Date: Tue, 30 Jun 2015 19:09:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : hplib: Add Run time dependency on hplib-mod
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
X-List-Received-Date: Tue, 30 Jun 2015 19:09:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: eadcdb3b89c6f9ae6ca9b273e9836e120e6bf116
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=eadcdb3b89c6f9ae6ca9b273e9836e120e6bf116

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Jun 19 02:06:43 2015 +0000

hplib: Add Run time dependency on hplib-mod

- Library requires hplib kernel module loaded

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hplib/hplib_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/hplib/hplib_git.bb b/recipes-bsp/hplib/hplib_git.bb
index fbb3004..da8853b 100644
--- a/recipes-bsp/hplib/hplib_git.bb
+++ b/recipes-bsp/hplib/hplib_git.bb
@@ -3,6 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/runtime/hplib/src/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
 
 DEPENDS = "common-csl-ip rm-lld qmss-lld sa-lld pktlib"
+RDEPENDS_${PN} = "hplib-mod"
 
 include hplib.inc
 


