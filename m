Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B86AE00C6B; Tue, 18 Jul 2017 16:04:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0067E00C56
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:04:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4OHI027017
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419064;
	bh=r3DaFwPxQfA55Z4qBMf89Kke/Se49/tlyKfV08qALh0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rqGEoRTxIhtOtyiVpF1xp39hB2Mfl+NNR7NXGyqmxjNv1XZVlJc7GvwQurIRLaAfG
	o+7D3Gp/JMU9JliUDHon1MEEva5nCF17XeYGqsL5wBOKIb5IxabAsdHwYul6T0ZSju
	i3zHI0EU25hXBipSgW4o+VsMRFONT9alOS2IW6z4=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4OJx031786
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:24 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hg000997;	Tue, 18 Jul 2017 18:04:24 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:20 -0400
Message-ID: <1500419028-3361-9-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 09/37] i2c-lld-rtos: Add rtos recipe for i2c-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:04:29 -0000
Content-Type: text/plain

Upstreaming TI RTOS low level driver for I2C module

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Adding summary & merging in to a single recipe

 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb | 42 +++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb

diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
new file mode 100644
index 0000000..4f711b8
--- /dev/null
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
@@ -0,0 +1,42 @@
+SUMMARY = "TI RTOS low level driver for Inter-IC module (I2C)"
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://I2C.h;beginline=1;endline=32;md5=147a6773e962b103cd162ca58535289c"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+I2C_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/i2c-lld.git"
+I2C_LLD_GIT_PROTOCOL = "git"
+I2C_LLD_GIT_BRANCH = "master"
+I2C_LLD_GIT_DESTSUFFIX = "git/ti/drv/i2c"
+
+# Below commit ID corresponds to "DEV.I2C_LLD.01.00.00.07A"
+I2C_LLD_SRCREV = "85ad56fb6e1f2bdabdd3c371b97170cb62a6fdd7"
+
+BRANCH = "${I2C_LLD_GIT_BRANCH}"
+SRC_URI = "${I2C_LLD_GIT_URI};destsuffix=${I2C_LLD_GIT_DESTSUFFIX};protocol=${I2C_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${I2C_LLD_SRCREV}"
+PV = "01.00.00.07A"
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
+S = "${WORKDIR}/${I2C_LLD_GIT_DESTSUFFIX}"
+
+export PDK_I2C_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "I2C LLD"
-- 
1.9.1


