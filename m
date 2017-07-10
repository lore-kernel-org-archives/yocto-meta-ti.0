Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDBCCE00C35; Mon, 10 Jul 2017 12:29:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84B21E00B8B
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 12:29:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6AJTAGd027385
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 14:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499714950;
	bh=H0y1eMsIAddKmcTz0I7Q16CNwDzkQ3sxZfrTm4G7EsM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=K+ru8DYzln9SvFCT/w5g6jjghQXfZOJjujxXdknxk/7TCF9ZaIkWyD1EQNgek7YNq
	oLrdrF6FYI8TUNkMo5TbHvTpBq/3oZKwb4uAqR6sZwztF+NgcqvxVB68M4oaIkFahJ
	Tj0H6MPSo6ypq32gqEiHYl9i9r4lbUANDeOfjT1Y=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6AJT9JG010050
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 14:29:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Jul 2017 14:29:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6AJT9TD014821;
	Mon, 10 Jul 2017 14:29:09 -0500
Date: Mon, 10 Jul 2017 15:29:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Pang, Ivan" <i-pang@ti.com>
Message-ID: <20170710192906.GE14665@edge>
References: <1499359152-35413-1-git-send-email-m-radhakrishnan2@ti.com>
	<C45960711C772449A33A51ED1374F08A406267AF@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <C45960711C772449A33A51ED1374F08A406267AF@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] board-rtos: Added board-rtos recipe
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
X-List-Received-Date: Mon, 10 Jul 2017 19:29:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 06, 2017 at 06:02:34PM +0000, Pang, Ivan wrote:
> Are all the DEPENDS needed already upstreamed or in patches preceding this?

The only proper way to ensure the correct order of patches, when they depend 
on each other, is to submit them in numbered sequence as part of a patchset, 
not as individual patches!


> There's probably no other recipe using board.inc, so you can combine this into a single recipe too.
> 
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Thursday, July 06, 2017 11:39 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] board-rtos: Added board-rtos recipe
> 
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/board-rtos/board-rtos_git.bb | 58 ++++++++++++++++++++++++++++++++
>  recipes-bsp/board-rtos/board.inc         | 19 +++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bb
>  create mode 100644 recipes-bsp/board-rtos/board.inc
> 
> diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
> new file mode 100644
> index 0000000..b4b8b0b
> --- /dev/null
> +++ b/recipes-bsp/board-rtos/board-rtos_git.bb
> @@ -0,0 +1,58 @@
> +inherit ti-pdk
> +require board.inc
> +
> +PR = "${INC_PR}.0"
> +
> +DEPENDS_append = " i2c-lld-rtos \
> +                   spi-lld-rtos \
> +                   uart-lld-rtos \
> +"
> +
> +DEPENDS_append_omap-a15 = " osal-rtos \
> +                            ti-ndk \
> +"
> +
> +DEPENDS_append_am57xx-evm = " gpio-lld-rtos \
> +                              icss-emac-lld-rtos \
> +                              mmcsd-lld-rtos \
> +                              pruss-lld-rtos \
> +                              pm-lld-rtos \ "
> +
> +DEPENDS_append_ti33x = " gpio-lld-rtos \
> +                         gpmc-lld-rtos \
> +                         icss-emac-lld-rtos \
> +                         mmcsd-lld-rtos \
> +                         osal-rtos \
> +                         pruss-lld-rtos \
> +                         starterware-rtos \
> +                         ti-ndk \
> +"
> +
> +DEPENDS_append_ti43x = " gpio-lld-rtos \
> +                         gpmc-lld-rtos \
> +                         icss-emac-lld-rtos \
> +                         mmcsd-lld-rtos \
> +                         osal-rtos \
> +                         pruss-lld-rtos \
> +                         starterware-rtos \
> +                         ti-ndk \
> +"
> +
> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE = "0"
> +
> +LIMBOARDS_ti33x = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
> +LIMBOARDS_ti43x = "evmAM437x idkAM437x skAM437x"
> +LIMBOARDS_am57xx-evm = "evmAM571x evmAM572x idkAM571x idkAM572x"
> +LIMBOARDS_dra7xx-evm = "evmDRA72x evmDRA75x evmDRA78x"
> +LIMBOARDS_omapl137-evm = "evmOMAPL137"
> +LIMBOARDS_omapl138-lcdk = "lcdkOMAPL138"
> +LIMBOARDS_k2hk-evm = "evmK2H evmK2K"
> +LIMBOARDS_k2e-evm = "evmK2E"
> +LIMBOARDS_k2l-evm = "evmK2L"
> +LIMBOARDS_k2g = "evmK2G iceK2G"
> +export PDK_BOARD_ROOT_PATH ="${WORKDIR}/build"
> +export DEST_ROOT="${S}"
> +XDCPATH_append = ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
> diff --git a/recipes-bsp/board-rtos/board.inc b/recipes-bsp/board-rtos/board.inc
> new file mode 100644
> index 0000000..6d6655e
> --- /dev/null
> +++ b/recipes-bsp/board-rtos/board.inc
> @@ -0,0 +1,19 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=0e3182ba6a963da159c37eafa9752ade"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +BOARD_GIT_URI = "git://git.ti.com/keystone-rtos/board.git"
> +BOARD_GIT_PROTOCOL = "git"
> +BOARD_GIT_BRANCH = "master"
> +
> +# Below commit ID corresponds to "DEV.BOARD.01.00.07.00"
> +BOARD_SRCREV = "7d6a76ee65d75714740d468a48ca7e3668e66a94"
> +
> +BRANCH ="${BOARD_GIT_BRANCH}"
> +SRC_URI = "${BOARD_GIT_URI};protocol=${BOARD_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${BOARD_SRCREV}"
> +PV = "01.00.07.00"
> +INC_PR = "r0"
> --
> 1.9.1
> 
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

