Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2001BE00846; Tue, 23 Sep 2014 09:22:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B25CFE00786
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 09:22:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NGMIJS021668
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:22:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NGMI3T024847
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:22:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 11:22:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NGMHcM013736;
	Tue, 23 Sep 2014 11:22:17 -0500
Date: Tue, 23 Sep 2014 12:22:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140923162216.GR6303@edge>
References: <1411488036-32089-1-git-send-email-a0393906@ti.com>
	<1411488036-32089-5-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1411488036-32089-5-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [for master 4/6] bltsville: Updated SRCREV to the latest
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
X-List-Received-Date: Tue, 23 Sep 2014 16:22:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack.

On Tue, Sep 23, 2014 at 09:30:34PM +0530, Karthik Ramanan wrote:
> * Contains incremental updates and bug fixes
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  recipes-graphics/bltsville/bltsville_git.bb |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-graphics/bltsville/bltsville_git.bb b/recipes-graphics/bltsville/bltsville_git.bb
> index 158d189..7a05b4d 100644
> --- a/recipes-graphics/bltsville/bltsville_git.bb
> +++ b/recipes-graphics/bltsville/bltsville_git.bb
> @@ -4,9 +4,9 @@ LICENSE = "BSD-3-Clause & TI-TSPA"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148 \
>                      file://ticpu/license;md5=0bb831850a0de80e32a63772d89c6562"
>  
> -PR = "r2"
> +PR = "r3"
>  
> -SRCREV = "016586280ecdae201fd6e340ec8c4f8a9605cc94"
> +SRCREV = "a759bde8a5a6e518dfb8a6e633736a360005498e"
>  
>  inherit autotools pkgconfig
>  
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

