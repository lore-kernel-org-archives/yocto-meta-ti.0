Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD0A4E0141B
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 07:26:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62EQ3LH014081
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2013 09:26:03 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62EQ3BS004211
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2013 09:26:03 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Jul 2013 09:26:03 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r62EQ3qo004111;
	Tue, 2 Jul 2013 09:26:03 -0500
Date: Tue, 2 Jul 2013 10:26:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-ID: <20130702142602.GC4941@edge>
References: <CF956B779D819D41BBC043B7082161D543E169@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <CF956B779D819D41BBC043B7082161D543E169@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: FW: Re: [PATCH] abefw: Firmware for OMAP5 ABE
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
X-List-Received-Date: Tue, 02 Jul 2013 14:26:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 02, 2013 at 07:20:04AM -0400, Hingolikar, Mrinmayee wrote:
> 
>  On 7/1/2013 9:23 PM, Denys Dmytriyenko wrote:
> 
>  > On Mon, Jul 01, 2013 at 09:11:48PM +0530, Mrinmayee Hingolikar wrote:
> 
>  >> * The OMAP5 Audio Backend requires a 'firmware' to enable
> 
>  >>   sound. This recipe installs a prebuilt firmware. This
> 
>  >>   part is a hack, as in the current form, the firmware
> 
>  >>   cannot be cross-compiled. There is a plan to fix this
> 
>  >>   and hopefully, this recipe is short-lived. Once the code
> 
>  >>   is fixed, we should have new recipes that build the firmware
> 
>  >>   and clean up this recipe.
> 
>  >> 
> 
>  >> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> 
>  >> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> 
>  >> ---
> 
>  >>  recipes-bsp/abefw/abefw.inc       |    8 ++++++++
> 
>  >>  recipes-bsp/abefw/abefw_1.0.14.bb |   14 ++++++++++++++
> 
>  > What is the reason to have it split in 2 files - inc and bb?
> 
>  Reason to split because the there might be a version upgrade in the
> 
>  future. And also currently it just copies the prebuilt firmware,
> 
>  there should be a better recipe for this in future.

That is not a good reason for doing it now. Moreover, the goal is to not have 
more than one version of the same recipe, unless really-really needed, e.g. 
they are incompatible etc.


>  >>  2 files changed, 22 insertions(+), 0 deletions(-)
> 
>  >>  create mode 100644 recipes-bsp/abefw/abefw.inc
> 
>  >>  create mode 100644 recipes-bsp/abefw/abefw_1.0.14.bb
> 
>  >> 
> 
>  >> diff --git a/recipes-bsp/abefw/abefw.inc b/recipes-bsp/abefw/abefw.inc
> 
>  >> new file mode 100644
> 
>  >> index 0000000..4b6e9dc
> 
>  >> --- /dev/null
> 
>  >> +++ b/recipes-bsp/abefw/abefw.inc
> 
>  >> @@ -0,0 +1,8 @@
> 
>  >> +SUMMARY = "Firmware for OMAP5 ABE"
> 
>  >> +HOMEPAGE = "http://git.ti.com"
> 
>  >> +LICENSE = "MIT"
> 
>  >> +LIC_FILES_CHKSUM = "file://COPYING;md5=923db086ed9463ab3215b24d87e05ec5"
> 
>  >> +
> 
>  >> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
>  >> +
> 
>  >> +COMPATIBLE_MACHINE = "omap5-evm"
> 
>  > Is it limited to omap5-evm only? What about J6/DRA7xx (or pandaboard)?
> 
>  > Especially considering the repo is called omap4plus...
> 
>  J6 uses McASP and it does not require this firmware. Since this release
> 
>  is targetted for omap5 and J6, we limited it to omap5-evm. 

Ok, this makes sense then.


>  >> diff --git a/recipes-bsp/abefw/abefw_1.0.14.bb b/recipes-bsp/abefw/abefw_1.0.14.bb
> 
>  >> new file mode 100644
> 
>  >> index 0000000..df68080
> 
>  >> --- /dev/null
> 
>  >> +++ b/recipes-bsp/abefw/abefw_1.0.14.bb
> 
>  >> @@ -0,0 +1,14 @@
> 
>  >> +require abefw.inc
> 
>  >> +
> 
>  >> +SRC_URI = "git://git.ti.com/glsdk/abefw-omap4plus.git;protocol=git"
> 
>  >> +
> 
>  >> +S = "${WORKDIR}/git"
> 
>  >> +
> 
>  >> +SRCREV = "ceccc0332264e39bdc51e54f80ea7256a3886c58"
> 
>  >> +
> 
>  >> +do_install() {
> 
>  >> +        mkdir -p ${D}/lib/firmware
> 
>  >> +        cp ${S}/firmware/omap4_abe_new ${D}/lib/firmware/
> 
>  >> +}
> 
>  >> +
> 
>  >> +FILES_${PN} += "/lib/firmware/omap4_abe_new"
> 
>  >> --
> 
>  >> 1.7.0.4
> 
>  >> 
> 
>  >> _______________________________________________
> 
>  >> meta-ti mailing list
> 
>  >> meta-ti@yoctoproject.org
> 
>  >> https://lists.yoctoproject.org/listinfo/meta-ti
> 
>   
> 
>   
> 
>  --
> 
>  Regards,
> 
>  Mrinmayee
> 
>   
> 
>     
> 
>     

