Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32DC6E002A8
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 20:49:32 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.136.247])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M80008KHALO6161@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 30 Jul 2012 22:49:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C6FC5201BB; Mon,
	30 Jul 2012 23:49:00 -0400 (EDT)
Date: Mon, 30 Jul 2012 23:49:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: maniacbug <maniacbug@ymail.com>
Message-id: <20120731034900.GA7856@denix.org>
References: <1343704608.76381.YahooMailNeo@web121605.mail.ne1.yahoo.com>
MIME-version: 1.0
In-reply-to: <1343704608.76381.YahooMailNeo@web121605.mail.ne1.yahoo.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: MACHINE_KERNEL_PR ignored
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
X-List-Received-Date: Tue, 31 Jul 2012 03:49:32 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Mon, Jul 30, 2012 at 08:16:48PM -0700, maniacbug wrote:
> Hi.  I am recompiling linux-omap4 per Denys' suggestion.  I noticed that 
> conf/machine/include/omap4.inc has MACHINE_KERNEL_PR = "r1" and 
> linux-omap3_3.1.0.bb has MACHINE_KERNEL_PR_append = "a".  Yet "bitbake 
> linux-omap4" builds "linux-omap4-3.1.0-r0". Instead, I would have expected 
> "linux-omap4-3.1.0-r1a".
> 
> 
> Adding the usual PR = "rsomething", it now correctly builds 
> "linux-omap4-3.1.0-rsomething".

You'd need to use meta-oe layer from meta-openembedded to fully utilize 
MACHINE_KERNEL_PR:

http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/classes/kernel.bbclass#n13

-- 
Denys

