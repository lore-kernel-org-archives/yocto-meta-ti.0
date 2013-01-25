Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF833E006CB
	for <meta-ti@yoctoproject.org>; Fri, 25 Jan 2013 09:38:01 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0PHbv4P029845;
	Fri, 25 Jan 2013 11:37:57 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0PHbvYK029319;
	Fri, 25 Jan 2013 11:37:57 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 25 Jan 2013 11:37:57 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r0PHbv2f032455;
	Fri, 25 Jan 2013 11:37:57 -0600
Date: Fri, 25 Jan 2013 12:37:56 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130125173755.GD10087@edge>
References: <alpine.DEB.2.02.1301240816240.7586@oneiric>
	<20130125172057.GD23977@denix.org> <1359135133.13917.15.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1359135133.13917.15.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux_3.1.bb: Remove bad line continuation.
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
X-List-Received-Date: Fri, 25 Jan 2013 17:38:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 25, 2013 at 05:32:13PM +0000, Richard Purdie wrote:
> On Fri, 2013-01-25 at 12:20 -0500, Denys Dmytriyenko wrote:
> > On Thu, Jan 24, 2013 at 08:16:38AM -0500, Robert P. J. Day wrote:
> > > 
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > > 
> > > ---
> > > 
> > >   guessing just a copy and paste error, which currently generates:
> > 
> > No, the recent change in bitbake to handle multiline comments slightly 
> > different, i.e. stricter...
> 
> Previously if you put something in place of that blank line uncommented,
> bitbake might have ignored it under certain circumstances. This is
> rather unexpected by users.
> 
> We therefore made bitbake ask the users to say what they mean :)
> 
> Its a bit of a short term pain but a win for usability after that.

Agree. Thanks.

-- 
Denys

