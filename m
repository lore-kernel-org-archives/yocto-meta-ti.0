Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FD2EE00AB9; Fri, 28 Sep 2018 09:26:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CEE9E00AAA
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:26:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGQZFP078243
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151995;
	bh=Oq09o3NxDY4E7SPcabNYW5ypbOI4pbowxZ7lUxjzTMY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yeU1HvArARNmvUFd8tobHESGMZZuU+AARQI6kkI+eSt6zBq128C9Kf26PQKEu4mgO
	FUDgVqV+hoNvmYBxZUhrzHaZcoNe2+fihg6dXGdDVsZnKpVeugWiZNlSBnO9aww1U5
	EfcYVDNkYVPrPsELlKO15q/V4pUYOBqX4PRemH2A=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQZ9s003170
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:35 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:26:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:26:35 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQWML011688
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:34 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 12:26:10 -0400
Message-ID: <1538151990-44823-10-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3 09/29] emac-lld-rtos:Update to version 01.00.03.12A and added support to k3
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
X-List-Received-Date: Fri, 28 Sep 2018 16:26:39 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
index f0b1672..9519c83 100644
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
@@ -5,21 +5,21 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://emacver.h;beginline=1;endline=47;md5=f66bb3695972ca2a85d990a390f45d88"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
 EMAC_LLD_GIT_PROTOCOL = "git"
 EMAC_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.11"
-EMAC_LLD_SRCREV = "d541d5a564029b3472e054cd7aa2bae53b40378c"
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.12A"
+EMAC_LLD_SRCREV = "5501d03014ada54f25e72eda380f751e734f006e"
 
 BRANCH ="${EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${EMAC_LLD_SRCREV}"
-PV = "01.00.03.11"
+PV = "01.00.03.12A"
 PR = "r0"
 
 DEPENDS_append = " board-rtos osal-rtos"
@@ -27,6 +27,9 @@ DEPENDS_append_ti33x = " starterware-rtos"
 DEPENDS_append_ti43x = " starterware-rtos"
 DEPENDS_append_k2g  = " cppi-lld-rtos qmss-lld-rtos"
 
+DEPENDS_remove_k3 = "board-rtos "
+DEPENDS_append_k3 = " udma-lld-rtos "
+
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
-- 
1.9.1


