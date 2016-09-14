Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2109E009FA; Wed, 14 Sep 2016 04:37:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CCCBE009E3
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 04:37:22 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8EBbLjg009705
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 06:37:21 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8EBbKaA002684
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 06:37:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 06:37:19 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8EBbJIU030351;
	Wed, 14 Sep 2016 06:37:20 -0500
To: Justin Sobota <jsobota@ti.com>, <meta-ti@yoctoproject.org>
References: <1473816561-27507-1-git-send-email-jsobota@ti.com>
	<1473816561-27507-3-git-send-email-jsobota@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c37a1e05-5661-77ab-2a0a-44c803875352@ti.com>
Date: Wed, 14 Sep 2016 07:37:19 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1473816561-27507-3-git-send-email-jsobota@ti.com>
Subject: Re: [master/krogoth][PATCH 3/6] pa-lld: Bump version
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
X-List-Received-Date: Wed, 14 Sep 2016 11:37:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

This fails to build. The patch no longer applies.

- Jake


On 9/13/2016 9:29 PM, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>   recipes-bsp/pa-lld/pa-lld.inc |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
> index 6c51560..c050044 100644
> --- a/recipes-bsp/pa-lld/pa-lld.inc
> +++ b/recipes-bsp/pa-lld/pa-lld.inc
> @@ -9,16 +9,16 @@ PA_LLD_GIT_PROTOCOL = "git"
>   PA_LLD_GIT_BRANCH = "master"
>   PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
>   
> -# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.12"
> -PA_LLD_SRCREV = "d3f3f5d93d3febc24099974bbc77e67c80a83b1e"
> +# Below Commit ID corresponds to "DEV.PA_LLD.03.00.02.00"
> +PA_LLD_SRCREV = "dca2a281c0c57f3b3018a93fae5485825a33042c"
>   
>   BRANCH = "${PA_LLD_GIT_BRANCH}"
>   SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH} \
>               file://0001-makefile_armv7-fix-missing-separator-error.patch"
>   SRCREV = "${PA_LLD_SRCREV}"
>   
> -PV = "03.00.01.12"
> -INC_PR = "r2"
> +PV = "03.00.02.00"
> +INC_PR = "r0"
>   
>   S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
>   


