Return-Path: <ceh@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86AEFE01530
	for <meta-ti@yoctoproject.org>; Tue, 25 Jun 2013 03:59:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5PAxWYp015732;
	Tue, 25 Jun 2013 05:59:32 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5PAxWSL021518;
	Tue, 25 Jun 2013 05:59:32 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 25 Jun 2013 05:59:32 -0500
Received: from [158.218.103.10] (a0850405-off1.am.dhcp.ti.com
	[158.218.103.10])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r5PAxWnr020767;	Tue, 25 Jun 2013 05:59:32 -0500
Message-ID: <51C97814.1090000@ti.com>
Date: Tue, 25 Jun 2013 06:59:32 -0400
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <1372125179-6458-1-git-send-email-denis@denix.org>
In-Reply-To: <1372125179-6458-1-git-send-email-denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot: add support for SPL UART variant
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
X-List-Received-Date: Tue, 25 Jun 2013 10:59:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Carlos Hernandez <ceh@ti.com>

On 06/24/2013 09:52 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> This is an adaptation of a patch by Carlos Hernandez
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Carlos Hernandez <ceh@ti.com>
> ---
>   recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb |  3 ++-
>   recipes-bsp/u-boot/u-boot-ti.inc                   | 24 ++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
> index 5fbd0c9..ea72e4d 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bb
> @@ -2,7 +2,7 @@ require u-boot-ti.inc
>   
>   DESCRIPTION = "u-boot bootloader for TI devices"
>   
> -PR = "r4+gitr${SRCPV}"
> +PR = "r5+gitr${SRCPV}"
>   
>   SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
>   
> @@ -12,3 +12,4 @@ BRANCH ?= "ti-u-boot-2013.01.01"
>   SRCREV = "7552b4c906b0a50fbc5225dc43ed0192618e9d5d"
>   
>   SPL_BINARY = "MLO"
> +SPL_UART_BINARY = "u-boot-spl.bin"
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index 968f3e4..c024e96 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -15,3 +15,27 @@ PKG_${PN}-dbg = "u-boot-dbg"
>   S = "${WORKDIR}/git"
>   
>   UBOOT_SUFFIX = "img"
> +
> +# SPL (Second Program Loader) to be loaded over UART
> +SPL_UART_BINARY ?= ""
> +SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
> +SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
> +
> +do_install_append () {
> +    if [ "x${SPL_UART_BINARY}" != "x" ]
> +    then
> +        install ${S}/spl/${SPL_UART_BINARY} ${D}/boot/${SPL_UART_IMAGE}
> +        ln -sf ${SPL_UART_IMAGE} ${D}/boot/${SPL_UART_BINARY}
> +    fi
> +}
> +
> +do_deploy_append () {
> +    cd ${DEPLOYDIR}
> +    if [ "x${SPL_UART_BINARY}" != "x" ]
> +    then
> +        install ${S}/spl/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_IMAGE}
> +        rm -f ${DEPLOYDIR}/${SPL_UART_BINARY} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
> +        ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_BINARY}
> +        ln -sf ${SPL_UART_IMAGE} ${DEPLOYDIR}/${SPL_UART_SYMLINK}
> +    fi
> +}


