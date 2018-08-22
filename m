Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CAD75E00546; Wed, 22 Aug 2018 13:15:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72828E00460
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 13:15:42 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7MKFfJw092595
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 15:15:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534968941;
	bh=GNa+6a9ul970gp6+AJlASfxomaVCBQj9G5HqchHZhZU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eeYmT4SyeEszQExa+csF/JvBWY0OvBavwRRZ/QR/OwHD6S1j6J7vR+4sg7sUbLa2N
	j1swfbvixi7l+UZl5Zq9zb8UHrRElrs8Hf29SSE0JQ8suYLUSa4rIH+rlw1x9qx6/E
	yCwFiHbd3+tvp7SzKGQgZy0BPQnbNmCsVv9gkwXg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MKFfex006947
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 15:15:41 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 15:15:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 22 Aug 2018 15:15:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MKFfRb021126;
	Wed, 22 Aug 2018 15:15:41 -0500
Date: Wed, 22 Aug 2018 16:14:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20180822201445.GH29422@beryl>
References: <1534968820-5584-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1534968820-5584-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko][PATCH v2] am65xx-evm: Add PDK specific soc, boards and cores configuration for AM65xx
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
X-List-Received-Date: Wed, 22 Aug 2018 20:15:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Well, it already says am65xx in the beginning, why do you need to repeat it at 
the end? :)

But fine, I'll take it.


On Wed, Aug 22, 2018 at 04:13:40PM -0400, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Change from previous version
> Updated title and comments
> ---
> ---
>  conf/machine/am65xx-evm.conf | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
> index 08dbc9e..82ee02c 100644
> --- a/conf/machine/am65xx-evm.conf
> +++ b/conf/machine/am65xx-evm.conf
> @@ -25,3 +25,8 @@ WKS_FILE = "sdimage-bootpart.wks"
>  IMAGE_BOOT_FILES = "u-boot.img"
>  
>  do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
> +
> +# Set the list of device targets for ti-pdk class recipes
> +TI_PDK_LIMIT_SOCS = "am65xx"
> +TI_PDK_LIMIT_BOARDS = "am65xx_evm am65xx_idk"
> +TI_PDK_LIMIT_CORES = "mcu1_0 mpu1_0"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

