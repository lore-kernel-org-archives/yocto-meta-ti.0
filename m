Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E765CE00294
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 09:19:04 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qASHJ3sD019018;
	Wed, 28 Nov 2012 11:19:03 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qASHJ3ZL014823;
	Wed, 28 Nov 2012 11:19:03 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 28 Nov 2012 11:19:03 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qASHJ24o020414;
	Wed, 28 Nov 2012 11:19:03 -0600
Date: Wed, 28 Nov 2012 12:19:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20121128171902.GB7172@edge>
References: <50B64752.6080607@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <50B64752.6080607@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Can't build recipes-graphics/xorg-xserver/xf86-video-omap_git.bb
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
X-List-Received-Date: Wed, 28 Nov 2012 17:19:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1196

On Wed, Nov 28, 2012 at 10:18:10AM -0700, Gary Thomas wrote:
> When trying to build this recipe, I get this error:
> 
> configure: error: Package requirements (xorg-server >= 1.3 xproto fontsproto libdrm >= 2.4.36 libdrm_omap xf86driproto  randrproto renderproto videoproto xextproto) were not met:
> No package 'libdrm_omap' found
> 
> Where can I find this package?
> 
> Thanks
> 
> -- 
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

