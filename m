Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDD69E013B7
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 14:48:44 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4800BIWN8X7RG0@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 18 May 2012 16:48:34 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A264D201AE; Fri,
	18 May 2012 17:48:33 -0400 (EDT)
Date: Fri, 18 May 2012 17:48:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Thilo Fromm <fromm@dresearch-fe.de>
Message-id: <20120518214833.GB4208@denix.org>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
	<CADZ6=atZrjgogV7zopSvXEvev6kucn524KG-s3Au7ocQ-+Eyyw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CADZ6=atZrjgogV7zopSvXEvev6kucn524KG-s3Au7ocQ-+Eyyw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2012 21:48:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 18, 2012 at 04:40:25PM +0200, Thilo Fromm wrote:
> 
> >>>> What do you mean by Ne/Ce?
> >>>
> >>> Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is calling it nowadays.
> >>
> >> We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with a
> >> C674x DSP.
> >
> > So a centaurus family SoC.
> 
> Thanks for the clarification :) TI didn't approach us with any of the
> terms you mentioned. It's just DaVinci for them when they're talking
> with us.

Netra and Centaurus are internal codenames for the SoC families behind those 
part numbers Koen mentioned above. Those codenames are not publicly advertised 
and Koen is just showing off after being on the inside... :) :-P

-- 
Denys

