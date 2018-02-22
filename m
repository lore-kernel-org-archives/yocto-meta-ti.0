Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BE8AE00E47; Wed, 21 Feb 2018 17:43:02 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECF64E00B1A
	for <meta-ti@yoctoproject.org>; Wed, 21 Feb 2018 17:43:00 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1M1gx7q023653;
	Wed, 21 Feb 2018 19:42:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519263779;
	bh=q5EOF018ItUvaAH5mnpLWA1prciJ3jJqRHtrbhLm1Ek=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NB4Bx7YS+Y4BA1RGz/bVN3y3A8q4YQ/Caiac1Qk2hrKLe/0IIIM2IQrhxP7IAgZgN
	2nlEUlatzlJ2VpP8mG9DXQhi+nXsGkWQlct6ziwO8OiHamKzkSpdm+0Bj6/WDh0gdp
	EZoNm1J4GagWIm+hC+wt24QrMWW/bzRbmaVqkY0A=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1M1gxtf032522;
	Wed, 21 Feb 2018 19:42:59 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Feb 2018 19:42:59 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Feb 2018 19:42:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1M1gxVj019719;
	Wed, 21 Feb 2018 19:42:59 -0600
Date: Wed, 21 Feb 2018 20:42:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20180222014258.GQ12117@edge>
References: <20180221215305.19734-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180221215305.19734-1-JPEWhacker@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/rocko/master][PATCH] ti-pdk: Allow Doxygen generation to be optional
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
X-List-Received-Date: Thu, 22 Feb 2018 01:43:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, looks good to me.

Jake, can you please check this for your RTOS/PDK builds. Thanks.

-- 
Denys


On Wed, Feb 21, 2018 at 03:53:05PM -0600, Joshua Watt wrote:
> Users can choose to completely disable doxygen generation in pdk recipes
> by setting TI_PDK_DOXYGEN_SUPPORT = "0" in local.conf
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  classes/ti-pdk.bbclass                             |  7 +++
>  ...mk-Allow-doxygen-support-to-be-overridden.patch | 50 ++++++++++++++++++++++
>  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   |  5 ++-
>  3 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch
> 
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index ab730a90..540a665c 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -59,17 +59,24 @@ TI_PDK_LIMIT_SOCS ?= ""
>  TI_PDK_LIMIT_BOARDS ?= ""
>  TI_PDK_MAKE_TARGET ?= "release"
>  TI_PDK_EXTRA_MAKE ?= ""
> +TI_PDK_DOXYGEN_SUPPORT ?= "1"
>  
>  TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
>  
>  PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
>  PARALLEL_MAKE = ""
>  
> +def get_doxygen_support(d):
> +    if d.getVar('TI_PDK_DOXYGEN_SUPPORT', True) == '1':
> +        return ''
> +    return 'DOXYGEN_SUPPORT=no'
> +
>  EXTRA_OEMAKE = " \
>      LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" \
>      LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" \
>      LIMIT_CORES="${TI_PDK_LIMIT_CORES}" \
>      ${TI_PDK_EXTRA_MAKE} \
> +    ${@get_doxygen_support(d)} \
>  "
>  
>  do_configure() {
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch
> new file mode 100644
> index 00000000..2a10d37e
> --- /dev/null
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos/0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch
> @@ -0,0 +1,50 @@
> +From e5dfce58161aaee80ca45c3e992a059efac459d7 Mon Sep 17 00:00:00 2001
> +From: Joshua Watt <JPEWhacker@gmail.com>
> +Date: Wed, 21 Feb 2018 13:38:35 -0600
> +Subject: [PATCH] comp_mk: Allow doxygen support to be overridden
> +
> +Support for Doxygen can be globally disabled by setting the
> +DOXYGEN_SUPPORT environment variable to "no"
> +
> +Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> +---
> + comp_top.mk | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/comp_top.mk b/comp_top.mk
> +index 28700ba..e331132 100644
> +--- a/comp_top.mk
> ++++ b/comp_top.mk
> +@@ -114,6 +114,11 @@ comp_FIRM_LIST_CLEAN = $(addsuffix _clean, $($(COMP)_FIRM_LIST))
> + comp_PKG_LIST_ALL_CLEAN = $(addsuffix _clean, $(comp_PKG_LIST_ALL))
> + comp_PKG_LIST_PACKAGE = $(addsuffix _package, $(comp_PKG_LIST_ALL))
> + 
> ++# If the component enables doxygen, this will evaluate to "yesyes" and doxygen
> ++# will be built. If this value is overridden by the user to any other value, or
> ++# $(COMP)_DOXYGEN_SUPPORT is not "yes", doxygen is not built.
> ++DOXYGEN_SUPPORT ?= yes$($(COMP)_DOXYGEN_SUPPORT)
> ++
> + .PHONY : apps appcores app_clean clean_appcores \
> +          lib libcores lib_allendians lib_clean clean_libcores clean_lib_allendians  \
> +          all comp_libs comp_libs_clean examples examples_clean clean package $(comp_PKG_LIST_ALL) \
> +@@ -230,7 +235,7 @@ xdc_meta_clean:
> + 	$(XDC) clean XDCBUILDCFG=config_mk.bld
> + 
> + doxygen:
> +-ifeq ($($(COMP)_DOXYGEN_SUPPORT),yes)
> ++ifeq ($(DOXYGEN_SUPPORT),yesyes)
> + 	$(ECHO) Creating Doxygen API guide ...
> + 	@doxygen docs/Doxyfile
> + else
> +@@ -238,7 +243,7 @@ else
> + endif
> + 
> + clean_doxygen:
> +-ifeq ($($(COMP)_DOXYGEN_SUPPORT),yes)
> ++ifeq ($(DOXYGEN_SUPPORT),yesyes)
> + 	$(ECHO) cleaned Doxygen API guide ...
> + 	$(RM) -rf docs/doxygen
> + else
> +-- 
> +2.14.3
> +
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> index 0999b5c5..fbb82ace 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -15,7 +15,10 @@ PDK_BUILD_GIT_BRANCH = "master"
>  PDK_BUILD_SRCREV = "cbac264f08aa9cdc2cd533d1433ef57b922cccb5"
>  
>  BRANCH = "${PDK_BUILD_GIT_BRANCH}"
> -SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
> +SRC_URI = "\
> +    ${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH} \
> +    file://0001-comp_mk-Allow-doxygen-support-to-be-overridden.patch \
> +    "
>  
>  SRCREV = "${PDK_BUILD_SRCREV}"
>  
> -- 
> 2.14.3
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

