Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4964E002AB
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 17:48:44 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8I0minu017430
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 19:48:44 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8I0mirJ005844
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 19:48:44 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 17 Sep 2012 19:48:43 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8I0mhFm007212	for
	<meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 19:48:43 -0500
Date: Mon, 17 Sep 2012 20:48:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20120918004843.GE1708@edge>
References: <1347603217-10160-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <1347603217-10160-1-git-send-email-denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] layer.conf: lower layer priority from 10 to 6
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
X-List-Received-Date: Tue, 18 Sep 2012 00:48:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Any objections here?


On Fri, Sep 14, 2012 at 02:13:37AM -0400, Denys Dmytriyenko wrote:
> Lowering layer priority from 10 to 6 aligns meta-ti with other BSP layers
> and also allows distributions to override our recipes.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  conf/layer.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 4afb4f3..faa4ac0 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -6,4 +6,4 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>  
>  BBFILE_COLLECTIONS += "meta-ti"
>  BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
> -BBFILE_PRIORITY_meta-ti = "10"
> +BBFILE_PRIORITY_meta-ti = "6"
> -- 
> 1.7.8.6
> 

