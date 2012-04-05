Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2C1CE0044A
	for <meta-ti@yoctoproject.org>; Thu,  5 Apr 2012 12:07:35 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M20007D1T3S4UK1@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 05 Apr 2012 14:07:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C5EB2201AE; Thu,
	05 Apr 2012 15:07:04 -0400 (EDT)
Date: Thu, 05 Apr 2012 15:07:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-id: <20120405190704.GA5144@denix.org>
References: <86pqbmm4oe.fsf@coulee.tdb.com>
	<CAFZh4h9hFiRTRhVK_BfxfhFWhmZSinKjC5NJBq=ncubqboyvBg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAFZh4h9hFiRTRhVK_BfxfhFWhmZSinKjC5NJBq=ncubqboyvBg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: building meta-ti + poky HOWTO?
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
X-List-Received-Date: Thu, 05 Apr 2012 19:07:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 05, 2012 at 02:36:59PM -0400, Brian Hutchinson wrote:
> I may be out of the loop but if you follow the yocto way of doing
> things .... poky will produce a BeagleBoard image without having to
> use meta-ti and I think you can use that on beaglebone.  Some one
> correct me if I'm sending Russell in the weeds.
> 
> I've been able to build yocto images for BeagleBoard but haven't tried
> them on the bone yet.

You shouldn't be using BeagleBoard kernel images on the BeagleBone. You might 
get very basic ARM support, if you are lucky, but otherwise it won't work.

While both share "Beagle" in the name, they are based on different SOCs with 
different peripherals, etc.

-- 
Denys

