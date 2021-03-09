Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.301.1615328458353541549
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 14:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9697540C2C;
	Tue,  9 Mar 2021 22:20:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmoRy6zAkipt; Tue,  9 Mar 2021 22:20:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8213740AB7;
	Tue,  9 Mar 2021 22:20:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4B6E417452F; Tue,  9 Mar 2021 17:20:56 -0500 (EST)
Date: Tue, 9 Mar 2021 17:20:56 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Vivien Didelot <vivien.didelot@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] ti33x: allow different virtual/bootloader
Message-ID: <20210309222056.GP4892@denix.org>
References: <20210309172331.22122-1-vdidelot@pbsc.com>
 <20210309203413.GL4892@denix.org>
 <20210309154234.GB55678@t480s.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210309154234.GB55678@t480s.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 09, 2021 at 03:42:34PM -0500, Vivien Didelot wrote:
> Hi Denys,
> 
> On Tue, 09 Mar 2021 15:34:13 -0500 Denys Dmytriyenko <denis@denix.org> wrote:
> > On Tue, Mar 09, 2021 at 12:23:31PM -0500, Vivien Didelot wrote:
> > > Boards like the beaglebone currently hardcode "u-boot" as a dependency
> > > for the image and the wic format, and this prevents one from choosing
> > > a different bootloader via:
> > > 
> > >     PREFERRED_PROVIDER_virtual/bootloader = "non-u-boot-bootloader"
> > > 
> > > Depending on "virtual/bootloader" instead of "u-boot" fixes this.
> > > 
> > > Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> > 
> > Could have added Suggested-by: here. Oh, well...
> > 
> > Reviewed-by: Denys Dmytriyenko <denis@denix.org>
> 
> Oops I messed up, can you please add your address as Suggested-by:,
> and set the author address to my Signed-off-by: address? Otherwise
> I can resend if that is simpler.

Sorry, I won't be able to change anything in the patch. So you better off 
re-sending a v2, if you want.

-- 
Denys
