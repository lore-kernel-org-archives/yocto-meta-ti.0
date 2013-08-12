Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6AE6E013DF
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 20:30:03 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7C3U1br017424;
	Sun, 11 Aug 2013 22:30:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7C3U0Xg009466;
	Sun, 11 Aug 2013 22:30:01 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 11 Aug 2013 22:30:00 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7C3U0K4010430;
	Sun, 11 Aug 2013 22:30:00 -0500
Date: Sun, 11 Aug 2013 23:30:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <igeiser@devonit.com>
Message-ID: <20130812032959.GA29743@edge>
References: <1376264495-7627-1-git-send-email-igeiser@devonit.com>
MIME-Version: 1.0
In-Reply-To: <1376264495-7627-1-git-send-email-igeiser@devonit.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] Fix filespath for dylan
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
X-List-Received-Date: Mon, 12 Aug 2013 03:30:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Aug 11, 2013 at 07:41:34PM -0400, igeiser@devonit.com wrote:
> From: Ian Reinhart Geiser <igeiser@devonit.com>
> 
> The old way of setting THISDIR in a bbappend clobbers THISDIR for
> other layers.  This change makes it use the new way that is done
> in dylan.

Thanks! I've been meaning to fix those for quite some time, but there was 
always something more important... :)


> Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>
> ---
>  recipes-bsp/formfactor/formfactor_0.0.bbappend |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> index 4b8d0e6..491d403 100644
> --- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
> +++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
> @@ -1,3 +1,2 @@
> -THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> -FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
> -
> +PRINC := "${@int(PRINC) + 1}"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

The above should be _append since that is what =. operand does and also since 
the colon is at the end.

-- 
Denys

