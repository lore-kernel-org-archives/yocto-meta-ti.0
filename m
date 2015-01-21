Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4647EE008EC; Wed, 21 Jan 2015 10:58:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C1A8E0089B
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 10:58:34 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0LIwXWp007606
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 12:58:33 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0LIwXZA030059
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 12:58:33 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 Jan 2015 12:58:33 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0LIwXel031800;
	Wed, 21 Jan 2015 12:58:33 -0600
Date: Wed, 21 Jan 2015 13:58:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150121185832.GE21328@edge>
References: <1421862770-30804-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1421862770-30804-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC PATCH] Increasing the max_leb_count
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
X-List-Received-Date: Wed, 21 Jan 2015 18:58:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Vivek, Jake,

I suggested that Karthik sends an RFC to get your input on this matter. My 
concern is that we have large enough flash and enough storage space left for 
anything else you might want to store (e.g. backup/recovery images, etc.)

Please provide your feedback for this patch. Thanks.

-- 
Denys


On Wed, Jan 21, 2015 at 11:22:48PM +0530, Karthik Ramanan wrote:
> Background:
> 
> * GLSDK brings in a lot of multimedia and graphics
>   enabling components as well as example applications.
> * Customers are going to add more software layers on top 
>   of this to enable more feature rich graphics and multimedia. 
> * There are two configurations that are used internally:
>    ** Release filesystem
>    ** Debug filesystem - (Release + GDB + dbg-pkgs)
>       dbg-pkgs is basically the EXTRA_MACHINE_FEATURES in 
>       the local.conf that brings in the sources and debug
>       symbols to allow gdb debugging.
> 
> With the current leb_count it is not possible to support 
> the above usecases. And to allow for enough room for the 
> customer to add their components and not hit the space 
> issue, it is proposed to make this change.
> 
> Karthik Ramanan (1):
>   dra7xx-evm: ubifs: Increase "max_leb_cnt"
> 
>  conf/machine/dra7xx-evm.conf |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

