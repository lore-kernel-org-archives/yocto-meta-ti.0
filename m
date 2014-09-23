Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BDF6E00874; Tue, 23 Sep 2014 09:04:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0ADB2E00786
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 09:04:04 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NG44Oo001769
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:04:04 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NG43we010628
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:04:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 11:04:03 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8NG3s7I031889;	Tue, 23 Sep 2014 11:04:02 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 23 Sep 2014 21:30:36 +0530
Message-ID: <1411488036-32089-7-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1411488036-32089-1-git-send-email-a0393906@ti.com>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [for master 6/6] libdrm: do_install_append added for modetest
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
X-List-Received-Date: Tue, 23 Sep 2014 16:04:06 -0000
Content-Type: text/plain

* modetest is a very important application to test the drm
  interface, this is not installed by the default make install.

* It is desirable to have this binary on the target because it
  allows all kinds of basic debugging.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-graphics/drm/libdrm_2.4.41.bb |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-graphics/drm/libdrm_2.4.41.bb
index 0150632..d94dca1 100644
--- a/recipes-graphics/drm/libdrm_2.4.41.bb
+++ b/recipes-graphics/drm/libdrm_2.4.41.bb
@@ -15,6 +15,12 @@ SRC_URI += "file://installtests-ti.patch \
             file://GNU_SOURCE_definition.patch \
            "
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 S = "${WORKDIR}/git"
+
+do_install_append() {
+        mkdir -p ${D}/usr/bin/
+        cp ${S}/tests/modetest/.libs/modetest ${D}/usr/bin
+}
+
-- 
1.7.9.5


