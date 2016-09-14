Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB515E009DF; Wed, 14 Sep 2016 05:12:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96877E009CD
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 05:12:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8ECCWOn032577
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 07:12:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8ECCUEj006455
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 07:12:31 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 07:12:30 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8ECCUBL010932;
	Wed, 14 Sep 2016 07:12:30 -0500
To: Justin Sobota <jsobota@ti.com>, <meta-ti@yoctoproject.org>
References: <1473816561-27507-1-git-send-email-jsobota@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <119ccc5d-a18c-46c4-a447-e5598fccd62a@ti.com>
Date: Wed, 14 Sep 2016 08:12:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1473816561-27507-1-git-send-email-jsobota@ti.com>
Subject: Re: [master/krogoth][PATCH 1/6] common-csl-ip: Bump version
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
X-List-Received-Date: Wed, 14 Sep 2016 12:12:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I also get a build error with this:


| makefile:42: 
.../arago-tmp-external-linaro-toolchain/sysroots/k2hk-evm/usr/share/ti/ti-pdk-tree/packages/ti/build/comp_top.mk: 
No such file or directory
| make: *** No rule to make target 
'.../arago-tmp-external-linaro-toolchain/sysroots/k2hk-evm/usr/share/ti/ti-pdk-tree/packages/ti/build/comp_top.mk'. 
Stop.


- Jake

On 9/13/2016 9:29 PM, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>   recipes-bsp/common-csl-ip/common-csl-ip.inc |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> index 77dfd1b..a6c3887 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
>   
>   COMPATIBLE_MACHINE = "keystone|dra7xx"
>   
> -PV = "3.3.0.3C"
> +PV = "03.03.00.04A"
>   INC_PR = "r0"
>   
>   CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
>   CSL_GIT_BRANCH = "master"
>   CSL_GIT_DESTSUFFIX = "git"
>   
> -# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.03C"
> -CSL_SRCREV = "ccd8dc29a5edce1a4d6409cb06b460bec6d3ecac"
> +# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.04A"
> +CSL_SRCREV = "64aba2b19c2f03ef0e5b1814489c910bb19ca2ee"
>   
>   BRANCH="${CSL_GIT_BRANCH}"
>   SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"


