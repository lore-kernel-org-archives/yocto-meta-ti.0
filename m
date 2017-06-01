Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACEE9E00B81; Thu,  1 Jun 2017 08:33:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A563E00B8B
	for <meta-ti@yoctoproject.org>; Thu,  1 Jun 2017 08:33:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v51FXYw9010987
	for <meta-ti@yoctoproject.org>; Thu, 1 Jun 2017 10:33:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496331214;
	bh=DvWwAjkJKkgoTrXWQRhlFC7OCd7kZhjHJU+t4nmRtOw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dBk8ODXfWYZlvkd+CzRhRTwJ8COahgjuvubz+V0pXPjuiINyKaguz18fysC5KyQY+
	r+LWF4WzXMv1Msm8KIqELMzFg8Svbk+aRIuXmPPfloGAKBmAuIcOwt+Lkmwfn9hUWb
	kEEdA4MraY9esDo3sSPyrO94qkE8MSH683N/QLCM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v51FXTGV021715
	for <meta-ti@yoctoproject.org>; Thu, 1 Jun 2017 10:33:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 10:33:29 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v51FXRvN026013;	Thu, 1 Jun 2017 10:33:29 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 1 Jun 2017 11:27:55 -0400
Message-ID: <1496330876-6173-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496330876-6173-1-git-send-email-j-stiffler@ti.com>
References: <1496330876-6173-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v3 5/6] recipes: remove ti-pdk device configuration
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
X-List-Received-Date: Thu, 01 Jun 2017 15:33:48 -0000
Content-Type: text/plain

* These variables have been moved into the machine configuration

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 8 --------
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb           | 5 -----
 recipes-bsp/pktlib/pktlib-rtos_git.bb               | 4 ----
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb           | 5 -----
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb               | 5 -----
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb       | 4 ----
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb       | 2 --
 7 files changed, 33 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 6892daa..fe4f697 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -10,13 +10,5 @@ DEPENDS_remove = "${PN}"
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
-TI_PDK_LIMIT_SOCS_ti33x = "am335x"
-TI_PDK_LIMIT_SOCS_ti43x = "am437x"
-TI_PDK_LIMIT_SOCS_omap-a15 = "am571x am572x"
-TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
-TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
-TI_PDK_LIMIT_SOCS_k2e = "k2e"
-TI_PDK_LIMIT_SOCS_k2g = "k2g"
-
 export PDK_CSL_ROOT_PATH ="${WORKDIR}/build"
 export DEST_ROOT="${S}"
diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
index f27f5e0..e29b087 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
@@ -6,8 +6,3 @@ PR = "${INC_PR}.0"
 DEPENDS_append = " rm-lld-rtos \
                    qmss-lld-rtos \
 "
-
-TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
-TI_PDK_LIMIT_SOCS_k2e = "k2e"
-TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
-TI_PDK_LIMIT_SOCS_k2g = "k2g"
diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pktlib-rtos_git.bb
index 2cca3ea..a7db402 100644
--- a/recipes-bsp/pktlib/pktlib-rtos_git.bb
+++ b/recipes-bsp/pktlib/pktlib-rtos_git.bb
@@ -7,7 +7,3 @@ DEPENDS_append = " rm-lld-rtos \
                    qmss-lld-rtos \
                    cppi-lld-rtos \
 "
-
-TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
-TI_PDK_LIMIT_SOCS_k2e = "k2e"
-TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
index adb091a..198f2bf 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
@@ -5,8 +5,3 @@ require qmss-lld.inc
 PR = "${INC_PR}.0"
 
 DEPENDS_append = " rm-lld-rtos"
-
-TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
-TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
-TI_PDK_LIMIT_SOCS_k2e = "k2e"
-TI_PDK_LIMIT_SOCS_k2g = "k2g"
diff --git a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
index b5f2fd1..50d8740 100644
--- a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
@@ -5,8 +5,3 @@ require rm-lld.inc
 PR = "${INC_PR}.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
-TI_PDK_LIMIT_SOCS_k2e = "k2e"
-TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
-TI_PDK_LIMIT_SOCS_k2g = "k2g"
diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
index b34cdd4..981a4af 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
@@ -17,9 +17,5 @@ IPC_TRANSPORT_QMSS_DESTSUFFIX = "git/c66/qmss"
 
 S = "${WORKDIR}/${IPC_TRANSPORT_QMSS_DESTSUFFIX}"
 
-TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
-TI_PDK_LIMIT_SOCS_k2e = "k2e"
-TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
-
 export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
 XDCPATH_append = ";${IPC_INSTALL_DIR}/packages"
diff --git a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
index 19ee5c5..3f96598 100644
--- a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
@@ -18,7 +18,5 @@ IPC_TRANSPORT_SRIO_DESTSUFFIX = "git/c66/srio"
 
 S = "${WORKDIR}/${IPC_TRANSPORT_SRIO_DESTSUFFIX}"
 
-TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
-
 export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
 XDCPATH_append = ";${IPC_INSTALL_DIR}/packages"
-- 
2.7.4


