Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5086DE00510; Fri, 24 Feb 2017 10:42:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E302E00405
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 10:42:38 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1OIgRFV029367
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 12:42:27 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1OIgMqt009647
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2017 12:42:22 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 12:42:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1OIgMwN028250;
	Fri, 24 Feb 2017 12:42:22 -0600
Date: Fri, 24 Feb 2017 13:42:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170224184221.GR26872@edge>
References: <1487472416-94956-1-git-send-email-denys@ti.com>
	<58AC9B39.9090606@ti.com> <20170223205007.GK26872@edge>
	<58AF4BE8.5080905@ti.com>
MIME-Version: 1.0
In-Reply-To: <58AF4BE8.5080905@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot-ti.inc: k2e-hs-evm doesn't provide the same binaries as other KS2 devices
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
X-List-Received-Date: Fri, 24 Feb 2017 18:42:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 23, 2017 at 02:54:00PM -0600, Dan Murphy wrote:
> Denys
> 
> 
> On 02/23/2017 02:50 PM, Denys Dmytriyenko wrote:
> > On Tue, Feb 21, 2017 at 01:55:37PM -0600, Dan Murphy wrote:
> >> Denys
> >>
> >> On 02/18/2017 08:46 PM, Denys Dmytriyenko wrote:
> >>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>> ---
> >>>  recipes-bsp/u-boot/u-boot-ti.inc | 35 ++++++++++++++++++++++-------------
> >>>  1 file changed, 22 insertions(+), 13 deletions(-)
> >>>
> >>> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> >>> index 0c0b6e8..57f7fe6 100644
> >>> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> >>> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> >>> @@ -49,7 +49,6 @@ SPL_BINARY_omapl138 = ""
> >>>  
> >>>  # SPL (Second Program Loader) to be loaded over UART
> >>>  SPL_UART_BINARY = "u-boot-spl.bin"
> >>> -SPL_UART_BINARY_k2e-hs-evm = ""
> >>>  SPL_UART_BINARY_keystone = ""
> >>>  
> >>>  SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
> >>> @@ -60,8 +59,10 @@ UBOOT_SUFFIX_keystone = "bin"
> >>>  
> >>>  # SPI NOR Flash binaries
> >>>  UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
> >>> +UBOOT_SPI_SPL_BINARY_k2e-hs-evm = ""
> >>>  UBOOT_SPI_BINARY = "u-boot.img"
> >>>  UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
> >>> +UBOOT_SPI_GPH_BINARY_k2e-hs-evm = ""
> >>>  
> >>>  # SPI NOR Flash deployed images
> >>>  UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
> >>> @@ -126,29 +127,37 @@ do_deploy_append () {
> >>>  }
> >>>  
> >>>  do_install_append_keystone () {
> >>> -	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
> >>> -	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
> >>> +	if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then
> >> This won't work.  You are checking for the SPI SPL binary in the build directory then
> >> try to install the binary from the spl directory.
> > Not checking for the file at all here. The check is only to see if it's 
> > enabled, not whether it exists.
> >
> 
> OK right I misread that. but again if the SPI_SPL binary is defined then we attempt to
> install from a directory we don't know exists or not.
> 
> Maybe an AND case here to check the directory and whether the file is defined.

I completely understand where you are coming from with this suggestion - it 
would definitely reduce the number of failures if/when u-boot decides to 
change what artifacts and where it deploys.

On the other hand, here in u-boot-ti.inc I'm extending the standard 
OpenEmbedded code from u-boot.inc for additional TI artifacts and following 
the same coding standard. In many cases it is required for pre-defined 
artifacts to exist and fail if they don't, instead of ignoring it and 
continuing.

-- 
Denys


> >> Also why don't we use the -d and -f directory and file tests?  They are shell compliant
> >>
> >> I used
> >> "if [ -d ${B}/spl ]; then
> >>     if [ -f ${B}/spl/${UBOOT_SPI_SPL_BINARY} ]; then"
> >>
> >> Then we can just define all the uboot images and then if they are there copy otherwise
> >> log a message and move on.
> > Again, it's a different logic here. Originally, the idea was if an image is 
> > defined here, it must exist, not the other way around.
> >
> >
> >>> +		install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
> >>> +		ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
> >>> +	fi
> >>>  
> >>>  	install ${B}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
> >>>  	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
> >>>  
> >>> -	install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
> >>> -	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
> >>> +	if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
> >>> +		install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
> >>> +		ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
> >>> +	fi
> >>>  }
> >>>  
> >>>  do_deploy_append_keystone () {
> >>> -	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
> >>> -	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
> >>> -	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
> >>> -	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
> >>> +	if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then
> >> Same as above
> >>
> >>> +		install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
> >>> +		rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
> >>> +		ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
> >>> +		ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
> >>> +	fi
> >>>  
> >>>  	install ${B}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}
> >> Can we add the existence check here as well?
> >>
> >>>  	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
> >>>  	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
> >>>  	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
> >>>  
> >>> -	install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
> >>> -	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
> >>> -	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
> >>> -	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
> >>> +	if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
> >>> +		install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
> >>> +		rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
> >>> +		ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
> >>> +		ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
> >>> +	fi
> >>>  }
> >>
> >> -- 
> >> ------------------
> >> Dan Murphy
> >>
> 
> 
> -- 
> ------------------
> Dan Murphy
> 

