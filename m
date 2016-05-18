Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69318E00E03; Tue, 17 May 2016 19:41:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04BBDE00C72
	for <meta-ti@yoctoproject.org>; Tue, 17 May 2016 19:41:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4I2fPLt025272
	for <meta-ti@yoctoproject.org>; Tue, 17 May 2016 21:41:25 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4I2fPKH003009
	for <meta-ti@yoctoproject.org>; Tue, 17 May 2016 21:41:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 May 2016 21:41:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4I2fPET027877;
	Tue, 17 May 2016 21:41:25 -0500
Date: Tue, 17 May 2016 22:41:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20160518024109.GX16188@edge>
References: <1462989639-23037-1-git-send-email-sam.nelson@ti.com>
	<20160513185652.GB16188@edge>
	<4B26FB5A64EBA14C87266869E037F95814287F9F@DFLE09.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F490583BC4F5@DLEE11.ent.ti.com>
	<20160517185637.GW16188@edge>
	<4F9216F96E5DF9428610502835A9F490583BC692@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F490583BC692@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-ipc-rtos: Update to include examples and documentation with the package
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
X-List-Received-Date: Wed, 18 May 2016 02:41:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 17, 2016 at 05:32:57PM -0400, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, May 17, 2016 2:57 PM
> > To: Nelson, Sam
> > Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] [PATCH] ti-ipc-rtos: Update to include examples and
> > documentation with the package
> > 
> > On Tue, May 17, 2016 at 02:39:45PM -0400, Nelson, Sam wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Stiffler, Jacob
> > > > Sent: Friday, May 13, 2016 3:13 PM
> > > > To: Dmytriyenko, Denys; Nelson, Sam
> > > > Cc: meta-ti@yoctoproject.org
> > > > Subject: RE: [meta-ti] [PATCH] ti-ipc-rtos: Update to include
> > > > examples and documentation with the package
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > > > bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> > > > > Sent: Friday, May 13, 2016 2:57 PM
> > > > > To: Nelson, Sam
> > > > > Cc: meta-ti@yoctoproject.org
> > > > > Subject: Re: [meta-ti] [PATCH] ti-ipc-rtos: Update to include
> > > > > examples and documentation with the package
> > > > >
> > > > > Sam,
> > > > >
> > > > > Is this v2? You didn't specify changes since v1, so I would have
> > > > > to dig out the previous submission and check that past comments
> > > > > were
> > > > addressed.
> > > > >
> > > > > Jake,
> > > > >
> > > > > Do you have any comments here?
> > > > >
> > > > >
> > > > > On Wed, May 11, 2016 at 02:00:39PM -0400, Sam Nelson wrote:
> > > > > > Updated to new version 3.42.01.03 Added procedures and source
> > > > > > urls for adding examples and
> > > > > documentation
> > > > > > into src package.
> > > > > > Added dependency on doxygen for document creation Added big
> > > > > > endian
> > > > > > c66 targets Updated uniform formatting
> > > > > >
> > > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > > ---
> > > > > >  recipes-ti/ipc/ti-ipc-rtos_git.bb | 119
> > > > > ++++++++++++++++++++++++++++++++------
> > > > > >  recipes-ti/ipc/ti-ipc.inc         |   6 +-
> > > > > >  2 files changed, 104 insertions(+), 21 deletions(-)
> > > > > >
> > > > > > diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > > > > > b/recipes-ti/ipc/ti-ipc-
> > > > > rtos_git.bb
> > > > > > index 4c0fc74..8fb448f 100644
> > > > > > --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > > > > > +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > > > > > @@ -2,9 +2,44 @@ require recipes-ti/includes/ti-paths.inc
> > > > > > require recipes-ti/includes/ti-staging.inc
> > > > > >  require ti-ipc.inc
> > > > > >
> > > > > > -PR = "${INC_PR}.4"
> > > > > > +TI_IPC_EXAMPLES_GIT_URI = "git://git.ti.com/ipc/ipc-examples.git"
> > > > > > +TI_IPC_EXAMPLES_DEST_SUFFIX = "git/ipc-examples"
> > > > > > +TI_IPC_EXAMPLES_GIT_PROTOCOL = "git"
> > > > > > +TI_IPC_EXAMPLES_GIT_BRANCH = "master"
> > > > > > +TI_IPC_EXAMPLES_NAME = "ipc-examples"
> > > > > >
> > > > > > -DEPENDS = "ti-xdctools ti-sysbios"
> > > > > > +SRC_URI += "${TI_IPC_EXAMPLES_GIT_URI};\
> > > > > > +destsuffix=${TI_IPC_EXAMPLES_DEST_SUFFIX};\
> > > > > > +protocol=${TI_IPC_EXAMPLES_GIT_PROTOCOL};\
> > > > > > +branch=${TI_IPC_EXAMPLES_GIT_BRANCH};\
> > > > > > +name=${TI_IPC_EXAMPLES_NAME}"
> > > > > > +
> > > > > > +TI_IPC_METADATA_GIT_URI = "git://git.ti.com/ipc/ipc-metadata.git"
> > > > > > +TI_IPC_METADATA_DEST_SUFFIX = "git/ipc-metadata"
> > > > > > +TI_IPC_METADATA_GIT_PROTOCOL = "git"
> > > > > > +TI_IPC_METADATA_GIT_BRANCH = "master"
> > > > > > +TI_IPC_METADATA_NAME = "ipc-metadata"
> > > > > > +
> > > > > > +SRC_URI += "${TI_IPC_METADATA_GIT_URI};\
> > > > > > +destsuffix=${TI_IPC_METADATA_DEST_SUFFIX};\
> > > > > > +protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
> > > > > > +branch=${TI_IPC_METADATA_GIT_BRANCH};\
> > > > > > +name=${TI_IPC_METADATA_NAME}"
> > > > > > +
> > > > > > +# Corresponds to tag: 3.42.01.03 SRCREV_ipc-examples =
> > > > "bd4f28bd46467553e6610629ff13b4b5b3ba3af0"
> > > > > > +
> > > > > > +# Corresponds to tag: 3.42.01.03 SRCREV_ipc-metadata =
> > > > "4d01fe4a7c41d2ce76a62b4325e66753d59b298c"
> > > > > > +
> > > > > > +SRCREV_FORMAT = "ipc-metadata_ipc-examples"
> > > >
> > > > I'm not sure about this SRCREV_FORMAT. Should it also contain the
> > > > main ipc git SRCREV? And is this needed if SRCPV is not in the PV?
> > >
> > > Look like there is some confusion here. I am also not clear if this is needed if
> > SRCREV is not used in PV.
> 
> Denys, Can you clarify on whether the SRCREV_FORMAT is really needed or not?

Do you get an error about SRCREV_FORMAT required w/o it?


> > > > > > +
> > > > > > +S_ipc-examples = "${WORKDIR}/git/ipc-examples"
> > > > > > +S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
> > > > > > +
> > > > > > +PR = "${INC_PR}.0"
> > > > > > +
> > > > > > +DEPENDS = "ti-xdctools ti-sysbios doxygen-native"
> > > > > >  DEPENDS_append_keystone = " ti-cgt6x-native \
> > > > > >                              gcc-arm-none-eabi-native \  "
> > > > > > @@ -12,6 +47,8 @@ DEPENDS_append_omap-a15 = " ti-cgt6x-native \
> > > > > >                              ti-ccsv6-native \
> > > > > >                              gcc-arm-none-eabi-native \  "
> > > > > > +DEPENDS_append_c66x = " ti-cgt6x-native \ "
> > > >
> > > > These c66x machines have not yet been accepted into meta-ti.
> > >
> > > Ok. I will remove this for now.
> > >
> > > >
> > > > > >
> > > > > >  PACKAGES =+ "${PN}-fw"
> > > > > >  FILES_${PN}-fw = "${base_libdir}/firmware/*"
> > > > > > @@ -26,6 +63,7 @@ IPC_TARGETS = ""
> > > > > >  IPC_TARGETS_omap-a15 = "\
> > > > > >      gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
> > > > > >      ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> > > > > > \
> > > > > > +
> > > > > ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/
> > > > > cgt-
> > > > > c6x" \
> > > > > >      ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
> > > > > >      ti.targets.arm.elf.M4F="${M4_TOOLCHAIN_INSTALL_DIR}" \  "
> > > > > > @@ -33,18 +71,66 @@ IPC_TARGETS_omap-a15 = "\
> > > > IPC_TARGETS_keystone
> > > > > > = " \
> > > > > >      gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
> > > > > >      ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> > > > > > \
> > > > > > +
> > > > > ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/
> > > > > cgt-
> > > > > c6x" \
> > > > > > +"
> > > > > > +
> > > > > > +IPC_TARGETS_c66x = " \
> > > > > > +    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> > > > > > +\
> > > > > > +
> > > > > ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/
> > > > > cgt-
> > > > > c6x" \
> > > > > >  "
> > > > > >
> > > > > >  EXTRA_OEMAKE = "\
> > > > > >      PLATFORM=${PLATFORM} \
> > > > > >      XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
> > > > > >      BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
> > > > > > -    ${IPC_TARGETS} -f ipc-bios.mak\
> > > > > > +    ${IPC_TARGETS} \
> > > > > >  "
> > > > > >
> > > > > > +RELEASE_TYPE = "GA"
> > > > > > +RELEASE_SUFFIX = ""
> > > > > > +
> > > > > > +SRCIPK_SRC_DIR = "${D}${IPC_INSTALL_DIR_RECIPE}"
> > > > > > +SRCIPK_INSTALL_DIR = "ipc_${@'${PV}'.replace('.',
> > > > > '_')}${RELEASE_SUFFIX}"
> > > >
> > > > This already specified in meta-arago's arago-source-ipk.conf?
> > >
> > > I don't see anything related ti-ipc-rtos, in the master branch meta-arago:
> > arago-source-ipk.conf.
> > > Am I missing something?
> > 
> > Yes, no SRCIPK stuff in meta-ti allowed.
> > 
> 
> I see. I will remove from here and send update to meta-arago.
> 
> > 
> > > > > > +
> > > > > >  do_compile() {
> > > > > > -  oe_runmake clean
> > > > > > -  oe_runmake all
> > > > > > +  oe_runmake -f ipc-bios.mak clean  oe_runmake -f ipc-bios.mak
> > > > > > + release
> > > > > > +
> > > > > > +  cd ${S_ipc-metadata}
> > > > > > +  oe_runmake .all-files IPC_INSTALL_DIR="${S}" \
> > > > > > +    BUILD_HOST_OS="linux" \
> > > > > > +    RELEASE_TYPE="${RELEASE_TYPE}"
> > > > > > +
> > > > > > +  cd ${S_ipc-examples}/src
> > > > > > +  oe_runmake .examples \
> > > > > > +    IPCTOOLS="${S_ipc-metadata}/src/etc"
> > > > > > +
> > > > > > +  if [  "${PLATFORM}" != "UNKNOWN" ]; then
> > > > > > +    oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${S}"
> > > > > > +    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${S}"
> > > > > > +
> > > > > > +    if [ ! -z ${ALT_PLATFORM} ]; then
> > > > > > +      oe_runmake extract PLATFORM=${ALT_PLATFORM}
> > HOSTOS="bios"
> > > > > IPC_INSTALL_DIR="${S}"
> > > > > > +      oe_runmake extract PLATFORM=${ALT_PLATFORM}
> > HOSTOS="linux"
> > > > > IPC_INSTALL_DIR="${S}"
> > > > > > +    fi
> > > > > > +  fi
> > > > > > +
> > > > > > +  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
> > > > > > + # Copy docs and other meta files  install -d
> > > > > > + ${D}${IPC_INSTALL_DIR_RECIPE}  cp -pPrf
> > > > > > + ${S_ipc-metadata}/exports/ipc_${IPC_VERSION}/* -d
> > > > > ${D}${IPC_INSTALL_DIR_RECIPE}
> > > > > > +
> > > > > > +  # Copy example folders corresponding to the platforms  if [
> > > > > > + "${PLATFORM}" != "UNKNOWN" ]; then
> > > > > > +    install -d ${D}${IPC_INSTALL_DIR_RECIPE}/examples
> > > > > > +    cp -pPf ${S_ipc-examples}/src/examples/*.*
> > > > > ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
> > > > > > +    cp -pPf ${S_ipc-examples}/src/examples/makefile
> > > > > ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
> > > > > > +    cp -pPrf ${S_ipc-examples}/src/examples/${PLATFORM}*
> > > > > ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
> > > > > > +    if [ ! -z ${ALT_PLATFORM} ]; then
> > > > > > +      cp -pPrf ${S_ipc-examples}/src/examples/${ALT_PLATFORM}*
> > > > > ${D}${IPC_INSTALL_DIR_RECIPE}/examples/
> > > > > > +    fi
> > > > > > +    find ${D}${IPC_INSTALL_DIR_RECIPE}/examples/ -name "*zip"
> > > > > > + -type f |
> > > > > xargs -I {} rm {}
> > > > > > +  fi
> > > >
> > > > Why do all of this installation in the do_compile stage? Should it
> > > > be in do_install?
> > > >
> > >
> > > This is rtos package and everything is that is created is part of the source
> > package.
> > > Only what goes into file system is in the do_install step.
> > >
> > > > > >  }
> > > > > >
> > > > > >  do_compile_append() {
> > > > > > @@ -52,25 +138,22 @@ do_compile_append() {  }
> > > > > >
> > > > > >  do_install() {
> > > > > > -    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
> > > > > > -    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
> > > > > > -
> > > > > > -    install -d ${D}${base_libdir}/firmware/ipc
> > > > > > -    cp -pPrf ${S}/packages/ti/ipc/tests/bin/*
> > > > > ${D}${base_libdir}/firmware/ipc
> > > > > > +  install -d ${D}${base_libdir}/firmware/ipc  cp -pPrf
> > > > > > + ${S}/packages/ti/ipc/tests/bin/*
> > > > > ${D}${base_libdir}/firmware/ipc
> > > > > >  }
> > > > > >
> > > > > >  ALTERNATIVE_PRIORITY = "5"
> > > > > >
> > > > > >  pkg_postinst_${PN}-fw_omap-a15 () {
> > > > > > -	update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-
> > > > > dsp1-fw.xe66
> > > > > ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> > > > > ${ALTERNATIVE_PRIORITY}
> > > > > > -	update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-
> > > > > dsp2-fw.xe66
> > > > > ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> > > > > ${ALTERNATIVE_PRIORITY}
> > > > > > -	update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 dra7-
> > > > > ipu1-fw.xem4
> > > > > ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> > > > > ${ALTERNATIVE_PRIORITY}
> > > > > > -	update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 dra7-
> > > > > ipu2-fw.xem4
> > > > > ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> > > > > ${ALTERNATIVE_PRIORITY}
> > > > > > +  update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66
> > > > > > + dra7-
> > > > > dsp1-fw.xe66
> > > > > ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> > > > > ${ALTERNATIVE_PRIORITY}
> > > > > > +  update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66
> > > > > > + dra7-
> > > > > dsp2-fw.xe66
> > > > > ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> > > > > ${ALTERNATIVE_PRIORITY}
> > > > > > +  update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4
> > > > > > + dra7-
> > > > > ipu1-fw.xem4
> > > > > ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> > > > > ${ALTERNATIVE_PRIORITY}
> > > > > > +  update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4
> > > > > > + dra7-
> > > > > ipu2-fw.xem4
> > > > > ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> > > > > ${ALTERNATIVE_PRIORITY}
> > > > > >  }
> > > > > >
> > > > > >  pkg_postrm_${PN}-fw_omap-a15 () {
> > > > > > -	update-alternatives --remove dra7-dsp1-fw.xe66
> > > > > ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> > > > > > -	update-alternatives --remove dra7-dsp2-fw.xe66
> > > > > ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> > > > > > -	update-alternatives --remove dra7-ipu1-fw.xem4
> > > > > ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> > > > > > -	update-alternatives --remove dra7-ipu2-fw.xem4
> > > > > ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> > > > > > +  update-alternatives --remove dra7-dsp1-fw.xe66
> > > > > ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
> > > > > > +  update-alternatives --remove dra7-dsp2-fw.xe66
> > > > > ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
> > > > > > +  update-alternatives --remove dra7-ipu1-fw.xem4
> > > > > ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
> > > > > > +  update-alternatives --remove dra7-ipu2-fw.xem4
> > > > > ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
> > > > > >  }
> > > > > > diff --git a/recipes-ti/ipc/ti-ipc.inc
> > > > > > b/recipes-ti/ipc/ti-ipc.inc index 69127aa..9c5dfed 100644
> > > > > > --- a/recipes-ti/ipc/ti-ipc.inc
> > > > > > +++ b/recipes-ti/ipc/ti-ipc.inc
> > > > > > @@ -8,15 +8,15 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
> > > > > >  TI_IPC_GIT_PROTOCOL = "git"
> > > > > >  TI_IPC_GIT_BRANCH = "3.42"
> > > > > >
> > > > > > -#Corresponds to 3.42.00.02
> > > > > > -TI_IPC_SRCREV = "a520969994378fb2629d7dfc25f306c3a711b5bc"
> > > > > > +#Corresponds to 3.42.01.03
> > > > > > +TI_IPC_SRCREV = "dc6c5082f478225b7fbce4216173e6c5b36100b4"
> > > > > >
> > > > > >  BRANCH = "${TI_IPC_GIT_BRANCH}"
> > > > > >  SRC_URI =
> > > > >
> > > >
> > "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH}"
> > > > > >  SRCREV = "${TI_IPC_SRCREV}"
> > > > > >
> > > > > >  S = "${WORKDIR}/git"
> > > > > > -PV = "3.42.00.02"
> > > > > > +PV = "3.42.01.03"
> > > > > >  INC_PR = "r0"
> > > > > >
> > > > > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > > > --
> > > > > > 1.9.1
> > > > > >
> > > > > > --
> > > > > > _______________________________________________
> > > > > > meta-ti mailing list
> > > > > > meta-ti@yoctoproject.org
> > > > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > > > > --
> > > > > _______________________________________________
> > > > > meta-ti mailing list
> > > > > meta-ti@yoctoproject.org
> > > > > https://lists.yoctoproject.org/listinfo/meta-ti

