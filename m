Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02A30E00D6C; Mon,  4 Mar 2019 08:08:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB589E00D2E
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 08:08:49 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x24G8nso083314
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 10:08:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551715729;
	bh=cUCt4XRDeXzwZWzz/5tyJaG7TDV5t6+WT5YhqkaWDgM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=GHfUX3He5jcQmY7YxT/RUYCIjhb5PT2+vxlEJQW1eZjytXdfFtxdkED0G/db3qRl9
	D+VZDkDkhCqRvPUooZpghRIuW/v5+6bp04q5u1HUfN7Iz3bB6wzXoZwe7k7TKIdREL
	gx3aLTufpFBKBkMTrtLuabwo2lVgzH12BJSoavbU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x24G8nnM066180
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 10:08:49 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 10:08:48 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 10:08:49 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x24G8m3R024701;
	Mon, 4 Mar 2019 10:08:48 -0600
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
References: <1551460736-16483-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6f775973-d681-4da8-355f-9c3987526a1c@ti.com>
Date: Mon, 4 Mar 2019 11:08:48 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1551460736-16483-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master][PATCH] gcc-arm-none-eabi: not supported on any target
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
X-List-Received-Date: Mon, 04 Mar 2019 16:08:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On a different machine, I am seeing the package_qa errors for the 
nativesdk package.


Should I submit a patch on top of this one to suppress the QA warnings 
and errors? Or should I combine this change with that patch?


Thank you,

Jake


On 3/1/2019 12:18 PM, Denys Dmytriyenko wrote:
> This package is only meant for native and nativesdk usage.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> index ae3d1d7..d08dd2f 100644
> --- a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> +++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> @@ -14,6 +14,7 @@ S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
>   
>   # only x86_64 is supported
>   COMPATIBLE_HOST = "x86_64.*-linux"
> +COMPATIBLE_HOST_class-target = "null"
>   
>   do_install() {
>       install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}

