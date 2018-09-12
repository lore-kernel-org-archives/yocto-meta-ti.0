Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9067E0097D; Wed, 12 Sep 2018 06:26:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD002E0090A
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2018 06:26:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8CDQRWC062419
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2018 08:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536758787;
	bh=rxyKT0ajsuZB58w7oquaFRvmtWeJUTYmM7AUpqhAwAw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WyXOT0vMKiw4ndrJXJZMYWKWNaKPMwm2MCc+vtdLl1PsjWuZHSFjzjLDv9y9ixO9k
	YhBj7t8k1ygPdJhVhkhCrXMm1NgwN2JoFo8Z0QiSWQ/rlQkW1VFUTQFDDHjwFVWCEM
	MYZ7uUqaOxIL5cX1jngFYWHfyWghccn6dsdqFWvo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CDQQC5007516
	for <meta-ti@yoctoproject.org>; Wed, 12 Sep 2018 08:26:27 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 12 Sep 2018 08:26:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 12 Sep 2018 08:26:25 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CDQPrC003337;
	Wed, 12 Sep 2018 08:26:26 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-ti@yoctoproject.org>
References: <1536584059-25777-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <cd8361bb-64e1-f2d4-8e90-1d61c0a77edd@ti.com>
Date: Wed, 12 Sep 2018 09:26:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536584059-25777-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [PATCH] ti-pdk-class: Include EVE toolchain path, as needed by ti-pdk-build-rtos for some SoCs
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
X-List-Received-Date: Wed, 12 Sep 2018 13:26:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/10/2018 8:54 AM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   classes/ti-pdk.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index f0d14a7..0716074 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -43,6 +43,7 @@ export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
>   export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
>   export TOOLCHAIN_PATH_Arm9 = "${M4_TOOLCHAIN_INSTALL_DIR}"
>   export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
> +export TOOLCHAIN_PATH_EVE = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-arp32"
>   export CL_PRU_INSTALL_PATH = "${TI_CGT_PRU_INSTALL_DIR}"
>   export TOOLCHAIN_PATH_GCC_ARCH64 = "${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}"
>   export TOOLCHAIN_PATH_R5 = "${M4_TOOLCHAIN_INSTALL_DIR}"


