Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37364E00C56; Tue, 18 Jul 2017 16:04:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABA59E00C49
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4NBg020761
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419063;
	bh=2ei4MkKgrzfKtlYc7wrEbEB4fCbJ2+iFSSuj/duPIOo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pm5P4rE3r66HOAXm24p/My0SzPInijbk1ifrqsg7+RdMLADVIitCvgf7FJnKtOtxx
	M0uV0u73zDkSuvUt74w47Jx9JB9zZwFT8yRFwgybh2m7cv6Rad9JHx37DC38r152pc
	pjRgcI/NDhpHSr9DdNW8w53iztk2GbwxTG70WtuY=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4NTk031747
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:23 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:22 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hf000997;	Tue, 18 Jul 2017 18:04:22 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:19 -0400
Message-ID: <1500419028-3361-8-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 08/37] gpmc-lld-rtos: Added rtos recipe for gpmc-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:24 -0000
Content-Type: text/plain

Upstreaming RTOS low level driver for General purpose memory controller
(GPMC)
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Adding summary & making in to a single recipe

 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb

diff --git a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
new file mode 100644
index 0000000..01ea501
--- /dev/null
+++ b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
@@ -0,0 +1,39 @@
+SUMMARY = "TI RTOS low level driver for General Purpose Memory Controller (GPMC)"
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://GPMC.h;beginline=1;endline=31;md5=485ec97c36f809bf92323fde3e988c72"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+GPMC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/gpmc-lld.git"
+GPMC_LLD_GIT_PROTOCOL = "git"
+GPMC_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.GPMC_LLD.01.00.00.01"
+GPMC_LLD_SRCREV = "86df4c099ad9c84f4b92d515ba64c343c75cf44d"
+
+BRANCH = "${GPMC_LLD_GIT_BRANCH}"
+SRC_URI = "${GPMC_LLD_GIT_URI};protocol=${GPMC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${GPMC_LLD_SRCREV}"
+PV = "01.00.00.01"
+PR = "r0"
+
+DEPENDS_append = " osal-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "GPMC LLD"
+
+export PDK_GPMC_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
-- 
1.9.1


