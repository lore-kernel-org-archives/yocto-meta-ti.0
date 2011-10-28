Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 218E7E013E0
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2011 19:05:36 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTR00LPE75A4ON0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 27 Oct 2011 21:05:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BD68F14AF5D; Thu,
	27 Oct 2011 22:05:34 -0400 (EDT)
Date: Thu, 27 Oct 2011 22:05:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jason Kridner <jkridner@beagleboard.org>
Message-id: <20111028020534.GQ15391@denix.org>
References: <1319679361-13741-1-git-send-email-jdk@ti.com>
	<20111027213912.GO15391@denix.org>
	<CA+T6QPnOubTg45SjEhWfG_B5fk+4Ywy3ow+O94dKx45G2Sk1Kg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+T6QPnOubTg45SjEhWfG_B5fk+4Ywy3ow+O94dKx45G2Sk1Kg@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] sdcard_image: align partitions with flash	pages
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
X-List-Received-Date: Fri, 28 Oct 2011 02:05:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 27, 2011 at 05:58:26PM -0400, Jason Kridner wrote:
> On Thu, Oct 27, 2011 at 5:39 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Wed, Oct 26, 2011 at 09:36:01PM -0400, Jason Kridner wrote:
> >> See
> >> http://sakoman.com/OMAP/a-script-for-partitioningformatting-a-bootable-sdmicrosd-card.html
> >
> > If I was Paul Menzel, I'd complain about non-descriptive description :)
> 
> Fair enough.  I thought giving the URL was better than taking the
> credit for the ideas, but I could have extracted the ideas for the

Well, giving proper credit is important, so I included Steve's and Arnd's 
names (although, leaving XorA's and my names out :))

> change as well.  Do you need me to resubmit?  I'm comfortable with you
> adding comments into the commit.

Sounds good then, here's what I've added:
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/?id=ed09701ebe89d4ce0802cf734aa25c29e94febe8

> Or should I apply an additional patch to put comments into the code?
> 
> > BTW, Arnd Bergmann is the expert in SD card wear issues http://lwn.net/Articles/428584/
> > and, if I remember correctly, he was showing some tests abusing whole bunch of
> > SD cards at the last ELC.
> 
> Yeah, I sat down with Arnd and discussed it at ELC, which is why I
> wanted to pick up the changes not only in mkcard as Steve did, but in
> this class which is more convenient for people using OE to build SD
> card images.

-- 
Denys

