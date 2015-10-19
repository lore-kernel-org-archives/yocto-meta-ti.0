Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4D71E0049B; Mon, 19 Oct 2015 14:09:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7326DE00343
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 14:09:57 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9JL9vUn017576
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 16:09:57 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JL9viU015873
	for <meta-ti@yoctoproject.org>; Mon, 19 Oct 2015 16:09:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Oct 2015 16:09:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9JL9usB030758;
	Mon, 19 Oct 2015 16:09:56 -0500
Date: Mon, 19 Oct 2015 17:09:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20151019210941.GJ5620@edge>
References: <1445283698-10019-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1445283698-10019-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-softhsmv2: Update to new version 1.3.0.4
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
X-List-Received-Date: Mon, 19 Oct 2015 21:09:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 19, 2015 at 03:41:38PM -0400, Sam Nelson wrote:
> - Update License checksum

Don't take license changes lightly - please confirm the LICENSE field itself 
hasn't changed and it's still OSRB approved.


> - Skip PR
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb |    9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> index 329fbaa..c1e1654 100644
> --- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> +++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "TI softhsmv2 package"
>  LICENSE = "BSD-2-Clause | BSD-3-Clause | ISC | IBM-License | FSFULLR | Zlib"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=55144a048ba54f211a1aaa38c7fd2424"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=664f3daf042b19d634189e709d5d558e"
>  SECTION = "libs"
>  
>  mntdir = "/mnt"
> @@ -12,10 +12,9 @@ COMPATIBLE_MACHINE = "(tci6614-evm|keystone)"
>  
>  BRANCH="master"
>  SRC_URI = "git://git.ti.com/keystone-linux/ti-softhsmv2.git;protocol=git;branch=${BRANCH}"
> -#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.01
> -SRCREV = "c79d93ac2a326567a7245dda1b903ef340b5650c"
> -PV = "1.3.0.1"
> -PR = "r1"
> +#Following commit corresponds to tag DEV.SOFTHSM-01.03.00.04
> +SRCREV = "c2688afb9373309751e640088705cb739997665d"
> +PV = "1.3.0.4"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

