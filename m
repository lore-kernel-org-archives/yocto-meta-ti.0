Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1EEB1E00CA3; Thu, 27 Sep 2018 08:23:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A98DE00BA2
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 08:23:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RFNSGg023649
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538061808;
	bh=XKZbVTydWsSn4POk2c0rnmXC3jvf1ONj0aCOuiS9i1Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NlLSV/iC4NWDxmwbBimS3+62D5kkcr3iTY36iyAUu6Av2cIbtQ2PZZhcP77Eou0/f
	hBQRHw5RxRUIqTrk11rOTJfZIBcvKMM9n4GvhV7BBbIfj3HKbuwPmq2hUk9T6D1/bV
	N6GQg0Q9LBZSDCvl7qiZmnTjvXXQgj87+9t9WuZE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNSkV016638
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:28 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 10:23:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 10:23:27 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNIJT014983
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:27 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 11:22:33 -0400
Message-ID: <1538061764-54977-20-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 19/30] spi-lld-rtos: Update to version 01.00.00.12A and added k3 support
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
X-List-Received-Date: Thu, 27 Sep 2018 15:23:54 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
index 2c174bf..77564cc 100644
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
+++ b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
@@ -5,21 +5,21 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://SPI.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SPI_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/spi-lld.git"
 SPI_LLD_GIT_PROTOCOL = "git"
 SPI_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.11"
-SPI_LLD_SRCREV = "772286dc767de33f735b14fcc1c41e4b65f24bb8"
+# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.12A"
+SPI_LLD_SRCREV = "5f591af32a1ff92140cf7d2b40cd131bb308ab73"
 
 BRANCH = "${SPI_LLD_GIT_BRANCH}"
 SRC_URI = "${SPI_LLD_GIT_URI};protocol=${SPI_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${SPI_LLD_SRCREV}"
-PV = "01.00.00.11"
+PV = "01.00.00.12A"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
@@ -28,6 +28,10 @@ DEPENDS_append = " osal-rtos \
 DEPENDS_append_ti33x = " starterware-rtos"
 DEPENDS_append_ti43x = " starterware-rtos"
 
+DEPENDS_remove_k3 = "edma3-lld-rtos "
+DEPENDS_append_k3 = " udma-lld-rtos"
+
+
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
-- 
1.9.1


