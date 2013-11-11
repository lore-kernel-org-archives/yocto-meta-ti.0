Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D028DE01389
	for <meta-ti@yoctoproject.org>; Mon, 11 Nov 2013 11:51:20 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MW40026R74YK1W0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 11 Nov 2013 13:51:03 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1779B20092; Mon,
	11 Nov 2013 14:50:57 -0500 (EST)
Date: Mon, 11 Nov 2013 14:50:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20131111195057.GH24766@denix.org>
References: <alpine.DEB.2.02.1311101239330.2907@oneiric>
MIME-version: 1.0
In-reply-to: <alpine.DEB.2.02.1311101239330.2907@oneiric>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: puzzled by FILESPATH setting in tipspkernel.inc
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
X-List-Received-Date: Mon, 11 Nov 2013 19:51:22 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Nov 10, 2013 at 12:47:24PM -0500, Robert P. J. Day wrote:
> 
>   poking around some of the kernel recipes in the meta-ti layer and
> i'm a bit baffled by the following in
> meta-ti/recipes-kernel/linux/tipspkernel.inc:
> 
> # First of all, set own FILESPATH avoiding unnecessary BP and BPN, but adding
> # extra level of major version
> FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}-${PMV}", \
> "${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"
> 
>   i understand the mechanics of how the above works, but i'm not sure
> about that very last element in array: ${FILE_DIRNAME}, all by itself.
> is that deliberate? that is, not having any extra level such as ${PF}
> or ${P} or "files"? isn't that suggesting that files can be located in
> the main directory itself? which doesn't seem to be necessary.

That used to be the case before, but had changed a year ago:
http://cgit.openembedded.org/openembedded-core/commit/?id=3efa13cd76bbd5611805021945fc9def88d9fd93

Anyway, tipspkernel.inc is a deprecated feature and its use is discouraged 
now. It remains present for some old kernel recipes to work.

-- 
Denys

