Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24834E00740
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 12:58:56 -0700 (PDT)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:54793 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UIP9t-0001Eo-8Y; Wed, 20 Mar 2013 15:58:49 -0400
Date: Wed, 20 Mar 2013 15:58:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Denys Dmytriyenko <denys@ti.com>
In-Reply-To: <20130320185747.GY32759@edge>
Message-ID: <alpine.DEB.2.02.1303201558250.18081@oneiric>
References: <20130319172138.GQ32759@edge> <5148A9B4.5060702@comcast.net>
	<20130319182747.GH14761@denix.org> <5149C666.7040306@comcast.net>
	<20130320151759.GP14761@denix.org>
	<5149F665.9090204@comcast.net> <20130320175415.GW32759@edge>
	<5149FD74.3030906@comcast.net> <20130320182722.GX32759@edge>
	<alpine.DEB.2.02.1303201441410.28378@oneiric>
	<20130320185747.GY32759@edge>
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
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Is this the correct list for AM3517 EVM questions?
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
X-List-Received-Date: Wed, 20 Mar 2013 19:58:56 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 20 Mar 2013, Denys Dmytriyenko wrote:

> On Wed, Mar 20, 2013 at 02:45:17PM -0400, Robert P. J. Day wrote:
> > On Wed, 20 Mar 2013, Denys Dmytriyenko wrote:
> >
> > ... snip ...
> >
> > > If you are using poky-danny as a base, you need to use "danny"
> > > branch of meta-ti to match the versions.
> >
> >   i ordered that very AM3517 exp kit this morning and, while it's
> > in transit, i'm building a core-image-minimal for it. should i expect
> > success if i use the absolute latest "git pull"s of everything?
> >
> >   i'm aware of the recipe masking issue and the mesa-dri version thing
> > so i won't trip over that. so far, the "fetchall" worked and i'm
> > currently on "running tasks (191 of 1591)" of the build itself.
> >
> >   is there any reason to think this shouldn't finish? thanks.
>
> http://article.gmane.org/gmane.linux.embedded.yocto.meta-ti/1661

  i should probably pay more attention to that. :-(

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

