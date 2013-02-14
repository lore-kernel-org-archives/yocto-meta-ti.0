Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB0DAE0047F
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2013 07:26:07 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MI7000YMUU8AV40@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 14 Feb 2013 09:25:36 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7C64D202A4; Thu,
	14 Feb 2013 10:25:20 -0500 (EST)
Date: Thu, 14 Feb 2013 10:25:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20130214152520.GA9154@denix.org>
References: <20130214083555.18042x2z6gmtzu4g@crashcourse.ca>
MIME-version: 1.0
In-reply-to: <20130214083555.18042x2z6gmtzu4g@crashcourse.ca>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [OT?] what is the status of the arago-project.org web site?
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
X-List-Received-Date: Thu, 14 Feb 2013 15:26:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 14, 2013 at 08:35:55AM -0500, Robert P. J. Day wrote:
> 
>   probably not the best place to ask this but since the arago project
> is tightly coupled(?) to meta-ti, what is the current status of the
> explanatory content at the http://arago-project.org web site?
> 
>   the main page there *suggests* it's current, but a check of the
> history of, say, "Setting Up Build Environment" shows that that page
> was last edited back in 2010.
> 
>   should there be some updates or simple links/redirections to take
> readers to newer pages?  or have i just missed something critically
> important?

The answer is two-fold:

1. There are still products out there, both from TI, as well as from our 
customers, that use the Arago Project based on the Classic OpenEmbedded. To 
support those, the old information on the Wiki is still needed.

2. With all the active development in meta-ti and meta-arago lately based on 
the Yocto Project and OpenEmbedded-Core, with more products ramping up 
quickly, there's not much time spent updating Wiki pages, unfortunately. This 
is definitely a gap now and would need to be closed soon.

-- 
Denys

