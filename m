Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51193E00BB1; Fri, 30 Jun 2017 13:40:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5828E00B9F
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 13:40:21 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5UKeLs7003803
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 15:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498855221;
	bh=wunaG1FS1P6z/mKiUZ31WaXLU6dF2jfHcIgdSeg/j9I=;
	h=From:To:CC:Subject:Date;
	b=WhaLe/JB+/pn7dzNd0Ikj9Jei8dOUFPgz9rjEA5CWtnwu3onvjXjXanhUuX3anH/a
	VRrAzDYd2r5dNZm1hJJySR36L3WQifqJ9fWWaMhjMp+eLxYcc2oo5wQJ4uCEcATYBo
	NsKzNRHc8tuZo0+TN+ePGXmjDOpzHJ6yqRdiciwQ=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5UKeLqh004163
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 15:40:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 30 Jun 2017 15:40:20 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5UKeKlY029681;	Fri, 30 Jun 2017 15:40:20 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 30 Jun 2017 16:40:18 -0400
Message-ID: <1498855218-43911-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] osal:Added rtos recipe and updated to 1.0.0.7 along with omapl1 support
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
X-List-Received-Date: Fri, 30 Jun 2017 20:40:23 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/osal/osal-rtos_git.bb | 18 ++++++++++++++++++
 recipes-bsp/osal/osal.inc         |  8 ++++----
 2 files changed, 22 insertions(+), 4 deletions(-)
 create mode 100644 recipes-bsp/osal/osal-rtos_git.bb

diff --git a/recipes-bsp/osal/osal-rtos_git.bb b/recipes-bsp/osal/osal-rtos_git.bb
new file mode 100644
index 0000000..da421b6
--- /dev/null
+++ b/recipes-bsp/osal/osal-rtos_git.bb
@@ -0,0 +1,18 @@
+inherit ti-pdk
+require recipes-bsp/osal/osal.inc
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/${OSAL_GIT_DESTSUFFIX}"
+
+DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti43x = " starterware-rtos"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_OSAL_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "OSAL Library"
diff --git a/recipes-bsp/osal/osal.inc b/recipes-bsp/osal/osal.inc
index fa8cde8..63ccca9 100644
--- a/recipes-bsp/osal/osal.inc
+++ b/recipes-bsp/osal/osal.inc
@@ -1,7 +1,7 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://osal.h;beginline=1;endline=31;md5=ae7b9f0410f26c80dcf790ef3f622fad"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 OSAL_GIT_URI = "git://git.ti.com/keystone-rtos/osal.git"
@@ -9,12 +9,12 @@ OSAL_GIT_PROTOCOL = "git"
 OSAL_GIT_BRANCH = "master"
 OSAL_GIT_DESTSUFFIX = "git/ti/osal"
 
-# Below commit ID corresponding to "DEV.OSAL.01.00.00.06E"
-OSAL_SRCREV = "072ab0f76fa272ace5b1756075475f848c14221a"
+# Below commit ID corresponding to "DEV.OSAL.01.00.00.07"
+OSAL_SRCREV = "62ea536572d91a17321dfca287771a5b65e6e00d"
 
 BRANCH = "${OSAL_GIT_BRANCH}"
 SRC_URI = "${OSAL_GIT_URI};destsuffix=${OSAL_GIT_DESTSUFFIX};protocol=${OSAL_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${OSAL_SRCREV}"
-PV = "01.00.00.06E"
+PV = "01.00.00.07"
 INC_PR = "r0"
-- 
1.9.1


