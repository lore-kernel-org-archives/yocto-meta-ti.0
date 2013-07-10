Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58FA4E00722
	for <meta-ti@yoctoproject.org>; Wed, 10 Jul 2013 10:15:35 -0700 (PDT)
Received: from [69.196.158.250] (port=58956 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UwxzJ-0000wH-9w; Wed, 10 Jul 2013 13:15:33 -0400
Date: Wed, 10 Jul 2013 13:15:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Denys Dmytriyenko <denys@ti.com>
In-Reply-To: <20130710163948.GC16407@edge>
Message-ID: <alpine.DEB.2.02.1307101314590.20912@oneiric>
References: <alpine.DEB.2.02.1307090624580.5445@oneiric>
	<20130710163948.GC16407@edge>
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
X-List-Received-Date: Wed, 10 Jul 2013 17:15:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 10 Jul 2013, Denys Dmytriyenko wrote:

> On Tue, Jul 09, 2013 at 06:26:27AM -0400, Robert P. J. Day wrote:
> >
> >   i remember tripping up on this before -- what's the proper way to
> > customize my local.conf to generate the sd card image via
> > sdcard_image.bbclass? i also remember a warning that that generation
> > wasn't compatible with the genext2fs in oe-core at the time, is that
> > still an issue?
>
> Robert,
>
> We don't use that class in our builds and products. Instead, the following
> script is being used to generate SD cards with the production SDKs:
>
> http://processors.wiki.ti.com/index.php/Sitara_Linux_SDK_create_SD_card_script
>
> Since that class is broken and outdated, it may be removed in the future.

  excellent, thanks very much.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

