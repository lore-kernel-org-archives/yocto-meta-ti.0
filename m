Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28E13E00B6C; Thu, 27 Sep 2018 14:44:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF1B9E0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:44:24 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RLiOUx110841
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538084664;
	bh=2HWupjA7/aQ8L+nIngNP8J1pJywlro4r+Ps/bVqEPUs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wFTKLgK9qpIQqsifYChmPSB9ew9ugdjjkCZm4K/pG1xHkapi+4skyMXyccob0leIb
	lPHej/joMVE0sarNi3eZNRUl4CuNX2zAcDPW7U+2plrJNOncCx9qAzBs1r8HmKoMeR
	ctoA4rHdw+r3tyW4Igxv8PQaNkKsZGSPrl31GHhk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLiOfO000543
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:44:24 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 16:44:24 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 16:44:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLiNeh021140;
	Thu, 27 Sep 2018 16:44:23 -0500
Date: Thu, 27 Sep 2018 17:44:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20180927214423.GQ8582@beryl>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-18-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1538081009-52859-18-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH v2 17/30] pm-lld-rtos: Update to version 01.08.00.19 and k3 support
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
X-List-Received-Date: Thu, 27 Sep 2018 21:44:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2018 at 04:43:16PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> index 3e4e4f7..4dc43f6 100644
> --- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> @@ -5,30 +5,34 @@ inherit ti-pdk
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://Power.h;beginline=1;endline=31;md5=527b91fdcd26cd19ac07a754f45dedbe"
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  
>  PM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pm-lld.git"
>  PM_LLD_GIT_PROTOCOL = "git"
> -PM_LLD_GIT_BRANCH = "int_pm_am335x"
> -PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
> -PM_LLD_GIT_BRANCH_am57xx-evm = "master"
> -PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
>  
> -# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05A"
> -PM_LLD_SRCREV = "a5f12b8210ccea4b2e8848e54b4e178534771843"
> +PM_LLD_GIT_BRANCH = "master"
> +
> +PM_LLD_GIT_BRANCH_ti33x = "int_pm_am335x"
> +PM_LLD_GIT_BRANCH_ti43x = "int_pm_am335x"
> +PM_LLD_GIT_BRANCH_k2g = "int_pm_am335x"

Argh, sorry about the confusion - didn't realize am335x branch was also used 
for am437 and k2g. So, it doesn't really make it simpler.

Anyway, let's keep it this way with master as default and am335x as a special 
case...


> +PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
>  
> -# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.18"
> -PM_LLD_SRCREV_dra7xx-evm = "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
> -PM_LLD_SRCREV_am57xx-evm = "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
> +# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.19"
> +PM_LLD_SRCREV = "9095c9d1b479d6d1ad483b8b0cf4568c83e599ec"
>  
> +# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05B"
> +PM_LLD_SRCREV_ti33x = "bac16125842f08d05156dccabec74947756d831b"
> +PM_LLD_SRCREV_ti43x = "bac16125842f08d05156dccabec74947756d831b"
> +PM_LLD_SRCREV_k2g = "bac16125842f08d05156dccabec74947756d831b"
>  
>  BRANCH = "${PM_LLD_GIT_BRANCH}"
>  SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>  
>  SRCREV = "${PM_LLD_SRCREV}"
> -PV = "01.04.00.05A"
> +PV = "01.08.00.19"
>  PR = "r0"
>  
>  S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
> @@ -40,6 +44,10 @@ DEPENDS_append_ti33x = " starterware-rtos \
>  "
>  DEPENDS_append_ti43x = " starterware-rtos \
>  "
> +
> +DEPENDS_append_k3 = " sciclient-rtos \
> +"
> +
>  export PDK_PM_ROOT_PATH = "${WORKDIR}/build"
>  export DEST_ROOT="${S}"
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

