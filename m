Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52C85E00B8E; Tue, 15 Oct 2019 10:17:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73D42E00924
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 10:17:53 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9FHHqYN052386
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 12:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571159872;
	bh=Qnigk49k/r7pl7Iv7M2c/LPRyu7H4pfD0nFZDIbW7h8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=n0VctXv/qUQv0jwLJgbQ2wLX41vAFdMjuPNo6lTLTKizaYoDi3fbx2Cub3IEZlpYx
	L8G8SXCY8R42v3rgcc5zaIb7rMyP9UGxuBQa92sxiQfSPUEOY8aHqsmQ6S/Q3VclW4
	RzSbdF/7y3F8dE3NG5JqxzGE8d1qf8IfQeLqItS8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9FHHqAa077545
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 12:17:52 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 15 Oct 2019 12:17:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 15 Oct 2019 12:17:45 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9FHHpdE107123;
	Tue, 15 Oct 2019 12:17:51 -0500
To: Sam Nelson <sam.nelson@ti.com>, <meta-ti@yoctoproject.org>
References: <1570840844-23037-1-git-send-email-sam.nelson@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <00c76e5f-5183-f9d9-485b-bb563830d557@ti.com>
Date: Tue, 15 Oct 2019 13:17:45 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1570840844-23037-1-git-send-email-sam.nelson@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/ti2019.03/master][PATCH] ti-ipc: Update examples to latest version
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
X-List-Received-Date: Tue, 15 Oct 2019 17:17:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.03.


Thank you,

Jake

On 10/11/2019 8:40 PM, Sam Nelson wrote:
> Fixes issues with AM65X examples
>
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>   recipes-ti/ipc/ti-ipc-rtos.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> index fe2cc99..25942db 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -26,8 +26,8 @@ name=${TI_IPC_METADATA_NAME}"
>   
>   # Corresponds to tag: 3.50.04.07
>   TI_IPC_METADATA_SRCREV = "37e85ff1966f7d093fe2bde2dd9d4546f29d0d80"
> -# Corresponds to tag: 3.50.04.07A
> -TI_IPC_EXAMPLES_SRCREV = "0ebf5e642a8ca567bcaa7653875d15f6e7178405"
> +# Corresponds to tag: 3.50.04.07B
> +TI_IPC_EXAMPLES_SRCREV = "ad3d694e30367a5c04525aef7c6ee9a33896fd59"
>   
>   SRCREV_FORMAT = "default"
>   SRCREV_ipc-metadata = "${TI_IPC_METADATA_SRCREV}"
> @@ -39,7 +39,7 @@ S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
>   RELEASE_TYPE = "GA"
>   RELEASE_SUFFIX = ""
>   
> -PR = "${INC_PR}.r0"
> +PR = "${INC_PR}.r1"
>   
>   DEPENDS_append_keystone = " ti-cgt6x-native \
>                               gcc-arm-none-eabi-native \

