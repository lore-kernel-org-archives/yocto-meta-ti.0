Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9FEBDE00CAA; Tue, 28 Jun 2016 10:48:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B98B5E0045E
	for <meta-ti@yoctoproject.org>; Tue, 28 Jun 2016 10:48:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5SHlbcM022066
	for <meta-ti@yoctoproject.org>; Tue, 28 Jun 2016 12:47:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5SHmgIk031211
	for <meta-ti@yoctoproject.org>; Tue, 28 Jun 2016 12:48:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Jun 2016 12:48:42 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5SHmf4D024614;	Tue, 28 Jun 2016 12:48:42 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 28 Jun 2016 13:48:05 -0400
Message-ID: <1467136085-24211-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ti-ipc-rtos: add dependency on zip-native
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
X-List-Received-Date: Tue, 28 Jun 2016 17:48:46 -0000
Content-Type: text/plain

* The zip utility is used during the build

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 740de53..379dcd0 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -35,9 +35,9 @@ SRCREV_ipc-metadata = "c3fc63be358c8c9a429366ebf54fe03812671129"
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-DEPENDS = "ti-xdctools ti-sysbios doxygen-native"
+DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
 "
-- 
2.7.4


