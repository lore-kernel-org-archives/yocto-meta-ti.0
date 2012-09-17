Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 820ACE0027F
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 14:56:22 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAI00K0VKX8KFV2@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 17 Sep 2012 16:56:03 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 930D2203CD; Mon,
	17 Sep 2012 17:55:56 -0400 (EDT)
Date: Mon, 17 Sep 2012 17:55:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Enrico <ebutera@users.berlios.de>
Message-id: <20120917215556.GC1218@denix.org>
References: <20120914064306.GC26968@edge>
	<7D46E86EC0A8354091174257B2FED101591F5F33@DLEE12.ent.ti.com>
	<CA+2YH7vzOwfqcfhM1xu8W=LmD-UV58zLQ6=XvokrCTh1AUvMnA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+2YH7vzOwfqcfhM1xu8W=LmD-UV58zLQ6=XvokrCTh1AUvMnA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: RFC: 2 possible workarounds for recipes-misc dependency on Angstrom
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
X-List-Received-Date: Mon, 17 Sep 2012 21:56:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 17, 2012 at 10:36:20PM +0200, Enrico wrote:
> On Fri, Sep 14, 2012 at 10:06 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
> > So really I think the question is do we have an agreement on "meta-beagle" or whatever it should be called, a timeline for it to be created and the recipes moved?  Let's make meta-ti be the foundation BSP that we can all build on top of and nothing more or less.
> 
> Sorry to jump into the discussion but...am i the only one that thinks
> that having meta-beagle, meta-panda, meta-whateverTIboard is crazy?

Not to argue that it's better, but how is it different from meta-cedartrail, 
meta-crownbay, meta-emenlow, meta-sugarbay and all the other Intel boards?

-- 
Denys

