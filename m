Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13BC9E00C58; Tue, 18 Jul 2017 16:04:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7079EE00C4E
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN49It007507
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419049;
	bh=UjytMx7SFrf7WKuyKKCODOH1X+X/4Wc7pPw8JIioF/I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tbqdfouihkzE27o7exrIapi74u5GlJ3qtyMdLhPSG2tnfi8DhzHH78gLJM+2cp5tg
	ETxCeYyZnCxk4S5ZASGQ2UsQZ2hLJE4PekVCissav1Av589APs3yrq6taWiP9LNT43
	stFeQqz/rrI4QSQdLDMkWzI9oQrPAG3GacpnCHZ0=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN49jt031331
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:09 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hZ000997;	Tue, 18 Jul 2017 18:04:09 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:13 -0400
Message-ID: <1500419028-3361-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 02/37] tcp3d-lld-rtos: Added rtos recipe for tcp3d-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:12 -0000
Content-Type: text/plain

Upstreaming RTOS driver for third generation Turbo Coprocessor (TCP3d)

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Adding summary

 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb

diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
new file mode 100644
index 0000000..f44a1d9
--- /dev/null
+++ b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
@@ -0,0 +1,35 @@
+SUMMARY = "TI third generation Trubo Coprocessor (TCP3) low level driver"
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://tcp3dver.h;beginline=1;endline=47;md5=3fe46c6320fb9ca4ac6692961402beb7"
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|c665x-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+TCP3D_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/tcp3d-lld.git"
+TCP3D_LLD_GIT_PROTOCOL = "git"
+TCP3D_LLD_GIT_BRANCH = "master"
+TCP3D_LLD_GIT_DESTSUFFIX = "git/ti/drv/bcp"
+
+# Below commit ID corresponds to "DEV.TCP3D_LLD.02.01.00.05"
+TCP3D_LLD_SRCREV = "8eb2edfc694982633e0dd01ba7b067ac9f634da9"
+
+BRANCH = "${TCP3D_LLD_GIT_BRANCH}"
+SRC_URI = "${TCP3D_LLD_GIT_URI};destsuffix=${TCP3D_LLD_GIT_DESTSUFFIX};protocol=${TCP3D_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${TCP3D_LLD_SRCREV}"
+PV = "02.01.00.05"
+PR = "r0"
+
+S = "${WORKDIR}/${TCP3D_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append = " edma3-lld-rtos"
+
+export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
+XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "TCP3D LLD"
+
-- 
1.9.1


