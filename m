Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 93AD9E00550
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2013 10:54:33 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1KIsWNI028941;
	Wed, 20 Feb 2013 12:54:32 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1KIsVH1005341;
	Wed, 20 Feb 2013 12:54:31 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Feb 2013 12:54:32 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1KIsVPm011973;
	Wed, 20 Feb 2013 12:54:31 -0600
Date: Wed, 20 Feb 2013 13:54:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Andreas M??ller <schnitzeltony@googlemail.com>
Message-ID: <20130220185430.GE13500@edge>
References: <CALbNGRRkxbzvQa0Lieiknz=QS+LehASn+6-QD2qY5G-CkND7zQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRkxbzvQa0Lieiknz=QS+LehASn+6-QD2qY5G-CkND7zQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: arago servers sane?
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
X-List-Received-Date: Wed, 20 Feb 2013 18:54:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yeah, as soon as I go on travel, things start falling apart... :)

For some reason git service went down, should be working now.

-- 
Denys


On Wed, Feb 20, 2013 at 02:15:37PM +0100, Andreas M??ller wrote:
> Hi
> 
> after deleting all my temp file I get during parse (?!):
> 
> ERROR: ExpansionError during parsing
> /home/andreas/data/oe-core/sources/meta-ti/recipes-bsp/u-boot/u-boot_2013.01.bb:
> Failure expanding variable SRCPV,expression was
> ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError:
> Fetcher failure: Fetch command failed with exit code 128, output:
> fatal: The remote end hung up unexpectedly
> 
> ERROR: Command execution failed: Exited with 1
> 
> I tried to browse http://arago-project.org/git/projects/ but get only
> an empty frame and the page loads forever.
> 
> Any thoughts?
> 
> Andreas
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

