Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A49B2E0140A
	for <meta-ti@yoctoproject.org>; Fri, 20 Apr 2012 06:20:53 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2S00DQZ52RYOE1@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 20 Apr 2012 08:20:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 995EB201A7; Fri,
	20 Apr 2012 09:20:50 -0400 (EDT)
Date: Fri, 20 Apr 2012 09:20:50 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-id: <20120420132050.GA3783@denix.org>
References: <4F910E4F.9000800@dresearch-fe.de>
MIME-version: 1.0
In-reply-to: <4F910E4F.9000800@dresearch-fe.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: meta-ti layer confusion
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
X-List-Received-Date: Fri, 20 Apr 2012 13:20:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 20, 2012 at 09:20:47AM +0200, Steffen Sledz wrote:
> Our company is working on a new TI DM814x based hardware currently.
> 
> That's a really hard job, because the TI linux support is not really "optimal". But that's not the primary cause for my message.
> 
> [1] lists two TI BSP layers [2],[3] each one claiming to be "The official OpenEmbedded/Yocto BSP layer for Texas Instruments platforms.".
> 
> A look into them shows that they are not identically. At the moment they differ in two commits ([3] is ahead of [2]). In the last days these differences where much bigger.
> 
> So what is the intention for these two "offical" layers?
> 
> Which one should we use? And why?
> 
> BTW: Is anyone else out there working on a TI DM814x/DM816x hardware?
> 
> Regards,
> Steffen
> 
> [1] <http://www.openembedded.org/wiki/LayerIndex>
> [2] <http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/>
> [3] <https://github.com/Angstrom-distribution/meta-ti>

They are the same. Or more appropriately, there is just one official meta-ti 
layer, it's just mirrored in several places. The one on yoctoproject.org[2] is 
considered the official mirror and that's what you should use. If you are 
subscribed to this list, you should have seen Koen posting 2 patches for 
review yesterday, which he has staged to his working copy on github[3] - 
that's the difference in 2 commits. They shouldn't have been pushed to the 
master branch though, until they are accepted...

-- 
Denys

