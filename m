Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 248EFE00CB0; Thu, 27 Jul 2017 16:24:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03A02E00B8E
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:24:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RNOMdh022030
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 18:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501197862;
	bh=OWONBtrIxuniONozpNpPsf/MctRirDNPrqYa2bDrsSk=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=As5m655uWETVFt8O4r8LDAJc96XDL/TtQbKHQuscC+KJwmf755jFMDHNTlaKLrZJ/
	Ip2lNjIscMc7TomSHWrHSlffS1vFFsaGy+snFlzU42b+5gigBEX8sYbBwqi0u8sZhy
	DCEZO7wFYQ6q+5ern8a+vVOKyTVh8EKRyIPLEnoM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RNOHjH009032
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 18:24:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 18:24:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RNOGme002504	for
	<meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 18:24:16 -0500
Date: Thu, 27 Jul 2017 19:24:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20170727232413.GQ18367@edge>
References: <1501016801-28357-1-git-send-email-i-pang@ti.com>
	<1501016801-28357-2-git-send-email-i-pang@ti.com>
	<20170727201642.GI18367@edge>
MIME-Version: 1.0
In-Reply-To: <20170727201642.GI18367@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH v2 2/4] ti-cgt6x-7: added recipe for TI CGT6x 7.x.x
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
X-List-Received-Date: Thu, 27 Jul 2017 23:24:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

SUMMARY is for short description (<80 characters), while DESCRIPTION is for
longer, more detailed explanation of the package.

Here's an example of properly defining those fields - autoconf recipe:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/autoconf/autoconf.inc

SUMMARY = "A GNU tool that procude shell scripts to automatically configure software"
DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \
configure software source code packages. Autoconf creates a configuration script for a package from a template \
file that lists the operating system features that the package can use, in the form of M4 macro calls."


That's how it gets into the binary package:

$ dpkg-deb -I autoconf_2.69-r11.38_armv7ahf-neon.ipk
...
 Package: autoconf
 Version: 2.69-r11.38
 Description: A GNU tool that procude shell scripts to automatically configure software
  Autoconf is an extensible package of M4 macros that produce shell scripts
  to automatically configure software source code packages. Autoconf
  creates a configuration script for a package from a template file that
  lists the operating system features that the package can use, in the form
  of M4 macro calls.
 Section: devel
 Priority: optional
...


When SUMMARY is not set, it defaults to "${PN} version ${PV}-${PR}", while
DESCRIPTION defaults to "${SUMMARY}."

http://cgit.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n225


Hence, if you don't set DESCRIPTION, you'll get:

$ dpkg-deb -I acl_2.2.52-r0.67_armv7ahf-neon.ipk
...
 Package: acl
 Version: 2.2.52-r0.67
 Description: Utilities for managing POSIX Access Control Lists
  Utilities for managing POSIX Access Control Lists.
 Section: libs
 Priority: optional
...


But the other way around, when DESCRIPTION is set, but not the SUMMARY, it's
not that nice:

$ dpkg-deb -I aif2-lld-test_1.2.0.1-r0.0.32_armv7ahf-neon.ipk
...
 Package: aif2-lld-test
 Version: 1.2.0.1-r0.0.32
 Description: aif2-lld-test version 1.2.0.1-r0.0
  TI Antenna Interface peripheral module low level driver test binaries
 Section: base
 Priority: optional
...


Moreover, standard sub-packages like ${PN}-dev, ${PN}-dbg etc. automatically
expand SUMMARY and DESCRIPTION fields, with short and long additions:
http://cgit.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n234


Compare to acl main package mentioned above:

...
 Package: acl-dev
 Version: 2.2.52-r0.67
 Description: Utilities for managing POSIX Access Control Lists - Development files
  Utilities for managing POSIX Access Control Lists.  This package contains
  symbolic links, header files, and related items necessary for software
  development.
 Section: devel
 Priority: optional
...


Historically, this distinction wasn't really enforced. Hence there are plenty
of recipes that use DESCRIPTION, but not SUMMARY. But with the continued
addition of tooling around Yocto Project to handle recipes and packages, this
becomes more important to enforce. There were several attempts to clean this
up upstream, e.g.:
http://cgit.openembedded.org/openembedded-core/commit/?id=ad17dfd31a2b97b3e610a0ea0889f5ecb2a63b97


I haven't done a thorough clean up of existing recipes in meta-ti or meta-arago 
yet, but I'm beginning to enforce this for newly submitted recipes now...

-- 
Denys


On Thu, Jul 27, 2017 at 04:16:42PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jul 25, 2017 at 04:06:39PM -0500, Ivan Pang wrote:
> > This recipe specifically installs the 7.x.x series of TI CGT6x.
> > 
> > Signed-off-by: Ivan Pang <i-pang@ti.com>
> > ---
> >  recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb | 37 +++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb
> > 
> > diff --git a/recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb b/recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb
> > new file mode 100644
> > index 0000000..335e0ae
> > --- /dev/null
> > +++ b/recipes-ti/devtools/ti-cgt6x-7-native_7.4.16.bb
> > @@ -0,0 +1,37 @@
> > +DESCRIPTION = "TI DSP Code Generation Tools"
> 
> Use SUMMARY for short one-line descriptions.
> 
> 
> > +HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
> > +LICENSE = "TI"
> 
> Please use the proper name for the license:
> http://arago-project.org/git/?p=meta-ti.git;a=tree;f=licenses;hb=refs/heads/morty
> 
> 
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
> > +
> > +PE = "0"
> > +PR = "r0"
> 
> These are the defaults, please drop them, especially PE.
> 
> 
> > +S = "${WORKDIR}/c6000_7.4.16"
> > +
> > +inherit native
> > +require recipes-ti/includes/ti-paths.inc
> > +require recipes-ti/includes/ti-unpack.inc
> > +
> > +BINFILE = "ti_cgt_c6000_7.4.16_linux_installer_x86.bin"
> > +BINFILE_NAME = "cgt6x_7.4.16_x86_installer"
> > +TI_BIN_UNPK_ARGS = "--prefix ${WORKDIR} --mode unattended"
> > +TI_BIN_UNPK_CMDS=""
> > +
> > +SRC_URI = "http://install.source.dir.local/${BINFILE};name=${BINFILE_NAME}"
> > +
> > +SRC_URI[cgt6x_7.4.16_x86_installer.md5sum] = "21ca55c5b1f6b2d8d4fb7570d5eb5513"
> > +SRC_URI[cgt6x_7.4.16_x86_installer.sha256sum] = "baa0d1ef20397383f99f45068a6d160963a01419d42fbbb851263b54c91df82f"
> > +
> > +do_install() {
> > +    install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
> > +    cp -r ${WORKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
> 
> This will give you host contamination warnings. Please adjust "cp" args 
> accordingly to not preserve ownership of files, e.g.:
> 
> cp -rP --preserve=mode,links,timestamps --no-preserve=ownership
> 
> 
> > +}
> > +
> > +FILES_${PN} += "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
> > +
> > +INSANE_SKIP_${PN} += "arch staticdev"
> > +
> > +INHIBIT_PACKAGE_STRIP = "1"
> > +INHIBIT_SYSROOT_STRIP = "1"
> > +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > -- 
> > 1.9.1
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

