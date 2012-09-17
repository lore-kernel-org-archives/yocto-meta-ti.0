Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 121F3E0027F
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 14:48:06 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MAI00IYKKJ9PSLT@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 17 Sep 2012 16:47:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E6366203CD; Mon,
	17 Sep 2012 17:47:32 -0400 (EDT)
Date: Mon, 17 Sep 2012 17:47:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Philip Balister <philip@balister.org>
Message-id: <20120917214732.GA1218@denix.org>
References: <20120914064306.GC26968@edge>
	<7D46E86EC0A8354091174257B2FED101591F5F33@DLEE12.ent.ti.com>
	<CA+2YH7vzOwfqcfhM1xu8W=LmD-UV58zLQ6=XvokrCTh1AUvMnA@mail.gmail.com>
	<50578DF9.1030904@balister.org>
MIME-version: 1.0
In-reply-to: <50578DF9.1030904@balister.org>
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
X-List-Received-Date: Mon, 17 Sep 2012 21:48:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 17, 2012 at 01:54:17PM -0700, Philip Balister wrote:
> On 09/17/2012 01:36 PM, Enrico wrote:
> >On Fri, Sep 14, 2012 at 10:06 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
> >>So really I think the question is do we have an agreement on "meta-beagle" or whatever it should be called, a timeline for it to be created and the recipes moved?  Let's make meta-ti be the foundation BSP that we can all build on top of and nothing more or less.
> >
> >Sorry to jump into the discussion but...am i the only one that thinks
> >that having meta-beagle, meta-panda, meta-whateverTIboard is crazy?
> 
> Whether or not Beagle is a TI board ....
> 
> It seems like the broader issue (and one I am falling over at the
> moment) is that we want some image recipes in BSP's. The images have
> different layer dependencies.
> 
> So we have a set of small images (such as board bring up and test
> images) that depend only on oe-core, and more complex images that
> depend on other layers. We can always mask the more complex images
> for the case where we want to only build against oe-core, but this
> is not the most convenient from a user point of view.

That's the whole point of this prolonged discussion...


> It seems like we need a way for an image to specify the layers it
> requires and if those layers are not present, the recipe will not
> build, but will not break parsing either.

Ah, that flexibility would have been nice in general, although it might be too 
easy to use it the wrong way or abuse.

-- 
Denys

