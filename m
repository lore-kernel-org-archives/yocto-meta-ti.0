Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B180E00961; Fri, 21 Jun 2019 05:56:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54DBCE003C1
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2019 05:56:00 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LCu0aj096567
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2019 07:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561121760;
	bh=S0EwwGLAl92QBWuOa0eajM6QYEgGVXKAFn2KOGRzyGA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=WnhS3pQzReYaZV9pbL4Y0HDh/WktXeUQ6V14u9VFqOJj2Bqx0DsA9Id00xS0p7cuK
	m3mP+/4BHgkKLTBMxMhxcgqQzHknI+cpJbls+bV83aMEh7Z8EHPJxxVd30WTHRFG7J
	TsiIjayR0v7EOvWbMsE7z6D3Bj9/VbrI6Y0sf9ug=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LCu0dt121585
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 21 Jun 2019 07:56:00 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 07:55:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 07:55:59 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LCtxXE007775;
	Fri, 21 Jun 2019 07:55:59 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-ti@yoctoproject.org>
References: <20190619174102.16280-1-x0157990@ti.com>
	<20190619174102.16280-2-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <d627f7c1-5384-e3fd-2e55-33275c3d0364@ti.com>
Date: Fri, 21 Jun 2019 08:55:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619174102.16280-2-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH 2/2] pm-lld-rtos: Enable building opencl-monitor for dra76xx
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
X-List-Received-Date: Fri, 21 Jun 2019 12:56:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake


On 6/19/2019 1:41 PM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> index 33ed5ffe..a8b870f0 100644
> --- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> @@ -63,4 +63,8 @@ do_compile_append() {
>       tar -cf pm_lld.tar --exclude='*.tar' ./*
>   }
>   
> +
> +# Workaround: dra7xx build requires am57xx pm libraries for opencl-monitor
> +TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x am574x"
> +
>   INSANE_SKIP_${PN} = "arch staticdev"

