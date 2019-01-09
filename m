Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B75BE00C5F; Tue,  8 Jan 2019 22:03:42 -0800 (PST)
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
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10108E00B77
	for <meta-ti@yoctoproject.org>; Tue,  8 Jan 2019 22:03:41 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0963fXZ114601
	for <meta-ti@yoctoproject.org>; Wed, 9 Jan 2019 00:03:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1547013821;
	bh=UTEeXsR2dAVPniaFzokzVdAIHD1eMQSHbyzzmY/xgic=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=RHVWne5xU+KZyiy6R0+EFpiv23SIKY3cI7hA8BmRhvrqLXQ29/3ZTuH8cKoJhSAc6
	VwW4DSUE5tvrt2LFkKPwG6pjhR0g41mecCBZTk87pO6nRThwfZ9siiq8TD2sDjtHFy
	ltL2Rwpz+JpngWnH+EOtc/CzqZB8WGsvpbg9c2fo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0963faI036658
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 9 Jan 2019 00:03:41 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 9 Jan 2019 00:03:41 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 9 Jan 2019 00:03:40 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0963exI003594;
	Wed, 9 Jan 2019 00:03:40 -0600
To: Denys Dmytriyenko <denys@ti.com>, <meta-ti@yoctoproject.org>
References: <20190109030212.19162-1-denys@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <74adab67-97d9-d013-1f0f-e05f6b53d07c@ti.com>
Date: Wed, 9 Jan 2019 00:03:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190109030212.19162-1-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko/master][PATCH] cmem.inc: add arm64 support for cmem injection
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
X-List-Received-Date: Wed, 09 Jan 2019 06:03:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/8/19 9:02 PM, Denys Dmytriyenko wrote:
> Since cmem 4.16 now supports arm64, update cmem injection code accordingly
> to work with arm64 DTS files.
> 
> Cc: Sam Nelson <sam.nelson@ti.com>
> Cc: Jacob Stiffler <j-stiffler@ti.com>
> Cc: Suman Anna <s-anna@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Thanks for the patch Denys. This is definitely needed to scale for both
v7 and v8 platforms.

Reviewed-by: Suman Anna <s-anna@ti.com>

> ---
>  recipes-kernel/linux/cmem.inc | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.inc
> index 0327557f..5fd0b9d9 100644
> --- a/recipes-kernel/linux/cmem.inc
> +++ b/recipes-kernel/linux/cmem.inc
> @@ -70,11 +70,14 @@ python do_setup_cmem() {
>  
>              # Get destination directory and destination dtsi filename which adds
>              #   the MACHINE prefix.
> -            dst_dir  = os.path.join(localdata.getVar('S'), 'arch/arm/boot/dts')
> +            dst_dir  = os.path.join(localdata.getVar('S'), localdata.expand('arch/${ARCH}/boot/dts'))
>              dst_dtsi = localdata.expand('${MACHINE}-${CMEM_DTSI}')
>  
>              # Copy cmem.dtsi into source tree
> -            shutil.copy(os.path.join(src_dir,src_dtsi), os.path.join(dst_dir,dst_dtsi))
> +            if localdata.getVar('ARCH') is 'arm64':
> +                shutil.copy(os.path.join(src_dir,src_dtsi), os.path.join(dst_dir,'ti',dst_dtsi))
> +            else:
> +                shutil.copy(os.path.join(src_dir,src_dtsi), os.path.join(dst_dir,dst_dtsi))
>  
>              # Inject dtsi into each dts in list
>              for dtb in (localdata.getVar('CMEM_DEVICETREE') or '').split():
> 


