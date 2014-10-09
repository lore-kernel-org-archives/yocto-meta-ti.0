Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 62015E00860; Wed,  8 Oct 2014 20:13:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 988B8E00848
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 20:13:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s993DHPK015073
	for <meta-ti@yoctoproject.org>; Wed, 8 Oct 2014 22:13:17 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s993DG3r003585
	for <meta-ti@yoctoproject.org>; Wed, 8 Oct 2014 22:13:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 8 Oct 2014 22:13:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s993DGfe032010;
	Wed, 8 Oct 2014 22:13:16 -0500
Date: Wed, 8 Oct 2014 23:13:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20141009031315.GA13128@edge>
References: <1412770244-3829-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1412770244-3829-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [daisy][PATCH v2] dra7xx: add "mmip" to MACHINE_FEATURES
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
X-List-Received-Date: Thu, 09 Oct 2014 03:13:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ah, this causes some grief to dra7xx and am57x builds due to gstreamer 
conflicts. I guess we need to play with preferred provider settings some more. 
I'll look into it tomorrow...


On Wed, Oct 08, 2014 at 08:10:44AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  conf/machine/include/dra7xx.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/dra7xx.inc b/conf/machine/include/dra7xx.inc
> index 857e1b3..a7c8782 100644
> --- a/conf/machine/include/dra7xx.inc
> +++ b/conf/machine/include/dra7xx.inc
> @@ -1,4 +1,4 @@
>  require conf/machine/include/omap-a15.inc
>  SOC_FAMILY_append = ":dra7xx"
>  
> -MACHINE_FEATURES += "pci"
> +MACHINE_FEATURES += "pci mmip"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

