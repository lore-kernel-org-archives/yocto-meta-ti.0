Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D2C4E00CC1; Thu, 27 Jul 2017 16:38:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C57D4E00B8E
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:38:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RNcclE012021
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 18:38:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501198718;
	bh=vkr8oEIDxNe56NRe8QpSzIQK+d9g3eU5wqtPxynws8c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AQ63gabnngPyZtvGIz2ET+VNuuqv9rZVhwlukG7J7yGbXBORSdoopV90XbO96/2+E
	s1PwKQAiPJ6ihqzBj01MTUulJ6cR1YUhsz0cRPmdKLIQaDkBoC8hcft0YiJFCdPS7i
	4/4MvxZISHGXiPv1a8azV6u2O1Z5+2fsiJuMTCRc=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RNccRr028940
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 18:38:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 18:38:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RNcbmA019430;
	Thu, 27 Jul 2017 18:38:37 -0500
Date: Thu, 27 Jul 2017 19:38:34 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20170727233834.GT18367@edge>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-2-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1500419028-3361-2-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 02/37] tcp3d-lld-rtos: Added rtos recipe for tcp3d-lld
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
X-List-Received-Date: Thu, 27 Jul 2017 23:38:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 18, 2017 at 07:03:13PM -0400, Mahesh Radhakrishnan wrote:
> Upstreaming RTOS driver for third generation Turbo Coprocessor (TCP3d)
> 
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
> 
> v2 - Adding summary
> 
>  recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
> 
> diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
> new file mode 100644
> index 0000000..f44a1d9
> --- /dev/null
> +++ b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
> @@ -0,0 +1,35 @@
> +SUMMARY = "TI third generation Trubo Coprocessor (TCP3) low level driver"

You might want to fix the typo in ^^^^ here - "Trubo"


> +
> +inherit ti-pdk
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://tcp3dver.h;beginline=1;endline=47;md5=3fe46c6320fb9ca4ac6692961402beb7"
> +
> +COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm|c665x-evm"

Agree with Jake that it's better to use SoC family names here to be less 
restrictive. For example, in your case this package won't be compatible with 
k2hk-hs-evm...


> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +TCP3D_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/tcp3d-lld.git"
> +TCP3D_LLD_GIT_PROTOCOL = "git"
> +TCP3D_LLD_GIT_BRANCH = "master"
> +TCP3D_LLD_GIT_DESTSUFFIX = "git/ti/drv/bcp"
> +
> +# Below commit ID corresponds to "DEV.TCP3D_LLD.02.01.00.05"
> +TCP3D_LLD_SRCREV = "8eb2edfc694982633e0dd01ba7b067ac9f634da9"
> +
> +BRANCH = "${TCP3D_LLD_GIT_BRANCH}"
> +SRC_URI = "${TCP3D_LLD_GIT_URI};destsuffix=${TCP3D_LLD_GIT_DESTSUFFIX};protocol=${TCP3D_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${TCP3D_LLD_SRCREV}"
> +PV = "02.01.00.05"
> +PR = "r0"
> +
> +S = "${WORKDIR}/${TCP3D_LLD_GIT_DESTSUFFIX}"
> +
> +DEPENDS_append = " edma3-lld-rtos"
> +
> +export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
> +XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "TCP3D LLD"
> +
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

