Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4707E014F2
	for <meta-ti@yoctoproject.org>; Fri, 19 Apr 2013 10:44:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3JHiQeD015858;
	Fri, 19 Apr 2013 12:44:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3JHiPZH008874;
	Fri, 19 Apr 2013 12:44:25 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 19 Apr 2013 12:44:25 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3JHiPfM027146;
	Fri, 19 Apr 2013 12:44:25 -0500
Date: Fri, 19 Apr 2013 13:44:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130419174425.GL5912@edge>
References: <20130418194532.39C0952A8F@arago-project.org>
	<8F29D6B095ED194EA1980491A5E029710C42A73A@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C42A73A@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Arago Project git <git@arago-project.org>
Subject: Re: Chase Maupin : am33x-cm3: use init script to load firmware
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
X-List-Received-Date: Fri, 19 Apr 2013 17:44:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Apr 19, 2013 at 04:15:05PM +0000, Cooper Jr., Franklin wrote:
> Is this change related to the 3.8 kernel? The patch "linux-ti-staging: make 
> cm3 firmware a run-time dependency" implies that this is indeed a 3.8 
> related change. This makes things a bit tricky since this breaks the 3.2 
> kernel.

Indeed. How long do you need to support 3.2 for after AM-SDK 5.07?

-- 
Denys

> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Arago Project git
> > Sent: Thursday, April 18, 2013 2:46 PM
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] Chase Maupin : am33x-cm3: use init script to load
> > firmware
> > 
> > Module: meta-ti
> > Branch: master
> > Commit: 14a312f1e9d724d61d163d9872d7f6542ee180b9
> > URL:    http://arago-project.org/git/meta-
> > ti.git?a=commit;h=14a312f1e9d724d61d163d9872d7f6542ee180b9
> > 
> > Author: Chase Maupin <Chase.Maupin@ti.com>
> > Date:   Thu Apr 18 13:10:00 2013 -0500
> > 
> > am33x-cm3: use init script to load firmware
> > 
> > * The PM firmware is now loaded using an init script so make
> >   the init script installation part of the firmware package.
> > * Fix up the SRC_URI to the proper format.
> > 
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > ---
> > 
> >  recipes-bsp/ti/am33x-cm3/init-am33x-cm3 |    6 ++++++
> >  recipes-bsp/ti/am33x-cm3_git.bb         |   17 +++++++++++++++--
> >  2 files changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/recipes-bsp/ti/am33x-cm3/init-am33x-cm3 b/recipes-
> > bsp/ti/am33x-cm3/init-am33x-cm3
> > new file mode 100644
> > index 0000000..56c17b3
> > --- /dev/null
> > +++ b/recipes-bsp/ti/am33x-cm3/init-am33x-cm3
> > @@ -0,0 +1,6 @@
> > +#!/bin/sh
> > +
> > +# Load the PM CM3 firmware
> > +echo 1 >
> > +/sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> > firmware.bin/loa
> > +ding cat /lib/firmware/am335x-pm-firmware.bin >
> > +/sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> > firmware.bin/dat
> > +a echo 0 >
> > +/sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-
> > firmware.bin/loa
> > +ding
> > diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-
> > cm3_git.bb index 247ba4d..169789e 100644
> > --- a/recipes-bsp/ti/am33x-cm3_git.bb
> > +++ b/recipes-bsp/ti/am33x-cm3_git.bb
> > @@ -4,9 +4,18 @@ LICENSE = "TI-BSD"
> >  LIC_FILES_CHKSUM =
> > "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
> > 
> >  PV = "04.06.00.07"
> > +PR = "r1"
> >  SRCREV = "cf07b841d6e8c5e026eecb259d143f3dff412c8e"
> > +BRANCH ?= "master"
> > 
> > -SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git"
> > +INITSCRIPT_NAME = "am335x-pm-firmware-load"
> > +INITSCRIPT_PARAMS = "defaults 96"
> > +
> > +inherit update-rc.d
> > +
> > +SRC_URI = "git://arago-project.org/git/projects/am33x-
> > cm3.git;protocol=git;branch=${BRANCH} \
> > +           file://init-am33x-cm3 \
> > +          "
> > 
> >  S = "${WORKDIR}/git"
> > 
> > @@ -17,7 +26,11 @@ do_compile() {
> >  do_install() {
> >  	install -d ${D}${base_libdir}/firmware
> >  	install -m 0644 bin/am335x-pm-firmware.bin
> > ${D}${base_libdir}/firmware/
> > +
> > +	# Install the init script to load the PM firmware at boot
> > +	install -d ${D}${sysconfdir}/init.d
> > +	install -m 0755 ${WORKDIR}/init-am33x-cm3
> > +${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
> >  }
> > 
> > -FILES_${PN} = "${base_libdir}/firmware"
> > +FILES_${PN} += "${base_libdir}/firmware"
> > 
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

