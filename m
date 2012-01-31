Return-Path: <pabigot@gmail.com>
Received: from mail-yw0-f41.google.com (mail-yw0-f41.google.com
	[209.85.213.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94AEBE0139D
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:41:18 -0800 (PST)
Received: by yhoo22 with SMTP id o22so249897yho.28
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=2NOm/Ak5NHy6gU7ibWRcn7KDR4FEjgw3x0Sqha/vG7c=;
	b=BVsczZ74muZgychN0Euh9mzjKPbpTP8lYP/5PXslezkYYuecf9ygjBxrfk2SZjAUh7
	uBc6151oi5bn1myzPTJa0HOIlI9cGsvnx4EgWU+NKKYcVNnr4G9yiE5xZPpasNLeD+of
	9ig7RPqCoPeMkFimFiSZJirKDXmItv/pZROVk=
Received: by 10.236.77.232 with SMTP id d68mr33360743yhe.98.1328013676913;
	Tue, 31 Jan 2012 04:41:16 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id t13sm55432563anh.2.2012.01.31.04.41.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 04:41:16 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 31 Jan 2012 06:40:55 -0600
Message-Id: <1328013657-2069-3-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328013657-2069-1-git-send-email-bigotp@acm.org>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 2/4] various: fix installation directories for corrected ti-eula-unpack
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
X-List-Received-Date: Tue, 31 Jan 2012 12:41:18 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 recipes-ti/bios/ti-dspbios.inc      |    3 ++-
 recipes-ti/devtools/ti-xdctools.inc |    3 ++-
 recipes-ti/edma3lld/ti-edma3lld.inc |    3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/bios/ti-dspbios.inc b/recipes-ti/bios/ti-dspbios.inc
index 8519039..0e3fa62 100644
--- a/recipes-ti/bios/ti-dspbios.inc
+++ b/recipes-ti/bios/ti-dspbios.inc
@@ -10,7 +10,8 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
 
-S = "${WORKDIR}/bios_${PV}"
+TI_BIN_UNPK_WDEXT="/bios_${PV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=biosbin"
 
diff --git a/recipes-ti/devtools/ti-xdctools.inc b/recipes-ti/devtools/ti-xdctools.inc
index c76ad80..547a555 100644
--- a/recipes-ti/devtools/ti-xdctools.inc
+++ b/recipes-ti/devtools/ti-xdctools.inc
@@ -12,7 +12,8 @@ S = "${WORKDIR}/xdctools_${PV}"
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdctools_setuplinux_${PV}.bin;name=xdcbin"
 
 BINFILE="xdctools_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+TI_BIN_UNPK_CMDS="Y:workdir:Y"
+TI_BIN_UNPK_WDEXT="/ti"
 
 do_install() {
     install -d ${D}${XDC_INSTALL_DIR_RECIPE}
diff --git a/recipes-ti/edma3lld/ti-edma3lld.inc b/recipes-ti/edma3lld/ti-edma3lld.inc
index d4e8557..fb131b6 100644
--- a/recipes-ti/edma3lld/ti-edma3lld.inc
+++ b/recipes-ti/edma3lld/ti-edma3lld.inc
@@ -8,7 +8,8 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
 
-S = "${WORKDIR}/edma3_lld_${PV}"
+TI_BIN_UNPK_WDEXT="/edma3_lld_${PV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/${SRC_URI_edma3lldsite}/edma3_lld/edma3-lld-bios5/${PV}/exports/EDMA3_LLD_setuplinux_${PV}.bin;name=edma3lldbin"
 
-- 
1.7.6.4


