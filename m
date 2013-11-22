Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9022E006AD
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 20:26:17 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MWN00ARMDNT0R90@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 21 Nov 2013 22:26:17 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7FE402003E; Thu,
	21 Nov 2013 23:26:16 -0500 (EST)
Date: Thu, 21 Nov 2013 23:26:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-id: <20131122042615.GD32354@denix.org>
References: <20131024054708.GA8184@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E90691E@DLEE08.ent.ti.com>
MIME-version: 1.0
In-reply-to: <B0581B5571079145BA1CD78C126DBDE72E90691E@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCHv4] libgles: Added prebuilt userspace libraries for graphics acceleration
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
X-List-Received-Date: Fri, 22 Nov 2013 04:26:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Well, had to make those changes myself:

* compatible machine set to omap-a15 SOC
* moved LIC_FILES_CHKSUM to right place
* disabled stripping binaries
* suppressed QA warning about redundant RPATH

-- 
Denys


On Thu, Oct 24, 2013 at 12:10:30PM +0000, Dmytriyenko, Denys wrote:
> 1. Patch changes usually should not go into the main description - separate them with --- sign.
> 2. Do you need COMPATIBLE_MACHINE here for cortex-a15?
> 
> 
> Denys
> 
> 
> -----Original Message-----
> From: Hingolikar, Mrinmayee [mrinmayee@ti.com]
> Received: Thursday, 24 Oct 2013, 6:47
> To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
> Subject: [meta-ti] [PATCHv4] libgles: Added prebuilt userspace libraries for graphics acceleration
> 
> These libraries are not distributable in source and hence
>  are available only as binary. They implement OpenGLES 1.x and
>  OpenGLES 2.x accelerated using SGX 544-MP2 found in OMAP5
>  class of devices.
> 
> v2:
> 
> Addressed Chases's comments:
>  * Updated the PR
>  * Added shasum for the tarball
>  * Removed redundant FILES section
> 
> v3:
>  * Replaced shasum by sha256sum
> 
> v4:
>  * Corrected license information to "TSPA"
> 
> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> ---
>  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> 
> diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> new file mode 100644
> index 0000000..5e21bd5
> --- /dev/null
> +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Userspace libraries for sgx"
> +HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
> +LICENSE = "TSPA"
> +
> +SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz;protocol=http"
> +
> +LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=d280df8e94bb2e7b9251c8526078eeb8"
> +
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "3cfb875de031098a4c1eeeaf4e442367"
> +SRC_URI[sha256sum] = "20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c762fbc72f22489a"
> +
> +S = "${WORKDIR}/${PN}-${PV}"
> +
> +do_install () {
> +    oe_runmake install DESTDIR=${D}
> +}
> +
> +FILES_${PN} += "${libdir}/gbm/"
> --
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


