Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1289E0146C
	for <meta-ti@yoctoproject.org>; Tue,  5 Feb 2013 01:32:21 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:46454 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U2et2-0008Qg-TK; Tue, 05 Feb 2013 04:32:21 -0500
Date: Tue, 5 Feb 2013 04:32:19 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Denys Dmytriyenko <denys@ti.com>
In-Reply-To: <20130205051649.GD27526@denix.org>
Message-ID: <alpine.DEB.2.02.1302050428130.6010@oneiric>
References: <alpine.DEB.2.02.1301301812590.3879@oneiric>
	<20130205051649.GD27526@denix.org>
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
Subject: Re: couple issues trying to build ti-hw-bringup-image.bb for AM1808 exp kit
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
X-List-Received-Date: Tue, 05 Feb 2013 09:32:21 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 5 Feb 2013, Denys Dmytriyenko wrote:

> Can the below patch help:
>
> https://lists.yoctoproject.org/pipermail/meta-ti/2012-September/001541.html
>
> Otherwise, entire recipes-misc folder of meta-ti is currently not
> supported and may be removed in the _near_ future. Although,
> ti-hw-bringup maybe preserved, but modified.

... snip ...

  i really like the idea of a bringup-related image that's stripped of
everything but essential low-level tools, so i hope something like
that sticks around.  i'll check if your patch solves this and let you
know, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

