Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8AF69E013BA
	for <meta-ti@yoctoproject.org>; Wed, 10 Jul 2013 09:39:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6AGdn0N004302;
	Wed, 10 Jul 2013 11:39:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6AGdnpR008056;
	Wed, 10 Jul 2013 11:39:49 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Jul 2013 11:39:49 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6AGdnIV016924;
	Wed, 10 Jul 2013 11:39:49 -0500
Date: Wed, 10 Jul 2013 12:39:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20130710163948.GC16407@edge>
References: <alpine.DEB.2.02.1307090624580.5445@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1307090624580.5445@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: proper way to generate the sd card image?
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
X-List-Received-Date: Wed, 10 Jul 2013 16:39:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 09, 2013 at 06:26:27AM -0400, Robert P. J. Day wrote:
> 
>   i remember tripping up on this before -- what's the proper way to
> customize my local.conf to generate the sd card image via
> sdcard_image.bbclass? i also remember a warning that that generation
> wasn't compatible with the genext2fs in oe-core at the time, is that
> still an issue?

Robert,

We don't use that class in our builds and products. Instead, the following 
script is being used to generate SD cards with the production SDKs:

http://processors.wiki.ti.com/index.php/Sitara_Linux_SDK_create_SD_card_script

Since that class is broken and outdated, it may be removed in the future.

-- 
Denys

