Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3F9CE00B57; Wed, 14 Mar 2018 17:45:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39134E0073D
	for <meta-ti@yoctoproject.org>; Wed, 14 Mar 2018 17:45:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2F0jnhZ028773
	for <meta-ti@yoctoproject.org>; Wed, 14 Mar 2018 19:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521074749;
	bh=R4KxEKx1k7tkFlMfZaJzSkGTH11IOiBdwfgrOQDFlXw=;
	h=From:To:Subject:Date;
	b=lm0E40K1TmaTENIRv1f3U/Yh9bPT42OQ8n9yTWfa75y7JqhY4oJ4SRd6wjnY4jNzT
	GdZwzTAgsBAqdf5miZxQPFzrHTlla2tE/yLzvBr3X4B/ekpCip36YtHmiFOIr+MIdU
	1yJoLODyVXgV41q2nkzHUtcUYidUWf4nG4bUeWmc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2F0jngB005676
	for <meta-ti@yoctoproject.org>; Wed, 14 Mar 2018 19:45:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 14 Mar 2018 19:45:48 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 14 Mar 2018 19:45:48 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2F0jmAb008447
	for <meta-ti@yoctoproject.org>; Wed, 14 Mar 2018 19:45:48 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 14 Mar 2018 20:45:45 -0400
Message-ID: <1521074745-42435-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3] ti-sgx-ddk-km: update SGX kernel driver for k4.14
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
X-List-Received-Date: Thu, 15 Mar 2018 00:45:52 -0000
Content-Type: text/plain

From: Anand Balagopalakrishnan <anandb@ti.com>

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index 0303797..55f6b9b 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -20,7 +20,7 @@ RPROVIDES_${PN} = "omapdrm-pvr"
 RREPLACES_${PN} = "omapdrm-pvr"
 RCONFLICTS_${PN} = "omapdrm-pvr"
 
-BRANCH = "ti-img-sgx/${PV}/k4.9"
+BRANCH = "ti-img-sgx/${PV}/k4.14"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
 file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch \
@@ -28,7 +28,7 @@ file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "0086977380d3320d70a3abc78b95fa0641427073"
+SRCREV = "b144fa4b97cb69e54cabaad62daffcd4b5497c29"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
-- 
1.9.1


