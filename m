Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3862CE01565
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2013 09:06:14 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8DG6BPD018150;
	Fri, 13 Sep 2013 11:06:11 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8DG6B7l001654;
	Fri, 13 Sep 2013 11:06:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 13 Sep 2013 11:06:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8DG6BEZ025167;
	Fri, 13 Sep 2013 11:06:11 -0500
Date: Fri, 13 Sep 2013 12:06:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130913160610.GB13687@edge>
References: <1379042687-25413-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015972726C@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015972726C@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] omap3-sgx-modules: add automatic selection between softfp and hardfp binaries
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
X-List-Received-Date: Fri, 13 Sep 2013 16:06:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 13, 2013 at 12:12:20PM +0000, Maupin, Chase wrote:
> You added a MAKE_TARGETS for PM_RUNTIME but I don't see a note saying why in 
> the commit message.

Yeah, I noticed that too in the original patch - I remember Prabu was 
explaining when this var needs to be set and when doesn't, based on the 
kernel and gfx sdk versions, but don't remember all the details...


> Aside from that
> 
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> >Sent: Thursday, September 12, 2013 10:25 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH 1/2] omap3-sgx-modules: add automatic
> >selection between softfp and hardfp binaries
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >This is based on the work by Franklin Cooper, with following
> >changes:
> >* Cleanup and simplify the logic
> >* Reduce the number of Python calls
> >* Expand support from Raw to X11 variant
> >
> >The original description:
> >* The Graphics SDK includes some binaries that are prebuilt.
> >* These prebuilt binaries come in two versions of the Graphics
> >SDK. By default
> >  the prebuilt binaries are built using a softfp toolchain. A
> >separate hardfp
> >  Graphics SDK exist that contains binaries that are prebuilt with
> >a hardfp
> >  toolchain.
> >* Add support for both by checking to see if the toolchain used in
> >the OE build
> >  is using a hardfp or softfp toolchain.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >Cc: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> > .../omap3-sgx-modules-x11_4.09.00.01.bb              | 18
> >++++++++++++++----
> > .../powervr-drivers/omap3-sgx-modules_4.09.00.01.bb  | 20
> >++++++++++++++++----
> > 2 files changed, 30 insertions(+), 8 deletions(-)
> >
> >diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-
> >x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-
> >x11_4.09.00.01.bb
> >index 9134e61..fd79818 100644
> >--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-
> >x11_4.09.00.01.bb
> >+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-
> >x11_4.09.00.01.bb
> >@@ -7,19 +7,29 @@ require ../../recipes-ti/includes/ti-eula-
> >unpack.inc
> >
> > SGXPV = "4_09_00_01"
> > IMGPV = "1.9.2188537"
> >-BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> >
> > inherit module
> >
> >-MACHINE_KERNEL_PR_append = "b"
> >+MACHINE_KERNEL_PR_append = "c"
> > PR = "${MACHINE_KERNEL_PR}"
> >
> > DEFAULT_PREFERENCE = "-1"
> >
> >+# Select the corresponding hardfp/softfp filename and checksums
> >based on tune flags
> >+BINFILE_SOFTFP =
> >"Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> >+MD5SUM_SOFTFP = "bd35e9d8843aff3a2aca9d41e7db1c7d"
> >+SHA256SUM_SOFTFP =
> >"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
> >+
> >+BINFILE_HARDFP =
> >"Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
> >+MD5SUM_HARDFP = "c9f656dce062d1ab10afffd4dfb71b67"
> >+SHA256SUM_HARDFP =
> >"dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
> >+
> >+BINFILE = "${@base_contains('TUNE_FEATURES', 'callconvention-
> >hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
> >+
> > SRC_URI = "http://software-
> >dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}
> >/exports/${BINFILE}"
> >
> >-SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
> >-SRC_URI[sha256sum] =
> >"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
> >+SRC_URI[md5sum] = "${@base_contains('TUNE_FEATURES',
> >'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}',
> >d)}"
> >+SRC_URI[sha256sum] = "${@base_contains('TUNE_FEATURES',
> >'callconvention-hard', '${SHA256SUM_HARDFP}',
> >'${SHA256SUM_SOFTFP}', d)}"
> >
> > TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
> > S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
> >diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-
> >modules_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-
> >modules_4.09.00.01.bb
> >index 399374d..1c8718c 100644
> >--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
> >+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
> >@@ -7,19 +7,29 @@ require ../../recipes-ti/includes/ti-eula-
> >unpack.inc
> >
> > SGXPV = "4_09_00_01"
> > IMGPV = "1.9.2188537"
> >-BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> >
> > inherit module
> >
> >-MACHINE_KERNEL_PR_append = "a"
> >+MACHINE_KERNEL_PR_append = "b"
> > PR = "${MACHINE_KERNEL_PR}"
> >
> > DEFAULT_PREFERENCE = "-1"
> >
> >+# Select the corresponding hardfp/softfp filename and checksums
> >based on tune flags
> >+BINFILE_SOFTFP =
> >"Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
> >+MD5SUM_SOFTFP = "bd35e9d8843aff3a2aca9d41e7db1c7d"
> >+SHA256SUM_SOFTFP =
> >"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
> >+
> >+BINFILE_HARDFP =
> >"Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
> >+MD5SUM_HARDFP = "c9f656dce062d1ab10afffd4dfb71b67"
> >+SHA256SUM_HARDFP =
> >"dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
> >+
> >+BINFILE = "${@base_contains('TUNE_FEATURES', 'callconvention-
> >hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
> >+
> > SRC_URI = "http://software-
> >dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}
> >/exports/${BINFILE}"
> >
> >-SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
> >-SRC_URI[sha256sum] =
> >"eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
> >+SRC_URI[md5sum] = "${@base_contains('TUNE_FEATURES',
> >'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}',
> >d)}"
> >+SRC_URI[sha256sum] = "${@base_contains('TUNE_FEATURES',
> >'callconvention-hard', '${SHA256SUM_HARDFP}',
> >'${SHA256SUM_SOFTFP}', d)}"
> >
> > TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
> > S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
> >@@ -41,6 +51,8 @@ MODULESLOCATION_ti33x = "dc_ti335x_linux"
> >
> > MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}
> >SUPPORT_XORG=0"
> >
> >+MAKE_TARGETS_append_ti33x = " PM_RUNTIME=1"
> >+
> > do_install() {
> >     mkdir -p
> >${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
> >     cp  ${S}/pvrsrvkm.ko \
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

