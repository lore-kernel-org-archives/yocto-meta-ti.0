Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1470E00CD9; Mon,  9 Jul 2018 12:23:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E62B4E009B2
	for <meta-ti@yoctoproject.org>; Mon,  9 Jul 2018 12:23:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w69JN5EC108140
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 14:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531164185;
	bh=1TVAIWH67d53SsIqsTybzHoMMg5q8xNU59Vdub2Nsvk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZXdpaHOBbr7LQgim85Z5Lh8P2cH7wNo4MIn21h8d2aqoaSq84KpZ7WvkPgm4/ezNb
	tUu2lSVY7FwvzskFMLFwPAsJK3nPU0J4m+hPS470UPbXQ+E5RRKuCcn59LzUESFKr8
	7Ndq+O6nM45h1dmL6gPoDiTICbSOKGUh4HIgWaY0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w69JN5H7026816
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 14:23:05 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 9 Jul 2018 14:23:05 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 9 Jul 2018 14:23:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w69JN4Kq030005;
	Mon, 9 Jul 2018 14:23:04 -0500
Date: Mon, 9 Jul 2018 15:22:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20180709192221.GD5464@beryl>
References: <1531154148-30707-1-git-send-email-e-ruei1@ti.com>
	<1531154148-30707-2-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1531154148-30707-2-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] conf: machine: k3: enable sgx
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
X-List-Received-Date: Mon, 09 Jul 2018 19:23:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 09, 2018 at 12:35:46PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  conf/machine/include/k3.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index 96699db..b9374e3 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -28,5 +28,5 @@ MACHINE_GUI_CLASS = "smallscreen"
>  UBI_VOLNAME = "rootfs"
>  
>  # List common SoC features, may need to add touchscreen for specific machines
> -MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet pci"
> +MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet pci sgx"
>  # Not ready yet - sgx dsp mmip

^^^^ please remove from this list as well


> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

