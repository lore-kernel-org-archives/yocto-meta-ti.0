Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87CD1E00D6A; Tue, 17 Sep 2019 07:07:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 713D0E00C5C
	for <meta-ti@yoctoproject.org>; Tue, 17 Sep 2019 07:07:50 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8HE7nx8111722
	for <meta-ti@yoctoproject.org>; Tue, 17 Sep 2019 09:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568729269;
	bh=H0S/2mTkFuKSEQf1gaxSt7tKeCGQhp/t7rLT6PXA0GU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=YV9CD3s0xE4Pj2WU9n/TNTeQPkWeZpvc6kXIBqSlfJ+L7udSuB27LKqG43he2L9Tg
	2GJxRlocwzhjpjkMgTaQdOHnh/t9VvTO+1Wg+Bpc3mOqNYPmoqqub/f9DbCKpiArpX
	dHC2Ky9pC2BJmIcccdLDli0g0cWvJ8NtiXqn04qc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8HE7nxU084510
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 17 Sep 2019 09:07:49 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 17 Sep 2019 09:07:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 17 Sep 2019 09:07:46 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8HE7nas056084;
	Tue, 17 Sep 2019 09:07:49 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1568646545-28643-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <005f2a50-e62b-be64-4386-3d9ffa3ecf64@ti.com>
Date: Tue, 17 Sep 2019 10:07:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568646545-28643-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] ibl-boot-rtos: SRCREV bump to address b2ccs utils packaging issue on windows
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
X-List-Received-Date: Tue, 17 Sep 2019 14:07:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport this to ti2019.03.


Thanks,

Jake

On 9/16/2019 11:09 AM, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>   recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> index b70ea6c..59b75b3 100644
> --- a/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> +++ b/recipes-bsp/ibl-boot/ibl-boot-rtos_git.bb
> @@ -19,10 +19,17 @@ COMPATIBLE_MACHINE = "c66x"
>   
>   CLEANBROKEN = "1"
>   
> -BRANCH = "master"
> -SRC_URI = "git://git.ti.com/keystone-rtos/ibl.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "8a3c14da3f0808854367cae38afe9d47ab80dce6"
> -PR = "r1"
> +IBL_BOOT_GIT_URI = "git://git.ti.com/keystone-rtos/ibl.git"
> +IBL_BOOT_GIT_PROTOCOL = "git"
> +IBL_BOOT_GIT_BRANCH = "master"
> +IBL_BOOT_SRCREV = "ed3f0989d8cdc813b7ca1ed899c4d84b63de3a75"
> +
> +BRANCH = "${IBL_BOOT_GIT_BRANCH}"
> +SRC_URI = "${IBL_BOOT_GIT_URI};protocol=${IBL_BOOT_GIT_PROTOCOL};branch=${BRANCH}"
> +SRCREV = "${IBL_BOOT_SRCREV}"
> +
> +
> +PR = "r2"
>   
>   S = "${WORKDIR}/git"
>   
> @@ -33,8 +40,8 @@ IBLTARGETS_c665x-evm = "evm_c6657_i2c"
>   IBLTARGETS_c667x-evm = "evm_c6678_i2c"
>   
>   IBLENDIAN = ""
> -IBLENDIAN_c665x-evm = "little big"
> -IBLENDIAN_c667x-evm = "little big"
> +IBLENDIAN_c665x-evm = "little"
> +IBLENDIAN_c667x-evm = "little"
>   
>   export C6X_BASE_DIR="${TI_CGT6X_7_INSTALL_DIR}"
>   export TOOLSC6X="${C6X_BASE_DIR}"

