Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51A3CE005BB
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2011 22:35:21 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTN00C2KRIV2II5@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 26 Oct 2011 00:35:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D1EF014AF5D; Wed,
	26 Oct 2011 01:35:19 -0400 (EDT)
Date: Wed, 26 Oct 2011 01:35:19 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Message-id: <20111026053519.GA15391@denix.org>
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
MIME-version: 1.0
In-reply-to: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
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
X-List-Received-Date: Wed, 26 Oct 2011 05:35:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 25, 2011 at 07:13:14PM -0500, Joel A Fernandes wrote:
> Enable the PL2303 usb-to-serial driver required for serial output
> from the beaglebone tester.

BTW, has anyone tried building kernel for am335x-evm lately? It appears broken 
for me with bunch of unresolved symbols for musb... Doing bisect doesn't help 
much, as the tree was rebased and no previous revs are available :(

-- 
Denys

