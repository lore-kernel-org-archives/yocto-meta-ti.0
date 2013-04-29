Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE54CE01308
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 11:16:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3TIGb9t028994
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 13:16:37 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3TIGbYs021227
	for <meta-ti@yoctoproject.org>; Mon, 29 Apr 2013 13:16:37 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 29 Apr 2013 13:16:36 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3TIGa7b013561;
	Mon, 29 Apr 2013 13:16:36 -0500
Date: Mon, 29 Apr 2013 14:16:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20130429181635.GG27211@edge>
References: <1367245658-15077-1-git-send-email-fcooper@ti.com>
	<1367245658-15077-2-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1367245658-15077-2-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] linux-am335x-psp: Correct recipe name typo
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
X-List-Received-Date: Mon, 29 Apr 2013 18:16:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK.

On Mon, Apr 29, 2013 at 09:27:38AM -0500, Franklin S. Cooper Jr wrote:
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  ...x-am335x-psp-3.2.bb => linux-am335x-psp_3.2.bb} |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-kernel/linux/{linux-am335x-psp-3.2.bb => linux-am335x-psp_3.2.bb} (100%)
> 
> diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> similarity index 100%
> rename from recipes-kernel/linux/linux-am335x-psp-3.2.bb
> rename to recipes-kernel/linux/linux-am335x-psp_3.2.bb
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

