Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D2E4E00EBC; Fri, 15 Nov 2019 07:34:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF9C7E00EF3
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:24 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYOYD038888
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832064;
	bh=BWAyKAW8vVxOW3XjbicRncQqiWbmTcwh5y1DF+kdmzU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XT0Zr47ujiosuoC+tF63dPClameqZwNQiKQdNOzvDOayo9jQhSVWvyHUUENMMbHYq
	qR4Qfr3qzARD8dr6KKQuTWuuxHJ+Q1q1GE6u1H3NEKGmiwYG0zn/inO4WYF2I/esUp
	Pw1CFaYEAJGCGo+4MX3aowYLInFfOGW13ghjF2kc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYOQr050971
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:24 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:24 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:24 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBg4041975;
	Fri, 15 Nov 2019 09:34:24 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:15:02 -0500
Message-ID: <1573830902-17409-43-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 42/42] iolink-lld: TI RTOS low level driver for IO-Link Master
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:29 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb

diff --git a/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb b/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
new file mode 100644
index 0000000..c0c27b6
--- /dev/null
+++ b/recipes-bsp/iolink-lld/iolink-lld-rtos_git.bb
@@ -0,0 +1,33 @@
+SUMMARY = "TI RTOS low level driver for IO-Link Master"
+
+inherit ti-pdk ti-pdk-fetch
+
+TI_PDK_COMP = "ti.drv.iolink"
+
+PE = "1"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://IOLINK.h;beginline=1;endline=32;md5=da669339a4b8594ed3edbe7ca30c726e"
+
+COMPATIBLE_MACHINE = "ti43x"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r2"
+
+DEPENDS_append = " osal-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+                         pruss-lld-rtos \
+"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+
+export PDK_IOLINK_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+INSANE_SKIP_${PN} = "arch"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "IOLINK LLD"
-- 
2.7.4


