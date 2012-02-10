Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC1FFE003E3
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 08:28:05 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LZ6005MOR2ACA30@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 10 Feb 2012 10:27:52 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7BB14200B9; Fri,
	10 Feb 2012 11:27:46 -0500 (EST)
Date: Fri, 10 Feb 2012 11:27:46 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-id: <20120210162746.GA2525@denix.org>
References: <9A3E20AC-1D66-4B5E-8B91-B930DE69039B@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766A9C8@DLEE12.ent.ti.com>
	<35641D9F-C467-4CE0-80A1-DDAB687AFF44@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766AE0A@DLEE12.ent.ti.com>
	<3ED328D4-BA57-41C2-8044-2C09617E5C32@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1012766AEE6@DLEE12.ent.ti.com>
MIME-version: 1.0
In-reply-to: <7D46E86EC0A8354091174257B2FED1012766AEE6@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Merging in linux-stable updates, git send-email
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
X-List-Received-Date: Fri, 10 Feb 2012 16:28:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 10, 2012 at 04:18:28PM +0000, Maupin, Chase wrote:
> 
> > -----Original Message-----
> > From: Koen Kooi [mailto:koen@dominion.thruhere.net]
> > Sent: Friday, February 10, 2012 10:15 AM
> > To: Maupin, Chase
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] Merging in linux-stable updates, git send-
> > email
> > 
> > 
> > Op 10 feb. 2012, om 17:05 heeft Maupin, Chase het volgende
> > geschreven:
> > 
> > > So you changed the recipe name to use 3.2.5 for the PV.  But when
> > I set the DISTRO_FEATURES to include tipspkernel I don't get all
> > the patches you added to update to 3.2.5.  So can you maybe do a
> > logic similar to how the patches are handled to set the PV based on
> > whether tipspkernel is set in DISTRO_FEATURES?
> > 
> > I have updated the patch locally to keep PV at 3.2. I can live with
> > PV being "wrong" for the patched kernel till we figure out the
> > python magic. Using gitpkgv would get us around all this, but
> > that's a story for another day :)
> 
> So for this recipe would the following line of code not work?
> 
> PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "${PV}", "3.2.5", d)}"

You'll have a circular resolution in there, basically doing PV = ${PV}

You'd want to use := instead. But anyway, it seems heavy handed for the 
purpose...

-- 
Denys


> Then leave the recipe as linux-ti33x-psp_3.2.bb but your PV should be 
> correct for your kernel right?

