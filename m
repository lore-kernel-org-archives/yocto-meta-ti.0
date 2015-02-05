Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 411C7E00894; Thu,  5 Feb 2015 06:41:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E30D5E00815
	for <meta-ti@yoctoproject.org>; Thu,  5 Feb 2015 06:40:52 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15EeqOt008884
	for <meta-ti@yoctoproject.org>; Thu, 5 Feb 2015 08:40:52 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15EepJi005387
	for <meta-ti@yoctoproject.org>; Thu, 5 Feb 2015 08:40:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Feb 2015 08:40:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15EeoNU006337;
	Thu, 5 Feb 2015 08:40:50 -0600
Date: Thu, 5 Feb 2015 09:40:50 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20150205144049.GB9943@edge>
References: <1423064446-7202-1-git-send-email-j-stiffler@ti.com>
	<1423064446-7202-2-git-send-email-j-stiffler@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7F6FA5@DFLE08.ent.ti.com>
	<20150204170415.GH6257@edge>
	<4B26FB5A64EBA14C87266869E037F958140E8AB4@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4B26FB5A64EBA14C87266869E037F958140E8AB4@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 2/2] ti-cgt6x: Upgrade to 8.0.0
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
X-List-Received-Date: Thu, 05 Feb 2015 14:41:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 05, 2015 at 09:17:04AM -0500, Stiffler, Jacob wrote:
> I was deleting the older versions because I ran into some issue with a lower 
> versioned recipe being chosen over the new one.
> 
> Now, I did some more investigation and I noticed that 'PE = "1"' in these 
> older recipes.
> 
> Should I remove this from the older recipes, or add this to my new recipe?

Jake,

PE stands for Package Epoch and is used when for some reason versioning order 
went backwards - for example, 97, 98, 99, 1.0, 1.1
In that case you bump PE when moving to 1.0 version to indicate a new epoch 
and get the sorting right.

In your case, old recipes already had PE = 1 and your version is higher than 
the rest, so you can just keep the same PE = 1 and don't need to increase it.

-- 
Denys


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Wednesday, February 04, 2015 12:04 PM
> To: Cooper Jr., Franklin
> Cc: Stiffler, Jacob; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 2/2] ti-cgt6x: Upgrade to 8.0.0
> 
> On Wed, Feb 04, 2015 at 04:42:55PM +0000, Cooper Jr., Franklin wrote:
> > In general we delete old recipes and add new recipes as two separate patches.
> 
> In reverse order, though - you first add new and then remove old.
> 
> 
> > So I would recommend creating your new recipe in one patch and then 
> > deleting the old recipes in another patch.
> 
> But why delete old codegen version? Will the new one still work for older platforms that we still have in meta-ti - omap3, omap4, etc?
> 
> --
> Denys
> 
> 
> > > -----Original Message-----
> > > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > > bounces@yoctoproject.org] On Behalf Of Stiffler, Jacob
> > > Sent: Wednesday, February 04, 2015 9:41 AM
> > > To: meta-ti@yoctoproject.org
> > > Subject: [meta-ti] [PATCH 2/2] ti-cgt6x: Upgrade to 8.0.0
> > > 
> > > * Remove older versions.
> > > * Add support for native and nativesdk versions.
> > > 
> > > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > > ---
> > >  recipes-ti/devtools/ti-cgt6x.inc       |   24 ---------
> > >  recipes-ti/devtools/ti-cgt6x_6.1.20.bb |   11 ----
> > >  recipes-ti/devtools/ti-cgt6x_7.2.7.bb  |   13 -----
> > >  recipes-ti/devtools/ti-cgt6x_8.0.0.bb  |   86
> > > ++++++++++++++++++++++++++++++++
> > >  4 files changed, 86 insertions(+), 48 deletions(-)  delete mode 100644
> > > recipes-ti/devtools/ti-cgt6x.inc  delete mode 100644 recipes-ti/devtools/ti-
> > > cgt6x_6.1.20.bb
> > >  delete mode 100644 recipes-ti/devtools/ti-cgt6x_7.2.7.bb
> > >  create mode 100644 recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> > > 
> > > diff --git a/recipes-ti/devtools/ti-cgt6x.inc b/recipes-ti/devtools/ti-cgt6x.inc
> > > deleted file mode 100644
> > > index 1d00a55..0000000
> > > --- a/recipes-ti/devtools/ti-cgt6x.inc
> > > +++ /dev/null
> > > @@ -1,24 +0,0 @@
> > > -DESCRIPTION = "TI DSP Code Generation Tools"
> > > -HOMEPAGE = "https://www-
> > > a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> > > -SECTION = "devel"
> > > -LICENSE = "TI"
> > > -
> > > -require ../includes/ti-paths.inc
> > > -require ../includes/ti-staging.inc
> > > -require ../includes/ti-eula-unpack.inc
> > > -
> > > -PR = "r4"
> > > -
> > > -S = "${WORKDIR}/cgt6x_${PV}"
> > > -
> > > -SRC_URI =
> > > "http://install.source.dir.local/ti_cgt_c6000_${PVwithdots}_setup_linux_x86
> > > .bin;name=cgt6xbin"
> > > -
> > > -BINFILE="ti_cgt_c6000_${PVwithdots}_setup_linux_x86.bin"
> > > -TI_BIN_UNPK_CMDS="Y:qY:workdir: : "
> > > -TI_BIN_UNPK_WDEXT="/cgt6x_${PV}"
> > > -
> > > -do_install() {
> > > -    install -d ${D}${CODEGEN_INSTALL_DIR_RECIPE}
> > > -    cp -pPrf ${S}/* ${D}${CODEGEN_INSTALL_DIR_RECIPE}
> > > -}
> > > -
> > > diff --git a/recipes-ti/devtools/ti-cgt6x_6.1.20.bb b/recipes-ti/devtools/ti-
> > > cgt6x_6.1.20.bb
> > > deleted file mode 100644
> > > index 1d6609c..0000000
> > > --- a/recipes-ti/devtools/ti-cgt6x_6.1.20.bb
> > > +++ /dev/null
> > > @@ -1,11 +0,0 @@
> > > -require ti-cgt6x.inc
> > > -
> > > -LIC_FILES_CHKSUM =
> > > "file://LICENSE.txt;md5=62f46f1125a152a2e213b414db7ac600"
> > > -
> > > -PE = "1"
> > > -PV = "6_1_20"
> > > -PVwithdots = "6.1.20"
> > > -
> > > -SRC_URI[cgt6xbin.md5sum] = "39485ea8211960de0a958ab27106ab9b"
> > > -SRC_URI[cgt6xbin.sha256sum] =
> > > "a020142011c8160e24f6386f7696ecfbfe02dab2a6c83af74ce6b67eb1da990
> > > 0"
> > > -
> > > diff --git a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb b/recipes-ti/devtools/ti-
> > > cgt6x_7.2.7.bb
> > > deleted file mode 100644
> > > index a226600..0000000
> > > --- a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
> > > +++ /dev/null
> > > @@ -1,13 +0,0 @@
> > > -require ti-cgt6x.inc
> > > -
> > > -LIC_FILES_CHKSUM =
> > > "file://LICENSE.txt;md5=62f46f1125a152a2e213b414db7ac600"
> > > -
> > > -PE = "1"
> > > -PV = "7_2_7"
> > > -PVwithdots = "7.2.7"
> > > -
> > > -SRC_URI[cgt6xbin.md5sum] = "71a0768a541fdebd9c35d44301019d1d"
> > > -SRC_URI[cgt6xbin.sha256sum] =
> > > "211477f0142d603975544abe3c45cc3b77a3b38038158676c6081280637873
> > > 8b"
> > > -
> > > -
> > > -INSANE_SKIP_${PN} = "installed-vs-shipped"
> > > diff --git a/recipes-ti/devtools/ti-cgt6x_8.0.0.bb b/recipes-ti/devtools/ti-
> > > cgt6x_8.0.0.bb
> > > new file mode 100644
> > > index 0000000..28689af
> > > --- /dev/null
> > > +++ b/recipes-ti/devtools/ti-cgt6x_8.0.0.bb
> > > @@ -0,0 +1,86 @@
> > > +DESCRIPTION = "TI DSP Code Generation Tools"
> > > +HOMEPAGE = "https://www-
> > > a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> > > +LICENSE = "TI TSPA with portions under Thai Open Source Software Center
> > > & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 and MIT and BSD-2-
> > > Clause and Public Domain and other similar"
> > > +
> > > +LIC_FILES_CHKSUM = "file://ti-cgt-
> > > c6000_${PV}/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
> > > +LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-
> > > c6x/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
> > > +
> > > +require ../includes/ti-unpack.inc
> > > +
> > > +BINFILE = "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
> > > +BINFILE_NAME = "cgt6x_x86_installer"
> > > +TI_BIN_UNPK_ARGS = "--prefix ${S}"
> > > +TI_BIN_UNPK_CMDS = ""
> > > +
> > > +BINFILE_class-target =
> > > "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
> > > +BINFILE_NAME_class-target = "cgt6x_arm_installer"
> > > +
> > > +SRC_URI = "http://software-
> > > dl.ti.com/codegen/esd/cgt_public_sw/C6000/Production/${PV}/${BINFILE};
> > > name=${BINFILE_NAME}"
> > > +
> > > +SRC_URI[cgt6x_x86_installer.md5sum] =
> > > "ff83845672090bf0a669bba7b0cadf56"
> > > +SRC_URI[cgt6x_x86_installer.sha256sum] =
> > > "297f77a00b211b3c4afa23afe7319e98b2400b5d2eb0f8c8cfe3ef7d7aa4d709
> > > "
> > > +
> > > +SRC_URI[cgt6x_arm_installer.md5sum] =
> > > "13961e5a1da4c310ea8c8707ab981fff"
> > > +SRC_URI[cgt6x_arm_installer.sha256sum] =
> > > "cb24ae05baffbd44d6dedba68743be09fd883e04403e069c437c486533d8fffb
> > > "
> > > +
> > > +do_install() {
> > > +    install -d ${D}${bindir}
> > > +    for binfile in ${S}/ti-cgt-c6000_${PV}/bin/*; do
> > > +        install -m 755 ${binfile} ${D}${bindir}
> > > +    done
> > > +
> > > +    install -d ${D}${datadir}/ti/cgt-c6x/include
> > > +    for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
> > > +        install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
> > > +    done
> > > +
> > > +    install -d ${D}${datadir}/ti/cgt-c6x/lib
> > > +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.a; do
> > > +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> > > +    done
> > > +
> > > +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.cmd; do
> > > +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> > > +    done
> > > +
> > > +    for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.lib; do
> > > +        install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
> > > +    done
> > > +
> > > +    install -d ${D}${datadir}/ti/cgt-c6x/lib/src
> > > +    for srcfile in ${S}/ti-cgt-c6000_${PV}/lib/src/*; do
> > > +        install -m 644 ${srcfile} ${D}${datadir}/ti/cgt-c6x/lib/src
> > > +    done
> > > +
> > > +    install -d ${D}${datadir}/man/man1
> > > +    for manfile in ${S}/ti-cgt-c6000_${PV}/man/man1/*; do
> > > +        install -m 644 ${manfile} ${D}${datadir}/man/man1
> > > +    done
> > > +
> > > +    install -d ${D}${datadir}/doc/ti/cgt-c6x
> > > +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.txt; do
> > > +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> > > +    done
> > > +
> > > +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.htm; do
> > > +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> > > +    done
> > > +
> > > +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.spdx; do
> > > +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> > > +    done
> > > +
> > > +    for docfile in ${S}/ti-cgt-c6000_${PV}/doc/*; do
> > > +        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> > > +    done
> > > +
> > > +}
> > > +
> > > +do_install_class-target() {
> > > +    ${WORKDIR}/${BINFILE} --prefix ${D} }
> > > +
> > > +FILES_${PN} += "${datadir}/ti/*"
> > > +
> > > +BBCLASSEXTEND = "native nativesdk"
> > > +
> > > --
> > > 1.7.9.5
> > > 
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

