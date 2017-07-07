Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9060EE00BBC; Fri,  7 Jul 2017 12:19:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FFEDE00B53
	for <meta-ti@yoctoproject.org>; Fri,  7 Jul 2017 12:19:29 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v67JJTpo008929
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 14:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499455169;
	bh=EOAVV1gq6ruuMgGXpqNeum/GkMGk4jWGvOYzEQb009I=;
	h=From:To:CC:Subject:Date;
	b=P3dJU9L1QFLWE4+dVUveCEtuyhn8U/yGg9bQWkeUVwhKXiWu7Uc7sHSnflWpQKj7Z
	FNu5WGaarfXu6IVDN4d9/lSR1ReCqcwWGL/H6/8lMUS0HBgxuhvh4OMJwByUHSUiEL
	bAe+9KBMvEA6dlv4vtwlX0oX7fem7BgIDXoD4Xpg=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v67JJTeW025958
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 14:19:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Jul 2017 14:19:28 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v67JJSAh013674;	Fri, 7 Jul 2017 14:19:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 7 Jul 2017 15:19:26 -0400
Message-ID: <1499455166-44572-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pruss-lld: Add rtos recipe & update the version to 1.0.0.7
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
X-List-Received-Date: Fri, 07 Jul 2017 19:19:31 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb | 23 +++++++++++++++++++++++
 recipes-bsp/pruss-lld/pruss-lld.inc         |  6 +++---
 2 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb

diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
new file mode 100644
index 0000000..a935f0b
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
@@ -0,0 +1,23 @@
+inherit ti-pdk
+require recipes-bsp/pruss-lld/pruss-lld.inc
+
+COMPATIBLE_MACHINE_append = "|k2g-hs-evm"
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append = " osal-rtos"
+DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti43x = " starterware-rtos"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_PRUSS_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${WORKDIR}/build"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "PRUSS LLD"
+
+INSANE_SKIP_${PN} = "arch"
diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
index 8620108..5343c9f 100644
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ b/recipes-bsp/pruss-lld/pruss-lld.inc
@@ -9,12 +9,12 @@ PRUSS_LLD_GIT_PROTOCOL = "git"
 PRUSS_LLD_GIT_BRANCH = "master"
 PRUSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/pruss"
 
-# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.06A"
-PRUSS_LLD_SRCREV = "b98729cc1fc26c9ac32846146892646a23c28adb"
+# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.07"
+PRUSS_LLD_SRCREV = "636bb5645014723c54c08245cf8c2ee401eceb4f"
 
 BRANCH = "${PRUSS_LLD_GIT_BRANCH}"
 SRC_URI = "${PRUSS_LLD_GIT_URI};destsuffix=${PRUSS_LLD_GIT_DESTSUFFIX};protocol=${PRUSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PRUSS_LLD_SRCREV}"
-PV = "01.00.00.06A"
+PV = "01.00.00.07"
 INC_PR = "r0"
-- 
1.9.1


