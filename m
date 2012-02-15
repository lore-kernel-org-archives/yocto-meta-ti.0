Return-Path: <pabigot@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D19A7E0030B
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2012 07:31:11 -0800 (PST)
Received: by ghbz2 with SMTP id z2so870029ghb.35
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2012 07:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=J5faaj4lOAcQxwyohNrZKPc+BhOgJyV0Yfa//nHLjVY=;
	b=axPT52/fhBEhuODYqYKSR1ZZ+Bx3x0Qi+fy3C8r7rIOcAHYPAXBzfscY1FmexUpIpU
	1/6NGMu4hTWnuPMS9+Eqey115f7mG7XvHG/7lW0UYaaWgYlZRV60xIAkrUv/9JBvpJ61
	rz5MfgO4N7wzDjpLGgw9f09vZKgBO6in7BWvY=
Received: by 10.50.196.167 with SMTP id in7mr12302401igc.9.1329319870985;
	Wed, 15 Feb 2012 07:31:10 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id ng9sm5086226igc.3.2012.02.15.07.31.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 07:31:09 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: bigotp@acm.org
To: meta-ti@yoctoproject.org
Date: Wed, 15 Feb 2012 09:30:58 -0600
Message-Id: <4f3bcfbd.09d4320a.6687.4d40@mx.google.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH] omap3-sgx-modules: fix for corrected ti-eula-unpack
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2012 15:31:12 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 .../omap3-sgx-modules_4.05.00.03.bb                |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
index 07a79ea..6b17adc 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
@@ -17,7 +17,8 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
           "
 SRC_URI[md5sum] = "0e651eaa92bb91760f0b40a17697a7dc"
 SRC_URI[sha256sum] = "bfe764a8959556195545d6fff76f63a489642f345c105bbbc309a3f243c2dd0e"
-S = "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
+TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
 
 PVRBUILD = "release"
 export KERNELDIR = "${STAGING_KERNEL_DIR}"
-- 
1.7.6.4


