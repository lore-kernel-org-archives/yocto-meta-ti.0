Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7CA6E00406
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 08:49:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7LFnt6d006936
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 10:49:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7LFnt6O004781
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 10:49:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 21 Aug 2013 10:49:54 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7LFns4M004696;
	Wed, 21 Aug 2013 10:49:55 -0500
Date: Wed, 21 Aug 2013 11:49:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130821154954.GE24491@edge>
References: <1372849303-21311-1-git-send-email-mrinmayee@ti.com>
	<CF956B779D819D41BBC043B7082161D5444C34@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101596D51CE@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596D51CE@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCHv2] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Wed, 21 Aug 2013 15:49:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 21, 2013 at 03:31:42PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
> >Sent: Wednesday, August 21, 2013 6:48 AM
> >To: Hingolikar, Mrinmayee; meta-ti@yoctoproject.org
> >Subject: Re: [meta-ti] [PATCHv2] abefw: Firmware for OMAP5 ABE
> >
> >Ping for comments!
> 
> For some reason I don't see this in my e-mails for the original post.  Sorry 
> for the delay.

You are correct - there were no v2 submissions to the list on July 3rd. We 
only reviewed the original patch before.


> >> -----Original Message-----
> >> From: Hingolikar, Mrinmayee
> >> Sent: Wednesday, July 03, 2013 4:32 PM
> >> To: meta-ti@yoctoproject.org
> >> Cc: Hingolikar, Mrinmayee; Heroor, Siddharth
> >> Subject: [PATCHv2] abefw: Firmware for OMAP5 ABE
> >>
> >> * The OMAP5 Audio Backend requires a 'firmware' to enable
> >>   sound. This recipe installs a prebuilt firmware. This
> >>   part is a hack, as in the current form, the firmware
> >>   cannot be cross-compiled. There is a plan to fix this
> >>   and hopefully, this recipe is short-lived. Once the code
> >>   is fixed, we should have new recipes that build the firmware
> >>   and clean up this recipe.
> >>
> >> v2:
> >> * Merged contents from abefw.inc and removed abefw.inc based
> >>   on review.
> >>
> >> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> >> ---
> >>  recipes-bsp/abefw/abefw_1.0.14.bb |   20 ++++++++++++++++++++
> >>  1 files changed, 20 insertions(+), 0 deletions(-)  create mode
> >100644
> >> recipes-bsp/abefw/abefw_1.0.14.bb
> >>
> >> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-
> >> bsp/abefw/abefw_1.0.14.bb
> >> new file mode 100644
> >> index 0000000..8db71e4
> >> --- /dev/null
> >> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
> >> @@ -0,0 +1,20 @@
> >> +SUMMARY = "Firmware for OMAP5 ABE"
> >> +HOMEPAGE = "http://git.ti.com"
> >> +LICENSE = "BSD/GPLv2"
> 
> This seems wrong.  I thought the convention is "BSD | GPLv2" for either 
> license or "BSD & GPLv2" if mixed license.
> 
> If it is mixed then you probably need 2 entries in LIC_FILES_CHKSUM, one for 
> each license.
> 
> Also, does the GPLv2 use the "or later" clause such that it should be GPLv2+ 
> ?

This was already mentioned in one of the other patches.


> >> +LIC_FILES_CHKSUM =
> >> "file://COPYING;md5=923db086ed9463ab3215b24d87e05ec5"
> >> +
> >> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> +COMPATIBLE_MACHINE = "omap5-evm"
> >> +
> >> +SRC_URI = "git://git.ti.com/glsdk/abefw-
> >omap4plus.git;protocol=git"

The git repo itself says omap4plus - why is it limited to OMAP5 only? Can it 
be enabled for OMAP4/Pandaboard too?


> Not strictly required but PR = r0 here would help remind you to bump the PR 
> in the future.
> 
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +SRCREV = "ceccc0332264e39bdc51e54f80ea7256a3886c58"
> >> +
> >> +do_install() {
> >> +        mkdir -p ${D}/lib/firmware
> >> +        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/ }
> >> +
> >> +FILES_${PN} += "/lib/firmware/omap4_abe_new"
> 
> I'm sure this has been discussed before, but do you see any confusion about 
> this being omap5-evm only and yet the FW is omap4_abe_new?
> 
> >> --
> >> 1.7.0.4
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

