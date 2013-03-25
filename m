Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED509E013A7
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 06:52:24 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MK7001K3YIBK1L2@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 25 Mar 2013 08:52:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AAD0F20092; Mon,
	25 Mar 2013 09:51:47 -0400 (EDT)
Date: Mon, 25 Mar 2013 09:51:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Enrico <ebutera@users.sourceforge.net>
Message-id: <20130325135147.GD30363@denix.org>
References: <1364216750-29038-1-git-send-email-Chase.Maupin@ti.com>
	<CA+2YH7s7mmU0-uxSnQ0na2BE1oULz5Ouy5FX8qTBi=kX7DrGxQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+2YH7s7mmU0-uxSnQ0na2BE1oULz5Ouy5FX8qTBi=kX7DrGxQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-ti-staging: Add panda dts file as supported DTS
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
X-List-Received-Date: Mon, 25 Mar 2013 13:52:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 25, 2013 at 02:37:03PM +0100, Enrico wrote:
> On Mon, Mar 25, 2013 at 2:05 PM, Chase Maupin <Chase.Maupin@ti.com> wrote:
> > * Add the omap5-panda.dts file as a supported DTS to be built.
> >   This file is for use on the panda and uEVM boards.
> 
> The name omap5-panda seems a bit misleading to me.

You are not alone.


> Or maybe there are plans for an omap5 pandaboard?

Not any longer - it is now called uEVM and DTS will be renamed accordingly 
soon. Until then Chase is just adding the old existing DTS to the build.

-- 
Denys

