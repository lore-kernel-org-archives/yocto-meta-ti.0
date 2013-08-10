Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BE3BE00408
	for <meta-ti@yoctoproject.org>; Sat, 10 Aug 2013 03:10:10 -0700 (PDT)
Received: from [174.115.226.96] (port=50541 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1V867d-0004jI-AJ; Sat, 10 Aug 2013 06:10:09 -0400
Date: Sat, 10 Aug 2013 06:10:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Brian Hutchinson <b.hutchman@gmail.com>
In-Reply-To: <CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1308100608560.2277@oneiric>
References: <alpine.DEB.2.02.1308091920590.10592@oneiric>
	<CAFZh4h8MZBVtwCUisoaNnBrd=Y81jZkrkhKAZUx2+JcBvTWepA@mail.gmail.com>
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
Subject: Re: should mesa_9.1.5.bbappend be upgraded to 9.1.6?
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
X-List-Received-Date: Sat, 10 Aug 2013 10:10:14 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-191019220-1376129408=:2277"

--8323329-191019220-1376129408=:2277
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

On Fri, 9 Aug 2013, Brian Hutchinson wrote:

>
>
> On Aug 9, 2013 7:23 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
> >
> >
> >   trying to build for beaglebone, getting:
> >
> > ERROR: No recipes available for:
> > /home/rpjday/oe/dist/layers/meta-ti/recipes-graphics/mesa/mesa_9.1.5.bbappend
> > ERROR: Command execution failed: Exited with 1
> >
> > should meta-ti master stay in sync with oe-core master (which has a
> > recipe for 9.1.6), or is there a different combo of layers to use?
> > thanks.
> >
> > rday
> >
>
> Hi Robert,
>
> I ran into the same thing the other day.  Yes, yocto master should
> be used with meta-ti master as far as I know.  I've ran into trouble
> mixing branch layers before.

  i'm not sure what you mean by "yocto master". i'm aware of the
meta-yocto layer, but that doesn't supply the underlying recipes. did
you mean "poky master"? or am i missing something here?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323329-191019220-1376129408=:2277--
