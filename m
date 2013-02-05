Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D97F9E0146C
	for <meta-ti@yoctoproject.org>; Tue,  5 Feb 2013 01:27:37 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:46452 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U2eoR-0008GQ-RK; Tue, 05 Feb 2013 04:27:36 -0500
Date: Tue, 5 Feb 2013 04:27:31 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Denys Dmytriyenko <denys@ti.com>
In-Reply-To: <20130205050559.GC27526@denix.org>
Message-ID: <alpine.DEB.2.02.1302050426070.6010@oneiric>
References: <alpine.DEB.2.02.1301310653100.25130@oneiric>
	<20130205050559.GC27526@denix.org>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: objections to replacing git SRCREV tag names with actual hash IDs?
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
X-List-Received-Date: Tue, 05 Feb 2013 09:27:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 5 Feb 2013, Denys Dmytriyenko wrote:

> On Thu, Jan 31, 2013 at 06:58:37AM -0500, Robert P. J. Day wrote:
> >
> >   surely, some of you saw this discussion on the oe-core list last
> > night, but would there be any objection to replacing the small
> > number of git SRCREV settings of tag names with their actual hash
> > IDs?  the motivation should be obvious -- avoid network traffic to
> > parse those tag names, even when that recipe isn't even being used
> > in the image being built.
>
> Yes, I've had occasional issues with "git ls-remote" during parse
> time on resolving those tags into commit IDs and was planning on
> eventually replacing them.

  ... snip ...

  thanks, i realize that, in the grand scheme of things, this isn't a
high priority but it definitely has an annoyance factor :-).  so i'll
leave this with folks higher up the food chain than me.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

