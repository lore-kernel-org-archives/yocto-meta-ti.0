Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F660E0032E
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 08:31:42 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CFVfNM027910
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 10:31:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CFVfmd027024
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 10:31:41 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 12 Oct 2012 10:31:41 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q9CFVe8u006454;
	Fri, 12 Oct 2012 10:31:41 -0500
Date: Fri, 12 Oct 2012 11:31:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Herv? Fache <h-fache@ti.com>
Message-ID: <20121012153140.GG26956@edge>
References: <507836EF.8050506@ti.com>
MIME-Version: 1.0
In-Reply-To: <507836EF.8050506@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: No /sbin/init when deriving m7y own image
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
X-List-Received-Date: Fri, 12 Oct 2012 15:31:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 12, 2012 at 05:27:43PM +0200, Herv? Fache wrote:
> Hi guys,
> 
> I am new to Poky and have created the following recipe:
>     require recipes-graphics/images/core-image-x11.bb
>     IMAGE_INSTALL += "omapdrmtest"

Can you try adding to CORE_IMAGE_EXTRA_INSTALL instead of IMAGE_INSTALL?

-- 
Denys


> I have stored it at
> meta-ti/recipes-graphics/images/core-image-x11-drmtest.bb for now, and
> am building using:
>     bitbake -k core-image-x11-drmtest
> 
> If I comment out the IMAGE_INSTALL line then everything is fine, but if
> I leave it in then I am missing files in the filesystem, including
> /sbin/init.
> 
> Can some one please let me know what I am doing wrong?
> 
> Thanks in advance,
> Herv?
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

