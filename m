Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44A29E0051D
	for <meta-ti@yoctoproject.org>; Mon,  1 Apr 2013 10:55:39 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r31Htcn0003562
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 12:55:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r31HtcZ8015523
	for <meta-ti@yoctoproject.org>; Mon, 1 Apr 2013 12:55:38 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Apr 2013 12:55:37 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r31Htbmt032380;
	Mon, 1 Apr 2013 12:55:37 -0500
Date: Mon, 1 Apr 2013 13:55:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-ID: <20130401175536.GA9892@edge>
References: <1364833567-8510-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1364833567-8510-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti33x: remove sgx until latest kernels are supported
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
X-List-Received-Date: Mon, 01 Apr 2013 17:55:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 01, 2013 at 11:26:07AM -0500, Chase Maupin wrote:
> * Remove the sgx feature from the ti33x devices until the update
>   to a later version of the graphics SDK and drivers enables SGX
>   support for later kernels such a v3.8

But we still have 3.2 supported and AM-SDK is using it...


> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  conf/machine/include/ti33x.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index 12b80c6..e8aa2ba 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -34,4 +34,4 @@ UBOOT_LOADADDRESS = "0x80008000"
>  EXTRA_IMAGEDEPENDS += "u-boot"
>  
>  # List common SoC features, may need to add touchscreen for specific machines
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

