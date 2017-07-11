Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A415FE00C35; Tue, 11 Jul 2017 04:26:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A9B9E00B31
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 04:26:19 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6BBQJDt030476
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 06:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499772379;
	bh=Ah1bY4b7IMYqAa+cZX4falNXAJR4VOl3OuCatteZDB4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ouDChQ5DOqL5sAxMCWBbV7HNWWernx2abDFtZPfpp9sTgPRvTjk1k2VXOYxmhdoag
	U32SC25MI1ZejwYHAHinurGcFM58JkEj6jPJIJnhTzIdJDqyb459injMdXVvZ+Bm5F
	vRoDlyyhLNkPlrdE/qawLURmwGucFYRx2WMTXEQg=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6BBQJdB022241
	for <meta-ti@yoctoproject.org>; Tue, 11 Jul 2017 06:26:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Jul 2017 06:26:19 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6BBQIai007244;
	Tue, 11 Jul 2017 06:26:19 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1499455166-44572-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <07592427-7fe1-b4e2-6549-ded120d0c197@ti.com>
Date: Tue, 11 Jul 2017 07:26:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499455166-44572-1-git-send-email-m-radhakrishnan2@ti.com>
Subject: Re: [PATCH] pruss-lld: Add rtos recipe & update the version to 1.0.0.7
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
X-List-Received-Date: Tue, 11 Jul 2017 11:26:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/7/2017 3:19 PM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb | 23 +++++++++++++++++++++++
>   recipes-bsp/pruss-lld/pruss-lld.inc         |  6 +++---
>   2 files changed, 26 insertions(+), 3 deletions(-)
>   create mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
>
> diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
> new file mode 100644
> index 0000000..a935f0b
> --- /dev/null
> +++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
> @@ -0,0 +1,23 @@
> +inherit ti-pdk
> +require recipes-bsp/pruss-lld/pruss-lld.inc
> +
> +COMPATIBLE_MACHINE_append = "|k2g-hs-evm"

Can you instead update the pruss-lld.inc to extend compatibility with 
the k2g SOC family?

> +
> +PR = "${INC_PR}.0"
> +
> +S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
> +
> +DEPENDS_append = " osal-rtos"
> +DEPENDS_append_ti33x = " starterware-rtos"
> +DEPENDS_append_ti43x = " starterware-rtos"

The dependency on starterware-rtos for ti33x/ti43x appears to be common 
for all ti-pdk class recipes. Should this go into the ti-pdk.class 
recipe instead?

> +
> +# Build with make instead of XDC
> +TI_PDK_XDCMAKE = "0"
> +
> +export PDK_PRUSS_ROOT_PATH ="${WORKDIR}/build"
> +export DEST_ROOT="${WORKDIR}/build"
> +
> +# HTML doc link params
> +PDK_COMP_LINK_TEXT = "PRUSS LLD"
> +
> +INSANE_SKIP_${PN} = "arch"
> diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
> index 8620108..5343c9f 100644
> --- a/recipes-bsp/pruss-lld/pruss-lld.inc
> +++ b/recipes-bsp/pruss-lld/pruss-lld.inc
> @@ -9,12 +9,12 @@ PRUSS_LLD_GIT_PROTOCOL = "git"
>   PRUSS_LLD_GIT_BRANCH = "master"
>   PRUSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/pruss"
>   
> -# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.06A"
> -PRUSS_LLD_SRCREV = "b98729cc1fc26c9ac32846146892646a23c28adb"
> +# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.07"
> +PRUSS_LLD_SRCREV = "636bb5645014723c54c08245cf8c2ee401eceb4f"
>   
>   BRANCH = "${PRUSS_LLD_GIT_BRANCH}"
>   SRC_URI = "${PRUSS_LLD_GIT_URI};destsuffix=${PRUSS_LLD_GIT_DESTSUFFIX};protocol=${PRUSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>   
>   SRCREV = "${PRUSS_LLD_SRCREV}"
> -PV = "01.00.00.06A"
> +PV = "01.00.00.07"
>   INC_PR = "r0"


