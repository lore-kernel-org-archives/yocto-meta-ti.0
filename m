Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBDB0E005BB
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 00:03:55 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTN00JXQVMJT4F6@vms173001.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 26 Oct 2011 02:03:55 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4986A14AF5D; Wed,
	26 Oct 2011 02:57:08 -0400 (EDT)
Date: Wed, 26 Oct 2011 02:57:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Message-id: <20111026065708.GB15391@denix.org>
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
	<20111026053519.GA15391@denix.org>
MIME-version: 1.0
In-reply-to: <20111026053519.GA15391@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable	usb-to-serial drivers
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
X-List-Received-Date: Wed, 26 Oct 2011 07:03:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 26, 2011 at 01:35:19AM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 25, 2011 at 07:13:14PM -0500, Joel A Fernandes wrote:
> > Enable the PL2303 usb-to-serial driver required for serial output
> > from the beaglebone tester.
> 
> BTW, has anyone tried building kernel for am335x-evm lately? It appears broken 
> for me with bunch of unresolved symbols for musb... Doing bisect doesn't help 
> much, as the tree was rebased and no previous revs are available :(

Well, it appears the recent rebase also sneaked in defconfig changes, which I 
didn't notice, that were causing me the above issues... Fixed now.

-- 
Denys

