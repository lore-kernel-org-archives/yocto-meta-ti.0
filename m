Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 152B0E00ABE; Wed, 17 Oct 2018 12:37:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A43ADE00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:37:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9HJbrGf064550;
	Wed, 17 Oct 2018 14:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539805073;
	bh=yHtcvD1CMF0WUCxnwvV5E9rCSliLe1bXRTcQxiSKvW4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mRJ/wh9bqdutRvMW+B7WncJMNfgP5ZDuWuuwo4/grE8kwcB1RAOcPcyHtH5g2Kaud
	g74iN6vT90UKYoX7xQYoTEc5d/IeZRVUGbTq874wG9wMSlAqeozWmFCONDM4wGLwHo
	CFPADdY4O+pD8ViCQZ6FM0mAdw9Ioa+P46VNw9QA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HJbr8A002363;
	Wed, 17 Oct 2018 14:37:53 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 17 Oct 2018 14:37:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 17 Oct 2018 14:37:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HJbqps019514;
	Wed, 17 Oct 2018 14:37:52 -0500
Date: Wed, 17 Oct 2018 15:37:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181017193752.GI4031@beryl>
References: <20181017192853.42942-1-raj.khem@gmail.com>
	<20181017192853.42942-5-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181017192853.42942-5-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 5/5] beaglebone.conf: SERIAL_CONSOLE has been deprecated
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
X-List-Received-Date: Wed, 17 Oct 2018 19:37:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ah, thanks! Missed this one.


On Wed, Oct 17, 2018 at 12:28:53PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/machine/beaglebone.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
> index 9b656d01..f1818578 100644
> --- a/conf/machine/beaglebone.conf
> +++ b/conf/machine/beaglebone.conf
> @@ -11,7 +11,7 @@ KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblue.dtb \
>  # Only has DVI connector for external screen
>  MACHINE_GUI_CLASS = "bigscreen"
>  
> -SERIAL_CONSOLE = "115200 ttyS0"
> +SERIAL_CONSOLES = "115200;ttyS0"
>  
>  # fall back on generic am335x_evm_config for now
>  #UBOOT_MACHINE = "am335x_boneblack_config"
> -- 
> 2.19.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

