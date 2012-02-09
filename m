Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7F6BE00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 08:57:22 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LZ400LTJXR88D50@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 09 Feb 2012 10:57:10 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9F9FC200B9; Thu,
	09 Feb 2012 11:57:08 -0500 (EST)
Date: Thu, 09 Feb 2012 11:57:08 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20120209165708.GB3917@denix.org>
References: <4F32F31B.2000303@gmail.com>
	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
	<8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
	<4F32F87E.2070907@mlbassoc.com>
	<38997C75-E36D-4A49-96D0-FB5E8A52817D@gmail.com>
	<7D46E86EC0A8354091174257B2FED10127667EB8@DLEE12.ent.ti.com>
	<4F33C61E.5080505@gmail.com>
	<4C3F7029-4844-4BA7-B378-BC30E27660F0@dominion.thruhere.net>
	<1328801627.9968.32.camel@ted>
MIME-version: 1.0
In-reply-to: <1328801627.9968.32.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: building Yocto for Pandaboard
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
X-List-Received-Date: Thu, 09 Feb 2012 16:57:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 09, 2012 at 03:33:47PM +0000, Richard Purdie wrote:
> On Thu, 2012-02-09 at 14:54 +0100, Koen Kooi wrote:
> > Op 9 feb. 2012, om 14:11 heeft jfabernathy het volgende geschreven:
> > > On 02/09/2012 08:01 AM, Maupin, Chase wrote:
> > >> Jim, you are welcome here.  As was mentioned before there have been
> > a lot of discussions about this layer.  One of the goals for the
> > meta-ti layer will be to work with just oe-core and yocto and not
> > require meta-angstrom.  We are moving that direction and the use case
> > you are trying and your experiences with it are important.  Thanks for
> > taking the time to give this a shot.
> > >> 
> > > Thanks, glad the proof of concept falls into the groups thinking as
> > well.  I will monitor for progress on the use of just the Yocto Linux
> > for this POC.
> >
> > Yocto or Poky? Because if you want yocto, angstrom very much *is*
> > yocto. If you want Poky, that's something different.
> 
> I think there are a few things need to get cleared up here as this is
> likely confusing for people.
> 
> The Yocto Project is the overall project which is working on improving
> embedded Linux for people in whatever areas those improvements are
> needed in. This involves things like eglibc, creating standard formats
> for hardware definitions (BSPs) and has also involved some work on build
> system which are derived from OpenEmbedded.
> 
> The Yocto Project uses Poky as its reference build system which is a
> combination of Bitbake, OE-Core, a load of documentation and a very
> small shim called meta-yocto. Its purpose is to provide a known good
> base system people can build on top of by adding layers.
> 
> Angstrom is similar to Poky in that its a mix of components allowing
> people to build things. It includes Bitbake and OE-Core and some other
> pieces. It has an equivalent to meta-yocto with different functionality.
> I'll let Koen as one of its maintainers describe what its purpose is.
> One difference is that is has a specific set of hardware targets and
> provides prebuilt package feeds which Poky does not (nor does the Yocto
> Project).
> 
> meta-ti is intended as a hardware support layer for various TI products.
> 
> The trouble is that some of these components have been around for a
> while and it hasn't always been possible to neatly layer things. In
> particular, meta-ti historically has a dependency on Angstrom.
> 
> Work is underway to remove that dependency so meta-ti can operate freely
> with both Poky and Angstrom, or just with OE-Core and Bitbake as
> separate pieces. There is no architectural problem with this and it is
> the intention of everyone involved. There is the question of sorting
> some of the mechanics and making the change whilst not causing problems
> for existing users. I'm really happy to see progress on this!
> 
> So in answer to Jim's question, you will be able to use meta-ti with
> Poky directly but right now, there are some details being worked through
> and it doesn't quite work. Perhaps we could mention that in the meta-ti
> README so people can see what the plan is as well as the current
> situation?

Richard,

Thank you for such a detailed and constructive message!

I won't repeat what has been already said several times about our plans to 
ensure meta-ti works with other distributions and OE-Core only...

I just wanted to clarify the historical dependency of meta-ti on Angstrom, 
as it's initial focus, driven by Koen and Jason, was mostly on supporting 
existing BeagleBoard platforms and recently released BeagleBone. The lack 
of flexibility is rather unintentional. :)

-- 
Denys

