Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A00DE00A4F; Wed, 25 Nov 2015 14:54:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EC4BE0088C
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 14:54:04 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPMs3Xf011626
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 16:54:03 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPMs3uC030710
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 16:54:03 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 16:54:03 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAPMrwc3016335	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 16:54:02
	-0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 25 Nov 2015 17:53:40 -0500
Message-ID: <1448492021-887-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448492021-887-1-git-send-email-e-ruei1@ti.com>
References: <1448492021-887-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] omapdrm_pvr: Define PVR_NULLDRM based on the availability of SGX
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
X-List-Received-Date: Wed, 25 Nov 2015 22:54:06 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@uda0850410>

Enable non-SGX build for AM3/AM4:
For ti43x, set PVR_NULLDRM to 1 only if SGX is not included at MACHINE_FEATURES.
Note: For ti33x, PVR_NULLDRM is always set to 1 becasue only nullDRM is 
supported.


Signed-off-by: Eric Ruei <a0850410@uda0850410>
---
 recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 50df3d9..da4ab74 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -24,7 +24,7 @@ SRCREV_ti33x = "2b7523d07a13ab704a24a7664749551f4a13ed32"
 SRCREV_ti43x = "2b7523d07a13ab704a24a7664749551f4a13ed32"
 
 PVR_NULLDRM_ti33x = "1"
-PVR_NULLDRM_ti43x = "0"
+PVR_NULLDRM_ti43x = "${@base_contains('MACHINE_FEATURES', 'sgx', '0', '1', d)}"
 PVR_NULLDRM_omap-a15 = "0"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" PVR_NULLDRM=${PVR_NULLDRM}'
-- 
1.9.1


