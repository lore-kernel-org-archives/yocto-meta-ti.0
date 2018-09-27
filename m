Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 636BCE00754; Thu, 27 Sep 2018 09:32:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25437E00519
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 09:32:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RGWD4K014774
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 11:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538065933;
	bh=Hh5XO6ndNtSD2J2qozQMkz7OlUxaciKcG+R30M956As=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=th64zsuugcxJGDQrpSSwuoAUb1nTqbr3L+kjuhL1CJJbD6NztTeieT4MQaID2VV60
	SO7C+lGheuApvNo6RYqmQW5kPs/rGX+SKswMGiLrIG2lgQ8nrNX72Bv20ae7NHMacv
	5sCKA8d7NICoNRD0c0Sar+d15/6Ju3Sn9Q1uAdJs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RGWD1t008249
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 11:32:13 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 11:32:13 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 11:32:13 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RGWCmd024402;
	Thu, 27 Sep 2018 11:32:13 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538061764-54977-18-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <11be0964-c9ac-9a41-87a0-0e0d074058d2@ti.com>
Date: Thu, 27 Sep 2018 12:32:12 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538061764-54977-18-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [rocko/master][PATCH 17/30] pm-lld-rtos: Update to version 01.04.00.05B and k3 support
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
X-List-Received-Date: Thu, 27 Sep 2018 16:32:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/27/2018 11:22 AM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> index 3e4e4f7..af3622b 100644
> --- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> @@ -5,7 +5,7 @@ inherit ti-pdk
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://Power.h;beginline=1;endline=31;md5=527b91fdcd26cd19ac07a754f45dedbe"
>   
> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
>   
> @@ -14,21 +14,23 @@ PM_LLD_GIT_PROTOCOL = "git"
>   PM_LLD_GIT_BRANCH = "int_pm_am335x"
>   PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
>   PM_LLD_GIT_BRANCH_am57xx-evm = "master"
> +PM_LLD_GIT_BRANCH_am65xx-evm = "master"

Please extend this to k3 as was done with the PM_LLD_SRCREV below.

>   PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
>   
> -# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05A"
> -PM_LLD_SRCREV = "a5f12b8210ccea4b2e8848e54b4e178534771843"
> +# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05B"
> +PM_LLD_SRCREV = "bac16125842f08d05156dccabec74947756d831b"
>   
> -# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.18"
> -PM_LLD_SRCREV_dra7xx-evm = "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
> -PM_LLD_SRCREV_am57xx-evm = "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
> +# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.19"
> +PM_LLD_SRCREV_dra7xx-evm = "9095c9d1b479d6d1ad483b8b0cf4568c83e599ec"
> +PM_LLD_SRCREV_am57xx-evm = "9095c9d1b479d6d1ad483b8b0cf4568c83e599ec"
> +PM_LLD_SRCREV_k3 = "9095c9d1b479d6d1ad483b8b0cf4568c83e599ec"
>   
>   
>   BRANCH = "${PM_LLD_GIT_BRANCH}"
>   SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>   
>   SRCREV = "${PM_LLD_SRCREV}"
> -PV = "01.04.00.05A"
> +PV = "01.04.00.05B"
>   PR = "r0"
>   
>   S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
> @@ -40,6 +42,10 @@ DEPENDS_append_ti33x = " starterware-rtos \
>   "
>   DEPENDS_append_ti43x = " starterware-rtos \
>   "
> +
> +DEPENDS_append_k3 = " sciclient-rtos \
> +"
> +
>   export PDK_PM_ROOT_PATH = "${WORKDIR}/build"
>   export DEST_ROOT="${S}"
>   


