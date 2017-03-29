Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0DBBBE0094C; Wed, 29 Mar 2017 07:14:51 -0700 (PDT)
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
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC2BAE00901
	for <meta-ti@yoctoproject.org>; Wed, 29 Mar 2017 07:14:47 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2TEEkiQ026687
	for <meta-ti@yoctoproject.org>; Wed, 29 Mar 2017 09:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490796886;
	bh=QRc9GT18TO04yXT5d8V+HX/w0ff3CP/cEa6V/vviHDs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Kry1J9C/U6+H5r+8HBcAFK1942l6p0t6vSSj/YktSJtvSGKOIyb3KrkodAl72wZtR
	ud8kfNwkyi1mBSQgTq4JpzBw63viDRfyT/bKRdVI7DsIQaQ0/G4nKPtynP4/rQrcfg
	Do/nwQU38y/hHCmQ9DqDXVddiYGBGeSzdEu2/gA4=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2TEEkan015081
	for <meta-ti@yoctoproject.org>; Wed, 29 Mar 2017 09:14:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Mar 2017 09:14:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2TEEkao013344;
	Wed, 29 Mar 2017 09:14:46 -0500
Date: Wed, 29 Mar 2017 10:14:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170329141445.GB11364@edge>
References: <1490789015-3886-1-git-send-email-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <1490789015-3886-1-git-send-email-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] k2hk-hs-evm: add new machine config
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
X-List-Received-Date: Wed, 29 Mar 2017 14:14:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 29, 2017 at 07:03:35AM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  conf/machine/k2hk-hs-evm.conf | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 conf/machine/k2hk-hs-evm.conf
> 
> diff --git a/conf/machine/k2hk-hs-evm.conf b/conf/machine/k2hk-hs-evm.conf
> new file mode 100644
> index 0000000..e0b11eb
> --- /dev/null
> +++ b/conf/machine/k2hk-hs-evm.conf
> @@ -0,0 +1,14 @@
> +#@TYPE: Machine
> +#@NAME: Keystone 2 K2HK HS EVM
> +#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2HK HS EVM
> +
> +require conf/machine/k2hk-evm.conf
> +
> +UBOOT_MACHINE = "k2e_hs_evm_config"

Dan,

Is k2e used here on purpose because k2hk defconfig is not ready yet?


> +UBOOT_ENTRYPOINT = "0x82000000"
> +UBOOT_LOADADDRESS = "0x82000000"
> +UBOOT_RD_LOADADDRESS = "0x84000000"
> +UBOOT_RD_ENTRYPOINT = "0x84000000"
> +
> +TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2hk"
> -- 
> 2.7.3
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

