Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97CDFE002AB
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 10:12:00 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIU006XZAJLJ5V1@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Feb 2013 12:11:51 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 63E0B200BD; Tue,
	26 Feb 2013 13:11:44 -0500 (EST)
Date: Tue, 26 Feb 2013 13:11:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20130226181144.GK6725@denix.org>
References: <1361852468-4352-1-git-send-email-denis@denix.org>
	<CAMKF1sq7h-bhjbCcaPdGHB8MxtZ0dE2LL_rWe2FDB3Uxmc7DNg@mail.gmail.com>
	<20130226062413.GG6725@denix.org>
	<CAMKF1sorSZg7iP=PVt-hXJyikZoYyyEay9EK61yh4i=B6+RSJA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sorSZg7iP=PVt-hXJyikZoYyyEay9EK61yh4i=B6+RSJA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot: add latest mainline release 2013.01.01
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
X-List-Received-Date: Tue, 26 Feb 2013 18:12:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Feb 25, 2013 at 10:47:50PM -0800, Khem Raj wrote:
> On Mon, Feb 25, 2013 at 10:24 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Mon, Feb 25, 2013 at 10:07:25PM -0800, Khem Raj wrote:
> >> On Mon, Feb 25, 2013 at 8:21 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> > +PR = "r1"
> >>
> >> not as important but better to get rid of it.
> >
> > Better? There's no harm in it and it prevents you from forgetting to update it
> > later. Otherwise it's just a matter or personal preference.
> >
> 
> better in an initial recipe I meant. later updates could change it.

It's Ok either way. Yes, it will default to -r0 when not set, but you need to 
remember to add and update it when changing the recipe later.


> with PR services its not as important as it used to be.

Yes, I know the PR server is supposed to solve that. But it's not there yet 
and these recipes have to work properly with "danny" as well.

-- 
Denys

