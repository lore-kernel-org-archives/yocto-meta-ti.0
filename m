Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5E0DE008D0; Tue, 21 Feb 2017 11:57:14 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,UPPERCASE_50_75
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C8B7E00524
	for <meta-ti@yoctoproject.org>; Tue, 21 Feb 2017 11:57:10 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1LJvAWh008176
	for <meta-ti@yoctoproject.org>; Tue, 21 Feb 2017 13:57:10 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1LJvAhS014267
	for <meta-ti@yoctoproject.org>; Tue, 21 Feb 2017 13:57:10 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Feb 2017 13:57:09 -0600
Received: from [172.22.146.117] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1LJtveQ029281;
	Tue, 21 Feb 2017 13:56:18 -0600
Message-ID: <58AC9B39.9090606@ti.com>
Date: Tue, 21 Feb 2017 13:55:37 -0600
From: Dan Murphy <dmurphy@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
References: <1487472416-94956-1-git-send-email-denys@ti.com>
In-Reply-To: <1487472416-94956-1-git-send-email-denys@ti.com>
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
X-List-Received-Date: Tue, 21 Feb 2017 19:57:14 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Denys

On 02/18/2017 08:46 PM, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti.inc | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index 0c0b6e8..57f7fe6 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -49,7 +49,6 @@ SPL_BINARY_omapl138 = ""
>  
>  # SPL (Second Program Loader) to be loaded over UART
>  SPL_UART_BINARY = "u-boot-spl.bin"
> -SPL_UART_BINARY_k2e-hs-evm = ""
>  SPL_UART_BINARY_keystone = ""
>  
>  SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
> @@ -60,8 +59,10 @@ UBOOT_SUFFIX_keystone = "bin"
>  
>  # SPI NOR Flash binaries
>  UBOOT_SPI_SPL_BINARY = "u-boot-spl.bin"
> +UBOOT_SPI_SPL_BINARY_k2e-hs-evm = ""
>  UBOOT_SPI_BINARY = "u-boot.img"
>  UBOOT_SPI_GPH_BINARY = "u-boot-spi.gph"
> +UBOOT_SPI_GPH_BINARY_k2e-hs-evm = ""
>  
>  # SPI NOR Flash deployed images
>  UBOOT_SPI_SPL_IMAGE = "u-boot-spl-${MACHINE}-${PV}-${PR}.bin"
> @@ -126,29 +127,37 @@ do_deploy_append () {
>  }
>  
>  do_install_append_keystone () {
> -	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
> -	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
> +	if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then

This won't work.  You are checking for the SPI SPL binary in the build directory then
try to install the binary from the spl directory.

Also why don't we use the -d and -f directory and file tests?  They are shell compliant

I used
"if [ -d ${B}/spl ]; then
    if [ -f ${B}/spl/${UBOOT_SPI_SPL_BINARY} ]; then"

Then we can just define all the uboot images and then if they are there copy otherwise
log a message and move on.

> +		install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${D}/boot/${UBOOT_SPI_SPL_IMAGE}
> +		ln -sf ${UBOOT_SPI_SPL_IMAGE} ${D}/boot/${UBOOT_SPI_SPL_BINARY}
> +	fi
>  
>  	install ${B}/${UBOOT_SPI_BINARY} ${D}/boot/${UBOOT_SPI_IMAGE}
>  	ln -sf ${UBOOT_SPI_IMAGE} ${D}/boot/${UBOOT_SPI_BINARY}
>  
> -	install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
> -	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
> +	if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
> +		install ${B}/${UBOOT_SPI_GPH_BINARY} ${D}/boot/${UBOOT_SPI_GPH_IMAGE}
> +		ln -sf ${UBOOT_SPI_GPH_IMAGE} ${D}/boot/${UBOOT_SPI_GPH_BINARY}
> +	fi
>  }
>  
>  do_deploy_append_keystone () {
> -	install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
> -	rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
> -	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
> -	ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
> +	if [ "x${UBOOT_SPI_SPL_BINARY}" != "x" ]; then

Same as above

> +		install ${B}/spl/${UBOOT_SPI_SPL_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_SPL_IMAGE}
> +		rm -f ${UBOOT_SPI_SPL_BINARY} ${UBOOT_SPI_SPL_SYMLINK}
> +		ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_SYMLINK}
> +		ln -sf ${UBOOT_SPI_SPL_IMAGE} ${UBOOT_SPI_SPL_BINARY}
> +	fi
>  
>  	install ${B}/${UBOOT_SPI_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_IMAGE}

Can we add the existence check here as well?

>  	rm -f ${UBOOT_SPI_BINARY} ${UBOOT_SPI_SYMLINK}
>  	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_SYMLINK}
>  	ln -sf ${UBOOT_SPI_IMAGE} ${UBOOT_SPI_BINARY}
>  
> -	install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
> -	rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
> -	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
> -	ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
> +	if [ "x${UBOOT_SPI_GPH_BINARY}" != "x" ]; then
> +		install ${B}/${UBOOT_SPI_GPH_BINARY} ${DEPLOYDIR}/${UBOOT_SPI_GPH_IMAGE}
> +		rm -f ${UBOOT_SPI_GPH_BINARY} ${UBOOT_SPI_GPH_SYMLINK}
> +		ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_SYMLINK}
> +		ln -sf ${UBOOT_SPI_GPH_IMAGE} ${UBOOT_SPI_GPH_BINARY}
> +	fi
>  }


-- 
------------------
Dan Murphy


