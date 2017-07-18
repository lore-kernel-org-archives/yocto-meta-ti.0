Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2A46E00C54; Tue, 18 Jul 2017 16:04:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38991E00BFF
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:12 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4B3v007511
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419051;
	bh=TAXTn3Knlwkr4a7DMyLMyz9b677WWxGVpknwhOkbQGU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ji0eYe0DcCrTCJw4B/vVDZHNIRWbrvTCSB1g7jYr1D27FG2rI9UAnTiwNcr44+mSs
	qLVMqL1Gd745D191lCIpgbCn5nE580ePKBQ7yHDhayPwHjw48ltRXHYWxV4a5NF4tq
	YbOPFFIlRH/+gOb5cuQJQ0W+T2TMOmKXMPIzOLaM=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4BMx007952
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:11 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46ha000997;	Tue, 18 Jul 2017 18:04:11 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:14 -0400
Message-ID: <1500419028-3361-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 03/37] fftc-lld-rtos: Added rtos recipe for fftc-lld
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

Upstreaming PDK RTOS driver recipe for FFT coprocessor

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Adding summary

 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb

diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
new file mode 100644
index 0000000..bc26b95
--- /dev/null
+++ b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "TI FFT Coprocessor (FFTC) low level driver "
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://fftc.h;beginline=1;endline=39;md5=2f1010c47d364414644caf6d30a2b7df"
+
+COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FFTC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/fftc-lld.git"
+FFTC_LLD_GIT_PROTOCOL = "git"
+FFTC_LLD_GIT_BRANCH = "master"
+FFTC_LLD_GIT_DESTSUFFIX = "git/ti/drv/fftc"
+
+# Below commit ID corresponds to "DEV.FFTC_LLD.02.02.00.06A"
+FFTC_LLD_SRCREV = "96e8839a2de5f15ba8765f4a6a4fd499689c496d"
+
+BRANCH = "${FFTC_LLD_GIT_BRANCH}"
+SRC_URI = "${FFTC_LLD_GIT_URI};destsuffix=${FFTC_LLD_GIT_DESTSUFFIX};protocol=${FFTC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${FFTC_LLD_SRCREV}"
+PV = "02.02.00.06A"
+PR = "r0"
+
+S = "${WORKDIR}/${FFTC_LLD_GIT_DESTSUFFIX}"
+
+
+DEPENDS_append= " qmss-lld-rtos \
+                  cppi-lld-rtos \
+"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "FFTC LLD"
-- 
1.9.1


