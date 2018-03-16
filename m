Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32B2AE00B52; Fri, 16 Mar 2018 09:09:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2192E007E1
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 09:09:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GG9s0s018256
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 11:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521216594;
	bh=OcSnfhSVD0xnj/rfIZvGI4RwGTfeGkVYJlfggi6GrEU=;
	h=From:To:Subject:Date;
	b=Hh7dRZ/q346Tpj1IraK5wtxIa4QJs7kPkDeMHeHqcZk3wK7re2yH8bw4E44rRjMc6
	x1IZlTPmN7hICy/nk5wnPnHrUrScE/oq0d0+obgTwM5VGEFBUvBEBfoyQlgPlJvRe3
	LTwNHpAx8vnSP9NYJGtdh09NFZ/AYhGNoMl5pUJk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GG9sIe031612
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 11:09:54 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 11:09:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 11:09:54 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GG9sTU022947
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 11:09:54 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 Mar 2018 12:09:52 -0400
Message-ID: <1521216592-27235-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] i2c-lld-rtos: Updating to version 01.00.00.10 & dependency updates
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
X-List-Received-Date: Fri, 16 Mar 2018 16:09:56 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
index a178c27..cad45f3 100644
--- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
+++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bb
@@ -13,21 +13,25 @@ I2C_LLD_GIT_PROTOCOL = "git"
 I2C_LLD_GIT_BRANCH = "master"
 I2C_LLD_GIT_DESTSUFFIX = "git/ti/drv/i2c"
 
-# Below commit ID corresponds to "DEV.I2C_LLD.01.00.00.09A"
-I2C_LLD_SRCREV = "1a0e371f1c992b3f28cb160c6e3ada33d382f6a9"
+# Below commit ID corresponds to "DEV.I2C_LLD.01.00.00.10"
+I2C_LLD_SRCREV = "631a38ad7245b68bfac40a417bdc9d3a0b7ca724"
 
 BRANCH = "${I2C_LLD_GIT_BRANCH}"
 SRC_URI = "${I2C_LLD_GIT_URI};destsuffix=${I2C_LLD_GIT_DESTSUFFIX};protocol=${I2C_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${I2C_LLD_SRCREV}"
-PV = "01.00.00.09A"
+PV = "01.00.00.10"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
 "
 DEPENDS_append_ti33x = " starterware-rtos \
+                         pruss-lld-rtos \
 "
 DEPENDS_append_ti43x = " starterware-rtos \
+                         pruss-lld-rtos \
+"
+DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
 "
 
 # Build with make instead of XDC
@@ -38,5 +42,7 @@ S = "${WORKDIR}/${I2C_LLD_GIT_DESTSUFFIX}"
 export PDK_I2C_ROOT_PATH ="${WORKDIR}/build"
 export DEST_ROOT="${S}"
 
+INSANE_SKIP_${PN} = "arch"
+
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "I2C LLD"
-- 
1.9.1


