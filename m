Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8561E0079A; Mon, 25 Aug 2014 10:16:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76A21E006B5
	for <meta-ti@yoctoproject.org>; Mon, 25 Aug 2014 10:16:19 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7PHGGV8000660;
	Mon, 25 Aug 2014 12:16:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7PHGGnF024999;
	Mon, 25 Aug 2014 12:16:16 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 25 Aug 2014 12:16:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7PHGGW2003992;
	Mon, 25 Aug 2014 12:16:16 -0500
Date: Mon, 25 Aug 2014 13:16:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140825171615.GF23523@edge>
References: <20140812221102.3E60D52981@arago-project.org>
	<8F29D6B095ED194EA1980491A5E029710C703EDD@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C703EDD@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Arago Project git <git@arago-project.org>
Subject: Re: Denys Dmytriyenko : am33x-cm3: update with version 1.8.7
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
X-List-Received-Date: Mon, 25 Aug 2014 17:16:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

> > * Bump PE due to versioning schema change

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


On Mon, Aug 25, 2014 at 05:14:22PM +0000, Cooper Jr., Franklin wrote:
> FYI
> I already built this package before this patch was introduced and found that 
> PM was never working.
> 
> The PV of this new firmware (1.8.7) is smaller than the old version of the 
> package (05.00.00.03) so I kept getting the old version of the firmware.
> So you need to clean out the old version of this package to make sure that 
> the new version is picked up.
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Arago Project git
> > Sent: Tuesday, August 12, 2014 5:11 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] Denys Dmytriyenko : am33x-cm3: update with version
> > 1.8.7
> > 
> > Module: meta-ti
> > Branch: master
> > Commit: dca184c6791df0195d5d0b927767296be684c3fe
> > URL:    http://arago-project.org/git/meta-
> > ti.git?a=commit;h=dca184c6791df0195d5d0b927767296be684c3fe
> > 
> > Author: Denys Dmytriyenko <denys@ti.com>
> > Date:   Wed Aug 13 02:03:49 2014 +0000
> > 
> > am33x-cm3: update with version 1.8.7
> > 
> > * Move repo to git.ti.com
> > * Bump PE due to versioning schema change
> > * Drop init scripts needed back in 3.8 days
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > ---
> > 
> >  recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3 |    6 ---
> >  recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3 |    6 ---
> >  recipes-bsp/am33x-cm3/am33x-cm3_git.bb         |   43 ++++--------------------
> >  3 files changed, 7 insertions(+), 48 deletions(-)
> > 
> > diff --git a/recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3 b/recipes-
> > bsp/am33x-cm3/am33x-cm3/init-am33x-cm3
> > deleted file mode 100644
> > index 56c17b3..0000000
> > --- a/recipes-bsp/am33x-cm3/am33x-cm3/init-am33x-cm3
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -#!/bin/sh
> > -
> > -# Load the PM CM3 firmware
> > -echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> > firmware.bin/loading
> > -cat /lib/firmware/am335x-pm-firmware.bin >
> > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> > firmware.bin/data
> > -echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> > firmware.bin/loading
> > diff --git a/recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3 b/recipes-
> > bsp/am33x-cm3/am33x-cm3/init-am43x-cm3
> > deleted file mode 100644
> > index 0a75c1f..0000000
> > --- a/recipes-bsp/am33x-cm3/am33x-cm3/init-am43x-cm3
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -#!/bin/sh
> > -
> > -# Load the PM CM3 firmware
> > -echo 1 >
> > /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-
> > firmware.bin/loading
> > -cat /lib/firmware/am335x-pm-firmware.bin >
> > /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-
> > firmware.bin/data
> > -echo 0 >
> > /sys/devices/44000000.ocp/44d00000.wkup_m3/firmware/am335x-pm-
> > firmware.bin/loading
> > diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-
> > bsp/am33x-cm3/am33x-cm3_git.bb
> > index 42f20da..51ec9bd 100644
> > --- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> > +++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
> > @@ -3,35 +3,14 @@ DESCRIPTION = "Cortex-M3 binary blob for suspend-
> > resume"
> >  LICENSE = "BSD-3-Clause"
> >  LIC_FILES_CHKSUM =
> > "file://License.txt;md5=7bdc54a749ab7a7dea999d25d99a41b8"
> > 
> > -PV = "05.00.00.03"
> > -PR = "r1"
> > +PV = "1.8.7"
> > +PR = "r0"
> > +PE = "1"
> > 
> > -# Make package machine specific due to different init scripts -
> > PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +SRCREV = "fb0117edd5810a8d3bd9b1cd8abe34e12ff2d0ba"
> > +BRANCH ?= "next"
> > 
> > -# SRCREV corresponds to tag v05.00.00.03 -SRCREV =
> > "a0ddffb63147e2079a08944c0e399c75538201a9"
> > -BRANCH ?= "master"
> > -
> > -# This init script is only used for older kernels that do not support -# hotplug
> > of the firmware.  Newer kernels do not require the initscript -# package.
> > -INITSCRIPT_NAME = "am335x-pm-firmware-load"
> > -INITSCRIPT_PARAMS = "defaults 96"
> > -
> > -inherit update-rc.d
> > -
> > -UPDATERCPN = "${PN}-initscript"
> > -
> > -RDEPENDS_${PN}-initscript = "am33x-cm3"
> > -
> > -SRC_URI = "git://arago-project.org/git/projects/am33x-
> > cm3.git;protocol=git;branch=${BRANCH} \
> > -           file://init-am33x-cm3 \
> > -           file://init-am43x-cm3 \
> > -          "
> > -
> > -SCRIPT_ti33x = "init-am33x-cm3"
> > -SCRIPT_ti43x = "init-am43x-cm3"
> > +SRC_URI = "git://git.ti.com/ti-cm3-pm-firmware/amx3-
> > cm3.git;protocol=git;branch=${BRANCH}"
> > 
> >  S = "${WORKDIR}/git"
> > 
> > @@ -41,15 +20,7 @@ do_compile() {
> > 
> >  do_install() {
> >  	install -d ${D}${base_libdir}/firmware
> > -	install -m 0644 bin/am335x-pm-firmware.bin
> > ${D}${base_libdir}/firmware/
> > -
> > -	# Install the init script to load the PM firmware at boot
> > -	install -d ${D}${sysconfdir}/init.d
> > -	install -m 0755 ${WORKDIR}/${SCRIPT}
> > ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> > +	install -m 0644 bin/am335x-pm-firmware.elf
> > +${D}${base_libdir}/firmware/
> >  }
> > 
> > -PACKAGES =+ "${PN}-initscript"
> > -
> >  FILES_${PN} += "${base_libdir}/firmware"
> > -
> > -FILES_${PN}-initscript = "${sysconfdir}/*"
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

